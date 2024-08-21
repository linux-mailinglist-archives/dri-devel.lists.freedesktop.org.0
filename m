Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3563F959548
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987A610E53C;
	Wed, 21 Aug 2024 07:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1141 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2024 01:33:08 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83C10E549;
 Wed, 21 Aug 2024 01:33:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpSwg1LJzzhXvK;
 Wed, 21 Aug 2024 09:12:03 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 88BFA180101;
 Wed, 21 Aug 2024 09:14:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 21 Aug
 2024 09:14:02 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <konrad.dybcio@linaro.org>,
 <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <lizetao1@huawei.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH -next] drm/msm/adreno: Use kvmemdup to simplify the code
Date: Wed, 21 Aug 2024 09:21:34 +0800
Message-ID: <20240821012134.1947547-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Mailman-Approved-At: Wed, 21 Aug 2024 07:04:47 +0000
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

Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.

No functional change intended.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..ef473ac88159 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -688,11 +688,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmalloc(size << 2, GFP_KERNEL);
-			if (state->ring[i].data) {
-				memcpy(state->ring[i].data, gpu->rb[i]->start, size << 2);
+			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
-			}
 		}
 	}
 
-- 
2.34.1

