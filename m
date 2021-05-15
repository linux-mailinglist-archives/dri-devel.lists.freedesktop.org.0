Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36538191B
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3886E402;
	Sat, 15 May 2021 13:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20EA6E1B2;
 Sat, 15 May 2021 08:54:31 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhzdM0kPvzmg0h;
 Sat, 15 May 2021 16:51:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Sat, 15 May 2021
 16:54:19 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>, <jajones@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/nouveau:disp: Remove set but not used variable 'ret'
Date: Sat, 15 May 2021 17:01:55 +0800
Message-ID: <20210515090155.186083-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 15 May 2021 13:35:18 +0000
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
Cc: yuehaibing@huawei.com, libaokun1@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com, yangjihong1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "libaokun1@huawei.com" <libaokun1@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_mstm_cleanup':
drivers/gpu/drm/nouveau/dispnv50/disp.c:1389:6: warning:
 variable ‘ret’ set but not used [-Wunused-but-set-variable]

drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_mstm_prepare':
drivers/gpu/drm/nouveau/dispnv50/disp.c:1413:6: warning:
 variable ‘ret’ set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1c9c0cdf85db..5ee3f1fc76d7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1386,12 +1386,10 @@ nv50_mstm_cleanup(struct nv50_mstm *mstm)
 {
 	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
 	struct drm_encoder *encoder;
-	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
-	ret = drm_dp_check_act_status(&mstm->mgr);
-
-	ret = drm_dp_update_payload_part2(&mstm->mgr);
+	drm_dp_check_act_status(&mstm->mgr);
+	drm_dp_update_payload_part2(&mstm->mgr);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
@@ -1410,10 +1408,9 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
 {
 	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
 	struct drm_encoder *encoder;
-	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
-	ret = drm_dp_update_payload_part1(&mstm->mgr);
+	drm_dp_update_payload_part1(&mstm->mgr);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
-- 
2.25.4

