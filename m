Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647261FE92
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2305A10E3A3;
	Mon,  7 Nov 2022 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B337210E392;
 Mon,  7 Nov 2022 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849160; x=1699385160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CaREa9/pD5lD48Lzd2B7bjrPLIU9+e08QxMO2B4kapk=;
 b=bRyfTCltc0Wnzjmft7i8dyy7+kPrMUSrLlHXGyS4iUABfM123/59gFme
 ao2Lx9au/7D1WcJNYJykYQd+oUW5x6Q/Q/cRT67X776tNGR+9dXbhjHPy
 J7FHE7JJpk/GABtcK1Z/8ugV5zEtvdCSfjFuQmSLfEnWoZmJU3XY/0fqP
 E696nupC7l+vC8OXVRKPsHc2oz/hjrugBvS+Xdf69ifhwI8V4a35uSHFi
 hxUUrgicOWs8VfT2SHv8JcGLxl9DKwYZWvvkT4a4TOgt+Ep4cpY+9eAip
 HRZSuL8Tbb4YoQmhoyRP/ZX8LBAnlfxk/jen1SGAFAfYwch89amU01u84 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125581"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009773"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:25:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:25:56 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm: Use drm_mode_init() for on-stack modes
Date: Mon,  7 Nov 2022 21:25:41 +0200
Message-Id: <20221107192545.9896-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head, or that we aren't copying
over another mode's list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2c14646661b7..0f71e8fe7be7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -237,12 +237,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
+	drm_mode_init(&mode, &phys_enc->cached_mode);
+
 	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
 		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
 		return;
 	}
 
-	mode = phys_enc->cached_mode;
 	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
 		DPU_ERROR("timing engine setup is not supported\n");
 		return;
@@ -634,7 +635,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
 {
 	struct intf_status s = {0};
 	u32 fetch_start = 0;
-	struct drm_display_mode mode = phys_enc->cached_mode;
+	struct drm_display_mode mode;
+
+	drm_mode_init(&mode, &phys_enc->cached_mode);
 
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
 		return -EINVAL;
-- 
2.37.4

