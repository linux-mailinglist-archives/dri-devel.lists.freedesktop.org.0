Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B7263D442
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C074410E449;
	Wed, 30 Nov 2022 11:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F210E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:19:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o5so17540495wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3RzUia69JsX3Kd3MgvLd201iv7H9LUlNLNFTBAG1oE=;
 b=XJZu8B6AZ1y/nps845IKPVxnobpz0UM/T0N4yqGpYy/4vgMkfsdVoCES1tjIPjUpzE
 O6MXwZGObIqUaTG77wWEK44TfgoE/XQWuBy0SIj2Pa7tShPt12REbD4PsqZEMlaWzUJN
 0yTvZ1l8SN1B9qSc0npZ3FMGslDYTp42W8ry4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3RzUia69JsX3Kd3MgvLd201iv7H9LUlNLNFTBAG1oE=;
 b=DSQsk8XXYnxkQqvy+7GaUwgVF2YVXXUVO4dDr58+UPEVX2JylKpYVWZCE/tUtka5PQ
 2iwsc9kHOKKgvroha4ZmGJbc5fpUP/ueNaZKSDaCpYDm1gNT1cZF1vMMVDlNYjVw35M1
 1uJrYHdupy+K9w7SjmcJJ/oztAX0o6fFEjalgSmNcaWLbH9fYtt5lxo1fyxKS14c9Ssj
 MAwD0fzzOq3wzWnPnxEbEGVncVMt4WXzZwCzl5tmQr64DbNbaTwprzMmZgEXtTq8GBHt
 ZAzwS8Wlnj4XH5+u3CcHltRtLaTiWODnjFJ+OcIASzZiX26/HHYSB3RwyNKmqAlxBdi9
 Ns2w==
X-Gm-Message-State: ANoB5pmDXo9uKeZIUI5hGaTS60N1/rh7SOs8c3Uzb/pzu043i0MUdvqF
 KItO9G19hMByByTBaL0nWjhs30iecxat3w==
X-Google-Smtp-Source: AA0mqf48e1fWgDwzk3rs0tRqwfO8D57O3sN1m1tha8i3SLpnlU69XIlzUcMxeWApDhPF71SViK70Hw==
X-Received: by 2002:a5d:4dc5:0:b0:242:1d11:f990 with SMTP id
 f5-20020a5d4dc5000000b002421d11f990mr7107346wru.686.1669807151744; 
 Wed, 30 Nov 2022 03:19:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 y2-20020adfdf02000000b0023657e1b980sm1235585wrl.53.2022.11.30.03.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:19:10 -0800 (PST)
Date: Wed, 30 Nov 2022 12:19:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem-helper: Remove errant put in error path
Message-ID: <Y4c8LMIkGPoPGy+4@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Eric Anholt <eric@anholt.net>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Rob Herring <robh@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221129200242.298120-1-robdclark@gmail.com>
 <20221129200242.298120-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129200242.298120-2-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 12:02:41PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> drm_gem_shmem_mmap() doesn't own this reference!
> 
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>

With Guenter's nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 35138f8a375c..110a9eac2af8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -623,7 +623,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  
>  	ret = drm_gem_shmem_get_pages(shmem);
>  	if (ret) {
> -		drm_gem_vm_close(vma);
>  		return ret;
>  	}
>  
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
