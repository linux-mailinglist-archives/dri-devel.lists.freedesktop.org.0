Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5219D5679
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 00:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796EA10E0C1;
	Thu, 21 Nov 2024 23:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ySJgz6w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7F410E433
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 23:57:18 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f84907caso1629024e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732233436; x=1732838236; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FGZRbTR/uK+ftQ2TfPgufc2P+z5Ye/l5g2WR5F5d4JQ=;
 b=ySJgz6w5oBzFXYhOuPe/nGsNhU+zNJG2b8L9PVbn/bUs3VWON3eNoa9uStkEHfeVhw
 P8hTd5+IBAxnwKAQwHiGpUN3PzKQu2YdEAI1knXqSAV1fi7O+RGbxfu5X4NzNGIsqaIc
 FwHqF3Ord5WPhSKGVU6NCfXVmZ7WqRcBmV2qLVSL59WwWEf9BsOrIfwMdXRxePS22nOW
 TUOTj4cq8JA1XOjjTO1eMyoZMHs8+GR9jHnYZ1XNhHvwE5ArXu2iNKeGSe5p4tqTNqNG
 ZplqhYKJ5+o7YyCPor0OAE+YUAOSMIjD7QUU4IBaAwuARGRbZkblg2WVNepuyepbM8kV
 zpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732233436; x=1732838236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGZRbTR/uK+ftQ2TfPgufc2P+z5Ye/l5g2WR5F5d4JQ=;
 b=o26+t4K1X4F/qfZsgAW0N+xojsQ70QRtUEEBBTPIbaXJvWxVN90WvNuZdPOR8sHLKV
 12rl1mPVJ7nRWdmZLlr7pROxGi8WDT/4/Ofq3HfKwzDnH7T26O7VPhqVS4Qlmf8yZ/BB
 g2qjQ3PBb74Lz9lTi7X68vaedoQYICQW/4zZA1+AszANvPbuBZj3JmJKBIQSO4esQkNQ
 HQDud6kxpS6bclegIildFftDFD6S7aRcQ1Rog5tlM8MPQBzLMDQ991QPJoyedHZc+SjM
 v2OSc1qlsXJ5FG/50ZnBUDNEjnCG0Hm/0Hj4AaGCmhLmW/qQV8hDyF6GyjvvBD3GPvrs
 otBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8wKTZfVhN8WUsEo2dJo6eNgj+Cwpw2UGjcrz20eahCCyzGmZHGJQ4OEBfWLPIXZYhvgp79Os1Wxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTAAeasM/uhOQR5mTV9BhsMTxJqCtLV6swhNcOxMcxGkab1AeR
 tM8fHqYc0C91mTVa6itoSADf/qGPnN//f4Xs2qpUq7EOXa18N6IDq778WligQQE=
X-Gm-Gg: ASbGnctnuCcQPB8oOA7oAWdeJMns2VgRf9Yok9ZfcF51aLaCb7lOfF1C0dg49c76wQQ
 F4wF6ag9j7MHEJpYlLTZZXm+sKgiSF3uIiKFe7NMhwzKQzUylKpbGlENlm8ucXeSh4uD5ASc0RM
 /ueBIPMZ+SuyIWHl8tPJWACEP79irvkeGaximAm5Llr2PJpacMfph5bkyezJ/QI9mj0e2Q8hQJ3
 69dZqjeH8JEZIuveQpQPG0ddUTyTs5vGcTEgi8ooJ0bN888GSXkc7xodSkZLeb7QnBJWypJrUCe
 NwjK1HMT9sTK+cEbdmVOE9idpdQ4EA==
X-Google-Smtp-Source: AGHT+IEmXbDQJcAUYj6lojIiC9JM4M4ujCCevK4TnX7twcBWShy1O7UHHnGrFWe77gpB0XWeTqJyWw==
X-Received: by 2002:a05:6512:b10:b0:539:adb0:b91 with SMTP id
 2adb3069b0e04-53dd3ab11a5mr254370e87.57.1732233436333; 
 Thu, 21 Nov 2024 15:57:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2481e38sm114731e87.123.2024.11.21.15.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 15:57:14 -0800 (PST)
Date: Fri, 22 Nov 2024 01:57:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Message-ID: <u4iaxbpuozap5rhjraxktq2wzxwdpqxj7ldglpvsmvpnxcutuz@ak2eiwtb5fg5>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-4-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:42PM +0800, keith zhao wrote:
> move rochchip inno hdmi connector to a newly created directory named
> inno-hdmi.c, and rename rockchip/inno_hdmi.c to
> rockchip/inno_hdmi-rockchip.c
> 
> This patch refines the Innosilicon HDMI architecture by abstracting
> the existing connector into a bridge architecture.
> The drm_bridge_connector_init function is used to create the connector.
> 
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS                                   |    2 +
>  drivers/gpu/drm/bridge/Kconfig                |    2 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>  drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  376 ++++++
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   34 +
>  drivers/gpu/drm/rockchip/Kconfig              |    1 +
>  drivers/gpu/drm/rockchip/Makefile             |    2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  690 +++++++++++
>  .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |    0
>  drivers/gpu/drm/rockchip/inno_hdmi.c          | 1025 -----------------
>  include/drm/bridge/inno_hdmi.h                |   56 +
>  13 files changed, 1171 insertions(+), 1026 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (100%)
>  delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>  create mode 100644 include/drm/bridge/inno_hdmi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f787dd625497..7766ee0bdd74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7439,6 +7439,8 @@ S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/starfive/
> +F:	drivers/gpu/drm/bridge/innosilicon/
> +F:	include/drm/bridge/inno_hdmi.h

Separate entry, please. This is not specific to StarFive.

>  
>  DRM DRIVER FOR SYNAPTICS R63353 PANELS
>  M:	Michael Trimarchi <michael@amarulasolutions.com>

-- 
With best wishes
Dmitry
