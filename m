Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD703F7168
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 11:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80836E162;
	Wed, 25 Aug 2021 09:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D15D6E162
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 09:04:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639BF31B;
 Wed, 25 Aug 2021 02:04:11 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51B5F3F66F;
 Wed, 25 Aug 2021 02:04:10 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] drm/panfrost: Handle non-aligned lock addresses
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
 <20210824173028.7528-5-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6fe675c4-d22b-22da-ba3c-f6d33419b9ed@arm.com>
Date: Wed, 25 Aug 2021 10:04:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824173028.7528-5-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2021 18:30, Alyssa Rosenzweig wrote:
> When locking memory, the base address is rounded down to the nearest
> page. The current code does not adjust the size in this case,
> truncating the lock region:
> 
> 	Input:      [----size----]
> 	Round: [----size----]
> 
> To fix the truncation, extend the lock region by the amount rounded off.
> 
> 	Input:      [----size----]
> 	Round: [-------size------]
> 
> This bug is difficult to hit under current assumptions: since the size
> of the lock region is stored as a ceil(log2), the truncation must cause
> us to cross a power-of-two boundary. This is possible, for example if
> the caller tries to lock 65535 bytes starting at iova 0xCAFE0010. The
> existing code rounds down the iova to 0xCAFE0000 and rounds up the lock
> region to 65536 bytes, locking until 0xCAFF0000. This fails to lock the
> last 15 bytes.
> 
> In practice, the current callers pass PAGE_SIZE aligned inputs, avoiding
> the bug. Therefore this doesn't need to be backported. Still, that's a
> happy accident and not a precondition of lock_region, so we let's do the
> right thing to future proof.

Actually it's worse than that due to the hardware behaviour, the spec
states (for LOCKADDR_BASE):

> Only the upper bits of the address are used. The address is aligned to a
> multiple of the region size, so a variable number of low-order bits are
> ignored, depending on the selected region size. It is recommended that software
> ensures that these low bits in the address are cleared, to avoid confusion.

It appears that indeed this has caused confusion ;)

So for a simple request like locking from 0xCAFE0000 - 0xCB010000 (size
= 0x30000) the region width gets rounded up (to 0x40000) which causes
the start address to be effectively rounded down (by the hardware) to
0xCAFC0000 and we fail to lock 0xCB000000-0xCB010000.

Interestingly (unless my reading of this is wrong) that means to lock
0xFFFF0000-0x100010000 (i.e. crossing the 4GB boundary) requires locking
*at least* 0x00000000-0x200000000 (i.e. locking the first 8GB).

This appears to be broken in kbase (which actually does zero out the low
bits of the address) - I've raised a bug internally so hopefully someone
will tell me if I've read the spec completely wrong here.

Steve

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Reported-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index dfe5f1d29763..14be32497ec3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -63,6 +63,9 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
>  	u8 region_width;
>  	u64 region = iova & PAGE_MASK;
>  
> +	/* After rounding the address down, extend the size to lock the end. */
> +	size += (region - iova);
> +
>  	/* The size is encoded as ceil(log2) minus(1), which may be calculated
>  	 * with fls. The size must be clamped to hardware bounds.
>  	 */
> 

