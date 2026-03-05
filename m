Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B9JLQRkqWmB6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:07:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DBA2104EF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9510E1D8;
	Thu,  5 Mar 2026 11:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LA8+6oDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CBF10E129
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:07:42 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625701nh2402044; Thu, 5 Mar 2026 11:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=v
 9LXvk7AYhEAMjwGCgZR3SACmCL+dJCjkYqhwKueTAY=; b=LA8+6oDY61C7JWJ9e
 gjxLI0xT3xeGdhcbE88C5EeZ8X+xQOSU0VM/ba+CtNDks2Ot9+ihyGM9Qb+I+JSG
 azy8rDV1A0T9p/zWMw8jjpLXL6pxpttKATGmRRQXMdrr26gpGpdmdkWIoyG32O8R
 SkLhoOlZuSCvLAuijWtFBByAcN8UF3qgwb9GW4gKHPGe8y23QqbvefoMWrA3telL
 pXJmrjMoONaBQYWztI7KnLn9RCEeNvtySpIrr4thhKR6ZF/LdJgtSvf84P6KgU7v
 N+lgAQdiqY8RRKqeeKP5XpqcIoUoLvv0guYzCj1T0fDz0AeI34/cl2Z78vR4v9GC
 UUhVg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4ckqgrv073-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2026 11:07:26 +0000 (GMT)
Received: from NP-G-BRAJESH.pu.imgtec.org (172.25.128.150) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:07:23 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 5 Mar 2026 11:06:17 +0000
Subject: [PATCH 2/2] drm/imagination: Skip 2nd thread DM association for
 non META Firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260305-b4-staging-layout_mars_base-v1-2-09831fa17cef@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708838; l=1623;
 i=brajesh.gupta@imgtec.com; s=20260107; h=from:subject:message-id;
 bh=3lZJ170S8zrsun7Jh3wItDtUCQJImaUgulKM+XWejhU=;
 b=pd56H51WHcR5/FunymyCUS7A8pXsEpohsPu0W6uG2zc8O5HjPnODqkohkZPmjXiA2o68rA/B7
 xC3zsYXjhEHAmw861eqOCiWhBc7hzJum7+xKbC3xctWHlnoFF/NWIwt
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=ed25519;
 pk=mxdDr22E/sHiu68U/bLe0W/SRYi3i848ZgoBuEyk21E=
X-Originating-IP: [172.25.128.150]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfXw9CAOdvAR2m7
 Qbpnq9Ma89ZEq6YbqvHXFHvTbjONicSNWd+6MK4k7l2bRAp7zk2vDgL7AsJaFpg8x6psw2lnlGo
 VJdAzt4JfE3ziwEfqBGJ6oOLY/v7ufBWSJSiFOL42Ou1B+pwBQAgk761BHuyISprmBlBCYtcobW
 D//aCl5vSrFw/qUct66BGEzp7O1HjmhQ7FX5JLxgmjdpO722ANOortL8xkNvuGcBbjWjTjXMjrX
 bGxqT3M0kMimT1NMsGG4ruaXmxrYRZiBsy5QFCUH+4Spt4wE0e3cGmj43kXa3K1PbqEYn1uHxHj
 eBndRudhZdH5X2j/BIlCMVK9niMMgTwzMC4jY3GmOvE5cVP7/m+ICZiL6ZXmepzIbWLQgf/xVXo
 o9ejujV4tWj0+elf7QY8Rxx6H0UNM1MhbpSUf21UGcR5q7EkLZMMIvaGRuRQj45a8VGAnZII96L
 LeTjPTWWbitUZx/xJ1w==
X-Proofpoint-ORIG-GUID: PVfz9kub7_tzqLY87mCliZm8A9h-eXpt
X-Authority-Analysis: v=2.4 cv=GbAaXAXL c=1 sm=1 tr=0 ts=69a963ee cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=aSvOoEy96_oA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=RMA9JOuqd9HpLUXpPykA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: PVfz9kub7_tzqLY87mCliZm8A9h-eXpt
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
X-Rspamd-Queue-Id: 67DBA2104EF
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,imgtec.com:dkim,imgtec.com:email,imgtec.com:mid]
X-Rspamd-Action: no action

Only a META firmware can have two threads.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index ce089f51f06a..3bca57cbaaf0 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -242,12 +242,14 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
 		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_MASKFULL &
 		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
 
-	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC,
-		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
-		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
-	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC,
-		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_MASKFULL &
-		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
+		pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC,
+			       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
+			       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+		pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC,
+			       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_MASKFULL &
+			       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+	}
 
 	/* Extra Idle checks. */
 	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_STATUS_MMU, 0,

-- 
2.43.0

