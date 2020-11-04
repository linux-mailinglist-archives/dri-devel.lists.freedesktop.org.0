Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072012A60A6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 10:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5289A16;
	Wed,  4 Nov 2020 09:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0A8892E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 09:39:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s9so21272024wro.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 01:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WUh7dQWB3Nw4YHmsebd1sLvvR/X71RnH4ab67Gv3wYk=;
 b=S/raARFJ/vaZ/Ot/IUwOIIlvXRpY2Yj4QIDnS33b2kN7/FIp3DkPR6yL6JXbOFtsun
 XCGQSHFeCkqm2rg/AGhFB1YHhvcd74hi+9A2IjEavLqPvuIl+cevnOkI1m7EnVPlArCM
 cnKSbnROs+/8v+9Q4NV02VA0gdUpsunZ5mcu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WUh7dQWB3Nw4YHmsebd1sLvvR/X71RnH4ab67Gv3wYk=;
 b=EsJmxfoJR5zEGptqs5PnqZjDaadj0GzSi+pza95ULJiTZUNlf4smoL8iXDDZ+WcFBA
 /ODb605+FWiUxFo+DPaG6k3+4fmwGpqJic0NWG3G4vlQZbwmgI2xuCMGDkyKdI3iBOUO
 S+XN7sSYRI25iEEGzCpbm/9i5TpG8jDf1cIUWwuPukcjGxRFZWUIgNOb74IUJraCsxR7
 atRJs47x5pX+PR3/O+uDjyP7/L8SpLla4CvKNGztknbKhIBDrIPLUvUM0ZZGBFMWrwVd
 5lNf18uHTxjDldlfyBPywl30LU5xxjrCLyxo3fvhnAV4eRUdolCLjNE8KFXeT4ygbw8L
 1L+A==
X-Gm-Message-State: AOAM532XZZ6BHfu+rjUdXDnL0suQo9jlKwjuwPL5kkNN8sCPiTvIH7Fu
 Lzdei4RBJe2RpMwvbtz4DaIpYA==
X-Google-Smtp-Source: ABdhPJxtU2fGVmmga0pww//IrX9t9qSL0oYjjC+akH8rJdZ27h5vdHBm9PUbTdi9DWr7TK8A6MJtGQ==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr30219067wrt.137.1604482758184; 
 Wed, 04 Nov 2020 01:39:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm1784106wrm.27.2020.11.04.01.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:39:17 -0800 (PST)
Date: Wed, 4 Nov 2020 10:39:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/virt: fix handling of the atomic flag
Message-ID: <20201104093915.GL401619@phenom.ffwll.local>
References: <20201103215450.815572-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103215450.815572-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 04:54:50PM -0500, Alex Deucher wrote:
> Use the per device drm driver feature flags rather than the
> global one.  This way we can make the drm driver struct const.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Can we merge this through drm-misc-next so I can follow up with the
drm_device constification series there? Otherwise I need to sit on that
for another few weeks until all the backmerges are done.
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index d0aea5e39531..8aff6ef50f91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
>  
>  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
>  {
> +	struct drm_device *ddev = adev_to_drm(adev);
> +
>  	/* enable virtual display */
>  	if (adev->mode_info.num_crtc == 0)
>  		adev->mode_info.num_crtc = 1;
>  	adev->enable_virtual_display = true;
> -	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
> +	ddev->driver_features &= ~DRIVER_ATOMIC;
>  	adev->cg_flags = 0;
>  	adev->pg_flags = 0;
>  }
> -- 
> 2.25.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
