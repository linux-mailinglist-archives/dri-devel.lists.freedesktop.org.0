Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38891CC8565
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 16:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D06010E17D;
	Wed, 17 Dec 2025 15:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3E0B10E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 15:05:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32340FEC;
 Wed, 17 Dec 2025 07:05:47 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49D633F73F;
 Wed, 17 Dec 2025 07:05:51 -0800 (PST)
Message-ID: <fb1c0b87-2aba-4bfa-90f1-a7a1c2dc100c@arm.com>
Date: Wed, 17 Dec 2025 15:05:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Avoid showing imported BO as exported in
 DebugFS output
To: Akash Goel <akash.goel@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251216153242.1042613-1-akash.goel@arm.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20251216153242.1042613-1-akash.goel@arm.com>
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

On 16/12/2025 15:32, Akash Goel wrote:
> The "gems" DebugFS file shows the device-wide list of DRM GEM objects.
> It displays various information about an object, including if it is
> PRIME imported, PRIME exported.
> This commit fixes the debugfs_bo_print() function to prevent an imported
> BO from also being shown as exported in the DebugFS file output.
> Both 'import_attach' and 'dma_buf' fields will not be NULL for an
> imported BO.
> 
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index b61908fd508a..5dd92cdcf316 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -668,7 +668,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  
>  	if (bo->base.base.import_attach)
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
> -	if (bo->base.base.dma_buf)
> +	else if (bo->base.base.dma_buf)
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
>  
>  	seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags);

