Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AD155EE6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0B96FD8D;
	Fri,  7 Feb 2020 19:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35306FD82;
 Fri,  7 Feb 2020 19:51:19 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w47so312795qtk.4;
 Fri, 07 Feb 2020 11:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jSk8UNuSvV0yFKAsTmjIMgpIonbMj22btC08pBbXT2E=;
 b=ak+N9xwunflpk4Bp+gtPvBEOwDKiLji4HGoXoH8uMNeIINUr39B5NrV9BO9Ag0A4H0
 WuHxEPy07gxQ+sC4jZTeRZOL6psg/bBHfjeesNtcr3tverv4fGEEyQvfz12rVhdrW2GW
 GVbeze/QRZOaQuEe2aL8PlaEQuQkve9FLyUoCH2jnbialnnj4v/7lBDP1RCPandnbkN/
 mxgWS1B5q07VcJ5A4WitCkOguVooWlNNs0vvGuih6ujXlkIdBLjT9lNFdJFiQ5wPZ4fc
 WrSpwXO711oHGOgOhvyisVD2wSNrGzZh4YW8l/lDoXf6id1yhZtwb0hCYBcBd7I4cRr1
 FwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSk8UNuSvV0yFKAsTmjIMgpIonbMj22btC08pBbXT2E=;
 b=kR7CGV8G2YutNlWSBbs3qkTDqk7QB3zyK9FViconEPlE/e2N5WKPE4uOJXCOUHxIFk
 kTm2jTQGYzEhDyxKe41FzFAOY9oCbe7acKSh737gK2yBt64tiNyTn86hLo7rTaJwWF4C
 YpLuk058ftj5NmlefpynFuvL4j3ZbcHbWGWpRg7uFIU2ewuC23DnD+soGY4BOg/yJj4E
 cK8Kx3HiK4lskY1QAArWlhHgbKHZN9q2KyO1fYH5a4Erw9Y/2QeZdVWm2MfrezHR3AO+
 ffOgoM7P3H5IOUC63OwKUu+Gb3t1vV5/5PSSHQftc3YzN3RhjidehSoLDRtAkWT7GX7u
 3YtA==
X-Gm-Message-State: APjAAAVDwwHU3c+1myNO8K7v7ibXmoa/x01L5+uLtsayLFMSf0g9sfz8
 W/P1cTRrQmd9/1RTvqELLw3BDVMn
X-Google-Smtp-Source: APXvYqzRSWTq4c2P0EYOdmbDCH7q0+o/PY8XzmKHxoojQ/oL+84kE+CT+kcsFF5PHAvDHAa2b+EFxg==
X-Received: by 2002:ac8:1194:: with SMTP id d20mr445495qtj.243.1581105078717; 
 Fri, 07 Feb 2020 11:51:18 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:18 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/15] drm/amdgpu/display: split dp connector registration (v2)
Date: Fri,  7 Feb 2020 14:50:56 -0500
Message-Id: <20200207195058.2354-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split into init and register functions to avoid a segfault
in some configs when the load/unload callbacks are removed.

v2:
- add back accidently dropped has_aux setting
- set dev in late_register

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 11 ++++++++---
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index ec1501e3a63a..f355d9a752d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
 	return MODE_OK;
 }
 
+static int
+amdgpu_connector_late_register(struct drm_connector *connector)
+{
+	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
+	int r = 0;
+
+	if (amdgpu_connector->ddc_bus->has_aux) {
+		amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
+		r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
+	}
+
+	return r;
+}
+
 static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
 	.get_modes = amdgpu_connector_dp_get_modes,
 	.mode_valid = amdgpu_connector_dp_mode_valid,
@@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
 	.early_unregister = amdgpu_connector_unregister,
 	.destroy = amdgpu_connector_destroy,
 	.force = amdgpu_connector_dvi_force,
+	.late_register = amdgpu_connector_late_register,
 };
 
 static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
@@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
 	.early_unregister = amdgpu_connector_unregister,
 	.destroy = amdgpu_connector_destroy,
 	.force = amdgpu_connector_dvi_force,
+	.late_register = amdgpu_connector_late_register,
 };
 
 void
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index ea702a64f807..9b74cfdba7b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
 
 void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
 {
-	int ret;
-
 	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
-	amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
 	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
-	ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
-	if (!ret)
-		amdgpu_connector->ddc_bus->has_aux = true;
-
-	WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
+	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
+	amdgpu_connector->ddc_bus->has_aux = true;
 }
 
 /***** general DP utility functions *****/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 3959c942c88b..a4e6f9d39e12 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -155,6 +155,13 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 	struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
+	int r;
+
+	r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
+	if (r)
+		return r;
+	drm_dp_cec_register_connector(&amdgpu_dm_connector->dm_dp_aux.aux,
+				      connector);
 
 #if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(amdgpu_dm_connector);
@@ -484,9 +491,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
 	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
 
-	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
-	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
-				      &aconnector->base);
+	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
 
 	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
 		return;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
