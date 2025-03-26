Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E7A71803
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57810E6DD;
	Wed, 26 Mar 2025 14:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rudorff.com (rudorff.com [193.31.26.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D0410E6D8;
 Wed, 26 Mar 2025 14:03:19 +0000 (UTC)
Received: from [127.0.0.1]
 (dynamic-2a02-3102-8418-1620-0000-0000-0000-04cc.310.pool.telefonica.de
 [IPv6:2a02:3102:8418:1620::4cc])
 by rudorff.com (Postfix) with ESMTPSA id 9C887401B2;
 Wed, 26 Mar 2025 15:03:16 +0100 (CET)
From: Christoph Rudorff <chris@rudorff.com>
Date: Wed, 26 Mar 2025 15:02:48 +0100
Subject: [PATCH BACKPORT v3] drm/nouveau: fix hibernate on disabled GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-nouveau-fix-hibernate-v3-1-893271fdcb59@rudorff.com>
X-B4-Tracking: v=1; b=H4sIAAcJ5GcC/4XNvQ7CIBQF4FdpmMWUC1Tr5M/ooDFuxqGUW8tgM
 dASTdN3lzDpYBxPzrnfHYlHZ9CTVTYSh8F4Y7sY+CwjdVt1N6RGx0wgB5nzXNDODgGrgTbmSVu
 j0HVVjxREuYRCC1goReLtw2EcJPdCtpvd/ng4nck1Nq3xvXWv9DCw1P+xA6OMIgrBuRRFHK7do
 K1rmnlt78kM8OGA/OVAdEBpWTPeqFLyb2eapjdI59LMDgEAAA==
X-Change-ID: 20250304-nouveau-fix-hibernate-249826d427bb
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Christoph Rudorff <chris@rudorff.com>
X-Mailer: b4 0.14.2
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

This is a backport and applies to v6.6 and below.

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
This patch applies to v6.6 and below
---
Changes in v3:
- Backport for v6.6 and below
- Link to v2: https://lore.kernel.org/r/20250325-nouveau-fix-hibernate-v2-1-2bd5c13fb953@rudorff.com

Changes in v2:
- EDITME: use my real name, my nick raised bugs
- Link to v1: https://lore.kernel.org/r/20250304-nouveau-fix-hibernate-v1-1-ee4433546030@rudorff.com
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ac15a662e06042e2c133da9c17fcd53000a98650..a05151b557dac6860e07fe7147aa81b7b15e6f4b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1026,6 +1026,11 @@ nouveau_pmops_freeze(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+
+	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm_dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_suspend(drm_dev, false);
 }
 
@@ -1034,6 +1039,11 @@ nouveau_pmops_thaw(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+
+	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm_dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_resume(drm_dev, false);
 }
 

---
base-commit: 4b6a8fa777d29785c7ddb51dcbb2b5411deefaca
change-id: 20250304-nouveau-fix-hibernate-249826d427bb

Best regards,
-- 
Christoph Rudorff <chris@rudorff.com>

