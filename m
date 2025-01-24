Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4BA1B1E5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF2910E918;
	Fri, 24 Jan 2025 08:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G+MAJvoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6420610E918
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737708367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zHmeBr5IInOQ3c8Hbgp5fDrBePZXorvM2nt8ak27BYw=;
 b=G+MAJvoNkeQT/AUx8bYCqB6+vfCPAr2ssDM3juDhNYnd1xDtpQ1+4iAE1jarsuPDZvO97+
 y8tvMOlKU62mZOqtGDibXSPAB2b53QXiow8aXZASQ0RXNTyp6FnEv8TldMCEI8DtdtRrzj
 7qiHfiQs2s4r4olJv5YcjDL1StJWQRE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-M5l05Io8NmSblN0DZW9tMQ-1; Fri,
 24 Jan 2025 03:46:03 -0500
X-MC-Unique: M5l05Io8NmSblN0DZW9tMQ-1
X-Mimecast-MFC-AGG-ID: M5l05Io8NmSblN0DZW9tMQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 71CAB1955F36; Fri, 24 Jan 2025 08:46:01 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.77])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0BD22195608A; Fri, 24 Jan 2025 08:45:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ast: Fix default resolution on BMC when DP is not
 connected
Date: Fri, 24 Jan 2025 09:45:43 +0100
Message-ID: <20250124084546.2094575-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DIxx-OePZiEAwdULrdj19ON2ReqrHBiAGA-eyRe0upE_1737708362
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The physical_status of ast_dp is not reliable, as it reports as
connected even when no monitor is connected. This makes the default
BMC resolution to be 640x480 for remote access.
So consider that if there is no edid, no monitor is connected, and
add the BMC 1024x768 default resolution.
I've debugged this regression on ast_dp, but as dp501 is similar, I
fixed both in this patch.

This regression was likely introduced by commit 2281475168d2
("drm/ast: astdp: Perform link training during atomic_enable")
But I fixed it in the BMC get_modes handling.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: bbad0090b9f4 ("drm/ast: astdp: Transparently handle BMC support")
---
 drivers/gpu/drm/ast/ast_dp.c    | 14 +++++++-------
 drivers/gpu/drm/ast/ast_dp501.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c..6c8ea95a2230 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -361,19 +361,19 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
+	struct ast_device *ast = to_ast_device(connector->dev);
+	const struct drm_edid *drm_edid = NULL;
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
-		struct ast_device *ast = to_ast_device(connector->dev);
-		const struct drm_edid *drm_edid;
-
+	if (ast_connector->physical_status == connector_status_connected)
 		drm_edid = drm_edid_read_custom(connector, ast_astdp_read_edid_block, ast);
-		drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (drm_edid) {
 		count = drm_edid_connector_add_modes(connector);
 		drm_edid_free(drm_edid);
 	} else {
-		drm_edid_connector_update(connector, NULL);
-
 		/*
 		 * There's no EDID data without a connected monitor. Set BMC-
 		 * compatible modes in this case. The XGA default resolution
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 9e19d8c17730..c92db65e3f20 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -504,19 +504,19 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
 static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
+	struct ast_device *ast = to_ast_device(connector->dev);
+	const struct drm_edid *drm_edid = NULL;
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
-		struct ast_device *ast = to_ast_device(connector->dev);
-		const struct drm_edid *drm_edid;
-
+	if (ast_connector->physical_status == connector_status_connected)
 		drm_edid = drm_edid_read_custom(connector, ast_dp512_read_edid_block, ast);
-		drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (drm_edid) {
 		count = drm_edid_connector_add_modes(connector);
 		drm_edid_free(drm_edid);
 	} else {
-		drm_edid_connector_update(connector, NULL);
-
 		/*
 		 * There's no EDID data without a connected monitor. Set BMC-
 		 * compatible modes in this case. The XGA default resolution

base-commit: 798047e63ac970f105c49c22e6d44df901c486b2
-- 
2.47.1

