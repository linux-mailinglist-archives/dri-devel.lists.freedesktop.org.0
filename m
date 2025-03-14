Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA86A618FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F6F10E318;
	Fri, 14 Mar 2025 18:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nYPb+g6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7F610E318
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE3CCA4781A;
 Fri, 14 Mar 2025 17:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D258BC4CEE5;
 Fri, 14 Mar 2025 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741975497;
 bh=LHJM4OU3kl+/G82P3FTZUg4E77KcnwgPswr6Flbh2rM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=nYPb+g6H7LYrbum7aeROxiYnk8fie4nu5F72GWC6DsqJdMDyU3nPz9+7gWsXus3ee
 MeQy+KYrAW4fvRe6QGQZwzQivZeF4GHmXZD7xliFgBFa97c18NhkYGfWvfqCvogNrY
 iD+m2/Yb8ki4IbQWPiMKW1GqFp5YRXdlUWbUwsOwmfUs5VL7uKutAJsCEvuFjSMpB/
 evvxcBfpCZrvdviy1gsOn/h0ldaiEtEl5qUYIM59+RbhL8E1RUtdub+IP8mQ+Id58r
 4MRlBQb6/tmg8O8NMwrAtg1yM1d6mSNKRB8ljvt2dJqhLd4YMAwk5EB1kjNLdjq2Sr
 0bRogUFvyBX1w==
Message-ID: <4199151804db21307707fc7e023d10d7@kernel.org>
Date: Fri, 14 Mar 2025 18:04:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 03/11] drm/bridge: get/put the bridge reference in
 drm_bridge_add/remove()
In-Reply-To: <20250314-drm-bridge-refcount-v7-3-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-3-152571f8c694@bootlin.com>
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

On Fri, 14 Mar 2025 11:31:16 +0100, Luca Ceresoli wrote:
> drm_bridge_add() adds the bridge to the global bridge_list, so take a
> reference for that. Vice versa in drm_bridge_remove().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
