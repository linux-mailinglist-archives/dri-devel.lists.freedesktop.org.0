Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FE274EE3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 04:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5EF6E3DF;
	Wed, 23 Sep 2020 02:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603A6E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:14:32 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g29so13428543pgl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y5JoffFpe5uav+d7gkZPgcNgC9xi0/l9KONDUMRkaCY=;
 b=YRBOzLDjeWxBNn9KFmDSoLENEBlpUDS//nPsHd4dNaE96fs/WQpXMO5t1SnJfpUC3K
 qxFeOeiZce9PE7UPdROP10YynHyTn6Z9SPTXa8mhty/vYO/PqdXFEESkbeSBN/jeblmT
 cKnwAxpJh6JvRcHqsjDGZtYGEKb9mt2USlHpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y5JoffFpe5uav+d7gkZPgcNgC9xi0/l9KONDUMRkaCY=;
 b=dkh2ImJa97Iek5Jg63qLvJyf1QGDk4i/6yW46SBrHiX0emxd7pF+tmtS6eAPz9v+Hl
 dPAZRdEMC9anOrUjnLmwLd9gJkEE0qNWaNHKJ3HQr8HTffxMT1QChEEqvNNOHzJXQe37
 zpXu06SnNlpsu1uaov8/7qohUFPIvR5YCR5iJy56WPMlMN0i9hEzG5g2CPeWm8dzTPw0
 czsXreKbyOupClPHPsE52l9aE88mr+J41eR2EGWrboFhCZuAlX6VOLdcHAu2WPiqS4nN
 nbDpSMhL4WGQV4gW9gw59YK7kvaqnugbjugH1dQXvbgKKrD9YaNcZJ9ffl7cwqBBNJRU
 BrCw==
X-Gm-Message-State: AOAM5339lNtP/Cyn9HeRM/QdXONBVtkrku/BzmAobdZ9FipE/CrBPCng
 lsDNjLZ0fXscZGLAo8EQ/luNbw==
X-Google-Smtp-Source: ABdhPJzefJHpa/mx25ZSzW9hJ66JiDcQKlpjolYG4X30mW3qV3RfoEptUwdKfqvAIx1GGeo3H8l4UQ==
X-Received: by 2002:a05:6a00:2387:b029:142:2501:3970 with SMTP id
 f7-20020a056a002387b029014225013970mr6597325pfc.53.1600827271588; 
 Tue, 22 Sep 2020 19:14:31 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id fs24sm3371383pjb.8.2020.09.22.19.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 19:14:31 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] drm_dp_cec: add MST support
Date: Wed, 23 Sep 2020 12:13:55 +1000
Message-Id: <20200923121320.v3.4.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sam McNally <sammc@chromium.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DP v2.0 errata E5, CEC tunneling can be supported through an MST
topology.

There are some minor differences for CEC tunneling through an MST
topology compared to CEC tunneling to an SST port:
- CEC IRQs are delivered via a sink event notify message
- CEC-related DPCD registers are accessed via remote DPCD reads and
  writes.

This results in the MST implementation diverging from the existing SST
implementation:
- sink event notify messages with CEC_IRQ ID set indicate CEC IRQ rather
  than ESI1
- setting edid and handling CEC IRQs, which can be triggered from
  contexts where locks held preclude HPD handling, are deferred to avoid
  remote DPCD access which would block until HPD handling is performed
  or a timeout

Register and unregister for all MST connectors, ensuring their
drm_dp_aux_cec struct won't be accessed uninitialized.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sam McNally <sammc@chromium.org>
---

Changes in v3:
- Fixed whitespace in drm_dp_cec_mst_irq_work()
- Moved drm_dp_cec_mst_set_edid_work() with the other set_edid functions

Changes in v2:
- Used aux->is_remote instead of aux->cec.is_mst, removing the need for
  the previous patch in the series
- Added a defensive check for null edid in the deferred set_edid work,
  in case the edid is no longer valid at that point

 drivers/gpu/drm/drm_dp_cec.c          | 68 +++++++++++++++++++++++++--
 drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
 include/drm/drm_dp_helper.h           |  4 ++
 3 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index 3ab2609f9ec7..1020b2cffdf0 100644
--- a/drivers/gpu/drm/drm_dp_cec.c
+++ b/drivers/gpu/drm/drm_dp_cec.c
@@ -14,6 +14,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_dp_mst_helper.h>
 
 /*
  * Unfortunately it turns out that we have a chicken-and-egg situation
@@ -248,6 +249,10 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
 	if (!aux->transfer)
 		return;
 
+	if (aux->is_remote) {
+		schedule_work(&aux->cec.mst_irq_work);
+		return;
+	}
 	mutex_lock(&aux->cec.lock);
 	if (!aux->cec.adap)
 		goto unlock;
@@ -276,6 +281,23 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
 	return true;
 }
 
+static void drm_dp_cec_mst_irq_work(struct work_struct *work)
+{
+	struct drm_dp_aux *aux = container_of(work, struct drm_dp_aux,
+					      cec.mst_irq_work);
+	struct drm_dp_mst_port *port =
+		container_of(aux, struct drm_dp_mst_port, aux);
+
+	port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
+	if (!port)
+		return;
+	mutex_lock(&aux->cec.lock);
+	if (aux->cec.adap)
+		drm_dp_cec_handle_irq(aux);
+	mutex_unlock(&aux->cec.lock);
+	drm_dp_mst_topology_put_port(port);
+}
+
 /*
  * Called if the HPD was low for more than drm_dp_cec_unregister_delay
  * seconds. This unregisters the CEC adapter.
@@ -297,7 +319,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
  * were unchanged and just update the CEC physical address. Otherwise
  * unregister the old CEC adapter and create a new one.
  */
