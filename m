Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BB070BB0A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 12:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41E010E2B9;
	Mon, 22 May 2023 10:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7177110E2B9;
 Mon, 22 May 2023 10:59:44 +0000 (UTC)
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 34MAxYxF041634;
 Mon, 22 May 2023 19:59:34 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Mon, 22 May 2023 19:59:33 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 34MAxXsW041631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 22 May 2023 19:59:33 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <47c5fe59-faec-8eb6-7f3c-f76a4bb0f3cb@I-love.SAKURA.ne.jp>
Date: Mon, 22 May 2023 19:59:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5] drm/i915: avoid flush_scheduled_work() usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <87a0ab95-d3d2-91b3-1e89-aca3f86a99f5@I-love.SAKURA.ne.jp>
 <173905bb-78d5-4952-cc31-ab0d5697a169@I-love.SAKURA.ne.jp>
In-Reply-To: <173905bb-78d5-4952-cc31-ab0d5697a169@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
macro") says, flush_scheduled_work() is dangerous and will be forbidden.

i915 became the last flush_scheduled_work() user, but developers cannot
find time for auditing which work items does this flush_scheduled_work()
need to wait.

Therefore, for now let's start with blind/mechanical conversion within
the whole drivers/gpu/drm/i915/ directory, based on an assumption that
i915 does not need to wait for work items outside of this directory.

Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
Changes in v5:
  Renamed the module global workqueue from "i915" to "i915-global",
  suggested by Tvrtko Ursulin.

Changes in v4:
  Refreshed using drm-tip.git.

