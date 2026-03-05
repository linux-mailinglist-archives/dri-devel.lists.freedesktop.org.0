Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO2WDQNkqWmB6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:07:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953202104E8
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D894710E129;
	Thu,  5 Mar 2026 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="xQ5NICrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF710E1D8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:07:42 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6256k5oT2377785; Thu, 5 Mar 2026 11:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=l7mKlURTTt3tGr6U8ZhDlVN
 nDr6WVyecDtz6iLHWTi8=; b=xQ5NICrm5v0bFF91LxQJZSiRkIYlIP+VoZSA5gt
 G44MK9wA2DHqhwxFlaku8RZypK2Z6qDxhwH+C7CXDj2KRjA5dtAoFMXUZfhO/+JE
 VknVFUjcM6UKIsCur8ZepKd2/FM9COmZRovryW0xVlmntm4TcZNBTBDtWKr9hZQw
 rBKHi10giCukNNS+YkFId2MvV/Y4bJpisUOMjA4zrJ+tSq8nh9+Kn1gQnQH7CVIk
 y1KSg544HV6ybn+Qre8LD4hBidOS8BMCj19tPN+ly3Ub18VbxxyOFBHZVNmxPRsV
 LCgjon4upOTf/r6qTHKXDFkgdFF1hYLL/kYgDMCMLqlcgTQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4ckqgrv071-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2026 11:07:21 +0000 (GMT)
Received: from NP-G-BRAJESH.pu.imgtec.org (172.25.128.150) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:07:18 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: Improve power off sequence
Date: Thu, 5 Mar 2026 11:06:15 +0000
Message-ID: <20260305-b4-staging-layout_mars_base-v1-0-09831fa17cef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdjqWkC/x3MwQqDMAwA0F+RnBeo1u3gr4whiaZdYNbRdEMR/
 31lx3d5B5hkFYOhOSDLV03XVNFeGpielKKgztXQue7mvOuRe7RCUVPEF+3rp4wLZRuZTHAOzKG
 lq2c/QR3eWYJu//3+OM8fre8U420AAAA=
X-Change-ID: 20260304-b4-staging-layout_mars_base-dfbbf1a53b3c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708838; l=554;
 i=brajesh.gupta@imgtec.com; s=20260107; h=from:subject:message-id;
 bh=bmCehEVtnJDXxi1NjKrSYJW0oHsmmi9BTNLCElQ7R+8=;
 b=NbscvsDOauISMa4XgeGI8Av5g4r9eM+lPhtZNGbZH8sVqe14XVo2ZANoOBb+FN+Fe5BDWaL/K
 JTKigMHebkjCbCNnj5952oLM6/tNOR6fBPAZrpO7RjiTDSCyNX9FLYP
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=ed25519;
 pk=mxdDr22E/sHiu68U/bLe0W/SRYi3i848ZgoBuEyk21E=
X-Originating-IP: [172.25.128.150]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfX7xRl1m2X6nfV
 8l5P51L5ToKxdwNUWTLqMCH9DlzdNLzulZ1Y0ffHoCCuBKkyvfD+HKyF5jW0uI8CUyU453wXN17
 dRt5KJ6mP03+BVtdH9k+8nqKxtOIsiUQvt6x4MBYwIATQ4g+k0NUgqZWKOW2cGQds3no1Ltnb4+
 v6bmgFM0x44HO3Jb2S3m8mph94vln+YG0w/16iJvt5oWGyt89GSV8PC4hXXTB/zTJtCZWXIAtqT
 ivIE/Qxw0Ga/YdOIo2RGrH8WBy8eEVoriAw/HkImH3ouJVbiLe6C7KoMI1fXvxQcIHzAj6C8Tnh
 Zj7i54YR4LVP7blAKkbuEPxwlhETpAusNMV38EYuKjwHuyAPuJTEebd27wnJgsl4vnxlMEJu+CV
 vsG3Ae1XguWe35WrUin2BwVaGgHVRJZdFug+lqb0+7MXAa9FqkujA25i+EpWjW1Dsvk6YTt7DZa
 RElebHwzEzmAvcAU41Q==
X-Proofpoint-ORIG-GUID: kGG0C8IorIbFmpPGQuPtqvsgjLXMzT10
X-Authority-Analysis: v=2.4 cv=GbAaXAXL c=1 sm=1 tr=0 ts=69a963e9 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=aSvOoEy96_oA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=cWoSPm01kt51RX837TEA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: kGG0C8IorIbFmpPGQuPtqvsgjLXMzT10
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
X-Rspamd-Queue-Id: 953202104E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:brajesh.gupta@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[brajesh.gupta@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
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

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
Brajesh Gupta (2):
      drm/imagination: Improve firmware power off for layout_mars config
      drm/imagination: Skip 2nd thread DM association for non META Firmware

 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 100 ++++++++++++++++---------
 1 file changed, 66 insertions(+), 34 deletions(-)
---
base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
change-id: 20260304-b4-staging-layout_mars_base-dfbbf1a53b3c

Best regards,
-- 
Brajesh Gupta <brajesh.gupta@imgtec.com>

