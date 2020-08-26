Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848202536EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 20:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9295F6EAC6;
	Wed, 26 Aug 2020 18:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF86EACA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrQypXsB06I27AWFzq+unFDPT9ULdnzgHHger98409Y=;
 b=TIwJ6AvM7UH3Ab2iSNftjgNMwzzx5uArsNrp+OeU2xtX9ln4oYPkau/xYw+s5dz8BVif5/
 wVeXDnuCehxweADFqFvNeQ/wlrRFrWXPNjmW82CgeYlnrW/ZgbmvpdlxItRpZOt4Sieip5
 RDWUe99X7xz+pM/GP6x90jriJ94HguQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-EnDZQoIPNm2QBWzx8RTYXg-1; Wed, 26 Aug 2020 14:25:55 -0400
X-MC-Unique: EnDZQoIPNm2QBWzx8RTYXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8AB1DDFC;
 Wed, 26 Aug 2020 18:25:53 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E07D1002382;
 Wed, 26 Aug 2020 18:25:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 14/20] drm/nouveau/kms/nv50-: Use downstream DP clock
 limits for mode validation
Date: Wed, 26 Aug 2020 14:24:50 -0400
Message-Id: <20200826182456.322681-15-lyude@redhat.com>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 005750aeb6d4f..ad852e572cfec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -61,6 +61,11 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
 	}
 
+	ret = drm_dp_read_downstream_info(aux, dpcd,
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
