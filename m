Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3371560A0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 22:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89326FDAD;
	Fri,  7 Feb 2020 21:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD236FDAD;
 Fri,  7 Feb 2020 21:17:21 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h12so522468qtu.1;
 Fri, 07 Feb 2020 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/Kkx3rE3c4O/NtziKxYF6smns1eo1chXNu5w/Bx0ak=;
 b=kPoaHHXsQQzH3TIugaam7FdHgjmcO3PKuC+8ymu+dS0NrLzCi3Js7K8hGh3hctsEIJ
 IhCrc6r35bKw2QmQ2iA9FQxLz7LASjYHoAl1U4NpaDxCIaL/722HJTMvO0Tik1BtSv3A
 7lVWhOdhHbDwNghOhwv+S431LmLDdGmn1PVYH2Hv2rk3oWU9jOnzc6A/pHsuNL/+t4B8
 SkwQ/XTqMvTAvSvjtdB+tFBPf6/oxelilwXiOGw/quPCnHGGGCufIPdM+e3mzSEOXf+B
 qH+DPhiN1kmNecPbKfyaB0MYADIuTNpWVRcOIl8h2PoT//BugB4oAhq6RhLOdMr8b8d6
 f9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/Kkx3rE3c4O/NtziKxYF6smns1eo1chXNu5w/Bx0ak=;
 b=SIcl00kFn4OaYNm79EMR8vUq7JD3gNqiIzlIuauDoTQHQ7wZv+lj3pe9jG5LcSnHGy
 1hx9l84TLq1W/HvIyll8p4fT0x92wUS2PqR/X24zZJJOTON9lMShJ1uCshXqe/BSFjtY
 ybB71cuR1X+G1dUQzzF7jgIz6Ib3eOyuLRqNOM+9svDm06yl7Uw+MKVQGHYt4zt0/vMS
 ktP7sTaIAgwVCjMWf3wsEj2kRp+RatDqsm0Z8AzrJIL7xZXwCEeh/HK3ceB509lyT0Ye
 UBuiGQaX14tW0HOY4+KHTgAMwjtGKarRq5vmWvFhKppZTSsenZhAWrNhDIQwqa/ZUlaS
 5WdQ==
X-Gm-Message-State: APjAAAXSCcSaPudOheQ+CcqS37EhvRTZqOfQS3vQUMzmkrQUfLVRfQdp
 5Itp4+ou+ww9JVWfaumx4wJ1X01g
X-Google-Smtp-Source: APXvYqykcdLHQ/Gneqsw+i7PoRXgdPCmi2fEQJBbOt9D6jUy5O6ywTHBlVyh27obqHR+0sqE9NQEsQ==
X-Received: by 2002:aed:2f01:: with SMTP id l1mr281187qtd.391.1581110240831;
 Fri, 07 Feb 2020 13:17:20 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id k5sm1884650qkk.117.2020.02.07.13.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 13:17:20 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/15] drm/amdgpu/display: split dp connector registration (v3)
Date: Fri,  7 Feb 2020 16:17:13 -0500
Message-Id: <20200207211713.3870-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

v3:
- fix dp cec ordering

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
 3 files changed, 24 insertions(+), 9 deletions(-)

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
index 3959c942c88b..d5b9e72f2649 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 	struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
+	int r;
+
+	r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
+	if (r)
+		return r;
 
 #if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(amdgpu_dm_connector);
@@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
 	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
 
-	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
+	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
 	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
 				      &aconnector->base);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