Changes in v3:
  Refreshed using drm-tip.git, for commit 40053823baad ("drm/i915/display:
  move modeset probe/remove functions to intel_display_driver.c") moved
  flush_scheduled_work() from intel_display.c to intel_display_driver.c .

  Please check the comment from Daniel Vetter at
  https://lkml.kernel.org/r/ZDuntOkUeh0Eve8a@phenom.ffwll.local .

Changes in v2:
  Add missing alloc_workqueue() failure check.

 drivers/gpu/drm/i915/display/intel_display.c   |  2 +-
 .../drm/i915/display/intel_display_driver.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_dmc.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  2 +-
 .../drm/i915/display/intel_dp_link_training.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c      | 18 +++++++++---------
 drivers/gpu/drm/i915/display/intel_hotplug.c   | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_opregion.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_pps.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c       |  6 +++---
 .../drm/i915/gt/intel_execlists_submission.c   |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_irq.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c    | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_reset.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c            | 14 +++++++-------
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c   |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                |  1 +
 drivers/gpu/drm/i915/i915_module.c             |  7 +++++++
 drivers/gpu/drm/i915/i915_request.c            |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c           |  4 +++-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c |  4 +++-
 25 files changed, 64 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 09320e14d75c..5f1ba9c908cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7145,7 +7145,7 @@ intel_atomic_commit_ready(struct i915_sw_fence *fence,
 				&to_i915(state->base.dev)->display.atomic_helper;
 
 			if (llist_add(&state->freed, &helper->free_list))
-				schedule_work(&helper->free_work);
+				queue_work(i915_wq, &helper->free_work);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 60ce10fc7205..a20a9cfaab0e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -435,7 +435,7 @@ void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 	intel_unregister_dsm_handler();
 
 	/* flush any delayed tasks or pending work */
-	flush_scheduled_work();
+	flush_workqueue(i915_wq);
 
 	intel_hdcp_component_fini(i915);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 8a88de67ff0a..57d015006784 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1057,7 +1057,7 @@ void intel_dmc_init(struct drm_i915_private *i915)
 	i915->display.dmc.dmc = dmc;
 
 	drm_dbg_kms(&i915->drm, "Loading %s\n", dmc->fw_path);
-	schedule_work(&dmc->work);
+	queue_work(i915_wq, &dmc->work);
 
 	return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4bec8cd7979f..4782bdfc7c61 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5251,7 +5251,7 @@ static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
 	spin_lock_irq(&i915->irq_lock);
 	i915->display.hotplug.event_bits |= BIT(encoder->hpd_pin);
 	spin_unlock_irq(&i915->irq_lock);
-	queue_delayed_work(system_wq, &i915->display.hotplug.hotplug_work, 0);
+	queue_delayed_work(i915_wq, &i915->display.hotplug.hotplug_work, 0);
 }
 
 static const struct drm_connector_funcs intel_dp_connector_funcs = {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 0952a707358c..06859fb6f30e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1081,7 +1081,7 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 	}
 
 	/* Schedule a Hotplug Uevent to userspace to start modeset */
-	schedule_work(&intel_connector->modeset_retry_work);
+	queue_work(i915_wq, &intel_connector->modeset_retry_work);
 }
 
 /* Perform the link training on all LTTPRs and the DPRX on a link. */
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 760e63cdc0c8..8bacb734ad78 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -111,7 +111,7 @@ static void intel_drrs_set_state(struct intel_crtc *crtc,
 
 static void intel_drrs_schedule_work(struct intel_crtc *crtc)
 {
-	mod_delayed_work(system_wq, &crtc->drrs.work, msecs_to_jiffies(1000));
+	mod_delayed_work(i915_wq, &crtc->drrs.work, msecs_to_jiffies(1000));
 }
 
 static unsigned int intel_drrs_frontbuffer_bits(const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 11bb8cf9c9d0..ba2c5b5c6e14 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1600,7 +1600,7 @@ static void __intel_fbc_handle_fifo_underrun_irq(struct intel_fbc *fbc)
 	if (READ_ONCE(fbc->underrun_detected))
 		return;
 
-	schedule_work(&fbc->underrun_work);
+	queue_work(i915_wq, &fbc->underrun_work);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index aab1ae74a8f7..e093270b6a4c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -689,7 +689,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 			/* Don't block our own workqueue as this can
 			 * be run in parallel with other i915.ko tasks.
 			 */
-			schedule_work(&dev_priv->display.fbdev.suspend_work);
+			queue_work(i915_wq, &dev_priv->display.fbdev.suspend_work);
 			return;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index dd539106ee5a..d981defc8b0a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1001,7 +1001,7 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 	hdcp->value = value;
 	if (update_property) {
 		drm_connector_get(&connector->base);
-		schedule_work(&hdcp->prop_work);
+		queue_work(i915_wq, &hdcp->prop_work);
 	}
 }
 
@@ -2095,11 +2095,11 @@ static void intel_hdcp_check_work(struct work_struct *work)
 		return;
 
 	if (!intel_hdcp2_check_link(connector))
-		schedule_delayed_work(&hdcp->check_work,
-				      DRM_HDCP2_CHECK_PERIOD_MS);
+		queue_delayed_work(i915_wq, &hdcp->check_work,
+				   DRM_HDCP2_CHECK_PERIOD_MS);
 	else if (!intel_hdcp_check_link(connector))
-		schedule_delayed_work(&hdcp->check_work,
-				      DRM_HDCP_CHECK_PERIOD_MS);
+		queue_delayed_work(i915_wq, &hdcp->check_work,
+				   DRM_HDCP_CHECK_PERIOD_MS);
 }
 
 static int i915_hdcp_component_bind(struct device *i915_kdev,
@@ -2398,7 +2398,7 @@ int intel_hdcp_enable(struct intel_atomic_state *state,
 	}
 
 	if (!ret) {
-		schedule_delayed_work(&hdcp->check_work, check_link_interval);
+		queue_delayed_work(i915_wq, &hdcp->check_work, check_link_interval);
 		intel_hdcp_update_value(connector,
 					DRM_MODE_CONTENT_PROTECTION_ENABLED,
 					true);
@@ -2473,7 +2473,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 		mutex_lock(&hdcp->mutex);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		drm_connector_get(&connector->base);
-		schedule_work(&hdcp->prop_work);
+		queue_work(i915_wq, &hdcp->prop_work);
 		mutex_unlock(&hdcp->mutex);
 	}
 
@@ -2490,7 +2490,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 		 */
 		if (!desired_and_not_enabled && !content_protection_type_changed) {
 			drm_connector_get(&connector->base);
-			schedule_work(&hdcp->prop_work);
+			queue_work(i915_wq, &hdcp->prop_work);
 		}
 	}
 
