Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55851986E82
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22810EABF;
	Thu, 26 Sep 2024 08:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H53/D/x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A0710EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:07:13 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f7528f4658so6395971fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727338031; x=1727942831; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qcdZF6UL2UXjFioy7LxFleeVQgy9EQrE3cGYWKNYiKA=;
 b=H53/D/x7C11s4S5YilMLaoV6oR8nMqewli549AopRSTFNapvnNfM1sfapUVnslZ4IW
 EwILgow6D6LYaXiIGEtUL9NJlVPWFygNoYuc/qalQAkssUcaGFQcEn0uLg+QMutw8Ug6
 vhjYaSEQSoa/iWLUbull434VikJONq0cH/WtprJI3Alhkj8okvd044JfrKWONQl1fpM8
 EiPJ/01Jz0VRKuAPbsbFPNrAjc9PAhnZtdf81FxzeqTstHZElqTPFNGSCxZsU+YOy7mC
 uVUVxcxD0b2FEHOJSrLEB6q0spgJSYEzkt+mgQpGKPfDUkP86+YaHwJ42P9qkca+t9Yk
 VibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338031; x=1727942831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcdZF6UL2UXjFioy7LxFleeVQgy9EQrE3cGYWKNYiKA=;
 b=dCc0/LgDYPGjVQY+X9/xCYqDRQnVIK4f3xwAccVR2q7tuPsqu+i6Hu6mwPXd4VIZXS
 fD6tThKEWd4MoN9Hfs60gHJb4UCSdEYZcc7uvgz42VfLmuN31Pq8rMf4imQ6AbIMPrBG
 3VdOWVd54VaEpoRDvk3i+XoHH2FZ9joll6Ih7BU/Ql73ojJQgufDuXG4LSghMO9Vw+By
 a2KkISaBU59O0IVwWHpmaicEaw+ERk1IgcGRwR1XJTqjiVe7cOfVPAP1qZa92cabNBIY
 85EW8T3UP+iiRwnDSOQ2UbsOpINGMacYjj/6RwT+WBtQ4ZI1yk60A6iDYDfdygNDhzGb
 l3Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiSdpoNxq/lMrU2wPVLuA0l39hlbT3Ys0GpXSO432uchsjPRmlcPLxpw3j9Niud+RRervRi93WA10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLz5kjCSWaR2K//VCf16v4btUYGvbbeyat6tjoSoHqLOp0/IiN
 NIzJhxxaIjUiS3WcpRbVSLShzKnN6h42AeLmnAEvwPAjdDABcVrl3lS+HQrc1HA=
X-Google-Smtp-Source: AGHT+IGxp5j7kEG4FZr2p9qw6+rAb8iblxhC96ppPWbog+IP2oHA+mgvxre4KxK20PKOjaCpfzsqxQ==
X-Received: by 2002:a05:651c:19a9:b0:2f7:603c:ef99 with SMTP id
 38308e7fff4ca-2f915ff8578mr38803891fa.16.1727338031383; 
 Thu, 26 Sep 2024 01:07:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d288e1d5sm7511261fa.90.2024.09.26.01.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:07:10 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:07:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Allen Chen <allen.chen@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP
 repeater ksv devices
Message-ID: <xyi4czye2dwqmh6iaschacduwxm52oaipbt5ulvlmalamkzwbc@6gt5endjo6gl>
References: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:50:14PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> A HDCP source shall support max downstream device to 127.
> 
> Change definition of MAX_HDCP_DOWN_STREAM_COUNT to 127

This results in struct it6505 growth by ~0.5 KiB. Please mention it in
the commit message.

Is it really required to have sha1_input in the constantly allocated
structure? I think it's a temporary data, which isn't necessary after
processing.

> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index d1f5220e04a6..5d5ce12cd054 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -296,7 +296,7 @@
>  #define MAX_LANE_COUNT 4
>  #define MAX_LINK_RATE HBR
>  #define AUTO_TRAIN_RETRY 3
> -#define MAX_HDCP_DOWN_STREAM_COUNT 10
> +#define MAX_HDCP_DOWN_STREAM_COUNT 127
>  #define MAX_CR_LEVEL 0x03
>  #define MAX_EQ_LEVEL 0x03
>  #define AUX_WAIT_TIMEOUT_MS 15
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
