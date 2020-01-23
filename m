Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE5014634B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E46F6FB2B;
	Thu, 23 Jan 2020 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6D6F978
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 03:33:40 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EC2F540BAF322F4BD86D;
 Thu, 23 Jan 2020 11:33:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:26 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder.c
Date: Thu, 23 Jan 2020 11:40:43 +0800
Message-ID: <1579750843-5315-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
References: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:464:56-57: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:571:15-16: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:571:32-33: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:571:49-50: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1968:17-18: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1981:17-18: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2012:51-52: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f8ac3bf..26d3b8f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -461,7 +461,7 @@ void dpu_encoder_helper_split_config(
 	struct msm_display_info *disp_info;

 	if (!phys_enc->hw_mdptop || !phys_enc->parent) {
-		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
+		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != NULL);
 		return;
 	}

@@ -568,7 +568,7 @@ static int dpu_encoder_virt_atomic_check(

 	if (!drm_enc || !crtc_state || !conn_state) {
 		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
-				drm_enc != 0, crtc_state != 0, conn_state != 0);
+				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
 		return -EINVAL;
 	}

@@ -1965,7 +1965,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		if (IS_ERR_OR_NULL(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == 0 ? -EINVAL : PTR_ERR(enc);
+			return enc == NULL ? -EINVAL : PTR_ERR(enc);
 		}

 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -1978,7 +1978,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		if (IS_ERR_OR_NULL(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == 0 ? -EINVAL : PTR_ERR(enc);
+			return enc == NULL ? -EINVAL : PTR_ERR(enc);
 		}

 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2009,7 +2009,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	struct dpu_enc_phys_init_params phys_params;

 	if (!dpu_enc) {
-		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != 0);
+		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
 		return -EINVAL;
 	}

--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
