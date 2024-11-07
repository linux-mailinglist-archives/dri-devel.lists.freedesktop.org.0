Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D29C07E2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 14:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174C10E82A;
	Thu,  7 Nov 2024 13:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OLf4HOiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824D510E82A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 13:45:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb49510250so9369911fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730987111; x=1731591911; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oYfmjInTwSrf8wkLQDjO5520/3amtQeI91RgnNq7ubc=;
 b=OLf4HOiGc3bFvqUBDb8dutgmXFP+z5BZHFEPx2dy7N40/PKj/ysvSswrZBF0wO5vt5
 BWfWzseU8UvJPVOIVJJLxVgKjlAZB5XjlqZ8m+4PDoM36/t9E5ovWBVmsFnFF3TeRzaI
 rdOaJPqyFFg1ZrdQExYFDAhyAAidVXEkpGwzqSBrublkk7hd2ebM0fG8stMdiIV43j8e
 sQAI8UvdsKNG6EjOapzQVb1nAK4irk7biTVTLXn+pxr8Sf5oSFMUCEFViPMLtYtG5pAV
 sz2dZNi+16XSW5GfNHcpm7TyszkBfg6Qk5FsVgrzwin9jSqviifpJpTKrtziIQN6TUTT
 22yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730987111; x=1731591911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYfmjInTwSrf8wkLQDjO5520/3amtQeI91RgnNq7ubc=;
 b=ZgrlV+rPz+ktiJWEEKVB7r1Ze8EukjVs0WAbYjjCQpNbLHMC66lU3d8LJ3Dxgtk2d8
 Dqt+Sr6QrgrIt9W8L9YqJSNhIiUsdeC5ejAiGWkjXxdmwVycq60ukqcKFqzfjU0lQfoz
 /xz/04sFnqT7ucQqSv2ETh6qkEdib7JYquykPcl3Ph3BixoVus7WuKeMMgTY6I+O+WFh
 eTUdqUMaIYzcogbvrIc+2fCz/2JolokPt+ddv85Krm4HHcVKqZE2XVj7i+55jyFV+WXg
 WeAPpFvUw76QwP0Nw1gxi1dr68f2Oj1h0YJjEDNjFhZkfTZLzkIF9sotAjMV9JgUS/wc
 7MsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxcpLAOurbTwyHQp+8uoWOvnPqsnTxt/7hiCbUnCfutgrQrFSu2W1t5CMdGV34Ukdch6OscezFHlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxNjm2g/n/ZglnHanvUnvFzptV/98fXV69tsQYMtFxOkumemxS
 pwh5OX2/1P/jypE3Rv81PG8ZIbtItifu6gicRk2Gg9LRUQxAPQHw1lUqGaqxkbM=
X-Google-Smtp-Source: AGHT+IFl+p0mMdxu5dSXrUkocxo9piGoG3Bvth7m60W3yHUYwLPE2t5/+pSBydipp+y555REAJVHHg==
X-Received: by 2002:a05:651c:543:b0:2fb:628c:2580 with SMTP id
 38308e7fff4ca-2ff1e88880amr264501fa.2.1730987111409; 
 Thu, 07 Nov 2024 05:45:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178f3ba1sm2202531fa.35.2024.11.07.05.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 05:45:10 -0800 (PST)
Date: Thu, 7 Nov 2024 15:45:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, varshini.rajendran@microchip.com,
 dharma.b@microchip.com, 
 arnd@arndb.de, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI
 Host Controller support
Message-ID: <6r4nna5i63eo7oo2xoclqxpuodbttvxceuwn2yl4to7aqti3md@i2wtdzhsj4fp>
References: <20241106093429.157131-1-manikandan.m@microchip.com>
 <20241106093429.157131-5-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106093429.157131-5-manikandan.m@microchip.com>
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

On Wed, Nov 06, 2024 at 03:04:29PM +0530, Manikandan Muralidharan wrote:
> Enable the Microchip's DSI controller wrapper driver that uses
> the Synopsys DesignWare MIPI DSI host controller bridge.

... It used on the board ABC DEF.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  arch/arm/configs/at91_dt_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 2022a7fca0f9..3ff89e27e770 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -145,6 +145,7 @@ CONFIG_VIDEO_OV7740=m
>  CONFIG_DRM=y
>  CONFIG_DRM_ATMEL_HLCDC=y
>  CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
> +CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_PANEL_EDP=y
>  CONFIG_FB_ATMEL=y
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
