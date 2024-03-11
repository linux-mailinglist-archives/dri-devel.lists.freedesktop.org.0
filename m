Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E71878670
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08C10E02A;
	Mon, 11 Mar 2024 17:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pxQ0BRB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FD610E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 17:42:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E4A660F4D;
 Mon, 11 Mar 2024 17:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD3FC433F1;
 Mon, 11 Mar 2024 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710178940;
 bh=eIK8ck9qFgdzPH9Ge4megCULbdYgFdE0in7FXrXDZ4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pxQ0BRB8qm4W0m40o5dWtGMpdtsnKbtg/jXgr8jiUwhuszJtVQwVa0ZHmNmORhMRC
 H72/3E5ijoVpLvgVNXJNhD7L0O8khV+I52/K8/QzQqbRWyBO13/PAGpM24AYMwcpky
 aLvMWd865rM9N5O4B19snk/Xz4qwJ8r9KGuLUCNXdfGMcye8XSAsRndSD5Dq9YoWrI
 qhh5XbOUm3u8/l3gPUXB3WKXqYphZa7Fg3P/Bn9kcNeB6RIZws3B6li0aBv+J6rEA3
 avqBQnGL17sO8xhvBWy9U6IAJWbUuURQBuhePeAUPciDi/k4CtddQ5WKd8QqGan19E
 dMJCLP5a+iT6A==
Date: Mon, 11 Mar 2024 11:42:17 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
Message-ID: <171017893732.1474464.15771358917061546141.robh@kernel.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
 <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>
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


On Mon, 11 Mar 2024 13:20:09 +0200, Dmitry Baryshkov wrote:
> None of the in-kernel DT files ever used edid override with the
> fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
> core allows one to either override it via the debugfs or to load it via
> request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
> EDID and/or modes are to be provided as a part of the panel driver.
> 
> Drop the edid property from the fsl-imx-drm bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

