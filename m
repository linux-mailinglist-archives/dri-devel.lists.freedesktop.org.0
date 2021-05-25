Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908438F745
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F086E4E3;
	Tue, 25 May 2021 01:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B256E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 01:00:26 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 22so21869535pfv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGG/aErcZ/0lAoc8aFDvgmwrRNUc1YsBV5vdLuO23uY=;
 b=SnOl66s5TW6QnjD0jrrlmoIgxr28LXiNgBUn8AwbSCt04pAwSxvaQdBrqbwDo2Zfzk
 hEXGaT6di9UHi5lWAm4RS6MG9KBjISnhkPPqNZVf5ebzdn3HJmovt7ZHTqao6S2N4yPL
 0wkdK+xHRX8cmIhU5J9VJ3pfmLQcO3Q86Apb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGG/aErcZ/0lAoc8aFDvgmwrRNUc1YsBV5vdLuO23uY=;
 b=GjRr/RAMMgvP5rYkg9ZeOZxsBeieE+PiBgK9I6FDiYVLBeiejj0wNuuGvbBHtbj04N
 i6uZHcxrEHlQJb56ogg2TW2HwiOlHq2EYIezgWw+hg/eiPjeycXzt82cD3PveqUGP4OV
 dslEgQpUJbexIpUGXrTfJ949MPHCz+ehNADLm3XDHuqlBBfoMK5O18BrcAA1q0ncPXwK
 HU7KDCrVUhiKy+L2O3pjuX1SIqK2VA2I3qO0WeP8tG8e4LEj0PR4669gmyUTWZAEl9d7
 1h2dtMYxcEm9rsrReUR3yVTgEGMSeEHb5ETZgvcwmAmbXf7ByAuxFU83L9ADARm5DBAn
 I6Jw==
X-Gm-Message-State: AOAM532+GUNrWFbhs4Vm/oj1igSSy9rDxUN1f2GS3kegwBTVo5qj2cdu
 b0dwSfKfMz9lPXpPUCb3wTMXCg==
X-Google-Smtp-Source: ABdhPJyT8FtIt573jqv8gbIvflCdEphyS4aEXCxLQ7ITouzpZouSiHPlNabZ9libJofp7qWxgOl41A==
X-Received: by 2002:a63:784c:: with SMTP id t73mr16238138pgc.62.1621904425641; 
 Mon, 24 May 2021 18:00:25 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:768b:3ffb:3070:acdc])
 by smtp.gmail.com with UTF8SMTPSA id 23sm238724pgd.71.2021.05.24.18.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 18:00:25 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/3] drm_dp_cec: add MST support
Date: Tue, 25 May 2021 10:59:56 +1000
Message-Id: <20210525105913.v5.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
References: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sam McNally <sammc@chromium.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Signed-off-by: Sam McNally <sammc@chromium.org>
---

(no changes since v4)

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

 drivers/gpu/drm/drm_dp_cec.c          | 20 ++++++++++++++++----
 drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index 3ab2609f9ec7..1abd3f4654dc 100644
--- a/drivers/gpu/drm/drm_dp_cec.c
+++ b/drivers/gpu/drm/drm_dp_cec.c
@@ -14,6 +14,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_dp_mst_helper.h>
 
 /*
  * Unfortunately it turns out that we have a chicken-and-egg situation
@@ -245,13 +246,22 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
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
@@ -307,7 +317,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	u8 cap;
 
 	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
+	if (!aux->transfer && !aux->is_remote)
 		return;
 
 #ifndef CONFIG_MEDIA_CEC_RC
@@ -375,6 +385,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
+
 EXPORT_SYMBOL(drm_dp_cec_set_edid);
 
 /*
@@ -383,7 +394,7 @@ EXPORT_SYMBOL(drm_dp_cec_set_edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 {
 	/* No transfer function was set, so not a DP connector */
-	if (!aux->transfer)
+	if (!aux->transfer && !aux->is_remote)
 		return;
 
 	cancel_delayed_work_sync(&aux->cec.unregister_work);
@@ -393,6 +404,7 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
 		goto unlock;
 
 	cec_phys_addr_invalidate(aux->cec.adap);
+
 	/*
 	 * We're done if we want to keep the CEC device
 	 * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
@@ -428,7 +440,7 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 				   struct drm_connector *connector)
 {
 	WARN_ON(aux->cec.adap);
-	if (WARN_ON(!aux->transfer))
+	if (WARN_ON(!aux->transfer && !aux->is_remote))
 		return;
 	aux->cec.connector = connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 29aad3b6b31a..5612caf9fb49 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2359,6 +2359,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
+	drm_dp_cec_register_connector(&port->aux, connector);
+
 	drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 
@@ -2382,6 +2384,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
+
+	drm_dp_cec_unregister_connector(&port->aux);
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
 
@@ -2682,6 +2686,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
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
@@ -4170,6 +4189,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
 		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
 		hotplug = true;
+	} else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
+		drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
@@ -4362,6 +4383,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		break;
 	}
 out:
+	if (ret != connector_status_connected)
+		drm_dp_cec_unset_edid(&port->aux);
 	drm_dp_mst_topology_put_port(port);
 	return ret;
 }
@@ -4392,6 +4415,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 		edid = drm_get_edid(connector, &port->aux.ddc);
 	}
 	port->has_audio = drm_detect_monitor_audio(edid);
+	drm_dp_cec_set_edid(&port->aux, edid);
 	drm_dp_mst_topology_put_port(port);
 	return edid;
 }
-- 
2.31.1.818.g46aad6cb9e-goog

