Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6F14634A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF08C6FB29;
	Thu, 23 Jan 2020 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC996F974;
 Thu, 23 Jan 2020 03:33:37 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 25BDC87CB5B1722926E8;
 Thu, 23 Jan 2020 11:33:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/msm/dpu: fix comparing pointer to 0 in
 dpu_encoder_phys_cmd.c
Date: Thu, 23 Jan 2020 11:40:40 +0800
Message-ID: <1579750843-5315-2-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:414:52-53: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:443:56-57: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 39e1e28..8493d68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -411,7 +411,7 @@ static void _dpu_encoder_phys_cmd_pingpong_config(
 		to_dpu_encoder_phys_cmd(phys_enc);

 	if (!phys_enc->hw_pp || !phys_enc->hw_ctl->ops.setup_intf_cfg) {
-		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != 0);
+		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != NULL);
 		return;
 	}

@@ -440,7 +440,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 	u32 flush_mask = 0;

 	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
+		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != NULL);
 		return;
 	}

--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
