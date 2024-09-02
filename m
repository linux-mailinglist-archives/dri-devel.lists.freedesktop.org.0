Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4C968952
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AF310E301;
	Mon,  2 Sep 2024 14:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BGBFqUHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749310E300
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 14:01:10 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1725285665; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S9flqk/B6l8l8AOmCYo1Gu2Tdqpn4QTNnkgrJOUmh84hTbdxCigzH1KNm+nl1vrpThUvNcHTSwLDv6FzrOuHOkSTKz+aIGGVZE2Qy4RnNyK8mtLcFZfg9+dkUuejjdI2bx+Svf0o2BB4U980yg8n4c0o46DA0AF6ZqGnIJf6XR8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725285665;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D/7RuX7OmIGW9y/1IHddtkVDMYjXxYRmzEFQDdhUgEk=; 
 b=MUjembpRv8nlszy3FhUQFuNiKTSI+gKalzBMCGzpLSYiMLZsfXlr4o7rSkIaMzV5xutAjHUl8xEyy493ppdRsYeWeiNz2pShUBxH3U2yfrHe0KOGbg+YwufMYRVU8kGWeN+ARx1jL1p1zmoD34NyMrv9dyGDVKpwSU3JIrJ9uis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725285665; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=D/7RuX7OmIGW9y/1IHddtkVDMYjXxYRmzEFQDdhUgEk=;
 b=BGBFqUHy4RwlL97QHFQDsiG2DjV48EuZ9IG+sJnykFzV8j5YhwLiZThgxm01oMbJ
 YIh6/P2qlkrOg1SBA4mmimF1HFgMl0qPSki1y45rlDsYdBXllxEaFmjUVdRMIRKUSFv
 V0dD/BLNc2CS/IHBLdO+Q+8LbXAA1tp3HRADosMw41gQYHdX0+x42kjq6ruz2HHw4fU
 LNdtFFyjJbnh8BNth5KGrXd/RzoK3o0rUX7C+JTMbLyAWT/lk3EdUnfjuAaSou7yEzt
 InKKhAH8Wi9xYlVXyd87iX2Fug49v7YYyZ6/Cy2YelHbk4zh2m/WX8vk9kdIPC+g1MO
 2med/CFc3A==
Received: by mx.zohomail.com with SMTPS id 172528566286781.8323865718055;
 Mon, 2 Sep 2024 07:01:02 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Matt Coster <Matt.Coster@imgtec.com>, Frank Binns <frank.binns@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2] drm/imagination: properly support stopping LAYOUT_MARS = 1
 cores
Date: Mon,  2 Sep 2024 22:00:39 +0800
Message-ID: <20240902140039.1972899-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Some new Rogue GPU cores have an extra MARS power domain, which
controlls the power of the firmware core and allows the firmware core to
power down most parts of the GPU.

Adapt to this by ignoring power domains that should be powered down by
the fiwmare and checking MARS idle status instead.

The logic mimics RGXStop() function in the DDK kernel mode source code.

Tested on BXE-4-32 (36.50.54.182) with firmware build 6503725 OS provided
by Imagination Technologies.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Changes in v2:
- Fixed some wrong change that moves the original logic into if(mars)
  instead of if(!mars).

 .../gpu/drm/imagination/pvr_fw_startstop.c    | 48 +++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index 36cec227cfe3c..ae137e35edf3b 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -191,19 +191,27 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
+	const u32 mars_idle_mask = ROGUE_CR_MARS_IDLE_CPU_EN |
+				   ROGUE_CR_MARS_IDLE_MH_SYSARB0_EN;
 	bool skip_garten_idle = false;
+	u32 mars = 0;
 	u32 reg_value;
 	int err;
 
+	PVR_FEATURE_VALUE(pvr_dev, layout_mars, &mars);
+
 	/*
 	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
 	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
 	 * powered down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
-				sidekick_idle_mask, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (!mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	/* Unset MTS DM association with threads. */
 	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
@@ -257,21 +265,27 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 	 * For cores with the LAYOUT_MARS feature, SLC would have been powered
 	 * down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
-				ROGUE_CR_SLC_IDLE_MASKFULL,
-				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (!mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
+					ROGUE_CR_SLC_IDLE_MASKFULL,
+					ROGUE_CR_SLC_IDLE_MASKFULL,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	/*
 	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
 	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been powered
 	 * down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
-				sidekick_idle_mask, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (!mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
 		err = pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_value);
@@ -287,7 +301,13 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 			skip_garten_idle = true;
 	}
 
-	if (!skip_garten_idle) {
+	if (mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_MARS_IDLE,
+					mars_idle_mask, mars_idle_mask,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	} else if (!skip_garten_idle) {
 		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
 					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
 					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
-- 
2.46.0

