Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C205FA6B822
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F084610E764;
	Fri, 21 Mar 2025 09:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G92hIB2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC11F10E764
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 626BD5C6D92;
 Fri, 21 Mar 2025 09:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F7FC4CEE3;
 Fri, 21 Mar 2025 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742550898;
 bh=TC3r2kF6h1DguPsHjjEeqn2dDugjdFWL1T8eZNZFK7U=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=G92hIB2X8Wwiys82uVSEu8Uj+jPevWW5gsMb3/Ub2Aj+nRnnmXcl2CCx9MQi6BPJj
 mVImTQqhYbsPkD8BIiI647oQtRIjVeHMufD3xer3lpfyCgJvyOyvoA/LP1Z8Gc/730
 abkxD1wnAEeW/wtqcCXh6SBggwAU2VRmsIZnWlbDrR3IeIyg6H887iljJ0ETRiHCpq
 0b7ce4aBeogQ+Qu1l+s9eel6AM6qEmh+MiJdXqDZEkYNfBhHZXy+ePNgEogfq8WGUQ
 SAAXeQIazO4EvxYj7Ac0E9uVNt8MSooPVFDswe5s8iP+dyQ3zVCYVUAUfxqscGyowc
 1HawfIyP4nC1Q==
Message-ID: <400466cd3c229ea6c6cb25e2a58cee27@kernel.org>
Date: Fri, 21 Mar 2025 09:54:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 2/5] drm/bridge: add support for refcounting
In-Reply-To: <20250320-drm-bridge-refcount-v8-2-b3ddaa9f1368@bootlin.com>
References: <20250320-drm-bridge-refcount-v8-2-b3ddaa9f1368@bootlin.com>
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

On Thu, 20 Mar 2025 16:42:11 +0100, Luca Ceresoli wrote:
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
