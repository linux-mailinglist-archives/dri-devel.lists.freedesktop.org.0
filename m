Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7499B23C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 10:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784A10E310;
	Sat, 12 Oct 2024 08:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mBdkieC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3EC10E310
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 08:48:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so443607e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728722888; x=1729327688; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ash+1oKuFiPE3A8tEMkMCFcio5xBuHLSoR41kg8F3Os=;
 b=mBdkieC/uPuE63vUQD9Mu+AcX3LQNeRAmPzxX4GvCnOXEK4PUOaZzf2u5WlubfyWTo
 hiMa8oeHL2TsRabd4R09OGF25RhLXgLZkzAEpQmIEw75BD0wVLH2URo/FXcAGPiMJNtc
 s/yuZVf11TiGizXTxtSrsCr7U4ZWdDHZjZEoMOOLq7iQGFPBG6E/1WyoOIG67XWijHj7
 37FRl4Y2G3AAV05qnCu67vnAP6wiXiBd4cM91G74/aYIV7/N3L5vRl1MRIBTAcweww9V
 SecUXybGb7H/KOYwOct7j7e+nwFWn1ghg+RgdS0E2+8gK4bSxtC6BS62D8Sm5yN+OSJb
 aWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728722888; x=1729327688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ash+1oKuFiPE3A8tEMkMCFcio5xBuHLSoR41kg8F3Os=;
 b=KDwWDi7pN1x5UXhgH55bOVVMbSOWkGayK+lViQ90CJAHxkCA/Z6iJwDRJy+sOfNlT/
 /E/JvHmdsamRs/TwuZQXwO6q4F1BIxA6AtfnKwTTkOTseI1aXLmN7WDRl5m24mqd2yeR
 eAffCgWI63ZbweXSBvP282ajHcTxrGulB2pRs1H8AcoKtOGOrCzU46h2cJZvlmN+4urS
 xINA3YQJ+YjYbR67S3Unraip/UxWpOkvvG/h1jLhlFO3rqZ2yFUjNJfdg53P27F9r4qj
 Ra8PRE7AC3SLSnKlg4nOnLlnCCBJ5czpZR4fe6ruX+2yoVYLAVHzcm1Y2irxE4KXUBv9
 eEnQ==
X-Gm-Message-State: AOJu0YwXi4Ko63kAmNetWMcXhLG98yR/59ud+NSVWLbt0VcBC2bsus36
 RD72T2ks1PvKq21xXnM73f/2418k7q8E3CllV3dv5F0fwUqI0p5c2Z76PTuZcaI=
X-Google-Smtp-Source: AGHT+IHEc4ZuCZYoFT2OUlml69hpickixa0aunTqwOmFQLHqCQKZVS3BFKcMPasacN1gqJ2srIOpVA==
X-Received: by 2002:a05:6512:2384:b0:539:8f4d:a7c9 with SMTP id
 2adb3069b0e04-539da552ebfmr3052540e87.41.1728722888062; 
 Sat, 12 Oct 2024 01:48:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e2c82823sm356433e87.184.2024.10.12.01.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 01:48:06 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:48:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 3/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Message-ID: <o7f5xi4ppam6ox2a6h7xgofgg62ewxfptgsbisbbqkwlwkjbmy@r7mgbhby5x6s>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012073543.1388069-4-victor.liu@nxp.com>
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

On Sat, Oct 12, 2024 at 03:35:37PM +0800, Liu Ying wrote:
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * No change.
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
