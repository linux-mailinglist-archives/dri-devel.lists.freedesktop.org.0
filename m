Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904EF62564D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CE610E7B1;
	Fri, 11 Nov 2022 09:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84A610E7C5;
 Fri, 11 Nov 2022 09:12:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VUWiU45_1668157914; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VUWiU45_1668157914) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 17:11:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Subject: [PATCH 5/5] drm/nouveau/gr/tu102: Remove the unused function
 tu102_gr_load()
Date: Fri, 11 Nov 2022 17:11:30 +0800
Message-Id: <20221111091130.57178-5-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function tu102_gr_load() is defined in the tu102.c file, but
not called elsewhere, so remove this unused function.

drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no
previous prototype for ‘tu102_gr_load’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3020
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a242..a7775aa18541 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
-tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
-{
-	int ret;
-
-	ret = gm200_gr_load(gr, ver, fwif);
-	if (ret)
-		return ret;
-
-	return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102_gr_av_to_init_veid,
-				 &gr->bundle_veid);
-}
-
 static const struct gf100_gr_fwif
 tu102_gr_fwif[] = {
 	{  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpccs_acr },
-- 
2.20.1.7.g153144c

