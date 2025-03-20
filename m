Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA87A6A4FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BD310E5F6;
	Thu, 20 Mar 2025 11:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="oQVbpz2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F6E10E5FA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:32:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K7I9lS006831;
 Thu, 20 Mar 2025 11:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=1
 xy+ZXc07bYcyzNP5LSe5ZmUyg3L7ep80ycLoyYfWbE=; b=oQVbpz2+D/4pEivYS
 bIlwAM0TaMkSm693pHQo/94w0LfCTW6a2kootfoikyAoGqojpf4Zz0hQQC6GN4Ua
 RfAWLD4yt9cdnKP20HsSzNuXWbVZJo3DhE+LucyZ6u2iQ4eUO6CU9HEFYeZT+f4e
 rRqPzpwVpJE5fLyYPjVPbIVBj1pv8XLIJQd7Vrlf89EwheBkDDh4004E+a1KNCfM
 9XCHrjH09VO/bmhyI4INhY7LxXMbCzos9AugI1d14EFcb8D/I7VKvQ5U2xGh5nCc
 2ystNoE42yYWX7ehA01rowy+04WKzt6+OlGTPprEUe+eOsuqHrzYwrruByaSUXHV
 0QGzw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45d2h1kwg1-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Mar 2025 11:32:26 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 11:32:25 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 20 Mar 2025 11:32:14 +0000
Subject: [PATCH v4 04/18] drm/imagination: Use new generic compatible
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-sets-bxs-4-64-patch-v1-v4-4-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=ucwwSoqIRug4WyXQRNUrjkeXzLx8FCRsGcNO8CwB3BY=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaTf/nPkoZTaHoU/HCvP8nmYqT2XeGAX657x6QqX7L4yh
 c/MYs/Pd5SyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEvioxMnT9nnp6re7DqNjJ
 4tfPrXly8L9J86tdUjnu2bpHY568mf2AkWH13BL25JqVc4PzXW8uktmzq88ggXfCPs00pfRu5Uk
 f7BkA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: uWTghCdVsd_LKiSqLvtUOYuSFj5WPb1P
X-Proofpoint-ORIG-GUID: uWTghCdVsd_LKiSqLvtUOYuSFj5WPb1P
X-Authority-Analysis: v=2.4 cv=V8Z90fni c=1 sm=1 tr=0 ts=67dbfcca cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=6TxX0kamTyKH95WNaFsA:9
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

Follow-on from the companion dt-bindings change ("dt-bindings: gpu: img:
More explicit compatible strings"), deprecating "img,img-axe" in favour of
the more explicit combination of "img,img-rogue" and "img,img-axe-1-16m".

Since all relevant details are interrogated from the device at runtime,
we can match on the generic "img,img-rogue" and avoid adding more entries
with NULL data members (barring hardware quirks).

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-4-143b3dbef02f@imgtec.com
Changes in v3:
- Don't use more specific compatible strings when not required
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-5-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-5-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0639502137b4431dc23a349476572cc898d1f8d0..3130193f8fffc185e630a293be53374bdc4b7ce0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1473,6 +1473,13 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,img-rogue", .data = NULL },
+
+	/*
+	 * This legacy compatible string was introduced early on before the more generic
+	 * "img,img-rogue" was added. Keep it around here for compatibility, but never use
+	 * "img,img-axe" in new devicetrees.
+	 */
 	{ .compatible = "img,img-axe", .data = NULL },
 	{}
 };

-- 
2.49.0

