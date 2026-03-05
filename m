Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIimJh1sqWnH7AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:42:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A31210BA0
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5D10E27F;
	Thu,  5 Mar 2026 11:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="M0mxWvKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2073 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 11:42:15 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D208110E27F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:42:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62580mOc2709618; Thu, 5 Mar 2026 11:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=0
 d4aJVUA3fUH10+yQGW7BMctA95MaZCfJgKPDKtFyX4=; b=M0mxWvKrfjpNoc5Ga
 11/155WGcEKb6eqXibsQ6fkuh9KLqD0xOtcaGqgrkYKKHNeXcDug/BvyoCDoZkC2
 DaUQ7IQ+Cr9Rw1eC0ejK18Z1uG/AK+UgaqLDwVt6sHeGpAFZSZA9inEKpkhTLEg0
 gQYbUdSvGFi7xLIydAvyv9tl5WoHRpwpRxNYL9HFyfFxq2lyZilmXwg0vuOcTjs8
 0F4c0ZuC67K4lISYnSbnAGwIuSAZQwDYZSpdtSQp59MUJV/pugbj3QU74rD1yGfV
 nk+qlsLjofSK4r0J3YnyRzMoO0UJ3sCAAtLKcuugHjUCFEQwORfwAvRcFt9RXWw4
 iw1Gg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cp30uhhbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2026 11:07:24 +0000 (GMT)
Received: from NP-G-BRAJESH.pu.imgtec.org (172.25.128.150) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:07:21 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 5 Mar 2026 11:06:16 +0000
Subject: [PATCH 1/2] drm/imagination: Improve firmware power off for
 layout_mars config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260305-b4-staging-layout_mars_base-v1-1-09831fa17cef@imgtec.com>
References: <20260305-b4-staging-layout_mars_base-v1-0-09831fa17cef@imgtec.com>
In-Reply-To: <20260305-b4-staging-layout_mars_base-v1-0-09831fa17cef@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Brajesh Gupta" <brajesh.gupta@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708838; l=5245;
 i=brajesh.gupta@imgtec.com; s=20260107; h=from:subject:message-id;
 bh=UK0HzNM0Hjzt6bAEnfm5A1R1GqivGHPANa4fW7CFl+k=;
 b=uxn+A76P2kqiwE6xTTeqYe7CSF/8U+MMp82TIfPHylxuyEX+iX8a+/cg6ObK4Zo5jvo3sXtz/
 NDAnkoXASzsAN5wQ+VQ/aCpkLsInGajENtizOmKIZtWQPRcBZp67Ay6
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=ed25519;
 pk=mxdDr22E/sHiu68U/bLe0W/SRYi3i848ZgoBuEyk21E=
X-Originating-IP: [172.25.128.150]
X-Authority-Analysis: v=2.4 cv=IoITsb/g c=1 sm=1 tr=0 ts=69a963ec cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=aSvOoEy96_oA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=2EhetXc2wdb5fkq4U_wA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5MCBTYWx0ZWRfX0O++b8++uYNg
 Vb98d7vpoOP0ZbauLKP/Po+3wQL4N2EHV7Vx611hWoioL6kjeicpOfkI2LjVZB5Bd3cBs9DsJPs
 KNKbH/LnZza9M2uMcQGfzUSpqSb4KkmGjuS8vW2bTVRnvnS5vWf5g53LwRhyrPfoLXWwvYKw8cP
 EvMObh2/bCGIMTrlURDXQFURzorIXLKZSocRsj7h/rX3xf3w7kwlW3Ixw/Ww0CPRpgzbR2whbAx
 jDR4KQ47FaBNorG5lVR5ErPKEi0jDy3H/V90QSA++0LmGy1CWB1P++KVmVH4/vMmgYpQwPdYLjK
 Yz7MLi0Ga6S+RWahMGv52w3QYh+fudkSeMJsrLl97/FEYoMvxO4emNLyY86/jVHWZ2LOQuAF6sh
 e1Ow5I1QciTPlv4JvRfDLxamfAKwk0fiqPaF/wbdwGoQpBY9e11aBD8dy62kr2F2r4LcvSajmP8
 YnH6x6pTN24MW92yBUw==
