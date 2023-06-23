Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1973B406
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17DF10E032;
	Fri, 23 Jun 2023 09:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0808910E032
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687513616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EWV5IJPnuL/n2//LEWW5JxIujCzv2HOlTOGeXhOLqDs=;
 b=YAEia51HOhMc11DxFxqZkwF6q4LqY/ZpZUDWZqHk8tn33jgSLNWtCHyGgVUFlZIKN2xWm9
 Qb/jUCa3N9AJgWhmG62ppuTHiQRqu9qD6aog2ANMNnfDl2k9kQLQtXcS7HsDClEBqvwqVZ
 L6IvXHztcab6uJC1gprqxW8fQHMVftQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-OzhPwuZkMEGAqaHpNurnJg-1; Fri, 23 Jun 2023 05:46:52 -0400
X-MC-Unique: OzhPwuZkMEGAqaHpNurnJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA8CE28088BA;
 Fri, 23 Jun 2023 09:46:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73C6014682FB;
 Fri, 23 Jun 2023 09:46:50 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
Subject: [PATCH] drm/ast: Fix default resolution when no monitor is connected
 on DP
Date: Fri, 23 Jun 2023 11:46:39 +0200
Message-Id: <20230623094639.434293-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
 EDID on DP")
The default resolution is now 640x480 when no monitor is connected.
But Aspeed graphics is mostly used in servers, where no monitor
is attached. This also affects the "remote" resolution to 640x480, which is
inconvenient, and breaks the anaconda installer.
So when no EDID is present, set 1024x768 as preferred resolution.

Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36374828f6c8..8f7b7cc021c7 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1589,9 +1589,31 @@ static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs
 	.get_modes = ast_dp501_connector_helper_get_modes,
 };
 
+static int ast_dp_probe_single_connector_modes(struct drm_connector *connector,
+					       uint32_t maxX, uint32_t maxY)
+{
+	int ret;
+	struct drm_display_mode *mode;
+
+	ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
+	/*
+	 * When no monitor are detected, DP now default to 640x480
+	 * As aspeed is mostly used in remote server, and DP monitors are
+	 * rarely attached, it's better to default to 1024x768
+	 */
+	if (!connector->edid_blob_ptr) {
+		list_for_each_entry(mode, &connector->modes, head) {
+			if (mode->hdisplay == 1024 && mode->vdisplay == 768)
+				mode->type |= DRM_MODE_TYPE_PREFERRED;
+			drm_mode_sort(&connector->modes);
+		}
+	}
+	return ret;
+}
+
 static const struct drm_connector_funcs ast_dp501_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	.fill_modes = ast_dp_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -1678,7 +1700,7 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
 
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	.fill_modes = ast_dp_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

base-commit: 0adec22702d497385dbdc52abb165f379a00efba
-- 
2.40.1

