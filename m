Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3541838C548
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 12:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CF06F616;
	Fri, 21 May 2021 10:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 611CC6F5C9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:53:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AF021424;
 Fri, 21 May 2021 03:53:18 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4323F73D;
 Fri, 21 May 2021 03:53:17 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error
 path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210521093811.1018992-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6749e0dd-bc07-b399-9718-0972993034cd@arm.com>
Date: Fri, 21 May 2021 11:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521093811.1018992-1-boris.brezillon@collabora.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 10:38, Boris Brezillon wrote:
> Make sure all bo->base.pages entries are either NULL or pointing to a
> valid page before calling drm_gem_shmem_put_pages().
> 
> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: <stable@vger.kernel.org>
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 569509c2ba27..d76dff201ea6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -460,6 +460,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  		if (IS_ERR(pages[i])) {
>  			mutex_unlock(&bo->base.pages_lock);
>  			ret = PTR_ERR(pages[i]);
> +			pages[i] = NULL;
>  			goto err_pages;
>  		}
>  	}
> 

