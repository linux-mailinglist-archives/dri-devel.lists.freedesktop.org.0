Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6390AD83
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE61B10E1D5;
	Mon, 17 Jun 2024 11:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wv0a+vGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0A110E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:59:48 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ebd95f136bso49333421fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718625587; x=1719230387; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8KXmCgiXbi+W1iA9MhwDCap2awLeCzu/ogu8EC1F34I=;
 b=Wv0a+vGraw1yscmr872PgDl/oDW3dMxSQIYGWxyNyozymEpLAB6XeWle67JJe3Y7xs
 DtuCV7jqfsGghYabOcd0kAvbJqUSPBiKy2HX2qogInw8WHhbYIQzx11P4IAPPcX5d+tq
 mq7J+Nlpf8M/tmJE3dNIFw3J2Z/dDCYUQdMa5VD9kfwJlNPxuU4dFpDPxotCIZLYPZlI
 vEVObMf1WpyfbT74kcX1BGRRpzUE4QXIjfvjUZexm0yOwqPc8tXmwZlBPTV34KiMya0G
 4ExsOr2+ZXzBRuckdUsYRHWsNEsTRCSI81XJvrIVZ66Pg58Vy0LgkpqQDpKSjCTFsux4
 yI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718625587; x=1719230387;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KXmCgiXbi+W1iA9MhwDCap2awLeCzu/ogu8EC1F34I=;
 b=BkVZA5iY8vkB1lTKwgZ+Gbnnqatv8sCFpifKCkZF4oiuapLggY330vEsbkH+0GTHOB
 VgZklovpU35qqLC5yqUQsjnSJjMLPgxObeDHU76eY8Pd6WSGmnB/ocXvmQAWYgY+aApn
 4AICk1aaDcsoWI7k3V/gy9vSVkVJCkONu+Uyl0t5OcIZ3+j8lSGNIzXv98Hq8R3v1f4I
 e3nMEHdtFTRebjr+Z5CM+kWiuor/onSfStsSgjlK6dwhbAbOu8zBS5Bn5l+Rf9+Bfvlf
 ihi+faG728gadz+PsTFq8PPOtSDNa3WxeGnvNgLtAv88+7sOgauo4QaUyI5vkiSYmQXM
 Zj2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRclhv9FOSZbWctAlny1bahIKu3mrwP4vL+Al+TaTxi4m7iwHEmuavwV4XUrQNbuUQlnrJdVtoAs1KUjUoomfY8gJcMIsnG9c1h0FU37Em
X-Gm-Message-State: AOJu0YxIGmuvima5piA697Y16R92O/DtVOIkuFqnXX8F8pdgyLa9T/mq
 etGMd2hj0S3vn+9TLFwqcL6kYCXQ6C7ycizaD4qQL69USkpBsxO7lXd2nQMgSWw=
X-Google-Smtp-Source: AGHT+IHb0F1oY+avRngvVJAyvRtdtWw1Eah+FceAxdnQ2X+0t/BvA9o1+Qa1OfCxtGKD3VTd4vkpww==
X-Received: by 2002:a2e:9b17:0:b0:2eb:e787:47ea with SMTP id
 38308e7fff4ca-2ec0e5c659fmr58540481fa.12.1718625586800; 
 Mon, 17 Jun 2024 04:59:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec2fd3cf4bsm1801831fa.34.2024.06.17.04.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 04:59:46 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:59:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v3 02/10] drm/bridge: cdns-dsi: Fix the phy_initialized
 variable
Message-ID: <fyxer3rl54uq7qemgjx7htykgsnwgg5ywda2d5f4fhzd6ksjfg@blvkbzdy6op5>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-3-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617105311.1587489-3-a-bhatia1@ti.com>
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

On Mon, Jun 17, 2024 at 04:23:03PM GMT, Aradhya Bhatia wrote:
> Update the Phy initialized state to "not initialized" when the driver
> (and the hardware by extension) gets suspended. This will allow the Phy
> to get initialized again after resume.
> 
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index b016f2ba06bb..42565e253b2d 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1153,6 +1153,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>  	clk_disable_unprepare(dsi->dsi_p_clk);
>  	reset_control_assert(dsi->dsi_p_rst);
>  	dsi->link_initialized = false;

Most likely you should also call phy_exit() here. And in _remove() too.

> +	dsi->phy_initialized = false;
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
