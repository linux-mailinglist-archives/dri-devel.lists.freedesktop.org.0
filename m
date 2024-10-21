Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30309A666A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B6F10E498;
	Mon, 21 Oct 2024 11:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LX0E7ojt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2810E498
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:17:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so5444704e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729509458; x=1730114258; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YNeF2ZBGHaW1ol/9+W1XXsRcpbYR9GHCwlVWOv4fcZQ=;
 b=LX0E7ojtRB1k3qCVa1GYrxjK1Opaj9tOhEBVwYSvu1xh7LukNoB0HH9SQz387TJwnM
 4Dtm1xGp+Zf7+NCys2oYrZGDDNKgqs4Wezu7mDV+083BA+yHsp7fC2LVbsk+hiren35X
 fT/6/ZbNc5jBF+ECRSyd2LesZyeuosjctY99vilzmqn4YLv5Hkn5VyGfC86MIn+qlddJ
 ylmoVuWmyEPFX7nqYxuiLSrwZrPhqPKniEq5WRGFDSQSx5CGeI4sg57lyTKOJZyTQH3C
 VLkjbhm5CEyUx8pI9jefBdV8fY++s0K5ctpxdFcEOCnpIHXN0aQC3bpx+PMIL9TPq4aK
 GlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729509458; x=1730114258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YNeF2ZBGHaW1ol/9+W1XXsRcpbYR9GHCwlVWOv4fcZQ=;
 b=mPQeEQ2PdcxZrGNU1FWKY3vkgNts/zOq2A40FkedzApocffxzzuH5+soX5QK/n6q4f
 MZmM8sde6h/T3DL5hbGMY5SK+TCvhXgmgWNYCo5eTHiFzv1rvXy0IOHym5RQTKQdspqw
 +HRTKlfgjkp/B/o1hWdK8e2En+EpPjKgk13PJNqAVpkkMf0omeoB9tvB3eQvcyYsq69F
 L7hrPMd6MyfFNUNJ33WQyAUe4mtLgRjRUugvIXASVPJd5WP2zhwpg2cjOgyNouf8EuqQ
 qyVzi+Lvd29sbdA7uUhH+JmWUNI4EmnVgeTxfUgRU7l/fn/gJgfDurIboJz0RtS1bD7e
 SWwg==
X-Gm-Message-State: AOJu0Yyi+uynWXNdHpclYCLl5erVkdpEl33BgkdILHPSMXKBEnW4Z9+V
 qHLfX56eeZAaQ7LmzZRAhnpVA1hLKu1JzPq4dnM9UkSHxE2GGz54NXg3tgHpgRs=
X-Google-Smtp-Source: AGHT+IEEkroMVurdl00NK7PlaqSl2yw7wRW19flraaPUODpUSSN62Bfto3+ygPG9Fg+h3Gwjkprg0w==
X-Received: by 2002:a05:6512:12c3:b0:53a:40e:d54f with SMTP id
 2adb3069b0e04-53a1543ef11mr5132397e87.8.1729509457981; 
 Mon, 21 Oct 2024 04:17:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223f0007sm458767e87.91.2024.10.21.04.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:17:37 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 05/15] drm: of: Get
 MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} LVDS data mappings
Message-ID: <ry5fed5bwwlnefcmfrhycazin36j2dsi24zegl4hteiuc4rxh4@qbs7imdlix5c>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-6-victor.liu@nxp.com>
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

On Mon, Oct 21, 2024 at 02:44:36PM +0800, Liu Ying wrote:
> Add MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} support in
> drm_of_lvds_get_data_mapping() function implementation so that function
> callers may get the two LVDS data mappings.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.
> 
>  drivers/gpu/drm/drm_of.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
