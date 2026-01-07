Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED762CFE2C5
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D28E10E5E9;
	Wed,  7 Jan 2026 14:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GrPQ+prQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA5E10E5FF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 500DB60018;
 Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4990DC4CEF1;
 Wed,  7 Jan 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767794942;
 bh=PZWDOBLRey6Z9yX+RyF83GqTHUzZPfvvBMqFhTb+pZg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GrPQ+prQOkX4BEgihC3kMMyG17wnhrSstZOLnQqhZ6YxGPgNVxNzO9jWwat+cRVab
 YGij8q6a7bz/LWjIjWmcwvp6BWxpKKVc9XXYetlswpDBnQb4wbV0L1i7g2HW2ATEBW
 KuzxcHzluA9oP5Vhbb2SsPp5J1X9cpdarnFrhtHopxt8scZm93r11XFzve7R35Luw8
 7iSpo71PthPlVmkmcLOo5dQ8mIkp4hToG2zAP7+WoR/LQe2Hl8JX0i40O/AgTdSJH0
 VYGGgVpsT90VnW0ypGc2ZqLlW5NW/xfnW2dze6eGtP5l5oaxfSJm2xPQK+GI40qTO9
 8koUD5HgnSc9Q==
Message-ID: <af317ef80c6bf8e670df3d6dbabacdeb@kernel.org>
Date: Wed, 07 Jan 2026 14:09:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>,
 "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
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

On Wed, 7 Jan 2026 14:13:01 +0100, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
