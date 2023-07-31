Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75E769995
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAA910E1CF;
	Mon, 31 Jul 2023 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1169 seconds by postgrey-1.36 at gabe;
 Mon, 31 Jul 2023 14:34:17 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7295210E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:34:17 +0000 (UTC)
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RF0Xh2Lw8z6J6sJ;
 Mon, 31 Jul 2023 22:11:32 +0800 (CST)
Received: from mscphis00759.huawei.com (10.123.66.134) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 15:14:44 +0100
From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
To: <bskeggs@redhat.com>
Subject: [PATCH] drivers: gpu: drm: nouveau: fix invalid variable name
Date: Mon, 31 Jul 2023 22:14:37 +0800
Message-ID: <20230731141437.3280099-1-konstantin.meskhidze@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.134]
X-ClientProxiedBy: mscpeml500002.china.huawei.com (7.188.26.138) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
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
Cc: kherbst@redhat.com, artem.kuzin@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yusongping@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit fixes logic error in function 'nvkm_dp_train':
	argument of function nvkm_dp_train_link might be rate, not ret

Co-developed-by: Ivanov Mikhail <ivanov.mikhail1@huawei-partners.com>
Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 40c8ea43c..8740978ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -455,7 +455,7 @@ nvkm_dp_train(struct nvkm_outp *outp, u32 dataKBps)
 	if (atomic_read(&outp->dp.lt.done)) {
 		for (rate = 0; rate < outp->dp.rates; rate++) {
 			if (outp->dp.rate[rate].rate == ior->dp.bw * 27000)
-				return nvkm_dp_train_link(outp, ret);
+				return nvkm_dp_train_link(outp, rate);
 		}
 		WARN_ON(1);
 		return -EINVAL;
-- 
2.34.1

