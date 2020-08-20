Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6024C574
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366156E9F0;
	Thu, 20 Aug 2020 18:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2E6E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 18:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSe2STeJN/VQk299U6GdY2sy2HaDdveKDfR6OrqqUwA=;
 b=gffWVt8hd71Tn+FfwVTSDxTNy7PtHQ+cZUMGro57dJIP7QzaKfioC0gq5JOtm/P8IUXgQN
 bGyHJ3usMmuq3i7DuellmXg9nFB9G2TQy7dWcTBwnn8uAN+k9XHIvz3G3gQ5ty8lmaitV2
 r339avU+S6tqEhgHk5vPqowocT3MTic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-3rX1RrBeMkqa_e3UfeI8Hg-1; Thu, 20 Aug 2020 14:31:00 -0400
X-MC-Unique: 3rX1RrBeMkqa_e3UfeI8Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB1BF1005E6D;
 Thu, 20 Aug 2020 18:30:58 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28DF45DA79;
 Thu, 20 Aug 2020 18:30:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v2 12/20] drm/nouveau/kms: Only use hpd_work for reprobing in
 HPD paths
Date: Thu, 20 Aug 2020 14:30:04 -0400
Message-Id: <20200820183012.288794-13-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
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

Currently we perform both short IRQ handling for DP, and connector
reprobing in the HPD IRQ handler. However since we need to grab
connection_mutex in order to reprobe a connector, in theory we could
accidentally block ourselves from handling any short IRQs until after a
modeset completes if a connector hotplug happens to occur in parallel
with a modeset.

I haven't seen this actually happen yet, but since we're cleaning up
nouveau's hotplug handling code anyway and we already have a hpd worker,
we can simply fix this by only relying on the HPD worker to actually
reprobe connectors when we receive a HPD IRQ. We also add a mask to
nouveau_drm to keep track of which connectors are waiting to be reprobed
in response to an HPD IRQ.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 42 +++++--------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c   | 70 ++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_display.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_dp.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |  2 +
 7 files changed, 86 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 4a29f691c08e4..637e91594fbe8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1138,6 +1138,20 @@ nouveau_connector_funcs_lvds = {
 	.early_unregister = nouveau_connector_early_unregister,
 };
 
+void
+nouveau_connector_hpd(struct drm_connector *connector)
+{
+	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	u32 mask = drm_connector_mask(connector);
+
+	mutex_lock(&drm->hpd_lock);
+	if (!(drm->hpd_pending & mask)) {
+		drm->hpd_pending |= mask;
+		schedule_work(&drm->hpd_work);
+	}
+	mutex_unlock(&drm->hpd_lock);
+}
+
 static int
 nouveau_connector_hotplug(struct nvif_notify *notify)
 {
@@ -1147,8 +1161,6 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	const struct nvif_notify_conn_rep_v0 *rep = notify->data;
-	const char *name = connector->name;
-	int ret;
 	bool plugged = (rep->mask != NVIF_NOTIFY_CONN_V0_UNPLUG);
 
 	if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
@@ -1156,31 +1168,9 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 		return NVIF_NOTIFY_KEEP;
 	}
 
-	ret = pm_runtime_get(drm->dev->dev);
-	if (ret == 0) {
-		/* We can't block here if there's a pending PM request
-		 * running, as we'll deadlock nouveau_display_fini() when it
-		 * calls nvif_put() on our nvif_notify struct. So, simply
-		 * defer the hotplug event until the device finishes resuming
-		 */
-		NV_DEBUG(drm, "Deferring HPD on %s until runtime resume\n",
-			 name);
-		schedule_work(&drm->hpd_work);
-
-		pm_runtime_put_noidle(drm->dev->dev);
-		return NVIF_NOTIFY_KEEP;
-	} else if (ret != 1 && ret != -EACCES) {
-		NV_WARN(drm, "HPD on %s dropped due to RPM failure: %d\n",
-			name, ret);
-		return NVIF_NOTIFY_DROP;
-	}
-
-	NV_DEBUG(drm, "%splugged %s\n", plugged ? "" : "un", name);
-
-	drm_helper_hpd_irq_event(connector->dev);
+	NV_DEBUG(drm, "%splugged %s\n", plugged ? "" : "un", connector->name);
+	nouveau_connector_hpd(connector);
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_autosuspend(drm->dev->dev);
 	return NVIF_NOTIFY_KEEP;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index d6de5cb8e2238..d0b859c4a80ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -187,6 +187,7 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 
 struct drm_connector *
 nouveau_connector_create(struct drm_device *, const struct dcb_output *);
+void nouveau_connector_hpd(struct drm_connector *connector);
 
 extern int nouveau_tv_disable;
 extern int nouveau_ignorelid;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 13016769a194b..bceb48a2dfca6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -457,16 +457,70 @@ static struct nouveau_drm_prop_enum_list dither_depth[] = {
 	}                                                                      \
 } while(0)
 
