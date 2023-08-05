Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B627770F4A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 12:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE310E17E;
	Sat,  5 Aug 2023 10:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1157 seconds by postgrey-1.36 at gabe;
 Sat, 05 Aug 2023 10:36:18 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2F10E17E;
 Sat,  5 Aug 2023 10:36:18 +0000 (UTC)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHz1k3TnhzGpwP;
 Sat,  5 Aug 2023 18:13:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 5 Aug
 2023 18:16:57 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <bskeggs@redhat.com>, <kherbst@redhat.com>, <lyude@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jani.nikula@intel.com>,
 <Wayne.Lin@amd.com>, <ruanjinjie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH -next] drm/nouveau/disp: fix incompatible types in subtraction
Date: Sat, 5 Aug 2023 18:16:31 +0800
Message-ID: <20230805101631.2342148-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
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
Cc: chenjiahao16@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes the following sparse error:

drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: error: subtraction of different types can't work (different address spaces)
drivers/gpu/drm/nouveau/dispnv50/disp.c:197:31: error: subtraction of different types can't work (different address spaces)

In struct nvif_push, "cur" is of type u32 *, whereas
dmac->_push.mem.object.map.ptr is of type void __iomem *.
Converting push->cur to u32 __iomem * to fix above sparse
error.

Fixes: 9cf06d6ef7fd ("drm/nouveau/disp: fix cast removes address space of expression warnings")
Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e7c9c353c51..3e95d82ce900 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -131,7 +131,7 @@ nv50_dmac_kick(struct nvif_push *push)
 {
 	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = (u32 __iomem *)push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
 	if (dmac->put != dmac->cur) {
 		/* Push buffer fetches are not coherent with BAR1, we need to ensure
 		 * writes have been flushed right through to VRAM before writing PUT.
@@ -194,7 +194,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 	if (WARN_ON(size > dmac->max))
 		return -EINVAL;
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = (u32 __iomem *)push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
 	if (dmac->cur + size >= dmac->max) {
 		int ret = nv50_dmac_wind(dmac);
 		if (ret)
-- 
2.34.1

