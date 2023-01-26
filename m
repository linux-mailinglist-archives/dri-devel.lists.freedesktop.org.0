Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC067D1D2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 17:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B2210E946;
	Thu, 26 Jan 2023 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1595410E946
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:38:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4F16B81EB2;
 Thu, 26 Jan 2023 16:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FA0C433D2;
 Thu, 26 Jan 2023 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674751088;
 bh=3vj1R34J3j8Pc5/LOGIfCqLcGuFCvDvGSh8Z3HJ+s4E=;
 h=From:To:Cc:Subject:Date:From;
 b=lBO7N2TDt3W3KT5KyeYvvNup5GJnczyXzWBV9gKnF0oFNaHCsGGXN4Mt6tmrOH8vV
 K7Pu3QO28yMkOWdk8cpn/eWcPLd3eqalthVV8O2mQ6PF0tKkSzdtf7/oqZIoMiEkbl
 JjBSPqAShXQVgjYOQgEpJiSadZqrIYNEFaMg7PJPCZDJ/R3QigCWSGNMObJ+Ih0Q14
 P86DUzKdh88PudL8oS/wQDHo1GlDQMN76kt80EdydIWGJhGOVkZwU9OKp1/NrckA4s
 fds/ziezLUuekw0PHsukGllTIKTr+DUxH1pXhSOA7SKXTofyMyyq1cfKepwJmcVWp+
 qobPbHVCHnYIQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/2] accep/ivpu: PM: remove broken ivpu_dbg() statements
Date: Thu, 26 Jan 2023 17:37:54 +0100
Message-Id: <20230126163804.3648051-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_PM is disabled, the driver fails to build:

drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get':
drivers/accel/ivpu/ivpu_pm.c:240:84: error: 'struct dev_pm_info' has no member named 'usage_count'
  240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
      |                                                                                    ^
include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
  223 |                 func(&id, ##__VA_ARGS__);                       \
      |                             ^~~~~~~~~~~
include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
  249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
  272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
      |         ^~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
  155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~
drivers/accel/ivpu/ivpu_drv.h:65:17: note: in expansion of macro 'dev_dbg'
   65 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
      |                 ^~~~~~~
drivers/accel/ivpu/ivpu_pm.c:240:9: note: in expansion of macro 'ivpu_dbg'
  240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
      |         ^~~~~~~~

It would be possible to rework these statements to only conditionally print
the reference counter, or to make the driver depend on CONFIG_PM, but my
impression is that these are not actually needed at all if the driver generally
works, or they could be put back when required. Just remove all four of these
to make the driver build in all configurations.

Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/ivpu/ivpu_pm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 553bcbd787b3..a880f1dd857e 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -237,8 +237,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
-
 	ret = pm_runtime_resume_and_get(vdev->drm.dev);
 	if (!drm_WARN_ON(&vdev->drm, ret < 0))
 		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
@@ -248,8 +246,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
-	ivpu_dbg(vdev, RPM, "rpm_put count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
-
 	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
@@ -314,16 +310,10 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
 	pm_runtime_allow(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
-
-	ivpu_dbg(vdev, RPM, "Enable RPM count %d\n", atomic_read(&dev->power.usage_count));
 }
 
 void ivpu_pm_disable(struct ivpu_device *vdev)
 {
-	struct device *dev = vdev->drm.dev;
-
-	ivpu_dbg(vdev, RPM, "Disable RPM count %d\n", atomic_read(&dev->power.usage_count));
-
 	pm_runtime_get_noresume(vdev->drm.dev);
 	pm_runtime_forbid(vdev->drm.dev);
 }
-- 
2.39.0

