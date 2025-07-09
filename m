Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34270AFE4F0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AF110E2AE;
	Wed,  9 Jul 2025 10:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="U0xVASIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673AB10E780
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 10:04:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5694tX8g317115;
 Wed, 9 Jul 2025 11:04:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=ouEAxd/wa1DPcX/rA84yopr
 C3dFU1Hfgw8lZioX7WXc=; b=U0xVASIWxsm6vtVUHTcM1uGBEipYwxsqImaWlva
 3HwAT4nX8+VEzGkzabvgg+eCc2T/BVVGCIrVE6x4nfO1CmkEOD7gQCea1JewM7ol
 BUeSGlss1+YC22PnWzh4CVwvyd93c8PRdHgcdyz8qDW/fiLgEy1RBZ5NiY7X+Yav
 gklD+5CVqEe3Blar40qlHeKsaXfOtOdj4IR7JFW3l9UszbRBz8W70jZKm0jmcAjL
 2v+qbgFTKCZA2f7vnetXKo+WK1Bra3jHG4onxWTggVagjGbWEYMvChLASrV0ex9k
 D053AFvhG1mEd/Kaak/LtBDhxVo/BIw4WXLiE8iiP5LbEJw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47pv4t3q37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Jul 2025 11:04:33 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.2.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 9 Jul 2025 11:04:31 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: Fixes for flexible structures
Date: Wed, 9 Jul 2025 11:04:08 +0100
Message-ID: <20250709-flex-array-check-v1-0-8adeb0bf0cde@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJg+bmgC/x3M3QpAQBBA4VfRXJta1k+8ilysMctEaLZE8u42l
 9/FOQ8EVuEAbfKA8ilB9i0iSxOg2W0To4zRkJu8NLUp0K98oVN1N9LMtKCjhuxQ+cwahpgdyl6
 uf9n17/sB3vys/WIAAAA=
X-Change-ID: 20250704-flex-array-check-ac9c3b6f130e
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=CYhEK9Wd36aro6J8JcPsaltkpoF+9K5pyGX/dkZSXnU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTk2a3/wHrANLf58v742VumKBl1b5uoIJegZ/Hh5X8PX
 m+Lj8/qO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAiTucZGdalfJpwpV7tU45t
 /qR8hdYc840vtzzgizdv8bOwzy9ku8DwTzf3rZK9sI7mdu+b/J+lnS8yCJ6KWCg39cDDY9e3rFR
 vZgQA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.2.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: iHCVhE5npcRyrvW5cAYiwXvcbkLRgvhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAyMCBTYWx0ZWRfXzPFuqABmgQhD
 GI9XicG4DfNiKFyUK1G008Na3mxkHdznRpXZeViKnTml7Dr6HPLOo7je9MSm7jTskiWF0EwKc22
 VFzO1vCYKz+BOcYzjlxLXEg8kOAm7X2PStzaeGPWKLdvuZpmLiKBMchmxc6jwJPvfUTSNG6brSj
 BTbiDjJuvT9V2DBv+fLARkY/+EtbhJNGRBpfY87dRvmIJFPK+feTk+uyLqrC9g+ope7wn9RCvww
 mVyZ/TLlS6W4QkmGCRIBaJXQvjddk1MjzyMSCwFkeGJ3+3UTQov65s4pfxma095QuSPaKvVAQ47
 CgFV40R5X+Q8O9dYBnKtW0oawPgR3KAWzfMSsFFbBvhWqe96y/p/SjGuK4hmisSFgPmbdeKCENg
 ul18UN1n
X-Proofpoint-ORIG-GUID: iHCVhE5npcRyrvW5cAYiwXvcbkLRgvhC
X-Authority-Analysis: v=2.4 cv=fMw53Yae c=1 sm=1 tr=0 ts=686e3eb1 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=U3IiEfsXoe_2rAGymboA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

These fixes were made as part of investigating the Sparse issue reported
in [1]; specifically that the sizeof() check for the flexible structure
struct rogue_fwif_frag_ctx_state was failing under Sparse.

This is actually a fairly pointless check, and the discrepancy is
related to the implicit padding at the end of the structure that is
never used due to the flexible array member. A far more useful check is
to assert that the final member is indeed a flexible array as expected,
and that one element of said array is of the size that we expect.

While fixing that, I stumbled on the useful struct_size_t() macro and
put it to good use wherever the size of the structure in question is
computed.

[1]: https://lore.kernel.org/r/20250606-sprase-reasoning-comments-v1-1-433c0ff11a09@imgtec.com

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Matt Coster (2):
      drm/imagination: Add and use FLEX_ARRAY_CHECK()
      drm/imagination: Use struct_size_t()

 drivers/gpu/drm/imagination/pvr_queue.c            | 11 +++++------
 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h | 19 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 7 deletions(-)
---
base-commit: fe88fb3421161f3abd974ee2ecbe2d9195f98812
change-id: 20250704-flex-array-check-ac9c3b6f130e

