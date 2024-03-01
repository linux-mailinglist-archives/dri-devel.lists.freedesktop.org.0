Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5086E439
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 16:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2C10EE62;
	Fri,  1 Mar 2024 15:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muQUso9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA53210EE6F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306541; x=1740842541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=950kTTkK0FSDaKv8WWlURXS/0SiZuHMMoyqeAPFN6Co=;
 b=muQUso9M4Yt7GNhIF9LgruM4Yb5U0ZtblcMcvN/6Jp5jvk1lYRl9xcWG
 D/zSXQ8pc8hkJ2eYDgOM0iKypdYOB4ZwEk/QWiefJBUTc8kWT3xNBEbxp
 MMRiFSB+KIcjI1DxPkBnYGOSY9uc159t8x3Tz7qIP5sOMaHCyatlRVuZ6
 T1RpkSJKYRnYwVnBWEfxOgtNu1j8GOH0J9WHIZdgr3d1I2wWIbLLdSXqg
 vO6645nef3Vm4C4MBYd0BENh2ZLH+5k2oMRhXZUndhCVoNVXiQndaZG7v
 r5fuHv52hABpBUp2c1t+YaxevLa1voLYHQHmU6Dwddo5TTJkcCJmS7BLo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7661244"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7661244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8282298"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:22:19 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm: Fix output poll work for drm_kms_helper_poll=n
Date: Fri,  1 Mar 2024 17:22:43 +0200
Message-ID: <20240301152243.1670573-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If drm_kms_helper_poll=n the output poll work will only get scheduled
from drm_helper_probe_single_connector_modes() to handle a delayed
hotplug event. Since polling is disabled the work in this case should
just call drm_kms_helper_hotplug_event() w/o detecting the state of
connectors and rescheduling the work.

After commit d33a54e3991d after a delayed hotplug event above the
connectors did get re-detected in the poll work and the work got
re-scheduled periodically (since poll_running is also false if
drm_kms_helper_poll=n), in effect ignoring the drm_kms_helper_poll=n
kernel param.

Fix the above by calling only drm_kms_helper_hotplug_event() for a
delayed hotplug event if drm_kms_helper_hotplug_event=n, as was done
before d33a54e3991d.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: d33a54e3991d ("drm/probe_helper: sort out poll_running vs poll_enabled")
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 19ecb749704be..4d60cc810b577 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -767,9 +767,11 @@ static void output_poll_execute(struct work_struct *work)
 	changed = dev->mode_config.delayed_event;
 	dev->mode_config.delayed_event = false;
 
-	if (!drm_kms_helper_poll && dev->mode_config.poll_running) {
-		drm_kms_helper_disable_hpd(dev);
-		dev->mode_config.poll_running = false;
+	if (!drm_kms_helper_poll) {
+		if (dev->mode_config.poll_running) {
+			drm_kms_helper_disable_hpd(dev);
+			dev->mode_config.poll_running = false;
+		}
 		goto out;
 	}
 
-- 
2.43.3

