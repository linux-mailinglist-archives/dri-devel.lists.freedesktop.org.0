Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E2B16874
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303B10E6EF;
	Wed, 30 Jul 2025 21:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=nicusor.huhulea@siemens.com header.b="BrLHKARN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jul 2025 16:23:19 UTC
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450D310E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:23:19 +0000 (UTC)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 2025073016131627faef9ad353453df9
 for <dri-devel@lists.freedesktop.org>;
 Wed, 30 Jul 2025 18:13:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=nicusor.huhulea@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=csY52TarazJEPmk/SsPbeY44Azar0/QHTLRBPgxrjAg=;
 b=BrLHKARNA7uCaaVovxHR0YJA5NPtQp7HKAibs+IDvmWS2ZIXtLI42TFUpUsd/bypG3HQDQ
 qUcWtrXvfRBuDiuGhU4DFOjcF7ybJMS3P6E9asn7/rSbnETIE7XxF+7u3fOBivBP98xFJSiX
 INB09FsvXCcsVzyHRVtGFyE66Av8NZMrZtnluyWNBY0YqHzHLTVKRkoGh24vhpitv80/FHoZ
 2hC3ocsw1sEyX+fAJomaGRfa2XhxlDXY/S6z4HbZVk7kUFJT+a4ORywIp1Ez27ZTjmxu0Cwh
 Y9ky+VL6c7i5D9vTuZGyQGizTohR7BFk9j0EDBSsISPVCVSC6e6ULGlA==;
From: Nicusor Huhulea <nicusor.huhulea@siemens.com>
To: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: cip-dev@lists.cip-project.org, imre.deak@intel.com,
 jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 cedric.hombourger@siemens.com, shrikant.bobade@siemens.com,
 Nicusor Huhulea <nicusor.huhulea@siemens.com>
Subject: [PATCH 5/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Date: Wed, 30 Jul 2025 19:11:06 +0300
Message-Id: <20250730161106.80725-6-nicusor.huhulea@siemens.com>
In-Reply-To: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331196:519-21489:flowmailer
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This collects and adapts several upstream fixes to make i915 and related
DRM subsystem build and function.
The upstream fix HPD polling("drm/i915: Fix HPD polling, reenabling the output poll work as needed")
and its dependencies could not be directly backported due to extensive code differences.

Upstream commits:
drm/i915: Fix HPD polling, reenabling the output poll work as needed(commit 50452f2f76852322620b63e62922b85e955abe9)
drm: Add an HPD poll helper to reschedule the poll work(commit fe2352fd64029918174de4b460dfe6df0c6911cd)
drm/probe_helper: extract two helper functions(commit cbf143b282c64e59559cc8351c0b5b1ab4bbdcbe)
drm/probe-helper: enable and disable HPD on connectors(commit c8268795c9a9cc7be50f78d4502fad83a2a4f8df)
...

Due to significant codebase divergence and numerous dependencies, it was not
possible to cherry-pick these commits cleanly. Instead, this will resolve compile-time
errors and fixes the hot plug mechanism. Developed with uspstream as a guideline,
with the goal of addressing the defect while maintaining the stability.

Auxiliary fixes in upstream commits were not ported here as this would require
substantial work and dependency tracking.

Cc: stable@vger.kernel.org # 6.1.y
Cc: dri-devel@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 938649e3a282..9dc7505f20ff 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -304,8 +304,6 @@ static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
 void drm_kms_helper_poll_enable(struct drm_device *dev)
 {
 
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
 
 	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
 	    !drm_kms_helper_poll || dev->mode_config.poll_running)
@@ -779,8 +777,11 @@ static void output_poll_execute(struct work_struct *work)
 	changed = dev->mode_config.delayed_event;
 	dev->mode_config.delayed_event = false;
 
-	if (!drm_kms_helper_poll)
+	if (!drm_kms_helper_poll && dev->mode_config.poll_running) {
+		drm_kms_helper_disable_hpd(dev);
+		dev->mode_config.poll_running = false;
 		goto out;
+	}
 
 	if (!mutex_trylock(&dev->mode_config.mutex)) {
 		repoll = true;
@@ -897,9 +898,14 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
 	if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
-		return;
+		pr_warn("%s: called with poll_enabled = false\n", __func__);
+
+	if (dev->mode_config.poll_running)
+		drm_kms_helper_disable_hpd(dev);
 
 	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+
+	dev->mode_config.poll_running = false;
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
-- 
2.39.2

