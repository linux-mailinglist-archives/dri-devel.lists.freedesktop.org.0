Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87775A7338C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FA210E8DC;
	Thu, 27 Mar 2025 13:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fPkC2YPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EC010E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:46:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44C1F614B1;
 Thu, 27 Mar 2025 13:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2B5C4CEDD;
 Thu, 27 Mar 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743083194;
 bh=fr5eXsH4ELM22q1VLft6cUDbRKWKY32EKB07b+nOwck=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fPkC2YPUg6U1AWk9VoIftitF2W8fruvym/IKkmjX44261oCL16avJfPPvNR+jI5Tb
 UsL2oVSbef3S+bgau3fT50BH6OGqrb5X6T/WYREVoCsx07BeG5G2xpqzjTbs5APdbZ
 H9wMIkF+Fln42CnAhH4aP0Cb29myQ7YecUgJMKUMSz5HWB4SPP/8WBOMhfR3B3lAyn
 VXzFJ1XllztFp7fpDSIpHm88cB2DdTHrgZadIz67ZmEsjW0PJ0h0IcWlDEhGWujPMU
 np0GeMOYWCBV4qZDS3XQzG24ZbafxAmmjZeY6ETvZM/PBYbtHx9O6I3ZCoXAoj7pDM
 6gVvqZ/3LM6zQ==
Message-ID: <cdf2955f1b9143566ba4eb7b87551441@kernel.org>
Date: Thu, 27 Mar 2025 13:46:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/5] drm/bridge: make devm_drm_bridge_alloc()
 mandatory for bridge allocation
In-Reply-To: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>,
 "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>,
 =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
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

On Wed, 26 Mar 2025 18:47:37 +0100, Luca Ceresoli wrote:
> All DRM bridges are now supposed to be allocated using
> devm_drm_bridge_alloc(), which is cleaner and necessary to support
> refcounting.
> 
> In the absence of a drm_bridge_init() or such initialization function,
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
