Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7ECFE1A7
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D9110E5E0;
	Wed,  7 Jan 2026 13:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U3GY/Qvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC1910E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:56:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A936E60007;
 Wed,  7 Jan 2026 13:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80D6C4CEF1;
 Wed,  7 Jan 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767794202;
 bh=is+q/rGp91VXaPijC+q4cj64jd7mGpSySGNDyI9q+mg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=U3GY/QvcyWmbXZeQ9v6SGEQMjvfLVh20Z62ki8Tf9dzfKJET754JDghzGb+Nd5Dz5
 Vv5Zu4g7TWqz0suD8gP1N0yMEve5gmuFYdP3CI/CGFCAZitnQ0rzsxw0oKkeDLZEgj
 XkZSIORN85IJg0iuV/GZyDdfl+PZICrqaGGIMFGLXJkAqMjNTlUP6NtL/JXiVDoZtn
 ccKweo3sOYUcYpNAPpJyRW6LdL0DyQntjZQy5LxMZnGSxTEqTkAC1dm0KbxA1nHxWo
 zbYtmLKsOIIMBFIp2guflw0pWEO045X/QoAkDeQoQVbXQQd0pbWcRfJGA9gGpVYPLY
 Wcp64O+70hyzQ==
Message-ID: <d06f91d487a616258431aa0b8b615b05@kernel.org>
Date: Wed, 07 Jan 2026 13:56:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:58 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
