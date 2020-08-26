Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B132536FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 20:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1901F6EAD2;
	Wed, 26 Aug 2020 18:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DF26EAD2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5pLgC6WIukVeJ9e0QAmsmJtAC4T0fQJjaINLg9ihCg=;
 b=L3vfoz4YujFVX2xhwJiDasOqC+KC9F+l0Jnw13166QtP8+YQGP3snZRZkxbMwTNjXh5MtR
 MqyH/trPR8mVKAgMPb9p9/jpZTG9iVvTafaYAQ1brhVlIUqqoBTo1zdVDkRergDnQuNzWr
 VtHUF3amDRSAgB/l7l1gN4aU4T8mkdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-klPhpkuiOVuAQ8W7ZxQJDw-1; Wed, 26 Aug 2020 14:26:05 -0400
X-MC-Unique: klPhpkuiOVuAQ8W7ZxQJDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DF69801AB7;
 Wed, 26 Aug 2020 18:26:03 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F0510021AA;
 Wed, 26 Aug 2020 18:26:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 17/20] drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
Date: Wed, 26 Aug 2020 14:24:53 -0400
Message-Id: <20200826182456.322681-18-lyude@redhat.com>
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
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 53 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index ad852e572cfec..59be357b17e00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,12 +36,21 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
+static bool
+nouveau_dp_has_sink_count(struct drm_connector *connector,
+			  struct nouveau_encoder *outp)
+{
+	return drm_dp_read_sink_count_cap(connector, outp->dp.dpcd, &outp->dp.desc);
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
 
@@ -50,9 +59,9 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
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
@@ -61,12 +70,33 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
 	}
 
+	if (nouveau_dp_has_sink_count(connector, outp)) {
+		ret = drm_dp_read_sink_count(aux);
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
 	ret = drm_dp_read_downstream_info(aux, dpcd,
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
@@ -159,6 +189,8 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
 	struct nv50_mstm *mstm;
+	int ret;
+	bool send_hpd = false;
 
 	if (!outp)
 		return;
@@ -170,12 +202,23 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 
 	if (mstm && mstm->is_mst) {
 		if (!nv50_mstm_service(drm, nv_connector, mstm))
-			nouveau_connector_hpd(connector);
+			send_hpd = true;
 	} else {
 		drm_dp_cec_irq(&nv_connector->aux);
+
+		if (nouveau_dp_has_sink_count(connector, outp)) {
+			ret = drm_dp_read_sink_count(&nv_connector->aux);
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
