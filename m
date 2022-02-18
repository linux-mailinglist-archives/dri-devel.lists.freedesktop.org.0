Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F364BB63F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCC610EEDD;
	Fri, 18 Feb 2022 10:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A4E10EED6;
 Fri, 18 Feb 2022 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178699; x=1676714699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OpIVq1wuA3HRWuulSvFXyy3QhdFsBNiPeTSse+q1RqY=;
 b=jGqKEwUlhBqvmlLW/fbdc2INpiAp92QlMZXassatXLjah1X7r1XE8K4v
 7fKwtHb7ARVIR83BOdknhEMBxws95C9mX3o2tG9nLVCV6dk34J5mak6Vy
 eKU3/wQag1RmeL6y07aaczFlTbGG3WiMUXD1y2x0TIRl80VwtUDiW+WDj
 gmr6WEIDS3GapPktjAW9bDh3lUqcoNhPrd2ZdMwdQ7aOfdl3QxcNkqWRf
 rJal0Yi7pi62yaNll+5YFhLKJ7S/7foEcI83AcMSTwddpSgXdTAuqp1r5
 t+NdcmNgIuS+3tO2+waSCy10sWZ+mJfOcKoCAsNDRxZcKfmE1ickWJrKV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314361616"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="314361616"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546219495"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 18 Feb 2022 02:04:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:53 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/22] drm/msm: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:03:52 +0200
Message-Id: <20220218100403.7028-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..e7813c6f7bd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -248,12 +248,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
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
@@ -652,7 +653,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
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
2.34.1

