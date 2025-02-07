Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A6A2B8FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C6610E9FA;
	Fri,  7 Feb 2025 02:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="se7HpdPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179D10E9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:21:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5441040a325so1168039e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738894907; x=1739499707; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
 b=se7HpdPzvD8qld0Mm3vDAV5W5rl+moYmpYg+TrlAUIrpayu/bGnHRaNHgjke+FSACg
 63lEHiaXAOZXCCMQNPqjr6/N/urUtCzE2JgDCw/UMtD/qexp08wE/5wUFl8sx/IL+YvU
 /Ka8/eULDuTowRx++bKc6h1wQPjPnZvfFLuGtUQeI/CjkHZMsoWL620gt/c/ynapHD9k
 8MzNB4hs7YTt0kki8Rdzl1oU229YvsgA3t4/vzLSJBBreitP3FcPkYvLcmO55KklvyPY
 jvszUWdmHGMdXOdYK3ZsROuyKMHHU1ne420OFF9QVSkyuZ76j1AjqwplosN6DRnEUNYw
 llBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738894907; x=1739499707;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
 b=mqUPKyqKvpnTGOmHUhk1DGooV87Vpeb+VffV8pMJ7HrvrJxRLPv3SDndu13EaF0xNG
 0FmuvDtkzPF+8ZLMZaY6OumNmEPKa1D035KSJViYqdHjiwnnHnQeGNzuhLvJEY4aTCxl
 VW8siuoVdORWetx715IdNmENyfEig7BdKNJnYyFV2wBkPPR9rhnQExtDpIprgKiMf1sk
 rrDgA2G9FogDGU/VKrh01GgI6NYuR6NkTSK8BwwEbJUvmfI2/hXpQ1sU9e9qJXzVlrnj
 noWmYWQCMkdfezOvoghKpZnBB07pEacBjhSefjZQpl1OoZ9FSP4fW2xvz8csCpPaGtCJ
 +1iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVATZvrJUu11c/s8QnM7y2ku10LTKDzlclvGa6aoYVATtSUMs/iSb5tbyg1s4QlNrhbqC5ylXoq9TE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHd5MKJjzzXub2qyjx4bB1I+cRrcxFJ6tsvd9kfzXD23L/ol0g
 4gIj9YRjZGzRkXCZqut0mc1LwZhr8mEukFE3ebFoi4UljJpJyXNOd1nx80AnV2s=
X-Gm-Gg: ASbGncvmwkd7j1rkM0ldzSqJ+TMqPdC37NWFBZpkqftMLT6J9y1XRoMLeV8ERAxcL6O
 Sirerj3HFADn09RKHjsXEcZuE+gLUWHA/SPHkLIvOq+l4TuGvQAHiG5EHi2gAt2rOKyeebDf304
 jXlk7D9aF3+JVoqYgFdYJJpPnbM3CANydG0JmSuQAOj0aRD5r/kwYFIAgOD+nu6RBh6X7Pxu7Hh
 sOaWCngnPM47CKsDm2wg2bdCmhV4lvMVbs5KJZaNhDfsl3q0MRmyzKOM4Tj59TyT8I5j0nDdpuf
 +8+x5Gv2qdiwKn5eNI6jcrniTuNgLO2+zwnwJE/RIh1y6PFQPTuv0DgFNsaxrRq3zjWVljo=
X-Google-Smtp-Source: AGHT+IEEMycc7B1Xywi6/voRjDNNe0jaAwgIo39w5VQbQbJyRuz6zbWk5Cv25Kf+Od2N2WEWuA4GlA==
X-Received: by 2002:a05:6512:3d0b:b0:542:2388:3f09 with SMTP id
 2adb3069b0e04-54414ae0b88mr338836e87.37.1738894907389; 
 Thu, 06 Feb 2025 18:21:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eb2dsm296973e87.28.2025.02.06.18.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:21:46 -0800 (PST)
Date: Fri, 7 Feb 2025 04:21:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 03/26] drm/bridge: panel: use drm_bridge_is_panel()
 instead of open code
Message-ID: <yokzxkh2fobfvrvcsp72o7j44tnhhb7w7sf5ofvsuibivju2my@bpauhrvwpkmh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:18PM +0100, Luca Ceresoli wrote:
> drm_panel_bridge_remove() reads bridge->funcs to find out whether this is a
> panel bridge or another kind of bridge. drm_bridge_is_panel() is made
> exactly for that, so use it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
