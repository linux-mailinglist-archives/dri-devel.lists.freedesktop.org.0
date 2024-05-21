Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091C8CADE1
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352CC10E904;
	Tue, 21 May 2024 12:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="epBRfOE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071A510E904
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:09:25 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52387b64206so928498e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716293364; x=1716898164; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BSr7XhF5S8WaGr9arreORqdLq/I+uMrvPz566WVlO90=;
 b=epBRfOE2gL73EBJnnbJd3ePa9uSz22XWqPXZzX0mEf+XUAQBHD0pSxeJ6bD8UNrzCK
 3vZdkl22DNEbjS81k/HIkBtYPJbTBxxBCfTL7euTrFj9EBDY372vHl6RVT2c40LXACU8
 9gxb435TqGHW47q84K1kAHkr5bKiMNLcRulXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716293364; x=1716898164;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BSr7XhF5S8WaGr9arreORqdLq/I+uMrvPz566WVlO90=;
 b=e32yv7g5F11ch6K/3D3qXcYR4BUUfaM2xsS1DaYGxE3W9Yak3zCVcJTP/isfiObLRp
 aA6nOxIc1V6Co/+9RtT5THzMpGcBP2EwGTCdnLikoAVeQMO0d7h0IJYSRm99oPELFeDI
 mScehwBiYGaDUaC71lSIOkCJvVzEIf4z8zPNX6FuiSp2DDcHTek5j+WEM/sDrGX9reyV
 gnfo1hTgtU1KPwatufbwZWqh9Jj7aD72CdyuaKMrvFmlWn1fs0Jc6mbZ2rvSO6MYs85Q
 FUCNfxJYQXf00mXfzk17Bfcrw388I5ma/eW9BIOjmWDKP6djCW7fcZ3GgrhyQAq2+Uc1
 k8GA==
X-Gm-Message-State: AOJu0Yx68H+07dA+5nrt/2s8An9+2YbFoZUmx1UoTCfoWNMKnZDDzPZT
 aUugos2yrscNZMS+ZXOAfjoL2CjhHl54LlL54SSEG0RPNn+8k0Bu/aqleaemzkw=
X-Google-Smtp-Source: AGHT+IHoXTL75VZZmSseXjU8/3hJvrLezkyEL4ClkngPvT91a0/B3d9SAEKQ8jn/6yXAyQnWEQvlog==
X-Received: by 2002:a05:6512:131d:b0:523:68bf:9d55 with SMTP id
 2adb3069b0e04-52368bf9e50mr14861039e87.2.1716293363766; 
 Tue, 21 May 2024 05:09:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7da8sm1612817166b.99.2024.05.21.05.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:09:21 -0700 (PDT)
Date: Tue, 21 May 2024 14:09:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/probe-helper: Call drm_mode_validate_ycbcr420()
 before connector->mode_valid()
Message-ID: <ZkyO7ybX-pdDiWMR@phenom.ffwll.local>
References: <20240516173324.18149-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516173324.18149-1-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, May 16, 2024 at 08:33:24PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make life easier for drivers by filtering out unwanted YCbCr 4:2:0
> only modes prior to calling the connector->mode_valid() hook.
> Currently drivers will still see YCbCr 4:2:0 only modes in said
> hook, which will likely come as a suprise when the driver has
> declared no support for such modes (via setting
> connector->ycbcr_420_allowed to false).
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10992
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sounds reasonable.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 4f75a1cfd820..249c8c2cb319 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -474,6 +474,10 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
>  		if (mode->status != MODE_OK)
>  			continue;
>  
> +		mode->status = drm_mode_validate_ycbcr420(mode, connector);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
>  		ret = drm_mode_validate_pipeline(mode, connector, ctx,
>  						 &mode->status);
>  		if (ret) {
> @@ -486,10 +490,6 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
>  			else
>  				return -EDEADLK;
>  		}
> -
> -		if (mode->status != MODE_OK)
> -			continue;
> -		mode->status = drm_mode_validate_ycbcr420(mode, connector);
>  	}
>  
>  	return 0;
> -- 
> 2.44.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
