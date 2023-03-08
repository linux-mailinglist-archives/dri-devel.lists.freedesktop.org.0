Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF06B14A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 22:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EE410E72A;
	Wed,  8 Mar 2023 21:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3221610E726
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 21:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678312730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsXXE/3ah6l8FS9Bij1KUf0ixjL+EJUN+eDvJohP578=;
 b=hgcRCl/kQZKziG9ew6ULMGgy0LrPWzAeLCbEnC9AIrB6b5jDRWObkktK1lCNR6N22Vzxf/
 eGv4/s4AJebJyXmECz8Sj9G4R0urzOLByWWHREKReKAmtZn5YLg23SZVA354dR0nUf2yGg
 3WwTNxnwEBRN/nSh5wf6uf7VPDyUrjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652--iDjfwdyNeeeUNSXv4LnDQ-1; Wed, 08 Mar 2023 16:58:47 -0500
X-MC-Unique: -iDjfwdyNeeeUNSXv4LnDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6259811E6E;
 Wed,  8 Mar 2023 21:58:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE123440E0;
 Wed,  8 Mar 2023 21:58:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC v2 6/6] drm/amd/display: Pass proper parent for DM backlight
 device registration v2
Date: Wed,  8 Mar 2023 22:58:31 +0100
Message-Id: <20230308215831.782266-7-hdegoede@redhat.com>
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

The parent for the backlight device should be the drm-connector object,
not the PCI device.

Userspace relies on this to be able to detect which backlight class device
to use on hybrid gfx devices where there may be multiple native (raw)
backlight devices registered.

Specifically gnome-settings-daemon expects the parent device to have
an "enabled" sysfs attribute (as drm_connector devices do) and tests
that this returns "enabled" when read.

This aligns the parent of the backlight device with i915, nouveau, radeon.
Note that drivers/gpu/drm/amd/amdgpu/atombios_encoders.c also already
uses the drm_connector as parent, only amdgpu_dm.c used the PCI device
as parent before this change.

Changes in v2:
Together with changing the parent, also move the registration to
drm_connector_funcs.late_register() this is necessary because the parent
device (which now is the drm_connector) must be registered before
the backlight class device is, otherwise the backlight class device ends
up without any parent set at all.

This brings the backlight class device registration timing inline with
nouveau and i915 which also use drm_connector_funcs.late_register()
for this.

Note this slightly changes backlight_device_register() error handling,
instead of not increasing dm->num_of_edps and re-using the current
bl_idx for a potential other backlight device, dm->backlight_dev[bl_idx]
is now simply left NULL on failure. This is ok because all code
looking at dm->backlight_dev[i] also checks it is not NULL.

Link: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 038bf897cc28..051074d5812f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4162,7 +4162,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 		 drm->primary->index + aconnector->bl_idx);
 
 	dm->backlight_dev[aconnector->bl_idx] =
-		backlight_device_register(bl_name, drm->dev, dm,
+		backlight_device_register(bl_name, aconnector->base.kdev, dm,
 					  &amdgpu_dm_backlight_ops, &props);
 
 	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
@@ -4232,13 +4232,6 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
 
 	amdgpu_dm_update_backlight_caps(dm, bl_idx);
 	dm->brightness[bl_idx] = AMDGPU_MAX_BL_LEVEL;
-
-	amdgpu_dm_register_backlight_device(aconnector);
-	if (!dm->backlight_dev[bl_idx]) {
-		aconnector->bl_idx = -1;
-		return;
-	}
-
 	dm->backlight_link[bl_idx] = link;
 	dm->num_of_edps++;
 
@@ -6297,6 +6290,8 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 		to_amdgpu_dm_connector(connector);
 	int r;
 
+	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
+
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
 	    (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
 		amdgpu_dm_connector->dm_dp_aux.aux.dev = connector->kdev;
-- 
2.39.1

