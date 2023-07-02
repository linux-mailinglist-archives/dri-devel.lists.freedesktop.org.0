Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B5744EA9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 18:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758D310E010;
	Sun,  2 Jul 2023 16:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C0410E010;
 Sun,  2 Jul 2023 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xdktR0ZW1+7oS8vQFbhX1grTHS/llaOWJVaub2NlKLo=; b=h/1wX4JTdSgoA39p/4CtiC1YxJ
 pMr+Yws3D2BV796tGwWpTXSTjjgpRB1Zfp3tlDtcSiWyixm/wjXzcvdKDaBbhOzmBzv9bDC9g51qa
 NAtC4AXqEI9IWCxIr85iY/qjdC8LUX3eNrqJvt+Hn2oL5V2Rv9lFSg/1uJCv+YrRIKWHluqcYJngr
 uXdx7oT1sX7nIkELRQiWavIgyY8ksuPEP90+Cy0sSrUujRJDLmAvLD9CxlRZF6H7GhnbVdZquQcN9
 4q5n/pOKDjqDsCuIu9CbczRRgimfDf+dRYmIgObzvsX3boSeEsO0PFvM3x0QaCYtA3+swhlBDnrWv
 Msy52OdA==;
Received: from [191.205.188.225] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qG0BV-007AcG-Tm; Sun, 02 Jul 2023 18:44:26 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max selectors
 unconditionally for DCN1+"
Date: Sun,  2 Jul 2023 13:44:07 -0300
Message-Id: <20230702164407.6547-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, cristian.ciocaltea@collabora.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 06c3a652a787efc960af7c8816036d25c4227c6c.

After this commit, the Steam Deck cannot boot with graphics anymore;
the following message is observed on dmesg:

"[drm] ERROR [CRTC:67:crtc-0] flip_done timed out"

No other error is observed, it just stays like that. After bisecting
amd-staging-drm-next, we narrowed it down to this commit. Seems it
makes sense to revert it to have the tree bootable until a proper
solution is worked.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

---

Hi Alex / Aurabindo, we couldn't boot the Deck with in HEAD
(amd-staging-drm-next), git bisect led to this commit. Since its
description already mentions a potential proper solution, related
to the DMCUB (and some complex state tracking), I thought it was
more effective to revert it to allow booting the tree in Deck (and
maybe other HW - I just tested the Deck BTW).
Lemme know your thoughts.

Special thanks to André and Melissa for helping the debug / bisect!
We're open to test alternative patches, feel free to ping.
Cheers,

Guilherme


 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 15 ++++++++++++---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c | 10 ----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index 0e8f4f36c87c..27419cd98264 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -945,10 +945,19 @@ void optc1_set_drr(
 				OTG_FORCE_LOCK_ON_EVENT, 0,
 				OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
 				OTG_SET_V_TOTAL_MIN_MASK, 0);
-	}
 
-	// Setup manual flow control for EOF via TRIG_A
-	optc->funcs->setup_manual_trigger(optc);
+		// Setup manual flow control for EOF via TRIG_A
+		optc->funcs->setup_manual_trigger(optc);
+
+	} else {
+		REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
+				OTG_SET_V_TOTAL_MIN_MASK, 0,
+				OTG_V_TOTAL_MIN_SEL, 0,
+				OTG_V_TOTAL_MAX_SEL, 0,
+				OTG_FORCE_LOCK_ON_EVENT, 0);
+
+		optc->funcs->set_vtotal_min_max(optc, 0, 0);
+	}
 }
 
 void optc1_set_vtotal_min_max(struct timing_generator *optc, int vtotal_min, int vtotal_max)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
index 58bdbd859bf9..d6f095b4555d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
@@ -462,16 +462,6 @@ void optc2_setup_manual_trigger(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
-	/* Set the min/max selectors unconditionally so that
-	 * DMCUB fw may change OTG timings when necessary
-	 * TODO: Remove the w/a after fixing the issue in DMCUB firmware
-	 */
-	REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
-				 OTG_V_TOTAL_MIN_SEL, 1,
-				 OTG_V_TOTAL_MAX_SEL, 1,
-				 OTG_FORCE_LOCK_ON_EVENT, 0,
-				 OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* TRIGA */
-
 	REG_SET_8(OTG_TRIGA_CNTL, 0,
 			OTG_TRIGA_SOURCE_SELECT, 21,
 			OTG_TRIGA_SOURCE_PIPE_SELECT, optc->inst,
-- 
2.40.1

