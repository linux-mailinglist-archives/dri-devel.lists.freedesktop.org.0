Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D22420FF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85F66E82F;
	Tue, 11 Aug 2020 20:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 82083 seconds by postgrey-1.36 at gabe;
 Tue, 11 Aug 2020 20:06:52 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F396E830
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWbyluC+fFKOD9cEtqyeVjPUd+5ObnZXVxPfAt8VXE0=;
 b=DBYWrWYG2y/1PGh3oPa+2+71wmg4FB6jJQc5hurZCW4mkvcav0YKrlWnnnv+3yD8WPpGmQ
 3TbHMYe8i4UwzGHOijPlBbHZnam9/j9IXmHttJYr5Jb5Hxpz5EV1C9+xG9RF/rtoh/WDy2
 daPK51UvUVbGfgSQj04+xlr0k9GlCfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-VA19RoBZMi2CgxKFt7b_0A-1; Tue, 11 Aug 2020 16:06:49 -0400
X-MC-Unique: VA19RoBZMi2CgxKFt7b_0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA2951005504;
 Tue, 11 Aug 2020 20:06:47 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9BD55D9D7;
 Tue, 11 Aug 2020 20:06:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 17/20] drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
Date: Tue, 11 Aug 2020 16:04:54 -0400
Message-Id: <20200811200457.134743-18-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
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

This is another bit that we never implemented for nouveau: dongle
detection. When a "dongle", e.g. an active display adaptor, is hooked up
to the system and causes an HPD to be fired, we don't actually know
whether or not there's anything plugged into the dongle without checking
the sink count. As a result, plugging in a dongle without anything
plugged into it currently results in a bogus EDID retrieval error in the kernel log.

Additionally, most dongles won't send another long HPD signal if the
user suddenly plugs something in, they'll only send a short HPD IRQ with
the expectation that the source will check the sink count and reprobe
the connector if it's changed - something we don't actually do. As a
result, nothing will happen if the user plugs the dongle in before
plugging something into the dongle.

So, let's fix this by checking the sink count in both
nouveau_dp_probe_dpcd() and nouveau_dp_irq(), and reprobing the
connector if things change.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 54 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index f6950a62138ca..f41fa513023fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,12 +36,22 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
+static bool
+nouveau_dp_has_sink_count(struct drm_connector *connector,
+			  struct nouveau_encoder *outp)
+{
+	return drm_dp_has_sink_count(connector, outp->dp.dpcd,
+				     &outp->dp.desc);
+}
+
 static enum drm_connector_status
 nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		      struct nouveau_encoder *outp)
 {
+	struct drm_connector *connector = &nv_connector->base;
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	struct nv50_mstm *mstm = NULL;
+	enum drm_connector_status status = connector_status_disconnected;
 	int ret;
 	u8 *dpcd = outp->dp.dpcd;
 
@@ -50,9 +60,9 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		ret = drm_dp_read_desc(aux, &outp->dp.desc,
 				       drm_dp_is_branch(dpcd));
 		if (ret < 0)
-			return connector_status_disconnected;
+			goto out;
 	} else {
-		return connector_status_disconnected;
+		goto out;
 	}
 
 	if (nouveau_mst) {
@@ -61,12 +71,33 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 			mstm->can_mst = drm_dp_has_mst(aux, dpcd);
 	}
 
+	if (nouveau_dp_has_sink_count(connector, outp)) {
+		ret = drm_dp_get_sink_count(aux);
+		if (ret < 0)
+			goto out;
+
+		outp->dp.sink_count = ret;
+
+		/*
+		 * Dongle connected, but no display. Don't bother reading
+		 * downstream port info
+		 */
+		if (!outp->dp.sink_count)
+			return connector_status_disconnected;
+	}
+
 	ret = drm_dp_downstream_read_info(aux, dpcd,
 					  outp->dp.downstream_ports);
 	if (ret < 0)
-		return connector_status_disconnected;
+		goto out;
 
-	return connector_status_connected;
+	status = connector_status_connected;
+out:
+	if (status != connector_status_connected) {
+		/* Clear any cached info */
+		outp->dp.sink_count = 0;
+	}
+	return status;
 }
 
 int
@@ -161,6 +192,8 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
 	struct nv50_mstm *mstm;
+	int ret;
+	bool send_hpd = false;
 
 	if (!outp)
 		return;
@@ -172,12 +205,23 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 
 	if (mstm && mstm->is_mst) {
 		if (!nv50_mstm_service(drm, nv_connector, mstm))
-			nouveau_connector_hpd(connector);
+			send_hpd = true;
 	} else {
 		drm_dp_cec_irq(&nv_connector->aux);
+
+		if (nouveau_dp_has_sink_count(connector, outp)) {
+			ret = drm_dp_get_sink_count(&nv_connector->aux);
+			if (ret != outp->dp.sink_count)
+				send_hpd = true;
+			if (ret >= 0)
+				outp->dp.sink_count = ret;
+		}
 	}
 
 	mutex_unlock(&outp->dp.hpd_irq_lock);
+
+	if (send_hpd)
+		nouveau_connector_hpd(connector);
 }
 
 /* TODO:
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index c1924a4529a7b..21937f1c7dd90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -74,6 +74,8 @@ struct nouveau_encoder {
 			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 			u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 			struct drm_dp_desc desc;
+
+			u8 sink_count;
 		} dp;
 	};
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
