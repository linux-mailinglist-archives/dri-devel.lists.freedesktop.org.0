Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNaoE+i6hWmOFgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E1FC52C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09B210E6C0;
	Fri,  6 Feb 2026 09:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="THInFgIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D533810E6B5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:56:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61672Psj3430938; Fri, 6 Feb 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=E
 pOpi4E2fDrwZowzWolNlPQPO9LDUigk9MxGb1DPuMs=; b=THInFgIFzJVi/H9uy
 5KwOj9u2mnDkevvmUu9K7OYqsyMoarvkoxgkcRYNOhkw2MMOa8zHqN/wSYOLgHPv
 OAYhE6pVBzfd6koE7cBjelDBXEIN1TZ6WWEQAqRvlyc7PHWMc60ee4leRK8LhVzq
 GbmhvGaZugBKfKY/aRiVzhYnjanhlH5nmu2Ua4PFoTD9yI0N7VAaDsWK6tDdgJSe
 BubScKQW9knbz0nzi7l2DE/auOB3kw/H34JqCuQKC811rl+TWJZnEGATdcXiZmOM
 Fe0KKKJxPOCJWVvTASc/A+Np7f78vcp0ASDPLw5Zx8J6rAMZYaydqsIPUv5rYJRj
 LvJOQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4c4je3s2n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 09:56:32 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:56:31 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 09:56:25 +0000
Subject: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
References: <20260206-bvnc-cleanup-v1-0-f3c818541fbe@imgtec.com>
In-Reply-To: <20260206-bvnc-cleanup-v1-0-f3c818541fbe@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4474;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=IUjffk5CloNwGZP93xbN7W0kQC8p3fqgc46IQ+Fsn94=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS27jo3aYFV2e4NCVstdiyuUTE32NEtlJbZ82Kt+d07L
 85tNtn4paOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmkmLF8IdPedYnww1GH28o
 Bbh/nyVfaVQTE5za3lxgG/hw8bnZnL6MDFPeT1HSWORUYV42xTN/U/xT1X9XL1yRFrWLmS/e+Od
 ZCjMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=TpLrRTXh c=1 sm=1 tr=0 ts=6985bad0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=99dQMx_Ko8NUrOUIDhEA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NiBTYWx0ZWRfX1wb5M+ainQtb
 GCcmeeoDZt0VnWAYF4uH+Pkl1PERq5vR1WbQCZbW9U2OuGXKqgPRCRj+lkPGYaLMRI0k3BSVm0q
 oLPU9cJyoxfceEWW/HU1C2hWtNKcGFOmAH/veoYZ2khxXlVopkZjuxvOaPOljo9V6VzTwvrC3p0
 vxTZDWdwlP32YSBlBlqY7wY5+TBlj1P9Nmu0VVUivy2Emrmb41ajJQ8fa8atWgnu34XXCBmUK67
 kZZmWNQ2IoNUfcI4sYnO8v+HrUsLbq4ZGyUoAA6eJeS14k7OAR45NfNWvrU7iGgBDTDE+kXSz7A
 W/CxRoFEFJ7Y2f745LKPRgCEEyjW08WhLSbxYziMsP1ra3BhHUVpD+W0nj4H83O2B8KmLaOXwWc
 5iSGnZmrjJsAck/GziijvlozGEvXPWK4PnxQ8esHRvVznrK2xdBlmNUOMJsFs6vi4DKlm8/XWVT
 LuggGdU5ATkBA2yJJpQ==
X-Proofpoint-GUID: Bfm1F5q3x_dH8jrsqNEyjeyvmfRNKhqK
X-Proofpoint-ORIG-GUID: Bfm1F5q3x_dH8jrsqNEyjeyvmfRNKhqK
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
X-Rspamd-Queue-Id: E67E1FC52C
X-Rspamd-Action: no action

Using the uapi-safe __GENMASK_ULL(), we can stably define the layout of
64-bit packed BVNCs. These defs replace the replicated doc comment that
appears all over the place.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.h | 36 ++++++++++----------------------
 include/uapi/drm/pvr_drm.h               | 14 ++++++-------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index cfda215e7428..58f0eae05ad9 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -14,7 +14,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mm.h>
 
