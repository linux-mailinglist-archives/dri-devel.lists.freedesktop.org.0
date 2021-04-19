Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A202E364DED
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B96E44E;
	Mon, 19 Apr 2021 22:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DCE6E450
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618872946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g21KQMO+x+0HfA9S5cU+LPpk/DDwp+NmKrjA0l+Lckg=;
 b=BsOCS455s/h/jtarwd80r32PmqIPJt8FfHLNZNAmrmmr7MucP/VB20F3X3PbwfsMHDwa23
 sIduQH7cHlvWQUuH0RmylZFFLwGcypwufSpv/uYO0Cp9ZP5Cf5fr/8ZElQq8DNBgHLBUVa
 rCFZoVur64kDfzq43rStE32xHIwNiGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-KZMwLGAWO2uQyxwrI7ZOGw-1; Mon, 19 Apr 2021 18:55:42 -0400
X-MC-Unique: KZMwLGAWO2uQyxwrI7ZOGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F11E501F0;
 Mon, 19 Apr 2021 22:55:38 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BD25C1C4;
 Mon, 19 Apr 2021 22:55:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 01/20] drm/amdgpu: Add error handling to
 amdgpu_dm_initialize_dp_connector()
Date: Mon, 19 Apr 2021 18:55:03 -0400
Message-Id: <20210419225523.184856-2-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Stylon Wang <stylon.wang@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Chris Park <Chris.Park@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on moving i2c device registration into drm_dp_aux_init() - I
realized that in order to do so we need to make sure that drivers calling
drm_dp_aux_init() handle any errors it could possibly return. In the
process of doing that, I noticed that the majority of AMD's code for DP
connector creation doesn't attempt to do any real error handling.

So, let's fix this and also cleanup amdgpu_dm_initialize_dp_connector()
while we're at it. This way we can handle the error codes from
drm_dp_aux_init().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++-----
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 44 +++++++++++--------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  6 +--
 3 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0c8c41e4e57..fc5d315bbb05 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7608,10 +7608,9 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 
 	aconnector->i2c = i2c;
 	res = i2c_add_adapter(&i2c->base);
-
 	if (res) {
 		DRM_ERROR("Failed to register hw i2c %d\n", link->link_index);
-		goto out_free;
+		goto fail_free;
 	}
 
 	connector_type = to_drm_connector_type(link->connector_signal);
@@ -7625,8 +7624,7 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 
 	if (res) {
 		DRM_ERROR("connector_init failed\n");
-		aconnector->connector_id = -1;
-		goto out_free;
+		goto fail_id;
 	}
 
 	drm_connector_helper_add(
@@ -7643,15 +7641,22 @@ static int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 	drm_connector_attach_encoder(
 		&aconnector->base, &aencoder->base);
 
-	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort
-		|| connector_type == DRM_MODE_CONNECTOR_eDP)
-		amdgpu_dm_initialize_dp_connector(dm, aconnector, link->link_index);
-
-out_free:
-	if (res) {
-		kfree(i2c);
-		aconnector->i2c = NULL;
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	    connector_type == DRM_MODE_CONNECTOR_eDP) {
+		res = amdgpu_dm_initialize_dp_connector(dm, aconnector, link->link_index);
+		if (res)
+			goto fail_cleanup;
 	}
+
+	return 0;
+fail_cleanup:
+	drm_connector_cleanup(&aconnector->base);
+fail_id:
+	aconnector->connector_id = -1;
+fail_free:
+	kfree(i2c);
+	aconnector->i2c = NULL;
+
 	return res;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 73cdb9fe981a..3dee9cce9c9e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -425,33 +425,39 @@ static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
 	.add_connector = dm_dp_add_mst_connector,
 };
 
-void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
-				       struct amdgpu_dm_connector *aconnector,
-				       int link_index)
+int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
+				      struct amdgpu_dm_connector *aconnector,
+				      int link_index)
 {
-	aconnector->dm_dp_aux.aux.name =
-		kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
-			  link_index);
-	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
-	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
+	struct amdgpu_dm_dp_aux *dm_aux = &aconnector->dm_dp_aux;
+	int ret;
 
-	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
-	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
-				      &aconnector->base);
+	dm_aux->aux.name = kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d", link_index);
+	if (!dm_aux->aux.name)
+		return -ENOMEM;
+
+	dm_aux->aux.transfer = dm_dp_aux_transfer;
+	dm_aux->ddc_service = aconnector->dc_link->ddc;
+
+	drm_dp_aux_init(&dm_aux->aux);
+	drm_dp_cec_register_connector(&dm_aux->aux, &aconnector->base);
 
 	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
-		return;
+		return 0;
 
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
-	drm_dp_mst_topology_mgr_init(
-		&aconnector->mst_mgr,
-		adev_to_drm(dm->adev),
-		&aconnector->dm_dp_aux.aux,
-		16,
-		4,
-		aconnector->connector_id);
+	ret = drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->adev),
+					   &dm_aux->aux, 16, 4, aconnector->connector_id);
+	if (ret)
+		goto unreg_cec;
 
 	drm_connector_attach_dp_subconnector_property(&aconnector->base);
+
+	return 0;
+unreg_cec:
+	drm_dp_cec_unregister_connector(&dm_aux->aux);
+	kfree(dm_aux->aux.name);
+	return ret;
 }
 
 int dm_mst_get_pbn_divider(struct dc_link *link)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
index b38bd68121ce..cf771ff58bb3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
@@ -31,9 +31,9 @@ struct amdgpu_dm_connector;
 
 int dm_mst_get_pbn_divider(struct dc_link *link);
 
-void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
-				       struct amdgpu_dm_connector *aconnector,
-				       int link_index);
+int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
+				      struct amdgpu_dm_connector *aconnector,
+				      int link_index);
 
 void
 dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
