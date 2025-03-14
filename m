Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90285A61902
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5710EA1D;
	Fri, 14 Mar 2025 18:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzeTk1PC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48F10EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:05:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D11C5C4B29;
 Fri, 14 Mar 2025 18:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BDFC4CEE3;
 Fri, 14 Mar 2025 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741975532;
 bh=lhEsW5DulyDSp0JArffKcqrIScwbmbvbf0ZjrL1HpS8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gzeTk1PCeOr6rPGhDbklSh+BDQerfNde0ttF/29dB0QzvQXCnn998ZRW02qHJTf5C
 2Dp5kPrBi+P7sNsz1LWOzMKJNWEBvTt1JGAnqdFqujlhDf1a4C1VUDWCK7y8UZuh5g
 V2CCeB04bQlWY69deQ1X+2heBphAGne3remu2rcmLCfDuoGvqy+4uUvkj5DYqNuGw6
 oUqnDOTKy6xlvV1VM8WTTJpZP0I+uOsEbzK343Y0y0j6+4JJiTxFazz1fWIwjQA93b
 /yBSGrPOXHFnIuESpBNdwRDh9o7Ds3tyG5Ofc7yXqHzWHtNqmGSfP6S0H6Ez3mAgcd
 SYJyZ0Bdw7npQ==
Message-ID: <50d94c0223e60881c014bddd55382692@kernel.org>
Date: Fri, 14 Mar 2025 18:05:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 04/11] drm/bridge: get/put the bridge reference in
 drm_bridge_attach/detach()
In-Reply-To: <20250314-drm-bridge-refcount-v7-4-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-4-152571f8c694@bootlin.com>
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

On Fri, 14 Mar 2025 11:31:17 +0100, Luca Ceresoli wrote:
> drm_bridge_attach() adds the bridge to the encoder chain, so take a
> reference for that. Vice versa in drm_bridge_detach().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
