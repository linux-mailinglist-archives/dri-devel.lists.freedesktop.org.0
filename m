Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567AD252137
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 21:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79B46E9B9;
	Tue, 25 Aug 2020 19:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8E6E9B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 19:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaqW4Gmy6cVcouD31SK1bgkpRdbI1OQBzcDJEb3YKEs=;
 b=OO6q/sN4kOwUCa817xz0ABg0GNNSpzixi81IsnDRNKJPJsYEeZY18H3J9TOwc0pqjNRcwJ
 tvP/QONZYVJ1E3m5otJzBpX3FfzUrp7uI6t/vMDOcDRBf+ltEbh8n1a6zvIfUEAW5e5NSq
 XMOrDughoyLo7GYVITm6AA0x6UcPMq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-HtmgTIBSOxG-YtslKRXWig-1; Tue, 25 Aug 2020 15:51:36 -0400
X-MC-Unique: HtmgTIBSOxG-YtslKRXWig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D4311005E5B;
 Tue, 25 Aug 2020 19:51:35 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DC05D9D3;
 Tue, 25 Aug 2020 19:51:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v4 18/20] drm/nouveau/kms: Don't change EDID when it hasn't
 actually changed
Date: Tue, 25 Aug 2020 15:50:25 -0400
Message-Id: <20200825195027.74681-19-lyude@redhat.com>
In-Reply-To: <20200825195027.74681-1-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently in nouveau_connector_ddc_detect() and
nouveau_connector_detect_lvds(), we start the connector probing process
by releasing the previous EDID and informing DRM of the change. However,
since commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") drm_connector_update_edid_property() actually checks
whether the new EDID we've specified is different from the previous one,
and updates the connector's epoch accordingly if it is. But, because we
always set the EDID to NULL first in nouveau_connector_ddc_detect() and
nouveau_connector_detect_lvds() we end up making DRM think that the EDID
changes every single time we do a connector probe - which isn't needed.

So, let's fix this by not clearing the EDID at the start of the
connector probing process, and instead simply changing or removing it
once near the end of the probing process. This will help prevent us from
sending unneeded hotplug events to userspace when nothing has actually
changed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 54 ++++++++++-----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 637e91594fbe8..49dd0cbc332ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -528,6 +528,17 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 	}
 }
 
+static void
+nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
+			   struct edid *edid)
+{
+	struct edid *old_edid = nv_connector->edid;
+
+	drm_connector_update_edid_property(&nv_connector->base, edid);
+	kfree(old_edid);
+	nv_connector->edid = edid;
+}
+
 static enum drm_connector_status
 nouveau_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -541,13 +552,6 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	int ret;
 	enum drm_connector_status conn_status = connector_status_disconnected;
 
-	/* Cleanup the previous EDID block. */
-	if (nv_connector->edid) {
-		drm_connector_update_edid_property(connector, NULL);
-		kfree(nv_connector->edid);
-		nv_connector->edid = NULL;
-	}
-
 	/* Outputs are only polled while runtime active, so resuming the
 	 * device here is unnecessary (and would deadlock upon runtime suspend
 	 * because it waits for polling to finish). We do however, want to
@@ -560,22 +564,23 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		ret = pm_runtime_get_sync(dev->dev);
 		if (ret < 0 && ret != -EACCES) {
 			pm_runtime_put_autosuspend(dev->dev);
+			nouveau_connector_set_edid(nv_connector, NULL);
 			return conn_status;
 		}
 	}
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
 	if (nv_encoder && (i2c = nv_encoder->i2c) != NULL) {
+		struct edid *new_edid;
+
 		if ((vga_switcheroo_handler_flags() &
 		     VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
 		    nv_connector->type == DCB_CONNECTOR_LVDS)
-			nv_connector->edid = drm_get_edid_switcheroo(connector,
-								     i2c);
+			new_edid = drm_get_edid_switcheroo(connector, i2c);
 		else
-			nv_connector->edid = drm_get_edid(connector, i2c);
+			new_edid = drm_get_edid(connector, i2c);
 
-		drm_connector_update_edid_property(connector,
-							nv_connector->edid);
+		nouveau_connector_set_edid(nv_connector, new_edid);
 		if (!nv_connector->edid) {
 			NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
 				 connector->name);
@@ -609,6 +614,8 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		conn_status = connector_status_connected;
 		drm_dp_cec_set_edid(&nv_connector->aux, nv_connector->edid);
 		goto out;
+	} else {
+		nouveau_connector_set_edid(nv_connector, NULL);
 	}
 
 	nv_encoder = nouveau_connector_of_detect(connector);
@@ -652,18 +659,12 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
+	struct edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
-	/* Cleanup the previous EDID block. */
-	if (nv_connector->edid) {
-		drm_connector_update_edid_property(connector, NULL);
-		kfree(nv_connector->edid);
-		nv_connector->edid = NULL;
-	}
-
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
 	if (!nv_encoder)
-		return connector_status_disconnected;
+		goto out;
 
 	/* Try retrieving EDID via DDC */
 	if (!drm->vbios.fp_no_ddc) {
@@ -682,7 +683,8 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * valid - it's not (rh#613284)
 	 */
 	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
-		if ((nv_connector->edid = nouveau_acpi_edid(dev, connector))) {
+		edid = nouveau_acpi_edid(dev, connector);
+		if (edid) {
 			status = connector_status_connected;
 			goto out;
 		}
@@ -702,12 +704,10 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * stored for the panel stored in them.
 	 */
 	if (!drm->vbios.fp_no_ddc) {
-		struct edid *edid =
-			(struct edid *)nouveau_bios_embedded_edid(dev);
+		edid = (struct edid *)nouveau_bios_embedded_edid(dev);
 		if (edid) {
-			nv_connector->edid =
-					kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
-			if (nv_connector->edid)
+			edid = kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
+			if (edid)
 				status = connector_status_connected;
 		}
 	}
@@ -720,7 +720,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 		status = connector_status_unknown;
 #endif
 
-	drm_connector_update_edid_property(connector, nv_connector->edid);
+	nouveau_connector_set_edid(nv_connector, edid);
 	nouveau_connector_set_encoder(connector, nv_encoder);
 	return status;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
