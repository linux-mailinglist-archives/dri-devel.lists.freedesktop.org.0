Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79101A70854
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B8310E5D4;
	Tue, 25 Mar 2025 17:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rudorff.com (rudorff.com [193.31.26.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50010E573;
 Tue, 25 Mar 2025 12:45:55 +0000 (UTC)
Received: from [127.0.0.1]
 (dynamic-2a02-3102-8418-1620-0000-0000-0000-04cc.310.pool.telefonica.de
 [IPv6:2a02:3102:8418:1620::4cc])
 by rudorff.com (Postfix) with ESMTPSA id DA59C406DA;
 Tue, 25 Mar 2025 13:45:50 +0100 (CET)
From: Christoph Rudorff <chris@rudorff.com>
Date: Tue, 25 Mar 2025 13:44:36 +0100
Subject: [PATCH v2] drm/nouveau: fix hibernate on disabled GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-nouveau-fix-hibernate-v2-1-2bd5c13fb953@rudorff.com>
X-B4-Tracking: v=1; b=H4sIADOl4mcC/4WNTQ6CMBCFr0Jm7ZhSCv6svIdhUWCws7A1U9poC
 He3cgGX38t731shkjBFuFYrCGWOHHwBfahgdNY/CHkqDFrpVjXKoA8pk0048xsdDyTeLoTaXM6
 6m4w+DQOU7UuoFHbvvS/sOC5BPvtNrn/pP2OusUYiY5qmNV0p3iRNQeb5OIYn9Nu2fQFtPSRSv
 AAAAA==
X-Change-ID: 20250304-nouveau-fix-hibernate-249826d427bb
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Christoph Rudorff <chris@rudorff.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Tue, 25 Mar 2025 17:37:54 +0000
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

Hibernate bricks the machine if a discrete GPU was disabled via

echo IGD > /sys/kernel/debug/vgaswitcheroo/switch

The freeze and thaw handler lacks checking the GPU power state,
as suspend and resume do.

This patch add the checks and fix this issue.

Signed-off-by: Christoph Rudorff <chris@rudorff.com>
---
I got an old MacBook having a defective nvidia GPU

So I put this in the initrd scripts to turn it off asap:

mount -t debugfs none /sys/kernel/debug
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch

which powers down the nouveau.

Suspend and resume works,
but hibernate locks up the machine.

The handlers are not checking the GPU state.

This is a good candidate for backport.
This patch applies down to 6.12.y
---
Changes in v2:
- EDITME: use my real name, my nick raised bugs
- Link to v1: https://lore.kernel.org/r/20250304-nouveau-fix-hibernate-v1-1-ee4433546030@rudorff.com
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5664c4c71faf1ced30f38d9874244db80d58194a..0958d1b940c2533bfadc29e098045db6f0170c79 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1079,6 +1079,10 @@ nouveau_pmops_freeze(struct device *dev)
 {
 	struct nouveau_drm *drm = dev_get_drvdata(dev);
 
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_suspend(drm, false);
 }
 
@@ -1087,6 +1091,10 @@ nouveau_pmops_thaw(struct device *dev)
 {
 	struct nouveau_drm *drm = dev_get_drvdata(dev);
 
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_resume(drm, false);
 }
 

---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250304-nouveau-fix-hibernate-249826d427bb

Best regards,
-- 
Christoph Rudorff <chris@rudorff.com>

