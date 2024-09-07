Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4F497007F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 08:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5CE10E729;
	Sat,  7 Sep 2024 06:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="XrUwsnXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 69899 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 06:55:33 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFF10E729
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725692093;
 bh=yfvC59lnVqCax5p/e7Q8hKA5Ouv+EjV+B2EInFi8R5A=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=XrUwsnXGJPi/VdPKKGiEaiJ0yoJ/sP0fZgk3AtiMqcsQumQjeiYXK68avYaivYlYe
 RjolHArHHmNO+yQjid/c/xc778TMXCyaQ3K3JCrzG6stNm7TvUykbdZ2gndo5zxYXa
 sFAg+ulTDgQGfjZOatoDLqsNGrtW/YG/rkivWxYo=
X-QQ-mid: bizesmtpsz9t1725692090tbhj9u3
X-QQ-Originating-IP: 0YhjS5yZ+OmtEIBzYtwSZmyZaKAh8IOW6App3/aY05c=
Received: from localhost.localdomain ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 07 Sep 2024 14:54:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17723308322550964968
From: He Lugang <helugang@uniontech.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 He Lugang <helugang@uniontech.com>
Subject: [PATCH 1/3] drm/xe: use devm_add_action_or_reset() helper
Date: Sat,  7 Sep 2024 14:54:39 +0800
Message-ID: <BE0644D06348D90D+20240907065439.1661032-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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

Use devm_add_action_or_reset() to release resources in case of failure,
because the cleanup function will be automatically called.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c  | 2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 68a5778b4319..71bcd60d0866 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
 	if (!gt->freq)
 		return -ENOMEM;
 
-	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
+	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index a05c3699e8b9..ec2b8246204b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
-	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
+	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
 }
-- 
2.45.2

