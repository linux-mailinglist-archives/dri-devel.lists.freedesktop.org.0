Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170BD19FAB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B1210E506;
	Tue, 13 Jan 2026 15:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tmNtaCHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36910E506
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:44:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44E0F40905;
 Tue, 13 Jan 2026 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A405C116C6;
 Tue, 13 Jan 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768319046;
 bh=PHMLXYcYeFMLCHsXk+6wPpFG2rT9iu0Lpjf1Mwx26o0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tmNtaCHZhnOPkNQtKmhqE0bQ88+IeHPB6ckoskfF7ruYjI/e08Cv3ldpq51A8gL5K
 qq0X+J8iT/Grf19XLTgb5OATfWR284kq/RnlqtUlkNoSxo6eibXw0WFnZlU02HB8pw
 e2+yJczgiszrzdUco7ZUEptG4UiqdKwfUFwhuaLNX9Vu2S9AuNmlZtb6nkEmMVGIhX
 KwjPuHC0MsPjRd7zhbOpkBnj44uodYV/nc/YhTg7NLH8IvjByTZDT7JyzL6OyBRWNg
 BTT8J2U3ljOUcbgUGhMiYHM2lYIf0yxPl3TAE7HT3MbvSZLQTMV1LzFo+UA30q7ZDf
 YE5fPWPxXXfBg==
Message-ID: <0985336fa75f27b7a85dd41e54a88e06@kernel.org>
Date: Tue, 13 Jan 2026 15:44:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
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

On Fri, 9 Jan 2026 08:31:43 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>=20
> This needs to handle both cases: when of_drm_find_panel() succeeds and wh=
en
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
