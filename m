Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664C1665E3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6E46EE2C;
	Thu, 20 Feb 2020 18:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033E6EE2C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:11:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so3075455wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GQQ2PB8OZDCVtv/m9hZDOmwUL+eoIyV9J82fybGpquM=;
 b=kI/JlNPlfc/3aNcf7mJHDHmVeonrKZCX85dE4PnLxHIlLd1jqah7m4YSCAuegLXjDf
 ZRlZvfY+jhGZ3WxxQC1EempH3JY5KOv7elWlMDqimYijIaNN/4sUjCzKkhelZC9oHWIP
 b2buLRaOLaDu3MGy/QO7OzsHjIpyRoXMLkkYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GQQ2PB8OZDCVtv/m9hZDOmwUL+eoIyV9J82fybGpquM=;
 b=lmky6em/QunZf3Hb00xKQp1hHuYRJ0CDEn7aI6BfiYT9KXwmQO2SBW+7dUCzBiiDY8
 g4Gva2V6TFB6dSt2+K2lRHs0R6K8khuvFPiwuRvk2pUOJuGVls/mXoRHK2RKa+6A3gJj
 q3jhnSgSlA8EqJTSd4DO2jWsz3UgIAszjSMrdv47hrvNeGfFtWHzgtN3IGUSweAXkTZz
 I45Rg1ErdaNFjlyQ5X9mR0wQbs9CLq7MAWdLmyeq8jHzSy3waTE/ryuWn3Qd9EiJrHDF
 STsDfa1oG0Y73kFm+M55DXcJZbzXLvavxQXV1q43XlGm0V3v2ch1/t05XD6dWMi5II/Z
 alyw==
X-Gm-Message-State: APjAAAX+qycq9eBQuWdtrExATpVB9K/D7sV6G+hpXpT+1XDbuYl3akwL
 xNH9AQBWtiblOKDcCW4CIBqGXizsP8U=
X-Google-Smtp-Source: APXvYqxIqb+oUCljVbphtriJA3QySvJpWOVKPYSAEUVVzetfo1F/iD65IBk402Y7xmeO2vawMEO7dg==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr5962038wmi.51.1582222285705; 
 Thu, 20 Feb 2020 10:11:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c15sm452900wrt.1.2020.02.20.10.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:11:25 -0800 (PST)
Date: Thu, 20 Feb 2020 19:11:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset v2
Message-ID: <20200220181123.GU2363188@phenom.ffwll.local>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-8-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219135322.56463-8-nirmoy.das@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 02:53:21PM +0100, Nirmoy Das wrote:
> Switch over to GEM VRAM's implementation to retrieve bo->offset
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/bochs/bochs_kms.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 8066d7d370d5..18d2ec34534d 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -29,16 +29,21 @@ static void bochs_plane_update(struct bochs_device *bochs,
>  			       struct drm_plane_state *state)
>  {
>  	struct drm_gem_vram_object *gbo;
> +	s64 gpu_addr;
> 
>  	if (!state->fb || !bochs->stride)
>  		return;
> 
>  	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
> +	gpu_addr = drm_gem_vram_offset(gbo);
> +	if (WARN_ON_ONCE(gpu_addr < 0))
> +		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */

That negative errno in gpu_addr from vram helpers is kinda wild.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	bochs_hw_setbase(bochs,
>  			 state->crtc_x,
>  			 state->crtc_y,
>  			 state->fb->pitches[0],
> -			 state->fb->offsets[0] + gbo->bo.offset);
> +			 state->fb->offsets[0] + gpu_addr);
>  	bochs_hw_setformat(bochs, state->fb->format);
>  }
> 
> --
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
