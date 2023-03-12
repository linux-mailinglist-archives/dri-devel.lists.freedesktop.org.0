Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDD6B6A98
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 20:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21D810E402;
	Sun, 12 Mar 2023 19:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C4E10E409
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 19:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678648689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AownpKIJhwr803qPecntU0wJCU2CAxTb2a8dt5TOPpU=;
 b=TXDZwZNj/UObKxVzqDqrrtP3dJ80oXKbK+J5S8yBfMKFPHUTnz+VBtf5EXCPU133kf9eTU
 DuBsj925gDmTuTZyldsxMn09zMlihh4U3RRo30rtbonAUHNkaYsPRpMLxaSDwl+zMEBjek
 mTmNtVDd7w5HijszfbXOAilxk+WCQc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-9HwWl37tPxCiUiGmE6fEgA-1; Sun, 12 Mar 2023 15:18:04 -0400
X-MC-Unique: 9HwWl37tPxCiUiGmE6fEgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD9785A5B1;
 Sun, 12 Mar 2023 19:18:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE3D140EBF4;
 Sun, 12 Mar 2023 19:18:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v3 5/6] drm/amd/display/amdgpu_dm: Make
 amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
Date: Sun, 12 Mar 2023 20:17:50 +0100
Message-Id: <20230312191751.183450-6-hdegoede@redhat.com>
In-Reply-To: <20230312191751.183450-1-hdegoede@redhat.com>
References: <20230312191751.183450-1-hdegoede@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
pointer to the connector for which it should register the backlight
as its only argument.

This is a preparation patch for moving the actual backlight class device
registering to drm_connector_funcs.late_register.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 757202af2eec..038bf897cc28 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4140,13 +4140,15 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
 };
 
 static void
-amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
+amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 {
-	char bl_name[16];
+	struct drm_device *drm = aconnector->base.dev;
+	struct amdgpu_display_manager *dm = &drm_to_adev(drm)->dm;
 	struct backlight_properties props = { 0 };
+	char bl_name[16];
 
 	if (!acpi_video_backlight_use_native()) {
-		drm_info(adev_to_drm(dm->adev), "Skipping amdgpu DM backlight registration\n");
+		drm_info(drm, "Skipping amdgpu DM backlight registration\n");
 		/* Try registering an ACPI video backlight device instead. */
 		acpi_video_register_backlight();
 		return;
@@ -4157,17 +4159,15 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	props.type = BACKLIGHT_RAW;
 
 	snprintf(bl_name, sizeof(bl_name), "amdgpu_bl%d",
-		 adev_to_drm(dm->adev)->primary->index + dm->num_of_edps);
+		 drm->primary->index + aconnector->bl_idx);
 
-	dm->backlight_dev[dm->num_of_edps] = backlight_device_register(bl_name,
-								       adev_to_drm(dm->adev)->dev,
-								       dm,
-								       &amdgpu_dm_backlight_ops,
-								       &props);
+	dm->backlight_dev[aconnector->bl_idx] =
+		backlight_device_register(bl_name, drm->dev, dm,
+					  &amdgpu_dm_backlight_ops, &props);
 
-	if (IS_ERR(dm->backlight_dev[dm->num_of_edps])) {
+	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
 		DRM_ERROR("DM: Backlight registration failed!\n");
-		dm->backlight_dev[dm->num_of_edps] = NULL;
+		dm->backlight_dev[aconnector->bl_idx] = NULL;
 	} else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
 }
@@ -4233,7 +4233,7 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
 	amdgpu_dm_update_backlight_caps(dm, bl_idx);
 	dm->brightness[bl_idx] = AMDGPU_MAX_BL_LEVEL;
 
-	amdgpu_dm_register_backlight_device(dm);
+	amdgpu_dm_register_backlight_device(aconnector);
 	if (!dm->backlight_dev[bl_idx]) {
 		aconnector->bl_idx = -1;
 		return;
-- 
2.39.1

