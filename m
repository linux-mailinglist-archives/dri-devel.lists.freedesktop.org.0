Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA258A419F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 11:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A13910F83E;
	Sun, 14 Apr 2024 09:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUrfAEAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6BB10F83E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 09:55:33 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516d487659bso2818752e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713088531; x=1713693331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAW8FE3757+N73ozBr48CQyvPZHQOC5ywYwUdbEQp2A=;
 b=OUrfAEAxRLOzIlJvAJYgjDIhqpji6FNfyCEMERFoVQXstGr1UDrUUd6BiIxuQCN5N3
 JRHVrCnfS59KvfsLm2fRjGc4QL44OdGJNLHpuEhExMkf6dKez/agjBSWoTPienkYrFkG
 K4KblIjaIvAYkWIj/h+fwJTHszcmy8gtjLmdScjiKmMFk2AvDa6+9yrzYgAuxKCzrwZw
 A2so7OdpTTKkxeMTEYNz542mpPxBh1HnGdkprYaFY88bbbNNd87IzpwfsznBeiKVfOkc
 3fuyWS6au3pxWfP1ayJ5kVSfaxrJjJgzXZgLwKtTauJCR+imcU7YwAVgXA3viTGyBJhj
 Ut3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713088531; x=1713693331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAW8FE3757+N73ozBr48CQyvPZHQOC5ywYwUdbEQp2A=;
 b=dCfOY+zQ6t+Mj1PEuLJ0aDc0pdkOIt9wl92eQYiz1NbE+iUVP5QTV9aWqL0N115d/n
 siiUfWOMyFgN62XCKa8JgGjob3svDW2CcFbDBkHva1TWcsq6+G5sd1TESyaIkme4+Gjx
 WVS6E1B+PlMMi9UwGIM5H5L2DeMX1TisDZ49VuNzvcbkp10yc1KdtxyEnYDznb3UjDSP
 poRkr8GjskzGHYyqTYvX4yrAI9EQSY3BCPISMFUR6XFeyE6DKS5zPCYbftkeoaElFiId
 +IQJZPqHONr4U06av2NB5KZMV1NG9R8+pcSVratpofqhqC/wLvogW6U/rcBYyYSrwknM
 dGUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvsne/4QKl+U1+iRIcLc2fcnCkuE+/9/JEPLf5nlBZM0MSNaFGClqVyJcgHLGkzVc6kSUMwnSnZqY4cv/4f4LnhagPmAxJ20+lbGrBQWL7
X-Gm-Message-State: AOJu0YwzukvJ6FM9Vb3WBCOq9kOvzEtGhzyYNVayXPZzWlPB0zFBPRPB
 EZQb4kzmty4D1CeOLKdNBs81xsRUkugPZqVE81TYOLQ3kRjAI7gC
X-Google-Smtp-Source: AGHT+IEEKoM/iDTJCuznVR9HiQN/AVCO8Nii+pEgbCzxUMbS3kxqr5wisBFEtwUu4Hozxm6Lwg6jLw==
X-Received: by 2002:ac2:51b7:0:b0:516:c099:e785 with SMTP id
 f23-20020ac251b7000000b00516c099e785mr4409977lfk.20.1713088531265; 
 Sun, 14 Apr 2024 02:55:31 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net.
 [46.123.252.50]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056000128a00b003436a3cae6dsm8677094wrx.98.2024.04.14.02.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 02:55:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/7] ARM: configs: sunxi: Enable DRM_DW_HDMI
Date: Sun, 14 Apr 2024 11:55:27 +0200
Message-ID: <3289340.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Dne sreda, 3. april 2024 ob 12:56:23 CEST je Maxime Ripard napisal(a):
> Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
> module") turned the DRM_DW_HDMI dependency of DRM_SUN8I_DW_HDMI into a
> depends on which ended up disabling the driver in the defconfig. Make
> sure it's still enabled.
> 
> Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/configs/sunxi_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
> index bddc82f78942..a83d29fed175 100644
> --- a/arch/arm/configs/sunxi_defconfig
> +++ b/arch/arm/configs/sunxi_defconfig
> @@ -108,10 +108,11 @@ CONFIG_DRM_SUN4I_HDMI_CEC=y
>  CONFIG_DRM_SUN8I_DW_HDMI=y
>  CONFIG_DRM_PANEL_LVDS=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_PANEL_EDP=y
>  CONFIG_DRM_SIMPLE_BRIDGE=y
> +CONFIG_DRM_DW_HDMI=y
>  CONFIG_DRM_LIMA=y
>  CONFIG_FB_SIMPLE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_SOUND=y
> 
> 




