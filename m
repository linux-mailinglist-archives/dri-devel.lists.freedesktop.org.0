Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1AFC595FC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11B10E90C;
	Thu, 13 Nov 2025 18:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="LGdw+TmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CFE10E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 18:09:25 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B448026599;
 Thu, 13 Nov 2025 19:09:23 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JuVBlzQUfkY; Thu, 13 Nov 2025 19:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1763057363; bh=+WfrJYAcG5cVtaeOgZk4Ik7SVUGLhfv+q/98SoorJR0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LGdw+TmKg4/ga7JVk6RR2cNrViS4yxLbbMGIC7edjZ4aMgmEVjBt2KUJeymOIP65b
 izz/D3nd1BuwLkh+CFH7Ecn4mgsSeVDYaoIG7pg+L3nZfW0HAMtR9DBAX5xbTbaIJB
 WswuogQCKQq6+4bzGcg2nbVgu1wU8GCuFSAQ49Cp4DxZL4NyWbKe7E66JqvDlN/h1I
 dJarBGWmf4T6agr9xwBxGSYPLqT89m6hFwA5HDdHGAcve9ZGPDVpBHv9bGcqRaybiR
 zPtODu5O5AOYvlq+InKRc29oMvW/xjwBbg/RBiarpyOrMMQ1ZXWX98JHIrspjH//EM
 OEKCxNtOVesAQ==
MIME-Version: 1.0
Date: Thu, 13 Nov 2025 18:09:22 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix device node reference leak
 in samsung_dsim_parse_dt
In-Reply-To: <20251029074121.15260-1-linmq006@gmail.com>
References: <20251029074121.15260-1-linmq006@gmail.com>
Message-ID: <209646801ba4a40da89aa16853524756@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
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

On 2025-10-29 07:41, Miaoqian Lin wrote:
> The function samsung_dsim_parse_dt() calls of_graph_get_endpoint_by_regs()
> to get the endpoint device node, but fails to call of_node_put() to release
> the reference when the function returns. This results in a device node
> reference leak.
> 
> Fix this by adding the missing of_node_put() call before returning from
> the function.
> 
> Found via static analysis and code review.
> 
> Fixes: 77169a11d4e9 ("drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge")

Is the Fixes: tag correct? This is what I get for relevant code:

74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2074)     endpoint = of_graph_get_endpoint_by_regs(node, 1, -1);
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2075)     nr_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2076)     if (nr_lanes > 0 && nr_lanes <= 4) {
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2077)             /* Polarity 0 is clock lane, 1..4 are data lanes. */
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2078)             of_property_read_u32_array(endpoint, "lane-polarities",
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2079)                                        lane_polarities, nr_lanes + 1);
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2080)             for (i = 1; i <= nr_lanes; i++) {
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2081)                     if (lane_polarities[1] != lane_polarities[i])
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2082)                             DRM_DEV_ERROR(dsi->dev, "Data lanes polarities do not match");
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2083)             }
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2084)             if (lane_polarities[0])
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2085)                     dsi->swap_dn_dp_clk = true;
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2086)             if (lane_polarities[1])
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2087)                     dsi->swap_dn_dp_data = true;
74629c49e66cc (Marek Vasut          2023-05-14 08:46:25 -0300 2088)     }

This should be a fix for 74629c49e66c instead.
