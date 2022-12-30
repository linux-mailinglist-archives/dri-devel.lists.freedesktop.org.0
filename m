Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BC6595B5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 08:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6B10E067;
	Fri, 30 Dec 2022 07:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [123.126.96.233])
 by gabe.freedesktop.org (Postfix) with ESMTP id B78BA10E067
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BZVBV
 RQVrTSn4BzI4JujaZV4qktmUeRF9eHZ5CKmHQM=; b=gJadKLaWCNs+R5dJcOlvU
 pXAWaVns4xKQJLjAOu+DCzyNHH7dhJ3pj3HBpKS6uyqCsb9Hz5V5ts2/uazefHoT
 t+TzH+ipfiNnAwWJ/KJaRUX3DCOcCdjr1SyFCyCIczbjTBIXcwvMrD8tlF5jnqtg
 Ercxuwa3ZpPBCNZF8HhgUQ=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by smtp16 (Coremail) with SMTP id MNxpCgCnzzsVk65jw+eMDQ--.25047S2;
 Fri, 30 Dec 2022 15:28:21 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/mmu: fix Use after Free bug in nvkm_vmm_node_split
Date: Fri, 30 Dec 2022 15:27:58 +0800
Message-Id: <20221230072758.443644-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: MNxpCgCnzzsVk65jw+eMDQ--.25047S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GF15Gr48ur17XrW5WryxGrg_yoW8JF4rpF
 45uryYvryxuF4Ut340vFy8ur90kan2yFWIk34YvasIvwnxZ3y0vFW5AryUGryrZw4xWw1a
 qr4DGr1fWry5ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziaZXrUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbCbxTnU2BbEN8pBAAAsW
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
Cc: alex000young@gmail.com, security@kernel.org, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here is a function call chain.
nvkm_vmm_pfn_map->nvkm_vmm_pfn_split_merge->nvkm_vmm_node_split
If nvkm_vma_tail return NULL in nvkm_vmm_node_split, it will
finally invoke nvkm_vmm_node_merge->nvkm_vmm_node_delete, which
will free the vma. However, nvkm_vmm_pfn_map didn't notice that.
It goes into next label and UAF happens.

Fix it by returning the return-value of nvkm_vmm_node_merge
instead of NULL.

Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index ae793f400ba1..84d6fc87b2e8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -937,8 +937,8 @@ nvkm_vmm_node_split(struct nvkm_vmm *vmm,
 	if (vma->size != size) {
 		struct nvkm_vma *tmp;
 		if (!(tmp = nvkm_vma_tail(vma, vma->size - size))) {
-			nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
-			return NULL;
+			tmp = nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
+			return tmp;
 		}
 		tmp->part = true;
 		nvkm_vmm_node_insert(vmm, tmp);
-- 
2.25.1

