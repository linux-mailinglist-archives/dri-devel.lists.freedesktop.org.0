Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3F38F7C3
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52C6E2D1;
	Tue, 25 May 2021 01:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882576E2D1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 01:55:41 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d16so22338798pfn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ddqCUwNOx/paKOf85rQhoOrYRs85J4xxGPsPHJ/BGyw=;
 b=dTpX3gtZYZXpeB5+zO4pnHHV6Ex4rgnVsfmpgwbsnUzEGsiaTYo5oF/h+65/dQ4/Do
 L0LO4MJp7qkbBudYo6JkjRq26DB0u8wBL97TeEm0aGR4lek4+o216DJOcCRQERWSN96x
 Ez2zdikOWVFcNwM6TEI1BVhNTrm6BPFE09g1VitwMalX+vxGYZjzu8P0O9i4riati6mY
 6dgThghaYxO79ez0sLHiJTCo9nCtMgzRyWJxhzgNkzIYk3oaOp+ejIk9ASq11AoRtukr
 +AtItT/ch0Jhyhxg/fEI6yi4FBkpXg9dufmJc+KQqt/oewTpke5p5DMjuuQvLDcyBmZP
 O13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ddqCUwNOx/paKOf85rQhoOrYRs85J4xxGPsPHJ/BGyw=;
 b=HtXvNLty/jXK87BjaPkho27waGd01A7yblNc2lHr75dE6Nj18bRkj0aMC5BQezniiq
 OPxFDyqPgVJZ3vR2l6mfQDbzXW3g/Zx3wJXcb5Ox/ekR8yvVPb7N+WTGCL7LuZwRe+5L
 l5e411olz689lLPyS2BljYdng0Yy0Nq3fw2PMTzpiOjyJP1uTaxvzMoIZwMj9JfEs5jS
 KXlQhQ0lCvkOur2wdIZ2ogiraNTnmdk8C4Mtx/MbgziP0TZFGwpj0iEVZ3uJCXK+AO3f
 ujb87lMehmqJ7ZxJad6xIjqrRz6nLRNtfsnCpXxRMxyLRCYDmr60gyzNuGdYO2jA2+UJ
 u2Hg==
X-Gm-Message-State: AOAM531gW80iqj1DyiyF2SAB4VGHF1ZGq7CHZoH+4+kLLXKVWATO6X96
 mSZFWeeHicBmJ7G9HvdFX7s=
X-Google-Smtp-Source: ABdhPJwRNAo9yyeCDPZy0dtgJwQjWvQQdTjfPnhVmeCl1vHAgLc0m+ileavKGOs2FjvQzmojhaAJGg==
X-Received: by 2002:a65:644d:: with SMTP id s13mr16337733pgv.362.1621907741199; 
 Mon, 24 May 2021 18:55:41 -0700 (PDT)
Received: from localhost.localdomain ([23.99.96.33])
 by smtp.gmail.com with ESMTPSA id b9sm11693841pfo.107.2021.05.24.18.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:55:40 -0700 (PDT)
From: ainux.wang@gmail.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 ainux.wang@gmail.com
Subject: [PATCH] drm/ast: Add detect function support
Date: Tue, 25 May 2021 09:55:20 +0800
Message-Id: <20210525015520.8327-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ainux <ainux.wang@gmail.com>

The existence of the connector cannot be detected,
so add the detect function to support.

Signed-off-by: Ainux <ainux.wang@gmail.com>
---
 drivers/gpu/drm/ast/ast_drv.c  |  2 ++
 drivers/gpu/drm/ast/ast_mode.c | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 5aa452b4efe6..6698bbc405e3 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -128,6 +128,8 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	drm_fbdev_generic_setup(dev, 32);
 
+	drm_kms_helper_poll_init(dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36d9575aa27b..b4dd4c29b353 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1293,6 +1293,21 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 	return flags;
 }
 
+static enum drm_connector_status ast_connector_detect(struct drm_connector
+						   *connector, bool force)
+{
+	int r;
+	enum drm_connector_status ret = connector_status_connected;
+
+	r = ast_get_modes(connector);
+	if (r)
+		ret = connector_status_connected;
+	else
+		ret = connector_status_disconnected;
+
+	return ret;
+}
+
 static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
@@ -1307,6 +1322,7 @@ static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 
 static const struct drm_connector_funcs ast_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
+	.detect = ast_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = ast_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -1334,7 +1350,8 @@ static int ast_connector_init(struct drm_device *dev)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+						DRM_CONNECTOR_POLL_DISCONNECT;
 
 	drm_connector_attach_encoder(connector, encoder);
 
-- 
2.18.1

