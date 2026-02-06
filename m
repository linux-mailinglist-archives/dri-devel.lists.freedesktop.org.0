Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOLEKpwQhmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E6FFFBC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AE010E824;
	Fri,  6 Feb 2026 16:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Jbne3fBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDC110E824
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 16:02:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616Co5nX3947023; Fri, 6 Feb 2026 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=j
 sxJqiLUnY8rGRevMOdGLFvbqwbIzPT3L79SxDSTwcE=; b=Jbne3fBYxIqb5Urbp
 Mfd9ji5cPyyp8PeelbJYSCrXBYQLxusNuPLlxr3TZY7S+8pHSuLsrMuOTCnK6hKp
 ep6PRwUIBpTYuOldGqsXW+NSHxkUEW8bEBwFQRuBzx3yVhbm7no1DnYhH8oI3xiN
 qdoW4hfb3L7QW5Q1BJ6zQBCCIJITuU7g5L1EL3FD8qC0OehVDVD+q49b+/dl+hcz
 R9p8FpC+L7VN5JM4wIsXFTcOVdjjRcb8RDqaBQnCiAp89faPu8PjU+3L8jeOnOqq
 ZvkVLM5ii6Mz4ksU91K+80T9Y7+0VVmOYGpXQZUCCAT3xJp5g7bDnuTCI6kXD5H7
 D/UWg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy15k0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 16:02:19 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 16:02:17 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 16:02:12 +0000
Subject: [PATCH 1/2] drm/imagination: Improve handling of unknown FWCCB
 commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-improve-bad-fwccb-cmd-v1-1-831a852ca127@imgtec.com>
References: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
In-Reply-To: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=fChwIFKJfTPixFLygc7esVQKSwCogVhWPR6FrdOBr90=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS2CXRIHjD0e7X6qCPL+5Abnw+UBO1ztebhdt2zNEXEl
 uN0lf3TjlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZiIWBPD//SHN/Uuylbysfat
 fFicNi8m0t+2/vTlLa2xLYv+3LYTmsXIMIX1iqKGwet7EYlqlUtMPy5et76B6RbbvI/ZBwsNJTR
 mswAA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExNiBTYWx0ZWRfX6TV0IfIwIG6g
 3xGP/F7YFSasKCuNjEA6nvLOssR1PcHBjqO1+jvJ9BhXNQ/98bbJY2JIEVSOWbRT9yf5uiPpwLb
 a2cnC2Le1rCVZ6cj50KFPr93g2vsTRsXqmwmYMb5Adc+O0EtAB2jPw9PRQiQRuvoajuXFe/VNxc
 pLsrx9jxqZADYy+NZZz+iwfNvu2l0iJd9do32alhWiKi+gUrnDK4x2CXVRTeC9oBzBIq5H7tkgX
 CBoG2T4fF5MsDn51DJEaF1w/rysCnXa2eJqd6/ASf4TBXtOrg0EUiOFfzgUBx1T5+JjbYZhytAR
 Y1OG4+y94+CBYqsew3RP9Sdom6YacEk5f/R5bc3rlsvrDmcvhFtqI9QhJTh7s5dlaijIOhC61Q+
 1+QRgKkfiz1jwDxBXh2TTsp2ay2q2BbkvtvzuJKlxz4ZdxwgHIdswY/2JFzkTsYbPFP3Hv310vK
 T+KVLaXmRZvEUn5xR4w==
X-Proofpoint-ORIG-GUID: eLMdNHTRBjFBRMj2Olo3LMqnCvYcxZga
X-Proofpoint-GUID: eLMdNHTRBjFBRMj2Olo3LMqnCvYcxZga
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6986108b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=2tjIQZU-TntZS31si9wA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[imgtec.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[matt.coster.imgtec.com:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 442E6FFFBC
X-Rspamd-Action: no action

A couple small changes:
 - Validate the magic value at the head of FWCCB commands, and
 - Mask off the magic value before logging unknown command types to make
   them easier to interpret on sight.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 9294b4ba1de7..2f4356a1e69f 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -136,6 +136,14 @@ pvr_ccb_slot_available_locked(struct pvr_ccb *pvr_ccb, u32 *write_offset)
 static void
 process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *cmd)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	if ((cmd->cmd_type & ROGUE_CMD_MAGIC_DWORD_MASK) != ROGUE_CMD_MAGIC_DWORD_SHIFTED) {
+		drm_warn_once(drm_dev, "Received FWCCB command with bad magic value; ignoring (type=0x%08x)\n",
+			      cmd->cmd_type);
+		return;
+	}
+
 	switch (cmd->cmd_type) {
 	case ROGUE_FWIF_FWCCB_CMD_REQUEST_GPU_RESTART:
 		pvr_power_reset(pvr_dev, false);
@@ -151,8 +159,8 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 		break;
 
 	default:
-		drm_info(from_pvr_device(pvr_dev), "Received unknown FWCCB command %x\n",
-			 cmd->cmd_type);
+		drm_info(drm_dev, "Received unknown FWCCB command (type=%d)\n",
+			 cmd->cmd_type & ~ROGUE_CMD_MAGIC_DWORD_MASK);
 		break;
 	}
 }

-- 
2.52.0

