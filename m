Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE02AFFA8C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7420310E888;
	Thu, 10 Jul 2025 07:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PyoHTKL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EC310E888
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9466E6146A;
 Thu, 10 Jul 2025 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7351C4CEF6;
 Thu, 10 Jul 2025 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752131648;
 bh=5fQOMq6JhnmsvgxFUq50HdHYFmRTYxKZ4vzuLcA43T8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=PyoHTKL6leJ/3r46CMvcb9x3yEkmOgmD0iPkLzmdxI8nr11KCQmcZjZnyHeLlCgUY
 T9RyJxG1XNbav/TcKr39X//7FmHctBpGz5p4/57EpAaCZEzi1lqiyoXEkXzqXlg4MZ
 jfWweMXOlVzX7SU2fpK8iqmglVC9892dJUWkIrRe5DEX39IFmxBNi+RbhO5nSglO0K
 A7Tg1Fclz9vB/gB5T2fBHd1Hv1hqfE6PO+ZBfKdczCmdH7XZSrTj3TqKtvCr8BCm08
 vbfPmauCLRQAe4yQhJsjHeubM2HPPsnjkGUQuH/i/l2wLF+NbgnUIf90BtecgLVQBe
 4VdKBFc6Shl5Q==
Message-ID: <ad4f5b60c0fa5c2936713c93a9c17591@kernel.org>
Date: Thu, 10 Jul 2025 07:14:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 5/9] drm/bridge: add drm_bridge_is_last()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-5-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-5-48920b9cf369@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Wed, 9 Jul 2025 18:48:04 +0200, Luca Ceresoli wrote:
> Some code needing to know whether a bridge is the last in a chain current=
ly
> call drm_bridge_get_next_bridge(). However drm_bridge_get_next_bridge()
> will soon increment the refcount of the returned bridge, which would make
> such code more annoying to write.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
