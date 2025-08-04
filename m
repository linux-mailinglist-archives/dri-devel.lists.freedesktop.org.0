Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D63B1AA0B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 22:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063E10E096;
	Mon,  4 Aug 2025 20:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=nicusor.huhulea@siemens.com header.b="MNCmyQqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 604 seconds by postgrey-1.36 at gabe;
 Mon, 04 Aug 2025 20:24:25 UTC
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6610E234
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 20:24:24 +0000 (UTC)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 202508042014190a512bfb6972371a4d
 for <dri-devel@lists.freedesktop.org>;
 Mon, 04 Aug 2025 22:14:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=nicusor.huhulea@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Eg0FnZksed8sRDakoNZ/imDBspZ54K5LuiASPUMrNYs=;
 b=MNCmyQqF8OxupdUaYm0BKKhTuulV7v/FSQAmb1H7l5SqUfCAyXGXUnGEw7MiAUtL4atBI1
 HMrzL2pzbdd2EYYtIjB6/Y5AxsjENgaMmnNKLckcepcrVeoG6kHSy6JaRw/y7Rg/fd8S3tlm
 kmgAyQ8+wmcmHpvUe3XoDIV7qnU08CC2TA5sXEcee09WaohfEZeJGIGsO8oDxV5NB2zNVJdv
 4s0ZV950xZki7KMSV8uFSr/wfIughT2UiAYd0wETHiUCobkxDR80xLWbRyigfMcQzElZt1bl
 L1s5hM0X5I9qQvYbTOTu4icKD+0XjrFB7ahoCjQLMSYCaUKw89uQyx5w==;
From: Nicusor Huhulea <nicusor.huhulea@siemens.com>
To: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 cip-dev@lists.cip-project.org, shradhagupta@linux.microsoft.com,
 imre.deak@intel.com, jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 laurentiu.palcu@oss.nxp.com, cedric.hombourger@siemens.com,
 shrikant.bobade@siemens.com, Nicusor Huhulea <nicusor.huhulea@siemens.com>
Subject: [PATCH] drm/probe-helper: fix output polling not resuming after HPD
 IRQ storm
Date: Mon,  4 Aug 2025 23:13:59 +0300
Message-Id: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331196:519-21489:flowmailer
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

A regression in output polling was introduced by commit 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
("drm: Check output polling initialized before disabling") in the 6.1.y stable tree.
As a result, when the i915 driver detects an HPD IRQ storm and attempts to switch
from IRQ-based hotplug detection to polling, output polling fails to resume.

The root cause is the use of dev->mode_config.poll_running. Once poll_running is set
(during the first connector detection) the calls to drm_kms_helper_poll_enable(), such as
intel_hpd_irq_storm_switch_to_polling() fails to schedule output_poll_work as expected.
Therefore, after an IRQ storm disables HPD IRQs, polling does not start, breaking hotplug detection.

The fix is to remove the dev->mode_config.poll_running in the check condition, ensuring polling
is always scheduled as requested.

Notes:
 Initial analysis, assumptions, device testing details, the correct fix and detailed rationale
 were discussed here https://lore.kernel.org/stable/aI32HUzrT95nS_H9@ideak-desk/

Cc: stable@vger.kernel.org # 6.1.y
Cc: Imre Deak <imre.deak@intel.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>
Suggested-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 0e5eadc6d44d..a515b78f839e 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
 	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
 
 	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
-	    !drm_kms_helper_poll || dev->mode_config.poll_running)
+	    !drm_kms_helper_poll)
 		return;
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
-- 
2.39.2

