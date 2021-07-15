Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E63C9925
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC36E578;
	Thu, 15 Jul 2021 06:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D946E578;
 Thu, 15 Jul 2021 06:53:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 978026117A;
 Thu, 15 Jul 2021 06:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626331991;
 bh=R4oQOomA8Ok/mNiwcSkcXhUgjl0dzN7G+Iv9LqLtcyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HGqcNWA0Cq+fYE9hv4SNYQ5hklXh4lnZWTj0DFfm8gBPSfmIVoIpR1wns12zrYnBk
 iLXd6C37MhC4m7sYiSN9JXIZANsTm7C/3W4WBWtOqyGjY/kN0nxGIR8kU82Qg/HD2l
 SXxy7KjFiZeIDdwkDxHL1SZG+rDG68gN6UvEDRvnqplEc284wmtJD4c2uloQ3YzJq4
 8RnEpQMJefeK43h8UYXcrQxBlBnmQT1XEYA58ZqKj8MINwN/oG2Yq4k2btwyoLYhgJ
 ttU0TvgJZAxO3rXiGKNTY3SiPXt8gPmQyIK6LZnpEojz5PU1WfMjXdpMyIxLkvvf9Z
 8pcmaqodP9bXQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 09/11] drm/msm/disp/dpu1: Add support for DSC in topology
Date: Thu, 15 Jul 2021 12:22:01 +0530
Message-Id: <20210715065203.709914-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions upto 4k. For more resolutions like 8k this won't
work.

The topology information is provided by DTS so we try to deduce the
topology required for DSC.
Furthermore, we can use 1 DSC encoder in lesser resolutions, but that is
not power efficient according to Abhinav, it is better to use 2 mixers
as that will split width/2 and is proven to be power efficient.

Also, the panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since RFC:
 - Add more details in changelog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 41140b781e66..8f0a8bd9c8ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -573,6 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv;
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -607,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
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