-void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
+				       const struct edid *edid)
 {
 	struct drm_connector *connector = aux->cec.connector;
 	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
@@ -306,10 +329,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	unsigned int num_las = 1;
 	u8 cap;
 
-	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
-		return;
-
 #ifndef CONFIG_MEDIA_CEC_RC
 	/*
 	 * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
@@ -320,6 +339,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	 */
 	cec_caps &= ~CEC_CAP_RC;
 #endif
+	cancel_work_sync(&aux->cec.mst_irq_work);
 	cancel_delayed_work_sync(&aux->cec.unregister_work);
 
 	mutex_lock(&aux->cec.lock);
@@ -375,8 +395,40 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
+
+void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+{
+	/* No transfer function was set, so not a DP connector */
+	if (!aux->transfer)
+		return;
+
+	if (aux->is_remote)
+		schedule_work(&aux->cec.mst_set_edid_work);
+	else
+		drm_dp_cec_handle_set_edid(aux, edid);
+}
 EXPORT_SYMBOL(drm_dp_cec_set_edid);
 
+static void drm_dp_cec_mst_set_edid_work(struct work_struct *work)
+{
+	struct drm_dp_aux *aux =
+		container_of(work, struct drm_dp_aux, cec.mst_set_edid_work);
+	struct drm_dp_mst_port *port =
+		container_of(aux, struct drm_dp_mst_port, aux);
+	struct edid *edid = NULL;
+
+	port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
+	if (!port)
+		return;
+
+	edid = drm_get_edid(port->connector, &port->aux.ddc);
+
+	if (edid)
+		drm_dp_cec_handle_set_edid(aux, edid);
+
+	drm_dp_mst_topology_put_port(port);
+}
+
 /*
  * The EDID disappeared (likely because of the HPD going down).
  */
@@ -393,6 +445,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 		goto unlock;
 
 	cec_phys_addr_invalidate(aux->cec.adap);
+	cancel_work_sync(&aux->cec.mst_irq_work);
+
 	/*
 	 * We're done if we want to keep the CEC device
 	 * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
@@ -433,6 +487,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 	aux->cec.connector = connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
 			  drm_dp_cec_unregister_work);
+	INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
+	INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
 }
 EXPORT_SYMBOL(drm_dp_cec_register_connector);
 
@@ -442,6 +498,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
  */
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
 {
+	cancel_work_sync(&aux->cec.mst_irq_work);
+	cancel_work_sync(&aux->cec.mst_set_edid_work);
 	if (!aux->cec.adap)
 		return;
 	cancel_delayed_work_sync(&aux->cec.unregister_work);
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index c783a2a1c114..221c30133739 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2183,6 +2183,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
+	drm_dp_cec_register_connector(&port->aux, connector);
+
 	DRM_DEBUG_KMS("registering %s remote bus for %s\n",
 		      port->aux.name, connector->kdev->kobj.name);
 
@@ -2206,6 +2208,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 	DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
 		      port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
+
+	drm_dp_cec_unregister_connector(&port->aux);
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
 
@@ -2515,6 +2519,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 		queue_work(system_long_wq, &mstb->mgr->work);
 }
 
+static void
+drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
+			    struct drm_dp_sink_event_notify *sink_event)
+{
+	struct drm_dp_mst_port *port;
+
+	if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
+		port = drm_dp_get_port(mstb, sink_event->port_number);
+		if (port) {
+			drm_dp_cec_irq(&port->aux);
+			drm_dp_mst_topology_put_port(port);
+		}
+	}
+}
+
 static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
 							       u8 lct, u8 *rad)
 {
@@ -3954,6 +3973,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
 		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
 		hotplug = true;
+	} else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
+		drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
@@ -4147,6 +4168,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		break;
 	}
 out:
+	if (ret != connector_status_connected)
+		drm_dp_cec_unset_edid(&port->aux);
 	drm_dp_mst_topology_put_port(port);
 	return ret;
 }
@@ -4177,6 +4200,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 		edid = drm_get_edid(connector, &port->aux.ddc);
 	}
 	port->has_audio = drm_detect_monitor_audio(edid);
+	drm_dp_cec_set_edid(&port->aux, edid);
 	drm_dp_mst_topology_put_port(port);
 	return edid;
 }
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 85513eeb2196..d8ee24a6319c 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1496,12 +1496,16 @@ struct drm_connector;
  * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
  * @connector: the connector this CEC adapter is associated with
  * @unregister_work: unregister the CEC adapter
+ * @mst_irq_work: IRQ for CEC events on an MST branch
+ * @mst_set_edid_work: set the EDID for an MST branch
  */
 struct drm_dp_aux_cec {
 	struct mutex lock;
 	struct cec_adapter *adap;
 	struct drm_connector *connector;
 	struct delayed_work unregister_work;
+	struct work_struct mst_irq_work;
+	struct work_struct mst_set_edid_work;
 };
 
 /**
-- 
2.28.0.681.g6f77f65b4e-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
