Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2FD78FEB8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916210E7DF;
	Fri,  1 Sep 2023 14:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD810E7DF;
 Fri,  1 Sep 2023 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693577030; x=1725113030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXfCtoMrzbDTA4n+1nOcRqiErSkQmB5TanHacVFv9Go=;
 b=WVF44kXrF/33Oxoy+bTq+e6Wz5Mv0urUPaVPepN2OQRtxgu26EHzRNOX
 FgBo8qtg1mpmOGAvWbD0svIWg89Uunp7xeiJfYAVlX3rg+XSGw33mWjrI
 jwFgasRCS8imLRf2bk0dhyU4wZ6uiHVWCN8XMFOF6zjZN4vclAH/uM37P
 AHUtJ629JZz4osGl7svsjozei/5dCGiqG4AlowdbsWV+wKvh/uY87W4O+
 x8gJgt0CjPB0H8cJdGS0xgQPwBqTu0yYWmdnUg8Op9iLFKTrVEtCsBTtA
 wD2ompa4PRuow/DnwFkkW5H9B8c5TKQjUr0/uxDey1JFURdchWaZAAyEC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375126750"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="375126750"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854714924"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="854714924"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:03:47 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm: Schedule the HPD poll work on the system unbound
 workqueue
Date: Fri,  1 Sep 2023 17:04:03 +0300
Message-Id: <20230901140403.2821777-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230901140403.2821777-1-imre.deak@intel.com>
References: <20230901140403.2821777-1-imre.deak@intel.com>
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
Cc: Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some i915 platforms at least the HPD poll work involves I2C
bit-banging using udelay()s to probe for monitor EDIDs. This in turn
may trigger the

 workqueue: output_poll_execute [drm_kms_helper] hogged CPU for >10000us 4 times, consider switching to WQ_UNBOUND

warning. Fix this by scheduling drm_mode_config::output_poll_work on a
WQ_UNBOUND workqueue.

Cc: Tejun Heo <tj@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
CC: stable@vger.kernel.org # 6.5
Cc: dri-devel@lists.freedesktop.org
Suggested-by: Tejun Heo <tj@kernel.org>
Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9245
Link: https://lore.kernel.org/all/f7e21caa-e98d-e5b5-932a-fe12d27fde9b@gmail.com
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 3f479483d7d80..72eac0cd25e74 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -279,7 +279,8 @@ static void reschedule_output_poll_work(struct drm_device *dev)
 		 */
 		delay = HZ;
 
-	schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
+	queue_delayed_work(system_unbound_wq,
+			   &dev->mode_config.output_poll_work, delay);
 }
 
 /**
@@ -614,7 +615,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		 */
 		dev->mode_config.delayed_event = true;
 		if (dev->mode_config.poll_enabled)
-			mod_delayed_work(system_wq,
+			mod_delayed_work(system_unbound_wq,
 					 &dev->mode_config.output_poll_work,
 					 0);
 	}
@@ -838,7 +839,8 @@ static void output_poll_execute(struct work_struct *work)
 		drm_kms_helper_hotplug_event(dev);
 
 	if (repoll)
-		schedule_delayed_work(delayed_work, DRM_OUTPUT_POLL_PERIOD);
+		queue_delayed_work(system_unbound_wq,
+				   delayed_work, DRM_OUTPUT_POLL_PERIOD);
 }
 
 /**
-- 
2.37.2

