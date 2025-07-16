Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDDEB0772A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A1410E28C;
	Wed, 16 Jul 2025 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qoUOG/U1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876E310E28C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:41:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7E4AA5730C;
 Wed, 16 Jul 2025 13:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8DEC4CEF0;
 Wed, 16 Jul 2025 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752673282;
 bh=RHI4u2LloKbvszBt3srx70NKJhd2p7vtukt+L4CqdjM=;
 h=From:To:Cc:Subject:Date:From;
 b=qoUOG/U1qkTJqbKVCTWTfWgbghtCdaRjlDFhlgr5PdCJZLqxeKx3KJ/PNY78ZzfzQ
 LTzDuSBI/+kUIzviMnBg5a6I7ZRo1Tq5XGBa+WM4q9GrJqVC93zBCauopIhCwwpfQz
 bnMvUuxvAs1wwMnAEKkBBnkDEqO21e+DaqQuGBdgHK/IMIknJUQQcj6gW/txOnyM8m
 B/IZlZ2BPRIm8Rs+SLsQvFviN4BNo4YpRnfzLbanuZR2/c/WesSYrPgAVDg2ugSWv2
 CjhsKKGBa175t2ViC5pTqPHVb5GjMibfFsgQZIEYxxDu0j2QqzW43Qss2zISQX5jPv
 Z7jDUgRz1JSLA==
From: Michael Walle <mwalle@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH] drm/tidss: encoder: convert to devm_drm_bridge_alloc()
Date: Wed, 16 Jul 2025 15:41:07 +0200
Message-Id: <20250716134107.4084945-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Convert the tidss encoder to use devm_drm_bridge_alloc(). Instead of
allocating the memory by drmm_simple_encoder_alloc() use
devm_drm_bridge_alloc() and initialize the encoder afterwards.

Fixes: a7748dd127ea ("drm/bridge: get/put the bridge reference in drm_bridge_add/remove()")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 95b4aeff2775..81a04f767770 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -90,14 +90,18 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	struct drm_connector *connector;
 	int ret;
 
-	t_enc = drmm_simple_encoder_alloc(&tidss->ddev, struct tidss_encoder,
-					  encoder, encoder_type);
+	t_enc = devm_drm_bridge_alloc(tidss->dev, struct tidss_encoder,
+				      bridge, &tidss_bridge_funcs);
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
+	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
+				      encoder_type);
+	if (ret)
+		return ret;
+
 	t_enc->tidss = tidss;
 	t_enc->next_bridge = next_bridge;
-	t_enc->bridge.funcs = &tidss_bridge_funcs;
 
 	enc = &t_enc->encoder;
 	enc->possible_crtcs = possible_crtcs;
-- 
2.39.5

