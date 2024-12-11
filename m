Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB079EC9AF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3510EADD;
	Wed, 11 Dec 2024 09:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFE4210EAE8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:50:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B07F1063
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:50:33 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 572AB3F720
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:50:05 -0800 (PST)
Date: Wed, 11 Dec 2024 09:50:01 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/5] drm/panthor: Preserve the result returned by
 panthor_fw_resume()
Message-ID: <Z1lgSe9sjcLwq5AI@e110455-lin.cambridge.arm.com>
References: <20241211075419.2333731-1-boris.brezillon@collabora.com>
 <20241211075419.2333731-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211075419.2333731-2-boris.brezillon@collabora.com>
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

On Wed, Dec 11, 2024 at 08:54:15AM +0100, Boris Brezillon wrote:
> WARN() will return true if the condition is true, false otherwise.
> If we store the return of drm_WARN_ON() in ret, we lose the actual
> error code.
> 
> v3:
> - Add R-b
> v2:
> - Add R-b
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 984615f4ed27..e701e605d013 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -461,8 +461,8 @@ int panthor_device_resume(struct device *dev)
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
>  		panthor_gpu_resume(ptdev);
>  		panthor_mmu_resume(ptdev);
> -		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -		if (!ret) {
> +		ret = panthor_fw_resume(ptdev);
> +		if (!drm_WARN_ON(&ptdev->base, ret)) {
>  			panthor_sched_resume(ptdev);
>  		} else {
>  			panthor_mmu_suspend(ptdev);
> -- 
> 2.47.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