X-Proofpoint-GUID: Kip5sdEy6LWtGDi0zHY-MVBJWZsHtCX4
X-Proofpoint-ORIG-GUID: Kip5sdEy6LWtGDi0zHY-MVBJWZsHtCX4
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
X-Rspamd-Queue-Id: E9A31210BA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:brajesh.gupta@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brajesh.gupta@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brajesh.gupta@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:dkim,imgtec.com:email,imgtec.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

In layout_mars HW config, Firmware MCU moved from SideKick to new Mars
domain so Firmware takes care of powering down Sidekick/Jones and SLC.
Skip checks for those from kernel and check idle bits for Firmware MCU
and system arbiter excluding SOCIF.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 86 +++++++++++++++++---------
 1 file changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index dcbb9903e791..ce089f51f06a 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -208,19 +208,31 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
 					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
-	bool skip_garten_idle = false;
+	u64 layout_mars_value = 0;
+	bool layout_mars = false;
 	u32 reg_value;
 	int err;
 
+	if (PVR_FEATURE_VALUE(pvr_dev, layout_mars, &layout_mars_value) == 0)
+		layout_mars = layout_mars_value > 0;
+
 	/*
-	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
-	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK and SLC would have been
 	 * powered down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
-				sidekick_idle_mask, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (!layout_mars) {
+		/* Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper. */
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+
+		/* Wait for SLC to signal IDLE. */
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE, ROGUE_CR_SLC_IDLE_MASKFULL,
+					 ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	/* Unset MTS DM association with threads. */
 	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
@@ -229,6 +241,7 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC,
 		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_MASKFULL &
 		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
+
 	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC,
 		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
 		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
@@ -270,25 +283,23 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 		return err;
 
 	/*
-	 * Wait for SLC to signal IDLE.
-	 * For cores with the LAYOUT_MARS feature, SLC would have been powered
-	 * down by the FW.
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK and SLC would have been
+	 * powered down by the FW.
 	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
-				ROGUE_CR_SLC_IDLE_MASKFULL,
-				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+	if (!layout_mars) {
+		/* Wait for SLC to signal IDLE. */
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
+					ROGUE_CR_SLC_IDLE_MASKFULL,
+					ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
 
-	/*
-	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
-	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been powered
-	 * down by the FW.
-	 */
-	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
-				sidekick_idle_mask, POLL_TIMEOUT_USEC);
-	if (err)
-		return err;
+		/* Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper. */
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+					sidekick_idle_mask, POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
 
 	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
 		err = pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_value);
@@ -300,11 +311,30 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 		 * Wrapper if there is no debugger attached (TxVECINT_BHALT =
 		 * 0x0).
 		 */
-		if (reg_value)
-			skip_garten_idle = true;
-	}
+		if (!reg_value) {
+			err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+						ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+						ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+						POLL_TIMEOUT_USEC);
+			if (err)
+				return err;
+		}
+	} else if (layout_mars) {
+		/*
+		 * As FW core has been moved from SIDEKICK to the new MARS domain, checking
+		 * idle bits for CPU & System Arbiter excluding SOCIF which will never be
+		 * idle if Host polling on this register
+		 */
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_MARS_IDLE,
+					ROGUE_CR_MARS_IDLE_CPU_EN |
+					ROGUE_CR_MARS_IDLE_MH_SYSARB0_EN,
+					ROGUE_CR_MARS_IDLE_CPU_EN |
+					ROGUE_CR_MARS_IDLE_MH_SYSARB0_EN,
+					POLL_TIMEOUT_USEC);
 
-	if (!skip_garten_idle) {
+		if (err)
+			return err;
+	} else {
 		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
 					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
 					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,

-- 
2.43.0

