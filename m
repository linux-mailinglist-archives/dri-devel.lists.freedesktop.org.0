Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD9697AF2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 12:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A8210E05A;
	Wed, 15 Feb 2023 11:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098C10E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676461119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RckP7WYLrffbpururKKDVfXVrvKrRNHRReGc8SPf228=;
 b=KrevVqpOUTAx29U5GqvMkePuAXqfybNRtxPSQLx6WlzjWCSBag32tSNrOps2+wiq17Fo23
 FXKp+hTiaFt2x7ridjc8MhpoQGekqozC2P1S84N7J21P50TzCEG3VVuFRWR33bgRTjNzGx
 /JnvwtKOFYxSUr1+E5g2bM7jwP7lmq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-Z4XdSNMSOLickXx8ACPeJg-1; Wed, 15 Feb 2023 06:38:35 -0500
X-MC-Unique: Z4XdSNMSOLickXx8ACPeJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD6A6183B3C6;
 Wed, 15 Feb 2023 11:38:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E552318EC1;
 Wed, 15 Feb 2023 11:38:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [RFC] drm/amd/display: Pass proper parent for DM backlight device
 registration
Date: Wed, 15 Feb 2023 12:38:33 +0100
Message-Id: <20230215113833.477999-1-hdegoede@redhat.com>
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

Note this is marked as a RFC because I don't have hw to test, so this
has only been compile tested! If someone can test this on actual
hw which hits the changed code path that would be great.

Link: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 31bce529f685..33b0e1de2770 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4065,7 +4065,8 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
 };
 
 static void
-amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
+amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm,
+				    struct amdgpu_dm_connector *aconnector)
 {
 	char bl_name[16];
 	struct backlight_properties props = { 0 };
@@ -4088,7 +4089,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 		 adev_to_drm(dm->adev)->primary->index + dm->num_of_edps);
 
 	dm->backlight_dev[dm->num_of_edps] = backlight_device_register(bl_name,
-								       adev_to_drm(dm->adev)->dev,
+								       aconnector->base.kdev,
 								       dm,
 								       &amdgpu_dm_backlight_ops,
 								       &props);
@@ -4141,6 +4142,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
 
 
 static void register_backlight_device(struct amdgpu_display_manager *dm,
+				      struct amdgpu_dm_connector *aconnector,
 				      struct dc_link *link)
 {
 	if ((link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) &&
@@ -4151,7 +4153,7 @@ static void register_backlight_device(struct amdgpu_display_manager *dm,
 		 * is better then a black screen.
 		 */
 		if (!dm->backlight_dev[dm->num_of_edps])
-			amdgpu_dm_register_backlight_device(dm);
+			amdgpu_dm_register_backlight_device(dm, aconnector);
 
 		if (dm->backlight_dev[dm->num_of_edps]) {
 			dm->backlight_link[dm->num_of_edps] = link;
@@ -4337,7 +4339,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 			if (ret) {
 				amdgpu_dm_update_connector_after_detect(aconnector);
-				register_backlight_device(dm, link);
+				register_backlight_device(dm, aconnector, link);
 
 				if (dm->num_of_edps)
 					update_connector_ext_caps(aconnector);
-- 
2.39.1