@@ -2609,5 +2609,5 @@ void intel_hdcp_handle_cp_irq(struct intel_connector *connector)
 	atomic_inc(&connector->hdcp.cp_irq_count);
 	wake_up_all(&connector->hdcp.cp_irq_queue);
 
-	schedule_delayed_work(&hdcp->check_work, 0);
+	queue_delayed_work(i915_wq, &hdcp->check_work, 0);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 23a5e1a875f1..8247b3e02968 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -212,7 +212,7 @@ intel_hpd_irq_storm_switch_to_polling(struct drm_i915_private *dev_priv)
 	/* Enable polling and queue hotplug re-enabling. */
 	if (hpd_disabled) {
 		drm_kms_helper_poll_enable(&dev_priv->drm);
-		mod_delayed_work(system_wq, &dev_priv->display.hotplug.reenable_work,
+		mod_delayed_work(i915_wq, &dev_priv->display.hotplug.reenable_work,
 				 msecs_to_jiffies(HPD_STORM_REENABLE_DELAY));
 	}
 }
@@ -339,7 +339,7 @@ static void i915_digport_work_func(struct work_struct *work)
 		spin_lock_irq(&dev_priv->irq_lock);
 		dev_priv->display.hotplug.event_bits |= old_bits;
 		spin_unlock_irq(&dev_priv->irq_lock);
-		queue_delayed_work(system_wq, &dev_priv->display.hotplug.hotplug_work, 0);
+		queue_delayed_work(i915_wq, &dev_priv->display.hotplug.hotplug_work, 0);
 	}
 }
 
@@ -446,7 +446,7 @@ static void i915_hotplug_work_func(struct work_struct *work)
 		dev_priv->display.hotplug.retry_bits |= retry;
 		spin_unlock_irq(&dev_priv->irq_lock);
 
-		mod_delayed_work(system_wq, &dev_priv->display.hotplug.hotplug_work,
+		mod_delayed_work(i915_wq, &dev_priv->display.hotplug.hotplug_work,
 				 msecs_to_jiffies(HPD_RETRY_DELAY));
 	}
 }
@@ -577,7 +577,7 @@ void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
 	if (queue_dig)
 		queue_work(dev_priv->display.hotplug.dp_wq, &dev_priv->display.hotplug.dig_port_work);
 	if (queue_hp)
-		queue_delayed_work(system_wq, &dev_priv->display.hotplug.hotplug_work, 0);
+		queue_delayed_work(i915_wq, &dev_priv->display.hotplug.hotplug_work, 0);
 }
 
 /**
@@ -687,7 +687,7 @@ void intel_hpd_poll_enable(struct drm_i915_private *dev_priv)
 	 * As well, there's no issue if we race here since we always reschedule
 	 * this worker anyway
 	 */
-	schedule_work(&dev_priv->display.hotplug.poll_init_work);
+	queue_work(i915_wq, &dev_priv->display.hotplug.poll_init_work);
 }
 
 /**
@@ -715,7 +715,7 @@ void intel_hpd_poll_disable(struct drm_i915_private *dev_priv)
 		return;
 
 	WRITE_ONCE(dev_priv->display.hotplug.poll_enabled, false);
-	schedule_work(&dev_priv->display.hotplug.poll_init_work);
+	queue_work(i915_wq, &dev_priv->display.hotplug.poll_init_work);
 }
 
 void intel_hpd_init_early(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index b7973a05d022..24c0a4abcc4d 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -635,7 +635,7 @@ static void asle_work(struct work_struct *work)
 void intel_opregion_asle_intr(struct drm_i915_private *dev_priv)
 {
 	if (dev_priv->display.opregion.asle)
-		schedule_work(&dev_priv->display.opregion.asle_work);
+		queue_work(i915_wq, &dev_priv->display.opregion.asle_work);
 }
 
 #define ACPI_EV_DISPLAY_SWITCH (1<<0)
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 5e7ba594e7e7..805bd0442d19 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -882,7 +882,7 @@ static void edp_panel_vdd_schedule_off(struct intel_dp *intel_dp)
 	 * operations.
 	 */
 	delay = msecs_to_jiffies(intel_dp->pps.panel_power_cycle_delay * 5);
