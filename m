Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AFCFDF5C
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916AC10E5D0;
	Wed,  7 Jan 2026 13:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZsLZbs7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CB910E5D0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:33:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FA8D41765;
 Wed,  7 Jan 2026 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D683CC4CEF7;
 Wed,  7 Jan 2026 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767792832;
 bh=eRal9aRJEBMws0AwIbeE+xWsj4dyQhrtTO2oF039rMA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ZsLZbs7o8rWvOy1KXRQEHXUY+OZNgKMmY0wLvJ8iieksy79lUKP2qpEbtYYjj18AN
 E7Xd9oiOs9XbNxr+4a9Ia06cop1T+OsmXvlKomwA1JcpOKqFyXILxvBcNGcMq38DZp
 HKbwnC7jmd/ik1tz4BPGB9OR3OcTMLK9ETrR22i4v2rVF8AKst/eJmHg3pizbZ0FCZ
 ciyGXWN51TABOpmO5w4SPjJ/n0kYXGAld0XeeODer6T7xx+Q6wEGXzip1eGcNwjLeM
 P+aBsWtH1MwJXQHaAnU27itZ5joYHKy6ZNad+h2Z7Sx4DhaMZt9mwn9z9kKmC5JLUb
 KNZlEazVnbbrQ==
Message-ID: <7e796e122dcbce9a8d7678db9bbfc89d@kernel.org>
Date: Wed, 07 Jan 2026 13:33:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/12] drm: of: drm_of_panel_bridge_remove(): fix
 device_node leak
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-1-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-1-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Adrien
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

On Wed, 7 Jan 2026 14:12:52 +0100, Luca Ceresoli wrote:
> drm_of_panel_bridge_remove() uses of_graph_get_remote_node() to get a
> device_node but does not put the node reference.
>=20
> Fixes: c70087e8f16f ("drm/drm_of: add drm_of_panel_bridge_remove function=
")
> Cc: stable@vger.kernel.org # v4.15
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
