Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35974A9F3C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 19:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86A710E82C;
	Fri,  4 Feb 2022 18:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4854010E82C;
 Fri,  4 Feb 2022 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643999818; x=1675535818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3tadDOiQgUCcHPUD6wqqZsXzt20xROqHOzDpJWPvJ5Q=;
 b=jwqcw4MYAmA4I4Qe7AYOeqNUr2oSak4tGP2tYJJkVBJ2KhRp3qMvZtzs
 LOVBOJ3C+VP96MC+vsmVx6GB4pJayYHU3iXQEvcAF0HEJKMCSb/nVYV1l
 Z0dcrAbErjdHJE29VVcR4pRRE9G7bnwM67hxrWltMlGBzxzlVcXQHro/d k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 04 Feb 2022 10:36:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 10:36:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 10:36:56 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 10:36:55 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/3] drm/msm/dp: revise timing engine programming to
 support compression (DSC)
Date: Fri, 4 Feb 2022 10:36:40 -0800
Message-ID: <1643999801-20359-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643999801-20359-1-git-send-email-quic_khsieh@quicinc.com>
References: <1643999801-20359-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Divides horizontal width by 3 at timing engine of interface. There are
major part of  compression (DSC) programming have to be done at DSC
controller which is not covered by this patch.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 35d4aaa..ee7ca34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -128,7 +128,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
-	if (p->wide_bus_en)
+	if (!p->compression_en || p->wide_bus_en)
 		intf_cfg2 |= BIT(4);
 
 	if (p->wide_bus_en)
@@ -150,10 +150,16 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 */
 	data_width = p->width;
 
-	if (!dp_intf && p->wide_bus_en)
+	if (p->compression_en) {
+		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
+
+		if (p->wide_bus_en)
+			data_width >>= 1;
+	} else if (!dp_intf && p->wide_bus_en) {
 		data_width = p->width >> 1;
-	else
+	} else {
 		data_width = p->width;
+	}
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
@@ -178,8 +184,16 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 
 	active_hctl = (active_h_end << 16) | active_h_start;
 
-	if (dp_intf)
+	if (dp_intf) {
 		display_hctl = active_hctl;
+		if (p->compression_en) {
+			active_data_hctl = (hsync_start_x +
+					p->extra_dto_cycles) << 16;
+			active_data_hctl += hsync_start_x;
+
+			display_data_hctl = active_data_hctl;
+		}
+	}
 
 	den_polarity = 0;
 	if (ctx->cap->type == INTF_HDMI) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index e4a518a..8fc71ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -32,6 +32,9 @@ struct intf_timing_params {
 	u32 hsync_skew;
 
 	bool wide_bus_en;
+	bool compression_en;
+	u32 extra_dto_cycles;   /* for DP only */
+	u32 dce_bytes_per_line;
 };
 
 struct intf_prog_fetch {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

