Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB13F24B3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 04:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E506E9EF;
	Fri, 20 Aug 2021 02:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 971D46E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 02:19:33 +0000 (UTC)
Received: from BC-Mail-Ex22.internal.baidu.com (unknown [172.31.51.16])
 by Forcepoint Email with ESMTPS id 0EDD4FE32EB288AF2D9A;
 Fri, 20 Aug 2021 10:19:29 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex22.internal.baidu.com (172.31.51.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 20 Aug 2021 10:19:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 20 Aug 2021 10:19:28 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <yuq825@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <lima@lists.freedesktop.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] drm/lima: Remove unused lima_vm_print()
Date: Fri, 20 Aug 2021 10:19:11 +0800
Message-ID: <20210820021911.95-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex22.internal.baidu.com (172.31.51.16) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

lima_vm_print() isn't used, so remove it

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/lima/lima_vm.c | 29 -----------------------------
 drivers/gpu/drm/lima/lima_vm.h |  1 -
 2 files changed, 30 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 2b2739adc7f5..b3426c5c987f 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -251,35 +251,6 @@ void lima_vm_release(struct kref *kref)
 	kfree(vm);
 }
 
-void lima_vm_print(struct lima_vm *vm)
-{
-	int i, j, k;
-	u32 *pd, *pt;
-
-	if (!vm->pd.cpu)
-		return;
-
-	pd = vm->pd.cpu;
-	for (i = 0; i < LIMA_VM_NUM_BT; i++) {
-		if (!vm->bts[i].cpu)
-			continue;
-
-		pt = vm->bts[i].cpu;
-		for (j = 0; j < LIMA_VM_NUM_PT_PER_BT; j++) {
-			int idx = (i << LIMA_VM_NUM_PT_PER_BT_SHIFT) + j;
-
-			printk(KERN_INFO "lima vm pd %03x:%08x\n", idx, pd[idx]);
-
-			for (k = 0; k < LIMA_PAGE_ENT_NUM; k++) {
-				u32 pte = *pt++;
-
-				if (pte)
-					printk(KERN_INFO "  pt %03x:%08x\n", k, pte);
-			}
-		}
-	}
-}
-
 int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
 {
 	struct lima_bo_va *bo_va;
diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_vm.h
index 3a7c74822d8b..291ec9a0a1c4 100644
--- a/drivers/gpu/drm/lima/lima_vm.h
+++ b/drivers/gpu/drm/lima/lima_vm.h
@@ -58,7 +58,6 @@ static inline void lima_vm_put(struct lima_vm *vm)
 		kref_put(&vm->refcount, lima_vm_release);
 }
 
-void lima_vm_print(struct lima_vm *vm);
 int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff);
 
 #endif
-- 
2.25.1

