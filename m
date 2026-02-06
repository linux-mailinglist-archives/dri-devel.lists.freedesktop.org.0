Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJtiH6a7hWmOFgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:00:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD032FC5A8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299410E6AD;
	Fri,  6 Feb 2026 10:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fFZ7tNTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026FB10E6AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:00:01 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6166Z4N73275617; Fri, 6 Feb 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=VMWortO+nbOriHa43v80+id
 rMEdrIyPqpfdyd62/BgY=; b=fFZ7tNTSzvSxrrmJdtE4hnyeN9TUMm/pK32GYM9
 1Bf8p16LCX43pNB9+VSZzXDYus4jqgB5YHk8dFddEgiW0/wnPbh7CSyvACgTRxrH
 2FPCybCW/QvznyR3PSPE6Tb19/+T1eh9SBKfRmQkmfKOGWHOiV4BrviilQk95Kxv
 6XrBG0VM3w3pbxE65HIiPuV/8UcNWA5JpTzdgdpcd2uCv/hN1fZ+qq9cXl7WL+jx
 nEYifxeCpehPqX3FiyniAlKrJcih8rx1aENU3gLIlIem6q87AqgeqVZ+g8wVRpJu
 G6HTH54czYMIsBVf2PsBSlDGRPf6NG8srQzO1zAt6yUJmlQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy0xpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 09:59:54 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:59:53 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 09:59:49 +0000
Subject: [PATCH] drm/imagination: Fix ROGUE_MAX_COMPUTE_SHARED_REGISTERS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-rogue-max-compute-shared-registers-v1-1-888249fa50b1@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAJS7hWkC/x3NQQqDMBBG4avIrDuQaDHgVUoXQf/EWWhkRosg3
 t3Q5bd57yKDCoyG5iLFT0zKWuFfDY1zXDNYpmpqXds73znWkg/wEk8ey7IdO9jmqJhYkcV2qHF
 KCR7Bv0PoqIY2RZLzP/l87/sBrs8cCnQAAAA=
X-Change-ID: 20260130-rogue-max-compute-shared-registers-fffe1e714773
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Simon Perretta <simon.perretta@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 "Alessio Belle" <alessio.belle@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=4CNEF2rSXxydPhjwJVDCmqmTux0K4eh1A0JWX//4kns=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS27p45K5Tp1Ya6viCXucsNd+4QlNpZrl230zX0RGzxO
 pM9Z9+ZdpSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEbv5jZHg4Ieej+ca5P3Y+
 fn4i3ztRfd1Nrpkb7ZYLbjp02yLu8roWhv851w4scHn79kv2pk//LebYqs6Sd/9xX2F9pLJO+KM
 thay8AA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NyBTYWx0ZWRfX5XdN1Vr9twWa
 cTeCgbfI01xNEO+tmZyDkuig5QeSmcIeHyHBGgDzBWdWU1WQ+BslAHj+571qJ9WwDQlOY8rgzrT
 FiTpFQKLUrGN8oMrvDFCslP3NSMnQgN03jmFT0v9oy0MwRFP/V0eGOnfy8ei1ZMmni0qeL/ukdA
 nRm87SgCciW8owoZaRQ+FzYzMpx1hJeH23Ee5ah0QanK5wdYkpLKNAvcvCuOqinchrVDSQZlwCe
 +2LOKt1xQzoSeo693n+RvqZzl7CiBJ2ySv2lLsxe8ZSNGfk9ko/DjiCn9QNnUAHTqsmUxHTgKTF
 VOtz5XaY/MuUUJ2xqj/1U275jbOm60WxhZP1Pc1eQFTTZnkx27UlzGS/uZUWglGDq2Tb/0fTSwt
 2M7YZhzI0uAqB3C0tZ5iMt4bOgRfU1/G+1xF+2Z3+Z7owWAOTIBGfdlKRO26rZW1Sw8pkCaQnBq
 LVXdPKm9UXkxbCqHqsg==
X-Proofpoint-ORIG-GUID: 1PNJdE0VR3sawAQTu5lzNjvDxrOGv42T
X-Proofpoint-GUID: 1PNJdE0VR3sawAQTu5lzNjvDxrOGv42T
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6985bb9a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=81mkaI_6koO-tMsR8hIA:9 a=QEXdDO2ut3YA:10
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:simon.perretta@imgtec.com,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: DD032FC5A8
X-Rspamd-Action: no action

Remove a spurious 2x multiplier from this def which can cause instability
in larger compute workloads on hardware with enhancement 38020 present.

Fixes: b41ae495207e ("drm/imagination: Add GPU register headers")
Cc: stable@vger.kernel.org
Suggested-by: Simon Perretta <simon.perretta@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_defs.h b/drivers/gpu/drm/imagination/pvr_rogue_defs.h
index 932b01686008..1fde3be43afe 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_defs.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_defs.h
@@ -114,7 +114,7 @@
 	ROGUE_CR_FWCORE_ADDR_REMAP_CONFIG0_CBASE_CLRMSK
 #define FWCORE_ADDR_REMAP_CONFIG0_SIZE_ALIGNSHIFT (12U)
 
-#define ROGUE_MAX_COMPUTE_SHARED_REGISTERS (2 * 1024)
+#define ROGUE_MAX_COMPUTE_SHARED_REGISTERS 1024
 #define ROGUE_MAX_VERTEX_SHARED_REGISTERS 1024
 #define ROGUE_MAX_PIXEL_SHARED_REGISTERS 1024
 #define ROGUE_CSRM_LINE_SIZE_IN_DWORDS (64 * 4 * 4)

---
base-commit: 5023ca80f9589295cb60735016e39fc5cc714243
change-id: 20260130-rogue-max-compute-shared-registers-fffe1e714773

