Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4689C36B48E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 16:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134A6E104;
	Mon, 26 Apr 2021 14:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD86E104
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 14:12:53 +0000 (UTC)
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id E448A80C0;
 Mon, 26 Apr 2021 14:12:52 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] drm/omap: Fix issue with clocks left on after resume
Date: Mon, 26 Apr 2021 17:12:41 +0300
Message-Id: <20210426141241.51985-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: linux-omap@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On resume, dispc pm_runtime_force_resume() is not enabling the hardware
as we pass the pm_runtime_need_not_resume() test as the device is suspended
with no child devices.

As the resume continues, omap_atomic_comit_tail() calls dispc_runtime_get()
that calls rpm_resume() enabling the hardware, and increasing child_count
for it's parent device.

But at this point device_complete() has not yet been called for dispc. So
when omap_atomic_comit_tail() calls dispc_runtime_get(), it won't idle
the hardware, and the clocks are left on after resume.

This can be easily seen for example after suspending Beagleboard-X15 with
no displays connected, and by reading the CM_DSS_DSS_CLKCTRL register at
0x4a009120 after resume. After a suspend and resume cycle, it shows a
value of 0x00040102 instead of 0x00070000 like it should.

Let's fix the issue by calling dispc_runtime_suspend() and
dispc_runtime_resume() directly from dispc_suspend() and dispc_resume().
This leaves out the PM runtime related issues for system suspend.

See also earlier commit 88d26136a256 ("PM: Prevent runtime suspend during
system resume") and commit ca8199f13498 ("drm/msm/dpu: ensure device
suspend happens during PM sleep") for more information.

Fixes: ecfdedd7da5d ("drm/omap: force runtime PM suspend on system suspend")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -182,6 +182,7 @@ struct dispc_device {
 	const struct dispc_features *feat;
 
 	bool is_enabled;
+	bool needs_resume;
 
 	struct regmap *syscon_pol;
 	u32 syscon_pol_offset;
@@ -4887,10 +4888,34 @@ static int dispc_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int dispc_suspend(struct device *dev)
+{
+	struct dispc_device *dispc = dev_get_drvdata(dev);
+
+	if (!dispc->is_enabled)
+		return 0;
+
+	dispc->needs_resume = true;
+
+	return dispc_runtime_suspend(dev);
+}
+
+static int dispc_resume(struct device *dev)
+{
+	struct dispc_device *dispc = dev_get_drvdata(dev);
+
+	if (!dispc->needs_resume)
+		return 0;
+
+	dispc->needs_resume = false;
+
+	return dispc_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops dispc_pm_ops = {
 	.runtime_suspend = dispc_runtime_suspend,
 	.runtime_resume = dispc_runtime_resume,
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(dispc_suspend, dispc_resume)
 };
 
 struct platform_driver omap_dispchw_driver = {
-- 
2.31.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
