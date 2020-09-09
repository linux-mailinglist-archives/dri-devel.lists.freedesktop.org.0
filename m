Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E265426286C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145876EA1F;
	Wed,  9 Sep 2020 07:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8106EA1F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:21:35 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q4so886566pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZDmB9JzIYGuRSsGy+dFsSPMcLM1wMcxNasVJybbmzU=;
 b=L3O3Ny3oymTUpl9Op9zbMnGr8l+9wV1Tq17GxtoiEAQbdOdnCoat6p6iLrAeA6CPA6
 +8wrZSkogWK+abWi6Kwx6m3nQdkI2yhcpDUOGVB/fuUTUqAuYyxgvmDcDCwaUbcCgp+N
 qcA5xqhOyToOkDzQp51dSNDQwdRZAuAJeyqw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pZDmB9JzIYGuRSsGy+dFsSPMcLM1wMcxNasVJybbmzU=;
 b=C4w/Q0wO1BR+qn0nrWbANIvcuDuK01g4PNksl6Vd7Xa92NEHZE8uv+w9m+/njhGsRS
 13mYWVW04We+YQUnRx81DqNb3KZmbfazDhcdbS46gaLdUObq1TCWrEBwaLssU0dt0KIC
 equMl2cV4GNawy2adHNwgRU+YCKTIHRHPFOMUQBIxBVBhr77XZ0tlkjGN7OQkJ2CFDDt
 YwzWurWOcsJ0wMs1nXUMRHhRdQ5KzCHw5l2cw2tdQTf/cfmAKMmoi5lTii8w+3/wlJN7
 i5rOuZGavSJWvUZwVHpDl/iTWJtVNgul4s1XPAQTh38smUL1D2dyV4cU7Gv2lfmo9m/h
 yrlw==
X-Gm-Message-State: AOAM533HEhunUPy8HvDX8KYZr49vTvN+MoI3cbHk3d0Wuu0un798iq/4
 GfeMvIC034nzdT7pxcaEb5urxg==
X-Google-Smtp-Source: ABdhPJzk2vrQsgC+7BtwVJBXymrwOXTdtaw5M0SdMjPF2utMC+q1a4PMBR7VeuoCJba7V7Yam01t4A==
X-Received: by 2002:a17:90b:2347:: with SMTP id
 ms7mr2416890pjb.135.1599636094728; 
 Wed, 09 Sep 2020 00:21:34 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id c128sm955410pfb.126.2020.09.09.00.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 00:21:34 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] drm_dp_cec: add MST support
Date: Wed,  9 Sep 2020 17:20:52 +1000
Message-Id: <20200909172023.v2.4.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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
 Sam McNally <sammc@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org
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

Signed-off-by: Sam McNally <sammc@chromium.org>
---

Changes in v2:
- Used aux->is_remote instead of aux->cec.is_mst, removing the need for
  the previous patch in the series
- Added a defensive check for null edid in the deferred set_edid work,
  in case the edid is no longer valid at that point

 drivers/gpu/drm/drm_dp_cec.c          | 69 +++++++++++++++++++++++++--
 drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
 include/drm/drm_dp_helper.h           |  4 ++
 3 files changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index 3ab2609f9ec7..d708fc1e273a 100644
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
@@ -276,6 +281,24 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
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
+
+	mutex_unlock(&aux->cec.lock);
+	drm_dp_mst_topology_put_port(port);
+}
+
 /*
  * Called if the HPD was low for more than drm_dp_cec_unregister_delay
  * seconds. This unregisters the CEC adapter.
@@ -297,7 +320,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
  * were unchanged and just update the CEC physical address. Otherwise
  * unregister the old CEC adapter and create a new one.
  */
-void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
+				       const struct edid *edid)
 {
 	struct drm_connector *connector = aux->cec.connector;
 	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
@@ -306,10 +330,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	unsigned int num_las = 1;
 	u8 cap;
 
-	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
-		return;
-
 #ifndef CONFIG_MEDIA_CEC_RC
 	/*
 	 * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
@@ -320,6 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	 */
 	cec_caps &= ~CEC_CAP_RC;
 #endif
+	cancel_work_sync(&aux->cec.mst_irq_work);
 	cancel_delayed_work_sync(&aux->cec.unregister_work);
 
 	mutex_lock(&aux->cec.lock);
@@ -375,6 +396,18 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
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
 
 /*
@@ -393,6 +426,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 		goto unlock;
 
 	cec_phys_addr_invalidate(aux->cec.adap);
+	cancel_work_sync(&aux->cec.mst_irq_work);
+
 	/*
 	 * We're done if we want to keep the CEC device
 	 * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
@@ -414,6 +449,26 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 }
 EXPORT_SYMBOL(drm_dp_cec_unset_edid);
 
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
 /**
  * drm_dp_cec_register_connector() - register a new connector
  * @aux: DisplayPort AUX channel
@@ -433,6 +488,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 	aux->cec.connector = connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
 			  drm_dp_cec_unregister_work);
+	INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
+	INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
 }
 EXPORT_SYMBOL(drm_dp_cec_register_connector);
 
@@ -442,6 +499,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
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
2.28.0.526.ge36021eeef-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
