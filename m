Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFA6B14A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 22:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577510E724;
	Wed,  8 Mar 2023 21:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413E10E722
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 21:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678312727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI+UdA8QJB3AB6ONCud8m8WEwuuhIZWoln4gVE1mVMc=;
 b=fp1IIXrBvZkodiELRA0BwNapSLGX05PG5KEQKstMc93Wr6zllX3RAV3vdppLUGa3bp8RGM
 uzdSNQOM2WgtrT2AMWCkPoODyx4Od/ybL//VfAXrkgGsTE+nZbpaRWfeJA8rPGNagKjy0C
 RZQliye0zm5pophuTPuw+OABIVVxDE4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-jMNZ47rYPW-GUzDqkZkdaQ-1; Wed, 08 Mar 2023 16:58:44 -0500
X-MC-Unique: jMNZ47rYPW-GUzDqkZkdaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B28C9185A794;
 Wed,  8 Mar 2023 21:58:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB1B3440D9;
 Wed,  8 Mar 2023 21:58:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC v2 3/6] drm/amd/display/amdgpu_dm: Add a bl_idx to
 amdgpu_dm_connector
Date: Wed,  8 Mar 2023 22:58:28 +0100
Message-Id: <20230308215831.782266-4-hdegoede@redhat.com>
In-Reply-To: <20230308215831.782266-1-hdegoede@redhat.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently functions like update_connector_ext_caps() and
amdgpu_dm_connector_destroy() are iterating over dm->backlight_link[i]
to find the index of the (optional) backlight_dev associated with
the connector.

Instead make register_backlight_device() store the dm->backlight_dev[]
index used for the connector inside the amdgpu_dm_connector struct.

This removes the need to iterate over the dm->backlight_link[]
array and this is necessary as a preparation patch for moving
the actual backlight_device_register()
call to drm_connector_funcs.late_register.

While reworking update_connector_ext_caps() also remove the aconnector
and aconnector->dc_link NULL checks in this function. These are both
never NULL and are unconditionally derefed in its callers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 42 +++++++------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1b5efa56ec15..eb1f2073b0cf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2936,30 +2936,18 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 {
 	struct amdgpu_dm_backlight_caps *caps;
-	struct amdgpu_display_manager *dm;
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
-	struct dc_link *link = NULL;
 	struct drm_luminance_range_info *luminance_range;
-	int i;
-
-	if (!aconnector || !aconnector->dc_link)
-		return;
 
-	link = aconnector->dc_link;
-	if (link->connector_signal != SIGNAL_TYPE_EDP)
+	if (aconnector->bl_idx == -1 ||
+	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
 		return;
 
 	conn_base = &aconnector->base;
 	adev = drm_to_adev(conn_base->dev);
-	dm = &adev->dm;
-	for (i = 0; i < dm->num_of_edps; i++) {
-		if (link == dm->backlight_link[i])
-			break;
-	}
-	if (i >= dm->num_of_edps)
-		return;
-	caps = &dm->backlight_caps[i];
+
+	caps = &adev->dm.backlight_caps[aconnector->bl_idx];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
 
@@ -4229,8 +4217,9 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
 
 
 static void register_backlight_device(struct amdgpu_display_manager *dm,
-				      struct dc_link *link)
+				      struct amdgpu_dm_connector *aconnector)
 {
+	struct dc_link *link = aconnector->dc_link;
 	int bl_idx = dm->num_of_edps;
 
 	if (!(link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) ||
@@ -4242,9 +4231,13 @@ static void register_backlight_device(struct amdgpu_display_manager *dm,
 		return;
 	}
 
+	aconnector->bl_idx = bl_idx;
+
 	amdgpu_dm_register_backlight_device(dm);
-	if (!dm->backlight_dev[bl_idx])
+	if (!dm->backlight_dev[bl_idx]) {
+		aconnector->bl_idx = -1;
 		return;
+	}
 
 	dm->backlight_link[bl_idx] = link;
 	dm->num_of_edps++;
@@ -4430,7 +4423,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 			if (ret) {
 				amdgpu_dm_update_connector_after_detect(aconnector);
-				register_backlight_device(dm, link);
+				register_backlight_device(dm, aconnector);
 
 				if (dm->num_of_edps)
 					update_connector_ext_caps(aconnector);
@@ -6211,10 +6204,8 @@ static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
 static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	const struct dc_link *link = aconnector->dc_link;
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
-	int i;
 
 	/*
 	 * Call only if mst_mgr was initialized before since it's not done
@@ -6223,11 +6214,9 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 	if (aconnector->mst_mgr.dev)
 		drm_dp_mst_topology_mgr_destroy(&aconnector->mst_mgr);
 
-	for (i = 0; i < dm->num_of_edps; i++) {
-		if ((link == dm->backlight_link[i]) && dm->backlight_dev[i]) {
-			backlight_device_unregister(dm->backlight_dev[i]);
-			dm->backlight_dev[i] = NULL;
-		}
+	if (aconnector->bl_idx != -1) {
+		backlight_device_unregister(dm->backlight_dev[aconnector->bl_idx]);
+		dm->backlight_dev[aconnector->bl_idx] = NULL;
 	}
 
 	if (aconnector->dc_em_sink)
@@ -7193,6 +7182,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		aconnector->base.funcs->reset(&aconnector->base);
 
 	aconnector->connector_id = link_index;
+	aconnector->bl_idx = -1;
 	aconnector->dc_link = link;
 	aconnector->base.interlace_allowed = false;
 	aconnector->base.doublescan_allowed = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ed5cbe9da40c..84260a478372 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -612,6 +612,7 @@ struct amdgpu_dm_connector {
 
 	struct drm_connector base;
 	uint32_t connector_id;
+	int bl_idx;
 
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-- 
2.39.1

