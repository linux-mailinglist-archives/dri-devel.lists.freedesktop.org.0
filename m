Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DFF75837C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32C10E3AE;
	Tue, 18 Jul 2023 17:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1128A10E3A0;
 Tue, 18 Jul 2023 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689701371; x=1721237371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YiexA/YvudH05LqNj7aXEyVr7ay2mFHkNEDtUSS8f1A=;
 b=iGxoT4iy8v///2dpHbCC45jOANdVJN2zXHdpbMTUO7INQ0z5jRUP8Ov1
 sAhtZAgZWYJ6DSox1kg39CLIlb7/94tpcDnByI3xBdV83vhtvdURX+Yzv
 PlxP+HUhuwyVXcvKvm76caOGwYsGW1bw73csnPywqRI7MDBFlWrvdN94r
 f4FJmNi0FC4s6fpH9G7SRmk5+l0YlTi1dg7gOwQqxkyN7qbKBiTPrUOX+
 l6pRlXAhOrnKcXkiA2654TBumxKHOZNozd493cWMk++z8FHqCh7sC1kve
 TJ1X0IPUONJgz++9aDALb34k2nhbtgFL5nGf1IHs21o3F20kIRfr/5y+d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369825407"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="369825407"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 10:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723701943"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="723701943"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 10:29:29 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Fix HPD polling,
 reenabling the output poll work as needed
Date: Tue, 18 Jul 2023 20:29:34 +0300
Message-Id: <20230718172934.69049-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230718172934.69049-1-imre.deak@intel.com>
References: <20230718172934.69049-1-imre.deak@intel.com>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the commit in the Fixes: line below, HPD polling stopped working
on i915, since after that change calling drm_kms_helper_poll_enable()
doesn't restart drm_mode_config::output_poll_work if the work was
stopped (no connectors needing polling) and enabling polling for a
connector (during runtime suspend or detecting an HPD IRQ storm).

After the above change calling drm_kms_helper_poll_enable() is a nop
after it's been called already and polling for some connectors was
disabled/re-enabled.

Fix this by calling drm_kms_helper_poll_reschedule() added in the
previous patch instead, which reschedules the work whenever expected.

Fixes: d33a54e3991d ("drm/probe_helper: sort out poll_running vs poll_enabled")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 3780629bff95c..cc49040445f39 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -212,7 +212,7 @@ intel_hpd_irq_storm_switch_to_polling(struct drm_i915_private *dev_priv)
 
 	/* Enable polling and queue hotplug re-enabling. */
 	if (hpd_disabled) {
-		drm_kms_helper_poll_enable(&dev_priv->drm);
+		drm_kms_helper_poll_reschedule(&dev_priv->drm);
 		mod_delayed_work(dev_priv->unordered_wq,
 				 &dev_priv->display.hotplug.reenable_work,
 				 msecs_to_jiffies(HPD_STORM_REENABLE_DELAY));
@@ -676,7 +676,7 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
 	drm_connector_list_iter_end(&conn_iter);
 
 	if (enabled)
-		drm_kms_helper_poll_enable(&dev_priv->drm);
+		drm_kms_helper_poll_reschedule(&dev_priv->drm);
 
 	mutex_unlock(&dev_priv->drm.mode_config.mutex);
 
-- 
2.37.2

