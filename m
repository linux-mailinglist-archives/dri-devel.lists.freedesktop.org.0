Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289215E9434
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FE010E2E8;
	Sun, 25 Sep 2022 16:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DCD10E568;
 Sat, 24 Sep 2022 09:29:06 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZNrM1hNpzHthT;
 Sat, 24 Sep 2022 17:24:19 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 17:29:02 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <bskeggs@redhat.com>, <kherbst@redhat.com>, <lyude@redhat.com>,
 <airlied@linux.ie>, <linux-kernel@vger.kernel.org>, <daniel@ffwll.ch>,
 <jani.nikula@intel.com>, <airlied@redhat.com>, <tzimmermann@suse.de>,
 <hverkuil-cisco@xs4all.nl>, <greenfoo@u92.eu>, <seanpaul@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH -next] drm/nouveau/disp: fix cast removes address space of
 expression warnings
Date: Sat, 24 Sep 2022 17:25:16 +0800
Message-ID: <20220924092516.10007-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When build Linux kernel with 'make C=2', encounter the following warnings:

./drivers/gpu/drm/nouveau/dispnv50/disp.c:134:34: warning: cast removes address space '__iomem' of expression
./drivers/gpu/drm/nouveau/dispnv50/disp.c:197:34: warning: cast removes address space '__iomem' of expression

The data type of dmac->_push.mem.object.map.ptr is 'void __iomem *', but
converted to 'u32 *' directly and cause above warnings, now
recover their data types to fix these warnings.

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 33c97d510999..aa94f8e284dd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -131,7 +131,7 @@ nv50_dmac_kick(struct nvif_push *push)
 {
 	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
 
-	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
 	if (dmac->put != dmac->cur) {
 		/* Push buffer fetches are not coherent with BAR1, we need to ensure
 		 * writes have been flushed right through to VRAM before writing PUT.
@@ -194,7 +194,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 	if (WARN_ON(size > dmac->max))
 		return -EINVAL;
 
-	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
 	if (dmac->cur + size >= dmac->max) {
 		int ret = nv50_dmac_wind(dmac);
 		if (ret)
-- 
2.25.1

