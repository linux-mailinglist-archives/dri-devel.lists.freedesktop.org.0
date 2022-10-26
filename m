Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB460D907
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 04:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A4E10E23E;
	Wed, 26 Oct 2022 02:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A110E23E;
 Wed, 26 Oct 2022 02:01:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VT500yh_1666749656; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VT500yh_1666749656) by smtp.aliyun-inc.com;
 Wed, 26 Oct 2022 10:00:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com
Subject: [PATCH -next] drm/amdkfd: Fix NULL pointer dereference in
 svm_migrate_to_ram()
Date: Wed, 26 Oct 2022 10:00:54 +0800
Message-Id: <20221026020054.57114-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:985:58-62: ERROR: p is NULL but dereferenced.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2549
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

change in v2:
According to Felix's suggestion, move the pr_debug up before the kfd_unref_process 
call. 

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 20d6b2578927..b9c8d29d95aa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -978,12 +978,10 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 out_unlock_svms:
 	mutex_unlock(&p->svms.lock);
 out_unref_process:
+	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
 	kfd_unref_process(p);
 out_mmput:
 	mmput(mm);
-
-	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
-
 	return r ? VM_FAULT_SIGBUS : 0;
 }
 
-- 
2.20.1.7.g153144c

