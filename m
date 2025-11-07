Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CF8C3FA38
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554FA10EA84;
	Fri,  7 Nov 2025 11:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itR1TzGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C68C10EA84;
 Fri,  7 Nov 2025 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513533; x=1794049533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v776QJKUlaoHpHbZOwb7lKz6YsrkRzuR2qpxDWxtrnA=;
 b=itR1TzGquAvodGcFMVgUS8OVLh9CQO4uDlGeeLhDjLQsdXGxz3BDDxiQ
 d1Z8/PiCzLI71ezNFMq2QcaHwv1P4adVBQ3+GDdPCJhKOf9D6KJqO/b55
 KzR7DUFjnPVgNRfZc0CPqDAFv15mSMhiXUDbQLRJ76YhLerYyKEEcQ4Ov
 8e7LjwQsbpea1cctxao+dgwc9d/H05Xf5jyOD4T6LgpcM+WJoMVD4ESb3
 pDq0hdrJSgKbVEXCBfwTLACEuiUQBwzGJb42GI7bsMT646g8C4TlhgEan
 1FiAVJlvvyM62HRbWafC/xsvXDrkCeURzHnsDXWoCXsci8uud2wegqZm5 Q==;
X-CSE-ConnectionGUID: s65eUDd4TNOdlW+N95l4cw==
X-CSE-MsgGUID: 4koJC9CQS/GzN09x/prbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82063930"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="82063930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:24 -0800
X-CSE-ConnectionGUID: 29IIpQ3sQxe+gTqN0DgrvA==
X-CSE-MsgGUID: w+pBUL8fTD+ADf7yyoTx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="211457387"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Date: Fri,  7 Nov 2025 13:04:57 +0200
Message-ID: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
for a vblank. Use it instead of poking at dev->vblank[] directly.

Due to the macro maze of wait_event_timeout() that uses the address-of
operator on the argument, we have to pass it in with the indirection
operator.

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index da53ca88251e..e8066f9fd534 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -527,13 +527,14 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
+	wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
 	int ret;
 
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret)
 		return;
 
-	ret = wait_event_timeout(dev->vblank[drm_crtc_index(crtc)].queue,
+	ret = wait_event_timeout(*queue,
 		!(mdp4_read(mdp4_kms, REG_MDP4_OVERLAY_FLUSH) &
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4c4900a7beda..373ae7d9bf01 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1234,6 +1234,7 @@ static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
+	wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
 	int ret;
 
 	/* Should not call this function if crtc is disabled. */
@@ -1244,7 +1245,7 @@ static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	if (ret)
 		return;
 
-	ret = wait_event_timeout(dev->vblank[drm_crtc_index(crtc)].queue,
+	ret = wait_event_timeout(*queue,
 		((mdp5_ctl_get_commit_status(ctl) &
 		mdp5_crtc->flushed_mask) == 0),
 		msecs_to_jiffies(50));
-- 
2.47.3

