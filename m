Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B375AEC9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFA10E5C1;
	Thu, 20 Jul 2023 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ACD10E157;
 Thu, 20 Jul 2023 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689857657; x=1721393657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOPBbrKCfdG//flwjSZUUmrcT9LBXhTFjhL9dc3YR2U=;
 b=Q4tfrU87XVFiqi3tp3/AwWI6O/m/FVikwyyu+H2QfsdAWpSENjSyX1wy
 YBW2GDPGyiOGhEO3xUNlSOzur5juwF0BbpbH5U9uJicp8lFPaHbEnu+wh
 Z0x0a2txJwffRQopUcg+aTuLfiS2/ZSNMDeZM7wGuaaDovOp1A/R8AA15
 JBoqNYrDYQYKC9qGKJiez+cBFQkwASiz4cD7juyFj8cvaA5vY2dLIzqgn
 s8ssMXstbXBnRCd5C2ZeyDvBfdhLPPmMfUX9inY9L2jrW13lv2Sjd8Wlx
 zsZ+aFwHqirtP+o8ooxuqDfO8C2A08kOXxhXhrZhKlMC7DzXfv6lKfXoR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351582759"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="351582759"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794477595"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="794477595"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:54:13 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/i915: Fix HPD polling,
 reenabling the output poll work as needed
Date: Thu, 20 Jul 2023 15:54:16 +0300
Message-Id: <20230720125418.236140-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230720125418.236140-1-imre.deak@intel.com>
References: <20230720125418.236140-1-imre.deak@intel.com>
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
index dd7eb9fc78610..d9f0ab1d953b9 100644
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