-	schedule_delayed_work(&intel_dp->pps.panel_vdd_work, delay);
+	queue_delayed_work(i915_wq, &intel_dp->pps.panel_vdd_work, delay);
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index ea0389c5f656..346ec839ab6c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -341,7 +341,7 @@ void intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir)
 		 */
 		intel_de_rmw(dev_priv, imr_reg, 0, psr_irq_psr_error_bit_get(intel_dp));
 
-		schedule_work(&intel_dp->psr.work);
+		queue_work(i915_wq, &intel_dp->psr.work);
 	}
 }
 
@@ -2453,7 +2453,7 @@ tgl_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits,
 		return;
 
 	tgl_psr2_enable_dc3co(intel_dp);
-	mod_delayed_work(system_wq, &intel_dp->psr.dc3co_work,
+	mod_delayed_work(i915_wq, &intel_dp->psr.dc3co_work,
 			 intel_dp->psr.dc3co_exit_delay);
 }
 
@@ -2493,7 +2493,7 @@ static void _psr_flush_handle(struct intel_dp *intel_dp)
 		psr_force_hw_tracking_exit(intel_dp);
 
 		if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
-			schedule_work(&intel_dp->psr.work);
+			queue_work(i915_wq, &intel_dp->psr.work);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 750326434677..e10d285ddb2c 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2375,7 +2375,7 @@ static void execlists_capture(struct intel_engine_cs *engine)
 		goto err_rq;
 
 	INIT_WORK(&cap->work, execlists_capture_work);
-	schedule_work(&cap->work);
+	queue_work(i915_wq, &cap->work);
 	return;
 
 err_rq:
@@ -3680,7 +3680,7 @@ static void virtual_context_destroy(struct kref *kref)
 	 * lock, we can delegate the free of the engine to an RCU worker.
 	 */
 	INIT_RCU_WORK(&ve->rcu, rcu_virtual_context_destroy);
-	queue_rcu_work(system_wq, &ve->rcu);
+	queue_rcu_work(i915_wq, &ve->rcu);
 }
 
 static void virtual_engine_initial_hint(struct virtual_engine *ve)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index cadfd85785b1..54aa90dff33f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -90,8 +90,8 @@ static void pool_free_work(struct work_struct *wrk)
 		container_of(wrk, typeof(*pool), work.work);
 
 	if (pool_free_older_than(pool, HZ))
-		schedule_delayed_work(&pool->work,
-				      round_jiffies_up_relative(HZ));
+		queue_delayed_work(i915_wq, &pool->work,
+				   round_jiffies_up_relative(HZ));
 }
 
 static void pool_retire(struct i915_active *ref)
@@ -116,8 +116,8 @@ static void pool_retire(struct i915_active *ref)
 	WRITE_ONCE(node->age, jiffies ?: 1); /* 0 reserved for active nodes */
 	spin_unlock_irqrestore(&pool->lock, flags);
 
-	schedule_delayed_work(&pool->work,
-			      round_jiffies_up_relative(HZ));
+	queue_delayed_work(i915_wq, &pool->work,
+			   round_jiffies_up_relative(HZ));
 }
 
 void intel_gt_buffer_pool_mark_used(struct intel_gt_buffer_pool_node *node)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 8f888d36f16d..5b38e9d53e8d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -376,7 +376,7 @@ static void gen7_parity_error_irq_handler(struct intel_gt *gt, u32 iir)
 	if (iir & GT_RENDER_L3_PARITY_ERROR_INTERRUPT)
 		gt->i915->l3_parity.which_slice |= 1 << 0;
 
