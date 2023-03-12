Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4501B6B6A95
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 20:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5BD10E401;
	Sun, 12 Mar 2023 19:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6510E413
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678648684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdsQaTtbIaBYJTe0xm3ESZR5oOBLuJquJVykY1dYCmg=;
 b=cRC4x7W4cvV8zEo+DQFXH+49lgPXUtw/skVOVbZ9TREqUQPRK/sC0IPzGzGyNQilbOh6A0
 ded1zE7+Y6bOOl49bbcTFEu6lJzszOjXevPsF9dIieBeJXKlv2CHKVSU3u8TMdTVCJ2S+j
 Vnvf5Megf0VzgnQLAKaIlgjgjyO+mYU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-1-XaOto0PGe2mSUAvV-jJg-1; Sun, 12 Mar 2023 15:18:00 -0400
X-MC-Unique: 1-XaOto0PGe2mSUAvV-jJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E4913810780;
 Sun, 12 Mar 2023 19:18:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8097F140EBF4;
 Sun, 12 Mar 2023 19:17:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v3 2/6] drm/amd/display/amdgpu_dm: Refactor
 register_backlight_device()
Date: Sun, 12 Mar 2023 20:17:47 +0100
Message-Id: <20230312191751.183450-3-hdegoede@redhat.com>
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

Refactor register_backlight_device():

1) Turn the connector-type + signal check into an early exit
condition to avoid the indentation level of the rest of the code

2) Add an array bounds check for the arrays indexed by dm->num_of_edps

3) register_backlight_device() always increases dm->num_of_edps if
amdgpu_dm_register_backlight_device() has assigned a backlight_dev to
the current dm->backlight_link[dm->num_of_edps] slot.

So on its next call dm->backlight_dev[dm->num_of_edps] always point to
the next empty slot and the "if (!dm->backlight_dev[dm->num_of_edps])"
check will thus always succeed and can be removed.

4) Add a bl_idx local variable to use as array index, rather then
using dm->num_of_edps to improve the code readability.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 42b88ab5552d..1b5efa56ec15 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4231,21 +4231,23 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
 static void register_backlight_device(struct amdgpu_display_manager *dm,
 				      struct dc_link *link)
 {
-	if ((link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) &&
-	    link->type != dc_connection_none) {
-		/*
-		 * Event if registration failed, we should continue with
-		 * DM initialization because not having a backlight control
-		 * is better then a black screen.
-		 */
-		if (!dm->backlight_dev[dm->num_of_edps])
-			amdgpu_dm_register_backlight_device(dm);
+	int bl_idx = dm->num_of_edps;
 
-		if (dm->backlight_dev[dm->num_of_edps]) {
-			dm->backlight_link[dm->num_of_edps] = link;
-			dm->num_of_edps++;
-		}
+	if (!(link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) ||
+	    link->type == dc_connection_none)
+		return;
+
+	if (dm->num_of_edps >= AMDGPU_DM_MAX_NUM_EDP) {
+		drm_warn(adev_to_drm(dm->adev), "Too much eDP connections, skipping backlight setup for additional eDPs\n");
+		return;
 	}
+
+	amdgpu_dm_register_backlight_device(dm);
+	if (!dm->backlight_dev[bl_idx])
+		return;
+
+	dm->backlight_link[bl_idx] = link;
+	dm->num_of_edps++;
 }
 
 static void amdgpu_set_panel_orientation(struct drm_connector *connector);
-- 
2.39.1

