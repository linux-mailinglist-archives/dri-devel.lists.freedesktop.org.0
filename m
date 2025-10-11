Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE08BCF7E2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 17:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C39310E1A3;
	Sat, 11 Oct 2025 15:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FP9bmFEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr
 [80.12.242.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8210E0E8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 15:23:22 +0000 (UTC)
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id 7bRFvxJn1A5xR7bRFvBQ4T; Sat, 11 Oct 2025 17:23:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1760196200;
 bh=a/TfkN8iuDSFf5GeeZL7tz298UI34rTKa4QzIThjPH4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=FP9bmFEKa5ovFis9LIiOWzEG0DWH0+nGhpuX8lhCF4OXUGebzo2arx2m8hgMpyS1h
 27dR0az7gZwxoRHTxEGhU4EapSQGj4EREjJzVC8B+/CJNC6h/yGYuKP3v4UsZQ4wgh
 rqJP/sFdsUHtXP5ifB0NsnA76+b2NUKtOXVCaCjjcX5jJIH+HhaeQSELbJGRgyPNGW
 pOqGLSDryQtgDwrKrV20OsCfIRY9kPaEnXU67egA8SC8J1SH9p/oPOn7VnV3m9q7Ab
 3+o8Hs61wjb56mesffIugaymwUNixxoCV/2Au2e3HHdhyxDQjrJ7CWbXUwCzTOCJvM
 2q++Bix4ZYHHg==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 Oct 2025 17:23:20 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: cdns-dsi: Remove a redundant memset()
Date: Sat, 11 Oct 2025 17:23:14 +0200
Message-ID: <beb76bce09880fa4afcdb04f359fd6b1012c298e.1760196170.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

'dsi_state' is allocated with kzalloc(), so it is already zeroed.
No need to explicitly memset the memory to 0.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 09b289f0fcbf..29ffae74b5da 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1017,7 +1017,6 @@ cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
 	if (!dsi_state)
 		return NULL;
 
-	memset(dsi_state, 0, sizeof(*dsi_state));
 	dsi_state->base.bridge = bridge;
 
 	return &dsi_state->base;
-- 
2.51.0

