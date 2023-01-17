Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08D66E41B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2F10E58D;
	Tue, 17 Jan 2023 16:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC8410E58D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:53:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B069D61454;
 Tue, 17 Jan 2023 16:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCF6C433EF;
 Tue, 17 Jan 2023 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673974383;
 bh=sjHnLfZeTv9osDceNwp3J0deH6tLLJyX+qHIX4MFm24=;
 h=From:To:Cc:Subject:Date:From;
 b=H+4dXZAoInFEP1VyT8Lgd9naMxssr2v64AkJXNrV5A/4RhjWllNTOhpTXNPvYt/OU
 NZZh5lRbpCLLrRJk6phh2EcWvucKrBUmJlZy/9o6w8Io+7nnu941LPUB6AjGV77kLO
 TdJAByFqPBvpjsuSlBKMoFYA3YqQ0Z+M8wJv9tjjFxZUWOp4sZ+IN1ab+KXyLP1U+R
 8KIZBnsZ2oyED8du9Td//Fw+zH3FW331/hyiTnqCyfHprprH1obmJitSUAhl4G2tRu
 zt8G70niwDO2rHQdtI3frtpRoi+LAuluCqGTb6gD9oK6iXnkFEjZafTju2xAVEPwRm
 0JObmsx/xgFMQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] vc4: fix build failure in vc4_dsi_dev_probe()
Date: Tue, 17 Jan 2023 17:52:51 +0100
Message-Id: <20230117165258.1979922-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The bridge->of_node field is defined inside of an #ifdef, which
results in a build failure when compile-testing the vc4_dsi driver
without CONFIG_OF:

drivers/gpu/drm/vc4/vc4_dsi.c: In function 'vc4_dsi_dev_probe':
drivers/gpu/drm/vc4/vc4_dsi.c:1822:20: error: 'struct drm_bridge' has no member named 'of_node'
 1822 |         dsi->bridge.of_node = dev->of_node;

Add another #ifdef in the place it is used in. Alternatively we
could consider dropping the #ifdef in the struct definition
and all other users.

Fixes: 78df640394cd ("drm/vc4: dsi: Convert to using a bridge instead of encoder")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 2a71321b9222..a5c075f802e4 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1819,7 +1819,9 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 
 	dsi->pdev = pdev;
 	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
+#ifdef CONFIG_OF
 	dsi->bridge.of_node = dev->of_node;
+#endif
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
-- 
2.39.0

