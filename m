Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6330BFFF55
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826F10E8D9;
	Thu, 23 Oct 2025 08:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kYtVTZJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807F10E8D9;
 Thu, 23 Oct 2025 08:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761208651;
 bh=ApOBYYNKJo5o8mu1ZNfuUNioVFTmTdyotlaytBUTJsU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kYtVTZJzrjA2QR0nPPhtoPNBIO7ll8vav2+b3E+zE3gmk9PQjlzEanvT+/HGTJQcs
 VkyMyc2UvUQ0/QhfrqlM5tu88Y3dv6TrmNHrmFxi2CMFkQvz/vbSp17ze3FN++7PCG
 FtpeGARFjBCJYwGvM7RwMkBOYBRYFDoTrVyhRGghYOcMITfSWJ5Drt4DjnjUMDVw58
 Qk9XL3uudX0RQm3Gf/6uKVIo8ynuJNZECECFAhRuKylgMe+yAaPtHf9LffHnE/Vll6
 JW8IsE070NkKpvUGf+St14RpRbpks02zYbdZVD1U9LANNulK7fYvW3qJLIyZ2Nc/d4
 2y+JcY9p/yu3Q==
Received: from [192.168.100.50] (unknown [144.48.130.189])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ECA917E0964;
 Thu, 23 Oct 2025 10:37:29 +0200 (CEST)
Message-ID: <9ddb17b8-32d9-459b-ad0b-42ada95c0757@collabora.com>
Date: Thu, 23 Oct 2025 13:37:00 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, "Mario Limonciello (AMD)"
 <superm1@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd: Manage frozen state internally
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
References: <20251022155114.48418-1-mario.limonciello@amd.com>
 <20251022155114.48418-3-mario.limonciello@amd.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20251022155114.48418-3-mario.limonciello@amd.com>
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

On 10/22/25 8:50 PM, Mario Limonciello wrote:
> From: "Mario Limonciello (AMD)" <superm1@kernel.org>
> 
> [Why]
> On a normal hibernate sequence amdgpu will skip the thaw step due to
> commit 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for
> normal hibernation").
> 
> If the hibernate sequence has been aborted however after this thawed
> step runs the PM core will think the device is suspended and will skip
> the restore() sequence for amdgpu.  This leads to accessing the device
> while in a low power state and will freeze the system.
> 
> [How]
> Set `dev->power.is_frozen` to indicate to the PM core that an error
> code will be returned for thaw() callback because driver managed the
> frozen state.  If the restore() callback is called by the PM core the
> driver will resume the device.
> 
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested on APU:
Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

I don't have AMD DGPU for its testing.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3d032c4e2dce..693347eb6861 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5247,6 +5247,11 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  	if (r)
>  		return r;
>  
> +#ifdef CONFIG_HIBERNATE_CALLBACKS
> +	if (adev->in_s4)
> +		dev->dev->power.is_frozen = 1;
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -5385,6 +5390,11 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  	if (amdgpu_acpi_smart_shift_update(adev, AMDGPU_SS_DEV_D0))
>  		dev_warn(adev->dev, "smart shift update failed\n");
>  
> +#ifdef CONFIG_HIBERNATE_CALLBACKS
> +	if (adev->in_s4)
> +		dev->dev->power.is_frozen = 0;
> +#endif
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 61268aa82df4..d40af069f24d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
>  
>  	/* do not resume device if it's normal hibernation */
>  	if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
> -		return 0;
> +		return -EBUSY;
>  
>  	return amdgpu_device_resume(drm_dev, true);
>  }


-- 
---
Thanks,
Usama
