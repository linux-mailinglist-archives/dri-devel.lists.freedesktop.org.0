Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565679145FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CD110E3C5;
	Mon, 24 Jun 2024 09:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DbgeLSBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC9510E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:15:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3635f991f4bso304925f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719220499; x=1719825299; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zIgCiOqDZxFI2uuCBgUiRtGa74MvVm/3sP1dkMWF9cM=;
 b=DbgeLSBCmcTI8X/7XdAX63WmzdfsHOYUlpZIraqH3LiTg+OqbPfMppBDHpYJKH39Ur
 FnqYbB2cvJI+psHRu2Gu6VP18P72tVhLYzw5R9ryl3OGD2Pf+aEezu2A9YIOiBlxolic
 IR7ff/Q7sUFQ/HE224WE+MzSpiOUcHIdfzAr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220499; x=1719825299;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIgCiOqDZxFI2uuCBgUiRtGa74MvVm/3sP1dkMWF9cM=;
 b=Vmf2Mt4KXRElVLugY2Rk8KQJJzWuyrM/UNrNPl7vo+kHuKnVG3N1M1vLht3FKUEuNc
 Xalm4Wscm3gdV7TXPCftJKhkRZGnCDiNnrQR8hseCW9qNcqqet4GrLvvPIRcEE5iRqYq
 mSQyn3t6mh7DS+KIpk/C/o6QnJ/Tlbv5hvdxxPmjad/+BQpcbrX4sDAGZP5+H5JsavPZ
 sw6Iq3W46HOPmy8J2YF/8lqwyORDibe+65w8U2KkkceejXLHmIcL9zqZd83Lu9fXlvQH
 X0IT57XgoK6VNGBjuEtJvAz+V7DnA5HaMUmpczRlgiyLGuNeU622gQ4BsMPhBVk4dl+J
 /nHg==
X-Gm-Message-State: AOJu0Yyo0jX4ZgMYwbb3LXUXEufgPwwQFIRqIiFjIQHJnFqMFLdTxLqe
 gxTklGnrqoGCINRFU8Q/Nv+qN1tqPZxNzqzQTwN0LDIBhtIx4UGNd2j3sFoVRpY=
X-Google-Smtp-Source: AGHT+IFp+gzewBfv8ZGNLpZ6eWuC39255ypBFHO9aEPFtXIzE2KwI67dNJaxBx7/okIjDFlh9K0O5A==
X-Received: by 2002:a05:6000:186e:b0:360:89ff:350f with SMTP id
 ffacd0b85a97d-366dfa3bb87mr4226535f8f.5.1719220499230; 
 Mon, 24 Jun 2024 02:14:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f694asm9470240f8f.77.2024.06.24.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:14:58 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:14:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/11] drm/rockchip: cdn-dp: get rid of drm_edid_raw()
Message-ID: <Znk5EHomvrTSw7Vd@phenom.ffwll.local>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <d0807fbde7b0bd06ebfcb5df5c3b1cdad4c4ef84.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0807fbde7b0bd06ebfcb5df5c3b1cdad4c4ef84.1715691257.git.jani.nikula@intel.com>
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

On Tue, May 14, 2024 at 03:55:07PM +0300, Jani Nikula wrote:
> The dimensions are available in display info, so there's no need for raw
> EDID access. While at it, move the debug logging to where the EDID is
> actually read.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index bd7aa891b839..90913fa26aad 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -266,15 +266,6 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
>  
>  	mutex_lock(&dp->lock);
>  
> -	if (dp->drm_edid) {
> -		/* FIXME: get rid of drm_edid_raw() */
> -		const struct edid *edid = drm_edid_raw(dp->drm_edid);
> -
> -		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
> -				  edid->width_cm, edid->height_cm);
> -
> -	}
> -
>  	ret = drm_edid_connector_add_modes(connector);
>  
>  	mutex_unlock(&dp->lock);
> @@ -369,6 +360,7 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
>  
>  static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
>  {
> +	const struct drm_display_info *info = &dp->connector.display_info;
>  	int ret;
>  
>  	if (!cdn_dp_check_sink_connection(dp))
> @@ -386,7 +378,11 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
>  					    cdn_dp_get_edid_block, dp);
>  	drm_edid_connector_update(&dp->connector, dp->drm_edid);
>  
> -	dp->sink_has_audio = dp->connector.display_info.has_audio;
> +	dp->sink_has_audio = info->has_audio;
> +
> +	if (dp->drm_edid)
> +		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
> +				  info->width_mm / 10, info->height_mm / 10);
>  
>  	return 0;
>  }
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
