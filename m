Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3318A6C3B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E416E112C97;
	Tue, 16 Apr 2024 13:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PSCuqPLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E36112C97
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:26:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0BE38CE1062;
 Tue, 16 Apr 2024 13:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1AEC113CE;
 Tue, 16 Apr 2024 13:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713273981;
 bh=5aYaNxw9B1Vv3UwdMBqympkbBecQ21r1beQW8ZZq2DY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PSCuqPLYUlXJ9auMKlyd6garhl7QXySTp9eWlrmke6rMcEA6bSOA3LfnUC8fU3VqT
 GPEAto9Bkx2ZM8IF4P088l7kgOxqOuEnE+bNwHq16+/nePGty9YLofePGKDd43bcpO
 Bdahh5f5bc2i5XhtB1GX7qB/5fIWniJK4aX8YVhPxOh79o/Ndhs+KiNH0z6N0lVh55
 UybhBviVJQNPjuhuARdJgWkKgbX/9Zb/Cjx53bCtaBpu85N8j0GDbDman9uDJ9gcGd
 f8z5m6GHPRuEB5wi/1ujlFHNpXNGf85z3SDlMxwvjeeef71W5otMCS9CA0mdfRu71H
 ZR/8El87zWzzA==
From: Robert Foss <rfoss@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Nícolas F. R. A. Prado <nfraprado@collabora.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <mripard@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Christopher Vollo <chris@renewoutreach.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, owen <qwt9588@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240415-anx7625-defer-log-no-dsi-host-v3-0-619a28148e5c@collabora.com>
References: <20240415-anx7625-defer-log-no-dsi-host-v3-0-619a28148e5c@collabora.com>
Subject: Re: [PATCH v3 0/9] drm: Switch from dev_err to dev_err_probe for
 missing DSI host error path
Message-Id: <171327397342.20734.17712631533739758920.b4-ty@kernel.org>
Date: Tue, 16 Apr 2024 15:26:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Mon, 15 Apr 2024 17:49:28 -0400, Nícolas F. R. A. Prado wrote:
> This series changes every occurrence of the following pattern:
> 
> 	dsi_host = of_find_mipi_dsi_host_by_node(dsi);
> 	if (!dsi_host) {
> 		dev_err(dev, "failed to find dsi host\n");
> 		return -EPROBE_DEFER;
> 	}
> 
> [...]

Applied, thanks!

[1/9] drm/bridge: anx7625: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ef4a9204d594
[2/9] drm/bridge: icn6211: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=275fafe58faa
[3/9] drm/bridge: lt8912b: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b3b4695ff47c
[4/9] drm/bridge: lt9611: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cd0a2c6a081f
[5/9] drm/bridge: lt9611uxc: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6d9e877cde7e
[6/9] drm/bridge: tc358775: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=272377aa0e3d
[7/9] drm/bridge: dpc3433: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=24f4f575214d
[8/9] drm/panel: novatek-nt35950: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5ff5505b9a2d
[9/9] drm/panel: truly-nt35597: Don't log an error when DSI host can't be found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c1e4d3a6de48



Rob

