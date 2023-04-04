Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A882F6D6E44
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A3A10E3BD;
	Tue,  4 Apr 2023 20:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985410E3BD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:46:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w9so135805181edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680641163;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kT23cCkJUnon2KM97SgS7BPPzYe1mYrfR1mV8DBgJo=;
 b=V283pZn5eDouVPigXRqp2+Ek2GVPjy9jfNXP6NRCBPJ1KcCoR3hm40xoVn5sDvctTj
 k+FxbzIdum8MdCV9DwlBZiaxIyNGOJg7WBL7zvVslLVFwUV1JXvQTPMQZVVZrCo6bBNW
 o2yCZdHGMQzv8SooZkJJv5KGSZXBHiaTpA2n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680641163;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0kT23cCkJUnon2KM97SgS7BPPzYe1mYrfR1mV8DBgJo=;
 b=bloWwFSFDVDSe7W+x/9FreucaiJGSILOzuECXX0i756YDCPjmnc7XIXKg9iEmqhThR
 O0oE+UvVbFCKFR8QY/wZ43JzbCQo7VANpAUpyw19HGGNGtKRDqhUDVbr+NJAWZoFS76e
 np7l13XoPVYTDZsTrrLGVkU1Iihly9XNuF0xCPMuUVwPHTl8+R7oh/gBfoa5AayV0E9H
 iuSLHXQZefxAAJgJgMb+SkcMT6v316tpEscoIHeAdZEM/BdI9DKDTrCtVk2S5gVaj3PF
 X08MI5hQkpuZ8U3it6aOqhpcQZ4u2iyMHT8NRrbR4LYmbNWIuqUfjn0KbLCNAKdh+l7l
 7NvA==
X-Gm-Message-State: AAQBX9fCCNm8qnLmbYjNGAX1hAUdk0G98CXWA2jpSOCJUIyA8c67HRtT
 JTvj+L/V9jmzxDkjl+HuAVkqew==
X-Google-Smtp-Source: AKy350buhut/rRziDOpqOTB/hCcfUaN6fYIb8Z3wScgzOrvxzehP9oATLJ3DZdG5AypSWSERpIpqTQ==
X-Received: by 2002:a17:906:2dd:b0:949:148d:82c0 with SMTP id
 29-20020a17090602dd00b00949148d82c0mr3071078ejk.6.1680641162893; 
 Tue, 04 Apr 2023 13:46:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 kx6-20020a170907774600b009310d4dece9sm6389443ejc.62.2023.04.04.13.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:46:02 -0700 (PDT)
Date: Tue, 4 Apr 2023 22:46:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/vblank: Simplify drm_dev_has_vblank()
Message-ID: <ZCyMiERvNHTP45o8@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230403160735.1211468-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403160735.1211468-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 09:07:35AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> What does vblank have to do with num_crtcs?  Well, this was technically
> correct, but you'd have to go look at where num_crtcs is initialized to
> understand why.  Lets just replace it with the simpler and more obvious
> check.

If you want to fix this, then I think the right fix is to rename num_crtcs
to be something like num_vblank_crtcs. It's a historical accident back
when vblanks without kms was a thing.

Plan B is someone gets really busy and fixes up the entire vblank mess and
moves it into drm_crtc struct. Now that the dri1 drivers are gone we could
indeed do that.

Or maybe instead a patch to improve the kerneldoc for drm_dev->num_crtc?
-Daniel

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 877e2067534f..ad34c235d853 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -575,7 +575,7 @@ EXPORT_SYMBOL(drm_vblank_init);
>   */
>  bool drm_dev_has_vblank(const struct drm_device *dev)
>  {
> -	return dev->num_crtcs != 0;
> +	return !!dev->vblank;
>  }
>  EXPORT_SYMBOL(drm_dev_has_vblank);
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
