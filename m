Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC95BB3AC1
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 12:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA76610E7AC;
	Thu,  2 Oct 2025 10:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54E6410E7AC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 10:41:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AAA1692;
 Thu,  2 Oct 2025 03:41:37 -0700 (PDT)
Received: from [10.57.2.240] (unknown [10.57.2.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2493F3F66E;
 Thu,  2 Oct 2025 03:41:42 -0700 (PDT)
Message-ID: <74e2f1a8-0410-4a5e-bbf3-29d5d5d55308@arm.com>
Date: Thu, 2 Oct 2025 11:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/panthor: remove unnecessary mmu_hw_wait_ready
 calls
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-8-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250916210823.4033529-8-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 16/09/2025 22:08, Chia-I Wu wrote:
> No need to call mmu_hw_wait_ready after panthor_gpu_flush_caches or
> before returning from mmu_hw_flush_caches.

Why is there no need? If we attempt to send a command when the hardware
is busy then the command will be dropped (so the cache flush won't
happen), and if we don't wait for the unlock command to complete then
then we don't know that the flush is complete.

Thanks,
Steve

> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 373871aeea9f4..c223e3fadf92e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -669,12 +669,9 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
>  	 * at the end of the GPU_CONTROL cache flush command, unlike
>  	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
>  	 */
> -	ret = mmu_hw_wait_ready(ptdev, as_nr);
> -	if (!ret)
> -		mmu_hw_cmd_unlock(ptdev, as_nr);
> +	mmu_hw_cmd_unlock(ptdev, as_nr);
>  
> -	/* Wait for the unlock command to complete */
> -	return mmu_hw_wait_ready(ptdev, as_nr);
> +	return 0;
>  }
>  
>  static int mmu_hw_do_operation(struct panthor_vm *vm,

