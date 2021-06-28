Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E63B5B14
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494B389D4D;
	Mon, 28 Jun 2021 09:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CAF89D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:17:39 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id e20so14983224pgg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jbXrDLIOYNJPynzQpjWFmwz7JqXKk9OrgK1UgECqTck=;
 b=eQKKdW1UrAwkKYnar6+WoW/p90aUK+QameL/kj+DS2wpMouLbmNGKzmfN6LuJ8ZpI7
 sh+//tsqMgV0ucPwehMZ4c+NlBbCmpjLV4hsj+rw/2P6lTliLfcDJsmAtM/O65N2/DV1
 kfB6Yi3EU0kGLw/j3qOBkCPUu/crQCk3ehOxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jbXrDLIOYNJPynzQpjWFmwz7JqXKk9OrgK1UgECqTck=;
 b=lTQ2iU7MJS1yAPUhC2VLvZES2/wY/jyqRnVjUGq4z9aSYjZ0ikLR4I5ItQVlT3u3R+
 AItjJgVm6z4OaHssOCEW6hgXDX5gyq2xpcB1wa1PblsHRV4O5yXlWGcf42kKY21I6q81
 LWMyHmuKnTLe5Vdh/bDN0W+RehvWQOTXjT1qf/LFbNVwGilWGjRBkyNbK6bKDZz3G3BA
 8R7FzZfRTlsh6IV8utDHdAD/BM1KRlvNkItXfvReZEoYMrQrGnk2PFCS15zjmIWTkZKg
 ofPmhxCL8WWR5Ib2Q5Q7wRq4ZPC6N3lgB9Eas+UR7fXzg8pGFy7qfFmwW8ylI4BObYjt
 5GCg==
X-Gm-Message-State: AOAM530ngk9RtbGjKkJ2G+u/wZmzOerAxFKh/2FxTCD55vbFB+5WO+kM
 lVWGFlj5LapJoJhRYJ0apQiU1Q==
X-Google-Smtp-Source: ABdhPJxILD/leYD+MaKF3w/17OoGIXPuUnQ/18cqzz/yvxgAmw04kYDvLciAv3L1VdW9golEb+OYKw==
X-Received: by 2002:a62:1ec4:0:b029:2fb:53cd:1dcb with SMTP id
 e187-20020a621ec40000b02902fb53cd1dcbmr23570105pfe.16.1624871859340; 
 Mon, 28 Jun 2021 02:17:39 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d9cf:d433:6a82:6f81])
 by smtp.gmail.com with UTF8SMTPSA id d9sm13870949pjx.13.2021.06.28.02.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 02:17:39 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/3] drm_dp_cec: add MST support
Date: Mon, 28 Jun 2021 19:17:03 +1000
Message-Id: <20210628191617.v7.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210628191617.v7.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
References: <20210628191617.v7.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sam McNally <sammc@chromium.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DP v2.0 errata E5, CEC tunneling can be supported through an MST
topology.

When tunneling CEC through an MST port, CEC IRQs are delivered via a
sink event notify message; when a sink event notify message is received,
trigger CEC IRQ handling - ESI1 is not used for remote CEC IRQs so its
value is not checked.

Register and unregister for all MST connectors, ensuring their
drm_dp_aux_cec struct won't be accessed uninitialized.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sam McNally <sammc@chromium.org>
---

Changes in v7:
- Added mutex_init() for aux->cec.lock

Changes in v6:
- Removed superfluous #include <drm/drm_dp_mst_helper.h>
- Removed spurious added newlines

Changes in v4:
- Removed use of work queues
- Updated checks of aux.transfer to accept aux.is_remote

Changes in v3:
- Fixed whitespace in drm_dp_cec_mst_irq_work()
- Moved drm_dp_cec_mst_set_edid_work() with the other set_edid functions

Changes in v2:
- Used aux->is_remote instead of aux->cec.is_mst, removing the need for
  the previous patch in the series
- Added a defensive check for null edid in the deferred set_edid work,
  in case the edid is no longer valid at that point

 drivers/gpu/drm/drm_dp_cec.c          | 17 +++++++++++++----
 drivers/gpu/drm/drm_dp_helper.c       |  3 ++-
 drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index 3ab2609f9ec7..61c59e2c4b3e 100644
--- a/drivers/gpu/drm/drm_dp_cec.c
+++ b/drivers/gpu/drm/drm_dp_cec.c
@@ -245,13 +245,22 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
 	int ret;
 
 	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
+	if (!aux->transfer && !aux->is_remote)
 		return;
 
 	mutex_lock(&aux->cec.lock);
 	if (!aux->cec.adap)
 		goto unlock;
 
+	if (aux->is_remote) {
+		/*
+		 * For remote connectors, CEC IRQ is triggered by an explicit
+		 * message so ESI1 is not involved.
+		 */
+		drm_dp_cec_handle_irq(aux);
+		goto unlock;
+	}
+
 	ret = drm_dp_dpcd_readb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
 				&cec_irq);
 	if (ret < 0 || !(cec_irq & DP_CEC_IRQ))
@@ -307,7 +316,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	u8 cap;
 
 	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
+	if (!aux->transfer && !aux->is_remote)
 		return;
 
 #ifndef CONFIG_MEDIA_CEC_RC
@@ -383,7 +392,7 @@ EXPORT_SYMBOL(drm_dp_cec_set_edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 {
 	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
+	if (!aux->transfer && !aux->is_remote)
 		return;
 
 	cancel_delayed_work_sync(&aux->cec.unregister_work);
@@ -428,7 +437,7 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 				   struct drm_connector *connector)
 {
 	WARN_ON(aux->cec.adap);
-	if (WARN_ON(!aux->transfer))
+	if (WARN_ON(!aux->transfer && !aux->is_remote))
 		return;
 	aux->cec.connector = connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 24bbc710c825..db566062058c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1723,10 +1723,11 @@ static void drm_dp_aux_crc_work(struct work_struct *work)
  * @aux: DisplayPort AUX channel
  *
  * Used for remote aux channel in general. Merely initialize the crc work
- * struct.
+ * struct and CEC lock.
  */
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux)
 {
+	mutex_init(&aux->cec.lock);
 	INIT_WORK(&aux->crc_work, drm_dp_aux_crc_work);
 }
 EXPORT_SYMBOL(drm_dp_remote_aux_init);
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1cc1a58cfa8b..b58c884fe67b 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2362,6 +2362,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
+	drm_dp_cec_register_connector(&port->aux, connector);
+
 	drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 
@@ -2385,6 +2387,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
+
+	drm_dp_cec_unregister_connector(&port->aux);
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
 
@@ -2662,6 +2666,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
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
@@ -4177,6 +4196,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
 		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
 		hotplug = true;
+	} else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
+		drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
@@ -4369,6 +4390,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		break;
 	}
 out:
+	if (ret != connector_status_connected)
+		drm_dp_cec_unset_edid(&port->aux);
 	drm_dp_mst_topology_put_port(port);
 	return ret;
 }
@@ -4399,6 +4422,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 		edid = drm_get_edid(connector, &port->aux.ddc);
 	}
 	port->has_audio = drm_detect_monitor_audio(edid);
+	drm_dp_cec_set_edid(&port->aux, edid);
 	drm_dp_mst_topology_put_port(port);
 	return edid;
 }
-- 
2.32.0.93.g670b81a890-goog

