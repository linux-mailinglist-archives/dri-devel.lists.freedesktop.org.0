Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0A94E081
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 10:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C9C10E0A1;
	Sun, 11 Aug 2024 08:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="NcLchHCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2510E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 08:28:36 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1723364911; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B+0C5KHeuBVdfBK7ZyL0s0sW8SYPjQ6YtghcVAZ8yIkRlEli78S+FV9xJNtljFCcYyHuZknqzzEyT5Lmr7QcZWSyKIlGmpqOY3hTJy6OSXvxcu7j98EPLDh61kwL7AdzBtEE542yqCV1y7vaJGyIbKvrmqz/B+VNcQAHAcVCGUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723364911;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=f7hdzgnS4D8cvOAiuoGZzS0Zmgqk/HH2cuB+RJSCCpw=; 
 b=CGpyvGnK2QWw5HPNKRCUI2yn/VNBiRGU6mnLPSlVDTUmvoA9djfIsZugkz+DxjX3rLXYl27NmF8k8UoJK4UnkFJm/yxMUSyZfH5yzEuzGbfNwKcy6qNA8nhyG/XLVvyIBBfG7ZsyWNs9ucUn2BfYEhLDlOH8icI0pnJGTjpcVAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723364911; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=f7hdzgnS4D8cvOAiuoGZzS0Zmgqk/HH2cuB+RJSCCpw=;
 b=NcLchHCRq4P5PlvH3MM8ecsPeQK9hjB+1qO4H62ZVxbfRVSJGpHUQQ9l3EQhw+uE
 XF9wZq6uEZvL4tgJrp20A6G6VGX8losVXK6mcRmAfMZXdV+bs1OvOz5jeLLn6ShHeO4
 RAZbomKrkUUDjIv0bcRCy4NvQ169Q9ez+oURSXrFtlupyBzLAcIi2KjbRiI/icfJGXi
 m5v58Ow3pXDz006WIjb/PVJz8fb4HNBYvQxkZNUpaPXKMoVNAuZgeoAs8S0z70KB3Fz
 jdunSGrLwyxqXkVsUrmomtRSzh2LsiLwSTnr8EKMdjpNyVP7sRIrEAcvjnY8rk6p4Gl
 dBtyUUp5UA==
Received: by mx.zohomail.com with SMTPS id 1723364909058364.2343906969842;
 Sun, 11 Aug 2024 01:28:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] drm/imagination: properly support stopping LAYOUT_MARS = 1
 cores
Date: Sun, 11 Aug 2024 16:28:13 +0800
Message-ID: <20240811082813.245871-1-uwu@icenowy.me>
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
 .../gpu/drm/imagination/pvr_fw_startstop.c    | 49 +++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index 159a4c3dd65b..4301a7aded64 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -201,19 +201,28 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
+	const u32 mars_idle_mask = ROGUE_CR_MARS_IDLE_CPU_EN |
+				   ROGUE_CR_MARS_IDLE_MH_SYSARB0_EN;
 	bool skip_garten_idle = false;
+	u32 mars = 0;
 	u32 reg_value;
 	int err;
 
+	if (PVR_HAS_FEATURE(pvr_dev, layout_mars))
+		PVR_FEATURE_VALUE(pvr_dev, layout_mars, &mars);
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
+	if (mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	/* Unset MTS DM association with threads. */
 	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
@@ -267,21 +276,27 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 	 * For cores with the LAYOUT_MARS feature, SLC would have been powered
 	 * down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
-				ROGUE_CR_SLC_IDLE_MASKFULL,
-				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (mars) {
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
+	if (mars) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
 		err = pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_value);
@@ -297,7 +312,13 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
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

