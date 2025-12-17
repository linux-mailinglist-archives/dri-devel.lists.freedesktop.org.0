Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCDCC70FD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAA10E2DA;
	Wed, 17 Dec 2025 10:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rm2NHFhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7E10E2DA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:25:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4036C6018E;
 Wed, 17 Dec 2025 10:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B6C4CEF5;
 Wed, 17 Dec 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765967121;
 bh=j6fWBAYEXtE3Kd4XTM6pOK9YC5GmGveHQTJogZwLkDQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Rm2NHFhSLip7bSLXiPGfLGtjzkUVxs6dUDd8ey0B8wNTOtLmMaxmzMTTKRHEFzBWs
 sdBBztUA8NDkaASfgt12Wb2zY3TIJdMJ9ZynH+qEpRy1GR9do4WKZMQIlJZeauI5Se
 tXkstKJunbralmVZCVBcCXkWZeXUKvqZ56Vh/PLOObvKo05r8ZuWzAxbamZnSPdBx2
 a+BViYe4R8LELixb5GNRs1I9i6d2zY/2ebsdiYDAyDpACOnCQfUmE8H8Wps81ikznb
 +SPzb+Awo+LWePjP+k2iqoC3iBH8GNM7xvAoIYZTu9TJjr3BpObrFmqZ0kEyRbUgYI
 /512xnZHl1/RA==
Message-ID: <b95966ec5cffced78db429efa87dcf95@kernel.org>
Date: Wed, 17 Dec 2025 10:25:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 19/22] drm/bridge: imx8qxp-pixel-link: simplify
 freeing of the remote device_node
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "David Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Tue, 16 Dec 2025 18:58:52 +0100, Luca Ceresoli wrote:
> The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
> of_node_put() in multiple places, complicating code flow. Simplify it by
> using a cleanup action and making the 'remote' variable scope local to the
> loop.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
