Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9040CC05
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 19:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581D6E9CA;
	Wed, 15 Sep 2021 17:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9301F6E9CA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 17:54:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u15so5208958wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0nM+Ut8/xj3dbQ99zPBxyvR9R2SDTaP5d+cRnZK/aqE=;
 b=JuK6+X5E0UstYx4PeCHWkaMLiIRmagVgiq5a+jSaGqoYnCfowsfIL2P8C/Q+hEq/2C
 sHA3Zcl27hJ5GBOF2d3UVX4HN9m5pes62w2IS6DgE+wgV4KBeBn5C5e5yeuknx71m5sR
 6JYA/upKsFgovzSZqPoweiCuTPMH7sT3DvQYC0xrwu9mRiBm3xOp0bf9fn0iU1nD+80F
 i9LcD7W0bP1kLli6SF+XXk+dZpDry7x1aI78cwr+WAjciqNK5/twKWhDKeVJ2THFeIIh
 e3MFxwWl5rOQ8pk8Fk0na7OQXkZIVWdQa3BYWE2WNKoWVoZmdzw6OtTwjcwhM4QPVnTg
 Iamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0nM+Ut8/xj3dbQ99zPBxyvR9R2SDTaP5d+cRnZK/aqE=;
 b=XmY4yHevvAe3I4Iy7Ln+fs7dHLr8cTBh7U7fpYM79BnHvLlEvKw6bmDnGgvy4bIGhs
 UPdhRZoJI/QJdk/x+dAco+U+NIQrllf0bFrlO0Kab5sk+XvXceGBlkeKGomEUwTEPuwl
 jYEqPu7591roIzUrcD458rnCkloiIHp6cnzWxo1Sml+F0OBgZzpLvCRgVZIZiJJVw0iO
 CaKN8TqIrkJqUevMSpwVR3oG2Kst2vp8hotFJNWL7HvtZsoCUV48y1T2LOS2wFuEO3yD
 XC8R6a86PUO5fIx0uMpDkUlONr5JfVrwGR2wU3fg3qDEfY+lHkmvytHdA22hg1YYLtV1
 RA7Q==
X-Gm-Message-State: AOAM530fDvc0I0nE0GuiyHoCdH2mBUH7EbLHCp2Kc7cOvegZ4g7UXvOD
 t+/yWEztVL1FxjBQi7Vp/oVqfk2FbhI+nw==
X-Google-Smtp-Source: ABdhPJxlT7F6A1KRVA7R7aP3Mb4v0oHN+WF51hua1CS3EupdlzfQztmVWRLupzNgXt7ye/2kHRiZgg==
X-Received: by 2002:adf:f688:: with SMTP id v8mr1387322wrp.189.1631728485057; 
 Wed, 15 Sep 2021 10:54:45 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id s24sm583246wmh.34.2021.09.15.10.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 10:54:44 -0700 (PDT)
Date: Wed, 15 Sep 2021 18:54:37 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Iago Toral Quiroga <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, mwen@igalia.com
Subject: Re: [PATCH v2] drm/v3d: fix wait for TMU write combiner flush
Message-ID: <20210915175437.g6mepp3blbbps6gb@smtp.gmail.com>
References: <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
 <20210915100507.3945-1-itoral@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915100507.3945-1-itoral@igalia.com>
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

On 09/15, Iago Toral Quiroga wrote:
> The hardware sets the TMUWCF bit back to 0 when the TMU write
> combiner flush completes so we should be checking for that instead
> of the L2TFLS bit.
> 
> v2 (Melissa Wen):
>   - Add Signed-off-by and Fixes tags.
>   - Change the error message for the timeout to be more clear.
> 
> Fixes spurious Vulkan CTS failures in:
> dEQP-VK.binding_model.descriptorset_random.*
> 
> Fixes: d223f98f02099 ("drm/v3d: Add support for compute shader dispatch")
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Applied to drm-misc-next.

Thanks,

Melissa

> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index a3529809d547..1953706bdaeb 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -197,8 +197,8 @@ v3d_clean_caches(struct v3d_dev *v3d)
>  
>  	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
>  	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
> -		       V3D_L2TCACTL_L2TFLS), 100)) {
> -		DRM_ERROR("Timeout waiting for L1T write combiner flush\n");
> +		       V3D_L2TCACTL_TMUWCF), 100)) {
> +		DRM_ERROR("Timeout waiting for TMU write combiner flush\n");
>  	}
>  
>  	mutex_lock(&v3d->cache_clean_lock);
> -- 
> 2.25.1
> 
