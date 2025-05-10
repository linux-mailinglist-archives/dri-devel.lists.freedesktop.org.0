Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DCAB2249
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 10:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACDE10E0D9;
	Sat, 10 May 2025 08:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Onec8uAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996B10E0D9;
 Sat, 10 May 2025 08:52:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C870DA4D4CD;
 Sat, 10 May 2025 08:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C05C4CEE2;
 Sat, 10 May 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867137;
 bh=XlSaDcr5Jh/2SaK+r7tKkviHv8HgHXYDdcwF93LaoB4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Onec8uAzD7JmmamW/YEPqOUFoypYhWj8QtO59vn2yzlxEq0v4xgsbhuFiafzvrMn0
 Ow949GOq9iVM4kip0Ronu9lJakUdq54CzR4LdMuTlcisGECEiVv7dc0s1hPT5IoQqY
 t/9+aHYBR4TyzoEGGLVwS2XC35luhlip1BzWM6BD1b++jeU2i0I9ARrypFsfPUpwhT
 CmN6gFgoOLqEwCadm0oY46/xw0tKBUQzcEcbNAMh2mH1jKpA00lXqce8uUTG8jehUL
 +RqsyvC8A/FO6+A+YrkNhnghMpdPZCcydpNtNT7+499Oj6zqJ9XFr3O/upTwfLGH8d
 cZAfLgrPEA4xw==
Message-ID: <79d5e811481345b20d53c0159f8e0aab@kernel.org>
Date: Sat, 10 May 2025 08:52:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 05/22] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 convert to devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org,
 "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>,
 "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martyn
 Welch" <martyn.welch@collabora.co.uk>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Peter Senna Tschudin" <peter.senna@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 9 May 2025 15:53:31 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
