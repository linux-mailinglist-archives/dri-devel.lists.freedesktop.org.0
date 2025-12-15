Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72CCBF216
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801B10E1B4;
	Mon, 15 Dec 2025 17:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1910 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 17:08:25 UTC
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch
 [84.16.66.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1CD10E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:08:25 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dVRN82ltkzPZS;
 Mon, 15 Dec 2025 18:08:24 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dVRN61zzfzF7B; Mon, 15 Dec 2025 18:08:22 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 15 Dec 2025 18:07:56 +0100
Subject: [PATCH] accel/rocket: factor out code with find_core_for_dev in
 rocket_remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-rocket-reuse-find-core-v1-1-be86a1d2734c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDtgQkXxKsWFTn51EJIysVIQ7
 25w+S3eOynDFJn66iTDoVlTLHCvimQd4wLWUEy+9o3zrmFLsmFnwy+DZ42BJRm4g0wtgn/LOFG
 Jv4ZZ/8/4M1zXDRIOJDFoAAAA
X-Change-ID: 20251215-rocket-reuse-find-core-8ecb7ed24cab
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
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

From: Quentin Schulz <quentin.schulz@cherry.de>

There already is a function to return the offset of the core for a given
struct device, so let's reuse that function instead of reimplementing
the same logic.

There's one change in behavior when a struct device is passed which
doesn't match any core's. Before, we would continue through
rocket_remove() but now we exit early, to match what other callers of
find_core_for_dev() (rocket_device_runtime_resume/suspend()) are doing.
This however should never happen. Aside from that, no intended change in
behavior.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/accel/rocket/rocket_drv.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 5c0b63f0a8f00..28bf6c602f802 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -180,17 +180,18 @@ static int rocket_probe(struct platform_device *pdev)
 	return rocket_core_init(&rdev->cores[core]);
 }
 
+static int find_core_for_dev(struct device *dev);
+
 static void rocket_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int core = find_core_for_dev(dev);
 
-	for (unsigned int core = 0; core < rdev->num_cores; core++) {
-		if (rdev->cores[core].dev == dev) {
-			rocket_core_fini(&rdev->cores[core]);
-			rdev->num_cores--;
-			break;
-		}
-	}
+	if (core < 0)
+		return;
+
+	rocket_core_fini(&rdev->cores[core]);
+	rdev->num_cores--;
 
 	if (rdev->num_cores == 0) {
 		/* Last core removed, deinitialize DRM device. */

---
base-commit: a619746d25c8adafe294777cc98c47a09759b3ed
change-id: 20251215-rocket-reuse-find-core-8ecb7ed24cab

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

