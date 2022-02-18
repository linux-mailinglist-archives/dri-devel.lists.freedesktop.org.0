Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFD4BB643
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322510F019;
	Fri, 18 Feb 2022 10:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003FE10EEE5;
 Fri, 18 Feb 2022 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178703; x=1676714703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R4w61C2KcssCMmhmacISGBGw98IvAAT3IU7Fyo1+BuQ=;
 b=RpKTTKa3WtDJx24YMxQ+Yv7cu91z5zu9BeL1pwOyyD0VPb8RecFqHsZi
 +QbNJqpWgUiDhNNmp/HmZ+8B45m+BBt48H5KP1/QYtjvfkIZtCmj6AeTE
 FJBhUVYIR0W8yvffJLAik/Jm3Oubf7/4hOjb8ULKc7lvNlBKCPrwUc3sJ
 RJsdpaDmugOCf/vi+xPfbRGsKorwZeUZ81byFNvsprs/hJv22aqnmXEEF
 kKa7Y1E3Xeshe0XTGsxoom+2j5gtkezEqQJ8YoCuTc2X4fvlWgP/D6eU/
 fmk7aUCbc+KCVbVtOKzaQUiYWYp8k7ZOJEw4KRK9M6T475Qgu2cdI624o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311839864"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="311839864"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="530863557"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 18 Feb 2022 02:04:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:58 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/22] drm/msm: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:03:53 +0200
Message-Id: <20220218100403.7028-13-ville.syrjala@linux.intel.com>
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

struct drm_display_mode embeds a list head, so overwriting
the full struct with another one will corrupt the list
(if the destination mode is on a list). Use drm_mode_copy()
instead which explicitly preserves the list head of
the destination mode.

Even if we know the destination mode is not on any list
using drm_mode_copy() seems decent as it sets a good
example. Bad examples of not using it might eventually
get copied into code where preserving the list head
actually matters.

Obviously one case not covered here is when the mode
itself is embedded in a larger structure and the whole
structure is copied. But if we are careful when copying
into modes embedded in structures I think we can be a
little more reassured that bogus list heads haven't been
propagated in.

@is_mode_copy@
@@
drm_mode_copy(...)
{
...
}

@depends on !is_mode_copy@
struct drm_display_mode *mode;
expression E, S;
@@
(
- *mode = E
+ drm_mode_copy(mode, &E)
|
- memcpy(mode, E, S)
+ drm_mode_copy(mode, E)
)

@depends on !is_mode_copy@
struct drm_display_mode mode;
expression E;
@@
(
- mode = E
+ drm_mode_copy(&mode, &E)
|
- memcpy(&mode, E, S)
+ drm_mode_copy(&mode, E)
)

@@
struct drm_display_mode *mode;
@@
- &*mode
+ mode

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..57592052af23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -157,7 +157,7 @@ static void dpu_encoder_phys_cmd_mode_set(
 		DPU_ERROR("invalid args\n");
 		return;
 	}
-	phys_enc->cached_mode = *adj_mode;
+	drm_mode_copy(&phys_enc->cached_mode, adj_mode);
 	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
 	drm_mode_debug_printmodeline(adj_mode);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e7813c6f7bd9..d5deca07b65a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -370,7 +370,7 @@ static void dpu_encoder_phys_vid_mode_set(
 	struct dpu_encoder_irq *irq;
 
 	if (adj_mode) {
-		phys_enc->cached_mode = *adj_mode;
+		drm_mode_copy(&phys_enc->cached_mode, adj_mode);
 		drm_mode_debug_printmodeline(adj_mode);
 		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21f2091..2ed6028ca8d6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -825,7 +825,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->panel->dp_mode.drm_mode = mode->drm_mode;
+	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
 	dp->panel->dp_mode.bpp = mode->bpp;
 	dp->panel->dp_mode.capabilities = mode->capabilities;
 	dp_panel_init_panel_info(dp->panel);
-- 
2.34.1

