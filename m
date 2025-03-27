Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBFFA7338F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC310E8E1;
	Thu, 27 Mar 2025 13:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TRYR+wJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D584910E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:47:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 772C7A42A43;
 Thu, 27 Mar 2025 13:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91924C4CEDD;
 Thu, 27 Mar 2025 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743083230;
 bh=RF3wdOFzL4vQqrB1B0vZ2iCYv5b2RA5x1OV5kLSU3FE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TRYR+wJJTnUYnvc1ODN4B9vpFKwvFoCczHvPyqf3uyWcee9vc7G3HqduxGVF99hGj
 2Anar/GswBgL04kQZ9wHQpotK+vz0ZpPE6+J7Eb/VTi2PcOmI2BZq3zNIwPhwtQdXG
 QbWKDgA4NBm1Wl/MModaDXner0J3IDHY/sZSU8C+1n6tLKZCMO4ElsgXDUpeelYVmE
 cv8Vp7Iain2yESM5cV0XyZbYHErfh63L4j48/Ex3hgmA1YRD5vqNgxkueELk2ceCHU
 7vcG8O9KKTohmlyEUFTgtyiTklRJvINQ1fdoDiG+RpkeAFVVaw9+WescKG+IQ5mZKj
 gfYcPqQWUU29A==
Message-ID: <83d859d94aeedacc2d5fb058a84bfdac@kernel.org>
Date: Thu, 27 Mar 2025 13:47:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 2/5] drm/bridge: add support for refcounting
In-Reply-To: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
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

On Wed, 26 Mar 2025 18:47:36 +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added to and removed from a DRM card without
> tearing the card down. This is possible for connectors already (used by DP
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
