Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BC252138
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 21:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636A6E9BA;
	Tue, 25 Aug 2020 19:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CDA6E9AF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAFue2g60a2ljGcukFK95rmCY40jDauxWzPPOO5DeB0=;
 b=I/152B3UugxRlogMHS4AOByYhL6UAEZE/1Xk4eDhbQkU8+G+4WnKwb9WrZFKblbO/exg4C
 xgFo5nxF0sQK5WtqVQdhKZm4NqM1vfI7KG7ezgr5J1jGr9fe+YI0OFMyZVjVXpOwM4JhOE
 Z0EvHcDMqq9I7ZNf96CmuN/r00GdFUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-J9C2FyQaPrSBNANa5zcHEg-1; Tue, 25 Aug 2020 15:51:27 -0400
X-MC-Unique: J9C2FyQaPrSBNANa5zcHEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A9C810ABDB2;
 Tue, 25 Aug 2020 19:51:25 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 381465D9D3;
 Tue, 25 Aug 2020 19:51:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v4 14/20] drm/nouveau/kms/nv50-: Use downstream DP clock limits
 for mode validation
Date: Tue, 25 Aug 2020 15:50:21 -0400
Message-Id: <20200825195027.74681-15-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for querying the maximum clock rate of a downstream
port on a DisplayPort connection. Generally, downstream ports refer to
active dongles which can have their own pixel clock limits.

Note as well, we also start marking the connector as disconnected if we
can't read the DPCD, since we wouldn't be able to do anything without
DPCD access anyway.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   |  3 +++
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 15 +++++++++++----
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8e1effb10425d..d2141ca16107b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1258,7 +1258,10 @@ nv50_mstc_detect(struct drm_connector *connector,
 
 	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
 				     mstc->port);
+	if (ret != connector_status_connected)
+		goto out;
 
+out:
 	pm_runtime_mark_last_busy(connector->dev->dev);
 	pm_runtime_put_autosuspend(connector->dev->dev);
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 71d095409c90d..c200f197083f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -61,6 +61,11 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 			mstm->can_mst = drm_dp_has_mst(aux, dpcd);
 	}
 
+	ret = drm_dp_downstream_read_info(aux, dpcd,
+					  outp->dp.downstream_ports);
+	if (ret < 0)
+		return connector_status_disconnected;
+
 	return connector_status_connected;
 }
 
@@ -176,8 +181,6 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 /* TODO:
  * - Use the minimum possible BPC here, once we add support for the max bpc
  *   property.
- * - Validate the mode against downstream port caps (see
- *   drm_dp_downstream_max_clock())
  * - Validate against the DP caps advertised by the GPU (we don't check these
  *   yet)
  */
@@ -188,15 +191,19 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		   unsigned *out_clock)
 {
 	const unsigned min_clock = 25000;
-	unsigned max_clock, clock;
+	unsigned max_clock, ds_clock, clock;
 	enum drm_mode_status ret;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
 
 	max_clock = outp->dp.link_nr * outp->dp.link_bw;
-	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
+	ds_clock = drm_dp_downstream_max_clock(outp->dp.dpcd,
+					       outp->dp.downstream_ports);
+	if (ds_clock)
+		max_clock = min(max_clock, ds_clock);
 
+	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
 	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
 					    &clock);
 	if (out_clock)
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index eef4643f5f982..c1924a4529a7b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -72,6 +72,7 @@ struct nouveau_encoder {
 			struct mutex hpd_irq_lock;
 
 			u8 dpcd[DP_RECEIVER_CAP_SIZE];
+			u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 			struct drm_dp_desc desc;
 		} dp;
 	};
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