-#include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
@@ -479,39 +479,25 @@ struct pvr_file {
  * @n: Number of scalable units.
  * @c: Config ID.
  *
- * The packed layout is as follows:
- *
- *    +--------+--------+--------+-------+
- *    | 63..48 | 47..32 | 31..16 | 15..0 |
- *    +========+========+========+=======+
- *    | B      | V      | N      | C     |
- *    +--------+--------+--------+-------+
+ * The packed layout follows the bitfield defined by the DRM_PVR_BVNC_* macros.
  *
  * pvr_gpu_id_to_packed_bvnc() should be used instead of this macro when a
  * &struct pvr_gpu_id is available in order to ensure proper type checking.
  *
  * Return: Packed BVNC.
  */
-/* clang-format off */
 #define PVR_PACKED_BVNC(b, v, n, c) \
-	((((u64)(b) & GENMASK_ULL(15, 0)) << 48) | \
-	 (((u64)(v) & GENMASK_ULL(15, 0)) << 32) | \
-	 (((u64)(n) & GENMASK_ULL(15, 0)) << 16) | \
-	 (((u64)(c) & GENMASK_ULL(15, 0)) <<  0))
-/* clang-format on */
+	(FIELD_PREP(DRM_PVR_BVNC_B, b) | \
+	 FIELD_PREP(DRM_PVR_BVNC_V, v) | \
+	 FIELD_PREP(DRM_PVR_BVNC_N, n) | \
+	 FIELD_PREP(DRM_PVR_BVNC_C, c))
 
 /**
  * pvr_gpu_id_to_packed_bvnc() - Packs B, V, N and C values into a 64-bit
  * unsigned integer
  * @gpu_id: GPU ID.
  *
- * The packed layout is as follows:
- *
- *    +--------+--------+--------+-------+
- *    | 63..48 | 47..32 | 31..16 | 15..0 |
- *    +========+========+========+=======+
- *    | B      | V      | N      | C     |
- *    +--------+--------+--------+-------+
+ * The packed layout follows the bitfield defined by the DRM_PVR_BVNC_* macros.
  *
  * This should be used in preference to PVR_PACKED_BVNC() when a &struct
  * pvr_gpu_id is available in order to ensure proper type checking.
@@ -527,10 +513,10 @@ pvr_gpu_id_to_packed_bvnc(const struct pvr_gpu_id *gpu_id)
 static __always_inline void
 packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
 {
-	gpu_id->b = (bvnc & GENMASK_ULL(63, 48)) >> 48;
-	gpu_id->v = (bvnc & GENMASK_ULL(47, 32)) >> 32;
-	gpu_id->n = (bvnc & GENMASK_ULL(31, 16)) >> 16;
-	gpu_id->c = bvnc & GENMASK_ULL(15, 0);
+	gpu_id->b = FIELD_GET(DRM_PVR_BVNC_B, bvnc);
+	gpu_id->v = FIELD_GET(DRM_PVR_BVNC_V, bvnc);
+	gpu_id->n = FIELD_GET(DRM_PVR_BVNC_N, bvnc);
+	gpu_id->c = FIELD_GET(DRM_PVR_BVNC_C, bvnc);
 }
 
 int pvr_device_init(struct pvr_device *pvr_dev);
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index ccf6c2112468..72f3f90560cf 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -6,6 +6,7 @@
 
 #include "drm.h"
 
+#include <linux/bits.h>
 #include <linux/const.h>
 #include <linux/types.h>
 
@@ -113,6 +114,11 @@ struct drm_pvr_obj_array {
  * DOC: PowerVR IOCTL DEV_QUERY interface
  */
 
+#define DRM_PVR_BVNC_B __GENMASK_ULL(63, 48)
+#define DRM_PVR_BVNC_V __GENMASK_ULL(47, 32)
+#define DRM_PVR_BVNC_N __GENMASK_ULL(31, 16)
+#define DRM_PVR_BVNC_C __GENMASK_ULL(15, 0)
+
 /**
  * struct drm_pvr_dev_query_gpu_info - Container used to fetch information about
  * the graphics processor.
@@ -125,13 +131,7 @@ struct drm_pvr_dev_query_gpu_info {
 	 * @gpu_id: GPU identifier.
 	 *
 	 * For all currently supported GPUs this is the BVNC encoded as a 64-bit
-	 * value as follows:
-	 *
-	 *    +--------+--------+--------+-------+
-	 *    | 63..48 | 47..32 | 31..16 | 15..0 |
-	 *    +========+========+========+=======+
-	 *    | B      | V      | N      | C     |
-	 *    +--------+--------+--------+-------+
+	 * value using the DRM_PVR_BVNC_* bitmasks.
 	 */
 	__u64 gpu_id;
 

-- 
2.52.0