+void
+nouveau_display_hpd_resume(struct drm_device *dev)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+
+	mutex_lock(&drm->hpd_lock);
+	drm->hpd_pending = ~0;
+	mutex_unlock(&drm->hpd_lock);
+
+	schedule_work(&drm->hpd_work);
+}
+
 static void
 nouveau_display_hpd_work(struct work_struct *work)
 {
 	struct nouveau_drm *drm = container_of(work, typeof(*drm), hpd_work);
+	struct drm_device *dev = drm->dev;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	u32 pending;
+	bool changed = false;
+
+	pm_runtime_get_sync(dev->dev);
 
-	pm_runtime_get_sync(drm->dev->dev);
+	mutex_lock(&drm->hpd_lock);
+	pending = drm->hpd_pending;
+	drm->hpd_pending = 0;
+	mutex_unlock(&drm->hpd_lock);
 
-	drm_helper_hpd_irq_event(drm->dev);
+	/* Nothing to do, exit early without updating the last busy counter */
+	if (!pending)
+		goto noop;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+
+	nouveau_for_each_non_mst_connector_iter(connector, &conn_iter) {
+		enum drm_connector_status old_status = connector->status;
+		u64 old_epoch_counter = connector->epoch_counter;
+
+		if (!(pending & drm_connector_mask(connector)))
+			continue;
+
+		connector->status = drm_helper_probe_detect(connector, NULL,
+							    false);
+		if (old_epoch_counter == connector->epoch_counter)
+			continue;
+
+		changed = true;
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s (epoch counter %llu->%llu)\n",
+			    connector->base.id, connector->name,
+			    drm_get_connector_status_name(old_status),
+			    drm_get_connector_status_name(connector->status),
+			    old_epoch_counter, connector->epoch_counter);
+	}
+
+	drm_connector_list_iter_end(&conn_iter);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed)
+		drm_kms_helper_hotplug_event(dev);
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
+noop:
 	pm_runtime_put_sync(drm->dev->dev);
 }
 
@@ -490,12 +544,11 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 				 */
 				pm_runtime_put_autosuspend(drm->dev->dev);
 			} else if (ret == 0) {
-				/* This may be the only indication we receive
-				 * of a connector hotplug on a runtime
-				 * suspended GPU, schedule hpd_work to check.
+				/* We've started resuming the GPU already, so
+				 * it will handle scheduling a full reprobe
+				 * itself
 				 */
 				NV_DEBUG(drm, "ACPI requested connector reprobe\n");
-				schedule_work(&drm->hpd_work);
 				pm_runtime_put_noidle(drm->dev->dev);
 			} else {
 				NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
@@ -686,6 +739,7 @@ nouveau_display_create(struct drm_device *dev)
 	}
 
 	INIT_WORK(&drm->hpd_work, nouveau_display_hpd_work);
+	mutex_init(&drm->hpd_lock);
 #ifdef CONFIG_ACPI
 	drm->acpi_nb.notifier_call = nouveau_display_acpi_ntfy;
 	register_acpi_notifier(&drm->acpi_nb);
@@ -705,9 +759,10 @@ void
 nouveau_display_destroy(struct drm_device *dev)
 {
 	struct nouveau_display *disp = nouveau_display(dev);
+	struct nouveau_drm *drm = nouveau_drm(dev);
 
 #ifdef CONFIG_ACPI
-	unregister_acpi_notifier(&nouveau_drm(dev)->acpi_nb);
+	unregister_acpi_notifier(&drm->acpi_nb);
 #endif
 
 	drm_kms_helper_poll_fini(dev);
@@ -719,6 +774,7 @@ nouveau_display_destroy(struct drm_device *dev)
 	nvif_disp_dtor(&disp->disp);
 
 	nouveau_drm(dev)->display = NULL;
+	mutex_destroy(&drm->hpd_lock);
 	kfree(disp);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 76ba93e01aff4..616c434270594 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -45,6 +45,7 @@ nouveau_display(struct drm_device *dev)
 int  nouveau_display_create(struct drm_device *dev);
 void nouveau_display_destroy(struct drm_device *dev);
 int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
+void nouveau_display_hpd_resume(struct drm_device *dev);
 void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
 int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 201c0b4335563..71d095409c90d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -165,7 +165,7 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 
 	if (mstm && mstm->is_mst) {
 		if (!nv50_mstm_service(drm, nv_connector, mstm))
-			schedule_work(&drm->hpd_work);
+			nouveau_connector_hpd(connector);
 	} else {
 		drm_dp_cec_irq(&nv_connector->aux);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e52..42fc5c813a9bb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -953,7 +953,7 @@ nouveau_pmops_resume(struct device *dev)
 	ret = nouveau_do_resume(drm_dev, false);
 
 	/* Monitors may have been connected / disconnected during suspend */
-	schedule_work(&nouveau_drm(drm_dev)->hpd_work);
+	nouveau_display_hpd_resume(drm_dev);
 
 	return ret;
 }
@@ -1036,7 +1036,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
 
 	/* Monitors may have been connected / disconnected during suspend */
-	schedule_work(&nouveau_drm(drm_dev)->hpd_work);
+	nouveau_display_hpd_resume(drm_dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index f63ac72aa556f..73ebf5fba2fcd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -198,6 +198,8 @@ struct nouveau_drm {
 	struct nvbios vbios;
 	struct nouveau_display *display;
 	struct work_struct hpd_work;
+	struct mutex hpd_lock;
+	u32 hpd_pending;
 	struct work_struct fbcon_work;
 	int fbcon_new_state;
 #ifdef CONFIG_ACPI
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
