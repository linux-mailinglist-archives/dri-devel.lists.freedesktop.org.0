Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6DAF8E1F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7CC10E9AB;
	Fri,  4 Jul 2025 09:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 307BC10E9AB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:18:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C745152B;
 Fri,  4 Jul 2025 02:18:09 -0700 (PDT)
Received: from [10.1.39.21] (e122027.cambridge.arm.com [10.1.39.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5059A3F6A8;
 Fri,  4 Jul 2025 02:18:21 -0700 (PDT)
Message-ID: <eee19dfc-c8ee-44d4-b9d7-9335ec3ad73e@arm.com>
Date: Fri, 4 Jul 2025 10:18:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/80] drm/panfrost: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075411.3218059-1-sakari.ailus@linux.intel.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250704075411.3218059-1-sakari.ailus@linux.intel.com>
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

On 04/07/2025 08:54, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Steven Price <steven.price@arm.com>

But this can't be merged via drm-misc until the PM changes have hit
Linus' tree and been backmerged to drm-misc-next.

Thanks,
Steve

> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 563f16bae543..0dd62e8b2fa7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -203,7 +203,6 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
>  	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
>  	panfrost_gem_mapping_put(perfcnt->mapping);
>  	perfcnt->mapping = NULL;
> -	pm_runtime_mark_last_busy(pfdev->dev);
>  	pm_runtime_put_autosuspend(pfdev->dev);
>  
>  	return 0;
> @@ -279,7 +278,6 @@ void panfrost_perfcnt_close(struct drm_file *file_priv)
>  	if (perfcnt->user == pfile)
>  		panfrost_perfcnt_disable_locked(pfdev, file_priv);
>  	mutex_unlock(&perfcnt->lock);
> -	pm_runtime_mark_last_busy(pfdev->dev);
>  	pm_runtime_put_autosuspend(pfdev->dev);
>  }
>  

