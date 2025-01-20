Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACDA16D4F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0640910E40F;
	Mon, 20 Jan 2025 13:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="o6TW02Qo";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="elCncO/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115B10E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1737379312; x=1768915312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VJa3igOIOuli78yOBBBQ2I7jWeh/0VyfqMMALgWLobk=;
 b=o6TW02QoNVuEinA9ElM0nzzzIyvEy9eNaBiT1QuB7s/1qqFNnaI+UBes
 yZ8Dsu488rPc9lpz/7ZETvuO/egG+eePYGs9UZK3fP77u+IqM6px1FgXI
 AiBpQuqYw9oO8wJS5zdJtLGX5/pprjS91YQj5hsJwv1grq4nTD14TNcQD
 dIRTm2DIQkRVEWkx1ftXiCmhOqlQ+Nb6OpgYJcUh40McIbmEmVhw5TSJF
 d4ytkT7ubpoYdPMMzuPz9N5lBsnGj5VsRul5D9S4yfqy5+G8I2jINomUy
 3Gr1uq57N90sucYD1gAAQ3TN1AhUG+Trns0XRAGLlRpnHhH2i5mV5oPyj g==;
X-CSE-ConnectionGUID: 7Z6aDZe1SdyguJu0ON+24g==
X-CSE-MsgGUID: G+cvdvTbQ++dlP2/mlRKWw==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; d="scan'208";a="41177777"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:21:51 +0100
X-CheckPoint: {678E4DEF-3D-3C670366-E45AD810}
X-MAIL-CPID: 6BF8297B60E42833DD72A353785330E2_4
X-Control-Analysis: str=0001.0A682F1D.678E4DEF.00A4, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3CB2161451; Mon, 20 Jan 2025 14:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1737379307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJa3igOIOuli78yOBBBQ2I7jWeh/0VyfqMMALgWLobk=;
 b=elCncO/WO5EWyRjQSgnHX2r7/ymbWk5vmS0vIrSwUhTNOFP1IfgcyQCHnQH9RibRZkrxb5
 P90M2xhx+SgaMygBX0lEZDPmvtF/NZGaatkg8GGEjboXXwWyFzMp0/ja7yBwWFmIxhcCgJ
 su8nYIq5FtvAoZ8plPrH1Fpw3j4W/AAT6JHrTARaljOczii7NBc7Jhr22PBWZtoqNPj68d
 CU/+/XU8FTVtKb7e9cVrcmy+R0gr7HxjB9orMtiOE+lIPJbCyqfYMp4xXB5ojO4OWVDih+
 cRm5ZQtshBd+wwoV9P+zwgtxNvZgML8NT8VtKmbA7JjPLgHK+T4MbTWMgkSeBA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: nwl-dsi: Set bridge type
Date: Mon, 20 Jan 2025 14:21:35 +0100
Message-Id: <20250120132135.554391-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
References: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

This is a DSI bridge, so set the bridge type accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 1e5b2a37cb8c9..6f2581e0034b4 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1184,6 +1184,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.funcs = &nwl_dsi_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.timings = &nwl_dsi_timings;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	dev_set_drvdata(dev, dsi);
 	pm_runtime_enable(dev);
-- 
2.34.1

