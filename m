Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2F424DDF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1FF6F3A1;
	Thu,  7 Oct 2021 07:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931F66F399;
 Thu,  7 Oct 2021 07:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B626120D;
 Thu,  7 Oct 2021 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633590598;
 bh=WjDgIdDis2JRNZ4SNzFembkLPX0J0lX61BxjIrvbQgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZEXkkuRyQ6F9Y8ZKN9a5xZDBYbOxJg6mQjw0VXvxy1nY5zGTKytFPoWdJm2byYoWi
 LVAZ9aTeJSr9AU/9tbwO2M/BmQLv3ZgdikBq56zctt0miPXeSUQou/cx4+fsAJur/k
 9W6/RgKrgiC69IedmK/odou7Zw8OXEBb+aP9lLLMrmUeyn8dz1ruhe6742kUDAhwUJ
 XmXpiLZifBGxcPUMivNM0yflWehf53mqoVibC2HBlAwPDUPk0hO7n0l3flfRYyS0Ka
 mzZpaRTC7Dumpo0O7k+aVBR/YpG1/S/fIftBT0QCBeZe1DT9ys6VAF9f9FW5OUYF/2
 KbMrIU0IfokIQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/msm/disp/dpu1: Add support for DSC in topology
Date: Thu,  7 Oct 2021 12:38:58 +0530
Message-Id: <20211007070900.456044-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions upto 4k. For more resolutions like 8k this won't
work.

Also, it is better to use 2 LMs and DSC instances as half width results
in lesser power consumption as compared to single LM, DSC at full width.

The panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since
RFC:
 - Add more details in changelog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index aac51c1bdf94..70f57a071165 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -538,6 +538,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv;
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -572,8 +574,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
+	drm_enc = &dpu_enc->base;
+	priv = drm_enc->dev->dev_private;
+	if (priv && priv->dsc) {
+		/* In case of Display Stream Compression DSC, we would use
+		 * 2 encoders, 2 line mixers and 1 interface
+		 * this is power optimal and can drive upto (including) 4k
+		 * screens
+		 */
+		topology.num_enc = 2;
+		topology.num_intf = 1;
+		topology.num_lm = 2;
+	}
+
 	return topology;
 }
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-- 
2.31.1

