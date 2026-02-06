Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJXMFKAQhmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAA0FFFC4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384C010E828;
	Fri,  6 Feb 2026 16:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="bT00/UJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867EC10E824
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 16:02:27 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616Co5nW3947023; Fri, 6 Feb 2026 16:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=FvPFXz16hd5e1bIFUDXo5jy
 JTWL2c9zMhlYB7KbJDJY=; b=bT00/UJ6YWoEBWVStHVScnIxSnWG8Yy+G206lLS
 HIOoqKoVnajqKbFQp0RiVbkqrn1JwXzja/EMpqR8YsbUVniCxCDSDpNB84AaQVea
 82XxdXXmlVysVhIAjylMCGLCcjDIkO7fdcZLF/YY+obRzOUhgD6je8luucwit2In
 FDGOJcuq8zgDvDqYVUaBgUsw6BpJ+rk0vnAKXz5H72sXjuKVEagBOKMVQdesg43p
 E30eCdCjTeVE13ybIyTmHoUquH/1n/zuNEToiak4WBMRxyGLwj23uENIz0J0/tYU
 T2q8E1kumrk5MAsDXmzg7nfDvRM2GNvUR9o0v54tu1R9C3w==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy15k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 16:02:18 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 16:02:17 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: Improve handling of FWCCB command types
Date: Fri, 6 Feb 2026 16:02:11 +0000
Message-ID: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMQhmkC/x3MQQqAIBBA0avErBtQFxJdJVqYztQstFCwILx70
 vIt/n+hUBYqMA8vZKpS5EwdehzAHy7thBK6wShjlVEWJV75rISbC8i39xv6GHBSOlgix8wWent
 lYnn+77K29gGdG6ZiZwAAAA==
X-Change-ID: 20260206-improve-bad-fwccb-cmd-801d6eeafff6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; i=matt.coster@imgtec.com; 
 h=from:subject:message-id;
 bh=7M4TGgsgBjjYnjkp5O9iY1VvA5YxVf2ED+A3YH9S7aQ=; 
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS2CXTUzj7jeurVh9VnNG2vdAs8Ui0xer/N3Wne37RWm
 5MxViuqO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAiEx8z/I/Q7rWwPJq1IXFW
 xMaLdwovi+lVLznTfv2GnkbterYb2Z6MDEfqvh723GS56fu33iC90OXJsy2Y98892XeR4/mR12+
 ObGABAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExNiBTYWx0ZWRfXxBIh15/YN9Bg
 sXf7JydlTAOri6P/FjjOrTx43WvRE2up3iCibEI5KPx7/2rEXZWoYT6utKn1DPDZxpGik0lSjPf
 jtE7+ZTFFG9UhQLd4gwlG8g+/WMFMjDBOlHPKfnkxUSNjwvb/j4kLI/vruBJPENHUlX41QRojNA
 4Rpyn5WWfM2Or3ozbZydKB8Ez75MC3T+hnjF/EpslO2IL7NEr7XrYy6oF1mfp/Gn20acg146w1+
 2t867WtH4DBTgZTZjHI4e0LrRfGWRRzlTMKUFcxs7bZr4Z4eBEDTPzgQ3mm/YyswdXovDS7U6In
 pfxVzsLBZ48Zj6R4nepU4D9p60tr4g0tZjcBT4zcRdjmkGHZWnWJen9JoL2BybQUI8mYT3XoHII
 fB1kgYI3A/ICMzOJKNlDY1sxrOMpSdfOPVSQN2Gh+aXU7huPIZxjyXheStHixROy7UnxjdI0qlY
 UrQM8ZkU3HSBqlm+9qw==
X-Proofpoint-ORIG-GUID: e2QyIT8Ckii8alRRiZKxAhcxvJm7Xti0
X-Proofpoint-GUID: e2QyIT8Ckii8alRRiZKxAhcxvJm7Xti0
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6986108a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=Y6sw-DVKxRC7ltCL6FkA:9 a=QEXdDO2ut3YA:10
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
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.868];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: EEAA0FFFC4
X-Rspamd-Action: no action

Just some simple QoL improvements within process_fwccb_command(). This
should hopefully both reduce the dmesg spam from within this function,
and make what messages remain easier to interpret.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Matt Coster (2):
      drm/imagination: Improve handling of unknown FWCCB commands
      drm/imagination: Mark FWCCB_CMD_UPDATE_STATS as known

 drivers/gpu/drm/imagination/pvr_ccb.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
---
base-commit: e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d
change-id: 20260206-improve-bad-fwccb-cmd-801d6eeafff6