-	schedule_work(&gt->i915->l3_parity.error_work);
+	queue_work(i915_wq, &gt->i915->l3_parity.error_work);
 }
 
 void gen6_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index 1dfd01668c79..683dc55d9191 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -116,7 +116,7 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
 	GEM_BUG_ON(intel_engine_is_virtual(engine));
 
 	if (add_retire(engine, tl))
-		schedule_work(&engine->retire_work);
+		queue_work(i915_wq, &engine->retire_work);
 }
 
 void intel_engine_init_retire(struct intel_engine_cs *engine)
@@ -207,8 +207,8 @@ static void retire_work_handler(struct work_struct *work)
 	struct intel_gt *gt =
 		container_of(work, typeof(*gt), requests.retire_work.work);
 
-	schedule_delayed_work(&gt->requests.retire_work,
-			      round_jiffies_up_relative(HZ));
+	queue_delayed_work(i915_wq, &gt->requests.retire_work,
+			   round_jiffies_up_relative(HZ));
 	intel_gt_retire_requests(gt);
 }
 
@@ -224,8 +224,8 @@ void intel_gt_park_requests(struct intel_gt *gt)
 
 void intel_gt_unpark_requests(struct intel_gt *gt)
 {
-	schedule_delayed_work(&gt->requests.retire_work,
-			      round_jiffies_up_relative(HZ));
+	queue_delayed_work(i915_wq, &gt->requests.retire_work,
+			   round_jiffies_up_relative(HZ));
 }
 
 void intel_gt_fini_requests(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 195ff72d7a14..f4e986f4c7c9 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1625,7 +1625,7 @@ void __intel_init_wedge(struct intel_wedge_me *w,
 	w->name = name;
 
 	INIT_DELAYED_WORK_ONSTACK(&w->work, intel_wedge_me);
-	schedule_delayed_work(&w->work, timeout);
+	queue_delayed_work(i915_wq, &w->work, timeout);
 }
 
 void __intel_fini_wedge(struct intel_wedge_me *w)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index e68a99205599..9221d88118e2 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -133,12 +133,12 @@ static void rps_timer(struct timer_list *t)
 		    rps->cur_freq < rps->max_freq_softlimit) {
 			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
 			rps->pm_interval = 1;
-			schedule_work(&rps->work);
+			queue_work(i915_wq, &rps->work);
 		} else if (100 * busy < rps->power.down_threshold * dt &&
 			   rps->cur_freq > rps->min_freq_softlimit) {
 			rps->pm_iir |= GEN6_PM_RP_DOWN_THRESHOLD;
 			rps->pm_interval = 1;
-			schedule_work(&rps->work);
+			queue_work(i915_wq, &rps->work);
 		} else {
 			rps->last_adj = 0;
 		}
@@ -973,7 +973,7 @@ static int rps_set_boost_freq(struct intel_rps *rps, u32 val)
 	}
 	mutex_unlock(&rps->lock);
 	if (boost)
-		schedule_work(&rps->work);
+		queue_work(i915_wq, &rps->work);
 
 	return 0;
 }
@@ -1025,7 +1025,7 @@ void intel_rps_boost(struct i915_request *rq)
 			if (!atomic_fetch_inc(&slpc->num_waiters)) {
 				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
 					 rq->fence.context, rq->fence.seqno);
-				schedule_work(&slpc->boost_work);
+				queue_work(i915_wq, &slpc->boost_work);
 			}
 
 			return;
@@ -1041,7 +1041,7 @@ void intel_rps_boost(struct i915_request *rq)
 			 rq->fence.context, rq->fence.seqno);
 
 		if (READ_ONCE(rps->cur_freq) < rps->boost_freq)
-			schedule_work(&rps->work);
+			queue_work(i915_wq, &rps->work);
 
 		WRITE_ONCE(rps->boosts, rps->boosts + 1); /* debug only */
 	}
@@ -1900,7 +1900,7 @@ void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
 	gen6_gt_pm_mask_irq(gt, events);
 
 	rps->pm_iir |= events;
