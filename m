Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64266AFE112
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB30C10E749;
	Wed,  9 Jul 2025 07:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6AF10E74E;
 Wed,  9 Jul 2025 07:16:33 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 5697GLOp591898; Wed, 9 Jul 2025 12:46:21 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5697GJ7q591885;
 Wed, 9 Jul 2025 12:46:19 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, Sunil Khatri <sunil.khatri@amd.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/amdgpu: fix the logic to validate fpriv and root bo
Date: Wed,  9 Jul 2025 12:46:18 +0530
Message-Id: <20250709071618.591866-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the smatch warning,
smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:2146 amdgpu_pt_info_read()
error: we previously assumed 'fpriv' could be null (see line 2146)

"if (!fpriv && !fpriv->vm.root.bo)", It has to be an OR condition
rather than an AND which makes an NULL dereference in case fpriv is NULL.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507090525.9rDWGhz3-lkp@intel.com/
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index e49890a23ef6..63cd790b1d7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -2143,7 +2143,7 @@ static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
 		return -EINVAL;
 
 	fpriv = file->driver_priv;
-	if (!fpriv && !fpriv->vm.root.bo)
+	if (!fpriv || !fpriv->vm.root.bo)
 		return -ENODEV;
 
 	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
-- 
2.34.1

