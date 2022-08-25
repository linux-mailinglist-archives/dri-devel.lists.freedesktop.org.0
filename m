Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F05A0757
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 04:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A4BA8EE;
	Thu, 25 Aug 2022 02:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21B27BA8EE;
 Thu, 25 Aug 2022 02:39:53 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id A94B21E80CC4;
 Thu, 25 Aug 2022 10:35:49 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmdQY3dN_yaw; Thu, 25 Aug 2022 10:35:47 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: yuzhe@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 75BA01E80C99;
 Thu, 25 Aug 2022 10:35:46 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: use time_after(a,b) to replace "a>b"
Date: Thu, 25 Aug 2022 10:38:48 +0800
Message-Id: <20220825023848.32307-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
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
Cc: liqiong@nfschina.com, Yu Zhe <yuzhe@nfschina.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

time_after() deals with timer wrapping correctly.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index e765abcb3b01..04c693ca419a 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1899,7 +1899,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 		 * to false since we want to wait for vbl to avoid flicker.
 		 */
 		if (rdev->pm.dynpm_planned_action != DYNPM_ACTION_NONE &&
-		    jiffies > rdev->pm.dynpm_action_timeout) {
+		    time_after(jiffies, rdev->pm.dynpm_action_timeout)) {
 			radeon_pm_get_dynpm_state(rdev);
 			radeon_pm_set_clocks(rdev);
 		}
-- 
2.11.0

