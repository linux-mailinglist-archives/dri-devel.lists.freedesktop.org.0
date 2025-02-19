Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32BA3CDC6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CCB10E0A8;
	Wed, 19 Feb 2025 23:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nwCfw+Vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0310E296
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1E+JK
 CDyr0UDbEZ31/NEb2aNDhIFieLLmKQm1VWaC8Q=; b=nwCfw+VxxrTeK8m1zQ89P
 sj++7+64qQ9wuvV/EeDbDvwIyjZtyi+DnSYZyrk7V6yCnxz2RFZwrQRAnJcxQX1q
 fiFret0K67ZrizItIhK6w6JZLcjzvN91FVynSHcSULP67AZKBlESFLL6cArdtsJD
 ZUcpzoVh01L6cCJ5lru8PI=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3D0HtqrVn0BWbNQ--.28485S4; 
 Wed, 19 Feb 2025 17:57:03 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, himal.prasad.ghimiray@intel.com, badal.nilawar@intel.com,
 matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Add check for alloc_ordered_workqueue()
Date: Wed, 19 Feb 2025 17:56:59 +0800
Message-Id: <20250219095659.2613487-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3D0HtqrVn0BWbNQ--.28485S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr18tr4kAr4DArWrtF1rXrb_yoWfGFb_CF
 WxXrn7XFs8CF1vgF1IyrZ3ZFy2yr98uayfW3W5K3sxtry2qrW2v3sFvr98Zr1xXa17WFnr
 Z3W8W3ZIqwnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuBTYDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0hT4bme1p+I8RwAAs8
X-Mailman-Approved-At: Wed, 19 Feb 2025 23:48:37 +0000
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

Add check for the return value of alloc_ordered_workqueue()
in xe_gt_alloc() to catch potential exception.

Fixes: e2d84e5b2205 ("drm/xe: Mark GT work queue with WQ_MEM_RECLAIM")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5d6fb79957b6..0f42bbcb8d42 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -79,6 +79,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
 						 WQ_MEM_RECLAIM);
+	if (!gt->ordered_wq)
+		return ERR_PTR(-ENOMEM);
 
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
-- 
2.25.1