-	schedule_work(&rps->work);
+	queue_work(i915_wq, &rps->work);
 }
 
 void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
@@ -1917,7 +1917,7 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
 		gen6_gt_pm_mask_irq(gt, events);
 		rps->pm_iir |= events;
 
-		schedule_work(&rps->work);
+		queue_work(i915_wq, &rps->work);
 		spin_unlock(gt->irq_lock);
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 542ce6d2de19..6938b5661f72 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -27,7 +27,7 @@ static void perf_begin(struct intel_gt *gt)
 
 	/* Boost gpufreq to max [waitboost] and keep it fixed */
 	atomic_inc(&gt->rps.num_waiters);
-	schedule_work(&gt->rps.work);
+	queue_work(i915_wq, &gt->rps.work);
 	flush_work(&gt->rps.work);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 14c5338c96a6..18bafa694c35 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -931,4 +931,5 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_LMEMBAR_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
 				       GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
 
+extern struct workqueue_struct *i915_wq;
 #endif
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 65acd7bf75d0..f70963540703 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -19,6 +19,8 @@
 #include "i915_vma.h"
 #include "i915_vma_resource.h"
 
+struct workqueue_struct *i915_wq;
+
 static int i915_check_nomodeset(void)
 {
 	bool use_kms = true;
@@ -79,6 +81,9 @@ static int __init i915_init(void)
 {
 	int err, i;
 
+	i915_wq = alloc_workqueue("i915-global", 0, 0);
+	if (!i915_wq)
+		return -ENOMEM;
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = init_funcs[i].init();
 		if (err < 0) {
@@ -86,6 +91,7 @@ static int __init i915_init(void)
 				if (init_funcs[i].exit)
 					init_funcs[i].exit();
 			}
+			destroy_workqueue(i915_wq);
 			return err;
 		} else if (err > 0) {
 			/*
@@ -113,6 +119,7 @@ static void __exit i915_exit(void)
 		if (init_funcs[i].exit)
 			init_funcs[i].exit();
 	}
+	destroy_workqueue(i915_wq);
 }
 
 module_init(i915_init);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 630a732aaecc..c4fc7b6f740c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -290,7 +290,7 @@ static enum hrtimer_restart __rq_watchdog_expired(struct hrtimer *hrtimer)
 
 	if (!i915_request_completed(rq)) {
 		if (llist_add(&rq->watchdog.link, &gt->watchdog.list))
-			schedule_work(&gt->watchdog.work);
+			queue_work(i915_wq, &gt->watchdog.work);
 	} else {
 		i915_request_put(rq);
 	}
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index dfd87d082218..46bce57c2feb 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -9,6 +9,8 @@
 #include "intel_runtime_pm.h"
 #include "intel_wakeref.h"
 
+extern struct workqueue_struct *i915_wq;
+
 static void rpm_get(struct intel_wakeref *wf)
 {
 	wf->wakeref = intel_runtime_pm_get(wf->rpm);
@@ -74,7 +76,7 @@ void __intel_wakeref_put_last(struct intel_wakeref *wf, unsigned long flags)
 
 	/* Assume we are not in process context and so cannot sleep. */
 	if (flags & INTEL_WAKEREF_PUT_ASYNC || !mutex_trylock(&wf->mutex)) {
-		mod_delayed_work(system_wq, &wf->work,
+		mod_delayed_work(i915_wq, &wf->work,
 				 FIELD_GET(INTEL_WAKEREF_PUT_DELAY, flags));
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index daa985e5a19b..0d3396751ac5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -28,6 +28,8 @@
 
 #include "../i915_selftest.h"
 
+extern struct workqueue_struct *i915_wq;
+
 static int
 fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
@@ -540,7 +542,7 @@ static int test_ipc(void *arg)
 
 	ipc.value = 0;
 	INIT_WORK_ONSTACK(&ipc.work, task_ipc);
-	schedule_work(&ipc.work);
+	queue_work(i915_wq, &ipc.work);
 
 	wait_for_completion(&ipc.started);
 
-- 
2.18.4

