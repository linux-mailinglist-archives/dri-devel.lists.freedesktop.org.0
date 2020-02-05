Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB8153425
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 16:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375496F61E;
	Wed,  5 Feb 2020 15:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3996F61C;
 Wed,  5 Feb 2020 15:40:23 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id 10so2736035ywv.5;
 Wed, 05 Feb 2020 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enniatpckRADBj2aVtvb6jb0E3OVi1vsmz6khollcx8=;
 b=N1Lb9j6m4IbU8yr6RUp1P3QoDzDavaMPCo+lHTRdkDXEMwl0vwKObXImcihPvz5phf
 ey7ZR53ojmhwfs3LUbuKKWXSZmCpQrazfEzcnD0+3Ps9FyXwWY3hf3tZqYHQAPA3E5h2
 +NVfh3WSDFCPkSIIp5N9zzMPR6TTiapzEmOeswFVT0M+ZWr30aLhX51c5creZBkw2Or5
 UaER1n9hSYO9qw9qZsEZgAnXLhSjPzAnNO9RQZ87EOdqD/j4nT1EVLX3cFUzTtF2ZaEq
 M6ATbRWW0AEa97GK/lHnZURALjd7cj5GCLKUbymCvvny+Rf6K5GHlzew4zD4QeeTtJVA
 g3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enniatpckRADBj2aVtvb6jb0E3OVi1vsmz6khollcx8=;
 b=TS7stQP9QYm61YMCuo+kszGqhihyg23iXbYPon0qflmEZo3/ZOsGGgZFrhm404BHqk
 r4ZfyyLeN79QUyr99qLHUvOOi3dD4VFWbckAMFy0tqne9X42xEWhJC4d28Qo/49CwM3F
 LC7yRbpelOd1INSTQxmjRHjcA9Y8BK5ZqKt5p01TMjMiiCO0ecUhTH8CqWEuE++et839
 PRHNj622uvutHSqWQTrxEXn31kUbtXch4nNc2IXVPeNlZir8Z/6zEntvIEbRsm2Qen1Q
 41CPtCphnQB9IeqEaJNvj4eZbXb9R9m5t0yZlGl3jUuJ3jZOesr/DEmVFt23bpjtMnip
 zvxQ==
X-Gm-Message-State: APjAAAVosZ08g+gaBm6+GOt5PSen1/psZjgj/D222IYdhS93yGGRHANL
 4uxbdp+wIp8Gsf7UivrL8rvBwp/f
X-Google-Smtp-Source: APXvYqzFuHcrnDJy6Cg7+uLy6snqo+t/WAxG0oKLEhzce5UBDSk2SELvEjXBO4TMCyBa7UARVjiYLA==
X-Received: by 2002:a25:ce4d:: with SMTP id x74mr28606490ybe.340.1580917222184; 
 Wed, 05 Feb 2020 07:40:22 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q185sm61256ywh.61.2020.02.05.07.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:40:21 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
Date: Wed,  5 Feb 2020 10:39:58 -0500
Message-Id: <20200205154000.536145-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205154000.536145-1-alexander.deucher@amd.com>
References: <20200205154000.536145-1-alexander.deucher@amd.com>
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

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c        | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c              |  8 +-------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 11 ++++++++---
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index ec1501e3a63a..635f6c9f625c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1461,6 +1461,14 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
 	return MODE_OK;
 }
 
+static int
+amdgpu_connector_late_register(struct drm_connector *connector)
+{
+	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
+
+	return drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
+}
+
 static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
 	.get_modes = amdgpu_connector_dp_get_modes,
 	.mode_valid = amdgpu_connector_dp_mode_valid,
@@ -1475,6 +1483,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
 	.early_unregister = amdgpu_connector_unregister,
 	.destroy = amdgpu_connector_destroy,
 	.force = amdgpu_connector_dvi_force,
+	.late_register = amdgpu_connector_late_register,
 };
 
 static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
@@ -1485,6 +1494,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
 	.early_unregister = amdgpu_connector_unregister,
 	.destroy = amdgpu_connector_destroy,
 	.force = amdgpu_connector_dvi_force,
+	.late_register = amdgpu_connector_late_register,
 };
 
 void
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index ea702a64f807..dd1e3530399d 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
 
 void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
 {
-	int ret;
-
 	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
 	amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
 	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
-	ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
-	if (!ret)
-		amdgpu_connector->ddc_bus->has_aux = true;
-
-	WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
+	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
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
