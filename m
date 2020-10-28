Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C229E5FD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7126E897;
	Thu, 29 Oct 2020 08:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72596ECA2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:13:13 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLnXR2n4YzLp4M;
 Wed, 28 Oct 2020 20:13:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 28 Oct 2020
 20:13:05 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/nouveau/nvkm: discard unnecessary breaks
Date: Wed, 28 Oct 2020 20:23:49 +0800
Message-ID: <20201028122349.46412-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: bskeggs@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'break' is not necessary and reachable
because of previous 'return', and we could
discard it for better view.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
index 350f10a3de37..2ec84b8a3b3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
@@ -123,7 +123,6 @@ pll_map(struct nvkm_bios *bios)
 	case NV_20:
 	case NV_30:
 		return nv04_pll_mapping;
-		break;
 	case NV_40:
 		return nv40_pll_mapping;
 	case NV_50:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
index efa50274df97..295ee352b5c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
@@ -147,10 +147,8 @@ mcp77_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
 		switch (mast & 0x00400000) {
 		case 0x00400000:
 			return nvkm_clk_read(&clk->base, nv_clk_src_core) >> P;
-			break;
 		default:
 			return 500000 >> P;
-			break;
 		}
 		break;
 	default:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
