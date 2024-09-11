Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F905974FA5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 12:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5C210E6EC;
	Wed, 11 Sep 2024 10:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="PZdHpO+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A812A10E6B3;
 Wed, 11 Sep 2024 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726050156;
 bh=BNMnRq4GXWvsIRMqKFBcaB1DKuUTxPlItfEJou4R5AE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=PZdHpO+TsNjHvnucx19/k4ZeaWGDV6APasijqumG4fkE8KII8YBvcA6EFMXTAgLL9
 6b5ssgifGXzxSoUsODmh+rYYuBYI5UYFS3s7MIFJHCLRftgi3X5EZC7MJELuEhMbTO
 5BMcsG6Gt3+Bvnv9GxtFoLYaSVBZnM9KkqwOxB2g=
X-QQ-mid: bizesmtp90t1726050153t2b1q14a
X-QQ-Originating-IP: VQv+AvPXRscgcXeidknstRmnuVHn0V39M5rPc3K8aME=
Received: from localhost.localdomain ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 11 Sep 2024 18:22:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4307851388913648844
From: He Lugang <helugang@uniontech.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 He Lugang <helugang@uniontech.com>
Subject: [PATCH v2] drm/xe: use devm_add_action_or_reset() helper
Date: Wed, 11 Sep 2024 18:22:15 +0800
Message-ID: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: He Lugang <helugang@uniontech.com>
---
v2:move devm_add_action_or_reset after sysfs_create_files to avoid removing
the sysfs files that hadn't been created.
---
 drivers/gpu/drm/xe/xe_gt_freq.c  | 4 ++--
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 68a5778b4319..ab76973f3e1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -237,11 +237,11 @@ int xe_gt_freq_init(struct xe_gt *gt)
 	if (!gt->freq)
 		return -ENOMEM;
 
-	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
+	err = sysfs_create_files(gt->freq, freq_attrs);
 	if (err)
 		return err;
 
-	err = sysfs_create_files(gt->freq, freq_attrs);
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

