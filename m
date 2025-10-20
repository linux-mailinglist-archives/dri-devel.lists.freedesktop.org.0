Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE02BF291F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8991810E48B;
	Mon, 20 Oct 2025 16:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SNT0ptMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B37410E498;
 Mon, 20 Oct 2025 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760979553;
 bh=YfnKeMKwhtaKKkpqNf8xO08h+LVL7gFtv+Wvu1LExHw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SNT0ptMzU1hGPApmR8M2TMZlhqbcmlE0R5tihYF3NoQci7wE9LRQuAH/CTyInqqag
 yUEws0h2RGdw94IQxdbHwqE74XZHVVGHnp4Zv5ns1BgKumAuICW5z4lnn8WPtgYvnh
 XYtNsVNxc5V300f3zZqN3PrfY8J3J3fCR/EDUEgCrEvQXIIZjDsvjzEb14EM5T1ARM
 HcBiBs7kRemcyb96M8jDvEbW/g8OVac773ez7B1loYim1vXepQwJvVqd8ngudI09gt
 yQhNhmwP+QPZRGHSpzw3RCt+Zh8M4VmIlNT6cOuVlc593aoFEhqkYRnbgRzxBsun5w
 expjkHJGVndEg==
Received: from [192.168.200.105] (unknown [182.181.201.194])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D02917E1278;
 Mon, 20 Oct 2025 18:59:10 +0200 (CEST)
Message-ID: <f710ff00-096b-4d88-8e39-dcde29098d40@collabora.com>
Date: Mon, 20 Oct 2025 21:59:04 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20251020165317.3992933-4-superm1@kernel.org>
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

On 10/20/25 9:50 PM, Mario Limonciello (AMD) wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The PM core should be notified that thaw was skipped for the device
> so that if it's tried to be resumed (such as an aborted hibernate)
> that it gets another chance to resume.
> 
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 61268aa82df4d..d40af069f24dd 100644
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
