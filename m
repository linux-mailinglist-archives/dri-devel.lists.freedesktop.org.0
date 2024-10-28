Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76B9B2B3A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460510E43A;
	Mon, 28 Oct 2024 09:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rpL9dg80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BAC10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:20:51 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so31845031fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730107249; x=1730712049; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
 b=rpL9dg80EzEfnfVMEa66J41BCfHEm2gSoOPSC5DW4Os3mM55eFLBcodjrXRvy3aG5K
 Clg0Ee5rbxAR3d1RJO7EJ63xIE9X4wUvd9eE/ypjaMYd4BYLTsJCkdD2Nd22C/z2mL5+
 gxk5ZvQFxtkfYkd7uBlUEIQbkTtOss+cpCdnkqecknfxDPyDPRjAoFuA0K4HUmeMQbcC
 gpr+HRKosLbbSDLmC5b9djHOgwEZujJfM7aWbHho7v1U4Swf1EFaxuFsqFwrNNTGwSFy
 kCuyGzVl6CO7R0j6GPUofqm1nd+yLI2nMQqPdvVBOl7caJPfMwPZ0oNHMoK3HosCpQ+v
 uc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730107249; x=1730712049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
 b=sXTzCrXpDv0vnj12qiTAhgbnN5RXOQhMMmFx6/qZHu9VLwfltmaTL2SKi9kYYWpUGz
 Nauv8x6iu+u+h8Y9Y/thlE1PXTQYo1Ja4JUXDD/syC7yxe43F0OhMC7XEli58RhXmJdz
 xpUP5DuxI0hpxOiIUF0CpptCzTo3RFihJTjTkZKGUggLSV5lAlXfucPfDYE8mAxt9dyz
 PCQlYyXmWXEyyhKEvwr0WKihvONHZb8/aoqiURS3AAMEeikzzgQFv7k4k2pUIKHtKWbH
 zMEyDqMByXm6y/+T40siUJjZTFN5f11liWAgtAt/IQ2ObP656OXAIOWHXSF8NaG4VxWX
 BxSg==
X-Gm-Message-State: AOJu0Yx+3DWp6t7U05W67ebLYbzInh7oUQaq2+nUcmkJ7dIAZ5V94syp
 1fPxCD+FhEO1+e1C2MhjOr4HD1mhY+jNsA17Ahs/V4XyoQ4hfYoIXAg1IuMqz0w=
X-Google-Smtp-Source: AGHT+IHMzC2RrBK1gDyjb7BDtN9UQMSMyOUaimH3SDT8yHY0Jieo0+u5sTv3iUOAiXJhLKZA5AAPKQ==
X-Received: by 2002:a2e:bea0:0:b0:2fb:5014:c941 with SMTP id
 38308e7fff4ca-2fcbdf71340mr25188781fa.14.1730107249435; 
 Mon, 28 Oct 2024 02:20:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb4507c44sm11199391fa.19.2024.10.28.02.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:20:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:20:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <tjtbvn5ewlzs6wqkp2ffquiiebakhv2eg3vt4mzooeb6nibx4u@qhwx4hxvj6ou>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-11-victor.liu@nxp.com>
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

On Mon, Oct 28, 2024 at 10:37:37AM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
