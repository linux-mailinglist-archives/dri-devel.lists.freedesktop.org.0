Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCv+ESnmrmlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E623B963
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084010E53C;
	Mon,  9 Mar 2026 15:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XQS6+1DF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76C910E53C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:24:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6296QwPF4109588; Mon, 9 Mar 2026 15:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=Aj4Z112A+l8JwYyMToVVYm9
 DQ9T6e9MfPk1hwZSFXS0=; b=XQS6+1DFyaDuir2kCvXSmPkZoAvLlEjVKs9lnyk
 cPEh6U6L7lrVP+r/78tk0QXtp1u6iAg3Fp5CEtQjnVHjDCiJXOjU0Lx4OZszBdty
 tC+EpVThhtEAnhnFFeraoR1y/XLPGfkQBxppa4y4/Hwpx0uhjTMXuvloaGHoIIQE
 cdp3qB3T5QKUXBvBgdsuymugGn0rHFnQVdae74IWxjUwHNusdD0ZE3JmO+4uRdbT
 OL4uBC/PrxLQ9T8JRb+G1aE/MnLIviPpc33kf93E5jHzzKe+qD+MhT7IY1lgGqDD
 Ue+k8ZANTHb7wo12qGw1dr6799HbfHfy+FogOhujBWApD1A==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4crb5thjrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 15:24:13 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.8.171) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:24:11 +0000
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 9 Mar 2026 15:23:48 +0000
Subject: [PATCH] drm/imagination: Fix deadlock in soft reset sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260309-fix-soft-reset-v1-1-121113be554f@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAAPmrmkC/x2MSQqAMAwAvyI5G6gNuH1FPEibai5WGhGh9O8Wj
 wMzk0E5CSvMTYbEj6jEs0LXNuCO7dwZxVcGa2xvyEwY5EWN4cbEyjeOgayjYSRPHmp0Ja7GP1z
 WUj74xUCNYAAAAA==
X-Change-ID: 20260309-fix-soft-reset-8f32c3783d3d
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 "Alexandru Dadu" <alexandru.dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Alessio Belle <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773069851; l=1481;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=oXjAn/frMEepxVkPh4OGIzVy+5lq+FiyZyDdSC/VmC0=;
 b=4sgUkNMjtGNG2WtaU3PEDkX9NgOL7wAfyB8aDWHlZzroC8B2s9UBz2PaMYIJUEnVKyqWsmKLw
 md5aGMs2HrHCSNVOTRiegzWwf877o7LC2cugvMgnYhxMIeGiFzwWn74
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Originating-IP: [172.25.8.171]
X-Proofpoint-ORIG-GUID: TVBurlFqrxhG_zc3r0SHg3lx7lbIi4k5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfX4jUcNPPgPEPc
 Sa7eggDdeHKuD6L6HLWisSPdndYMFoO5rAcNdjCt+cBq8k0M4FBKxRFE/l0gqxC+vfd63Ixn1kB
 y0jcd7AFh7Ytys56wwKu3KJJGJYzxt+YoeeTcv9Xf/13fjN5kfD37zWPxBTkEqnov8NkMu5TKbh
 2QI8jrGzRtpsGCaMrC3qrIsSPh6YUwr13LK1GGlix40y8nCaiP/J7k9GytSBLFKzzN7Cm+c6FID
 vxWmPlxq8dzzk7QJwhoONIUc6Si1oK4sVQ4ouJS6ZoyQtrTpUKJef2zYh085iiewbgrs/bVdOa/
 BYo8E295lBa6t/NDomakW9LldBD0bt2QAZ6Fx27ljwQQXNelrTSp3tXUbNpzoxx+ecryC1/upzw
 7QzbGDK+CgWLye+kEalwqyDA1F3pQ9ikTsPjxmG1hYKWzFmCXpcjFjzq/8ZCAfufaTdbwKo1iTd
 IYpzH4MnVoVBzIRtU4w==
X-Authority-Analysis: v=2.4 cv=VN7QXtPX c=1 sm=1 tr=0 ts=69aee61d cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Rd4DrVCMV_EA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=3oOJLAxtiLN628aBsBcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: TVBurlFqrxhG_zc3r0SHg3lx7lbIi4k5
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
X-Rspamd-Queue-Id: A76E623B963
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
	FORGED_RECIPIENTS(0.00)[m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:brajesh.gupta@imgtec.com,m:alexandru.dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:alessio.belle@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alessio.belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,imgtec.com:dkim,imgtec.com:email,imgtec.com:mid]
X-Rspamd-Action: no action

The soft reset sequence is currently executed from the threaded IRQ
handler, hence it cannot call disable_irq() which internally waits
for IRQ handlers, i.e. itself, to complete.

Use disable_irq_nosync() during a soft reset instead.

Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
Cc: stable@vger.kernel.org
Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 7a8765c0c1ed..046cce76498a 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -510,7 +510,16 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 	}
 
 	/* Disable IRQs for the duration of the reset. */
-	disable_irq(pvr_dev->irq);
+	if (hard_reset) {
+		disable_irq(pvr_dev->irq);
+	} else {
+		/*
+		 * Soft reset is triggered as a response to a FW command to the Host and is
+		 * processed from the threaded IRQ handler. This code cannot (nor needs to)
+		 * wait for any IRQ processing to complete.
+		 */
+		disable_irq_nosync(pvr_dev->irq);
+	}
 
 	do {
 		if (hard_reset) {

---
base-commit: d2e20c8951e4bb5f4a828aed39813599980353b6
change-id: 20260309-fix-soft-reset-8f32c3783d3d

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

