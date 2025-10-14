Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41276BD9382
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688D910E5D3;
	Tue, 14 Oct 2025 12:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="nT8zfuOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 509 seconds by postgrey-1.36 at gabe;
 Tue, 14 Oct 2025 12:06:35 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2447B10E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:06:34 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59E5rhto3790310; Tue, 14 Oct 2025 12:57:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=e+gRf74dlOTVykywKohC4yB
 asJPVNgvt6uf0YxnMDu4=; b=nT8zfuOgiRwJyG6n4K7imt1yI9F3J1mlnxt4RE3
 6lSaNEyp9jnFiCMhlF62Nf3/+qDvkr0uxi2pjvq1FoobRU2AFSmYUc0ltv/Two/p
 LNRIQf4dGuYp+Y+g5cd8yLLvZE9w1MFYyU5U3Ol3nsDCfCqplJ4JYglwc2LgNxff
 AUr4c2SlvL4XfzQMBMoCGteIyE3WxIQXbw47zlH4AMx9Ee2v/gd+xUSshIVo8GaR
 /rBjI9koSdGys9BphtYzg+1hA569BX1Mfadr3SaOqG22TcYcZEwfWfdBgsWvccXd
 Smb7+OK7YzehVgBkMLJ5XR8LwogQ3/MTRqklsrFX/iazWxw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49qfaru4ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Oct 2025 12:57:43 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.36; Tue, 14 Oct 2025 12:57:43 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.89) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 14 Oct 2025 12:57:42 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 14 Oct 2025 12:57:31 +0100
Subject: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAKs67mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3YLyouLUQt2U1AJdg2RDU4vEFAsDI8tkJaCGgqLUtMwKsGHRsbW
 1ANjYEjdcAAAA
X-Change-ID: 20251013-pwrseq-dep-0c158ad8029c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>, Matt Coster
 <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=g4J9HQuskix95nGVq29iELEGA0lIY+LzY+yk2Odn53I=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS8s9r2lb8g/5L3yy19FUx+FWz7a+wbbnR+vmXCt//Kq
 q8LtroYdJSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEvnkxMrw6dOpqvo2nwJqq
 3l8CIsYpV1kzNm4zOXS0YaXtnoTOH32MDKdUfng+PrTZ95ta27W4jU/7oi51LOs9tvFjkFqJat6
 8aH4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.89]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=O+A0fR9W c=1 sm=1 tr=0 ts=68ee3ab7 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=PZZNL22YEvsA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8
 a=dkdM1tVOqM7zQlyInTkA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: gUdNoCzFQDpPDzLkiSAfk7M3XJANJxa1
X-Proofpoint-GUID: gUdNoCzFQDpPDzLkiSAfk7M3XJANJxa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA5MyBTYWx0ZWRfXwEFmTnlHBIdm
 +E7OUQBIR0MLnYbQYDdVzTDjB/x2P2l1KyLfCrSjk2D9F5b1ADLwVEL9uhu9Q4v5GVM1HAvE8W8
 Z2OyViRF+F0kUMKzTZxDcLAT55RmR4K8JyxW9B/r93DajYYFV6iEmYvnThUXRxc2MguSrYt/3Tf
 mcQK6vWBZrkn2XTKu4kvMnXgTnsKeVdijk3LY1WVwqMUAYzHvVurUvA2HdtdJL7Xe131Ks7rpO1
 o2fD4XARDMUGCXnF4JdfAm1MCBhiENbAO3yOwv5VhhqKs8VDaftHTxRo+1VD2DAmGXljqKstMoF
 Fs53NoX841XrE41mij1tGavVVijcD0q+vP4uMJjzRweid0ab4a5eQxgNcwpKGdBZolsVgCxnP+P
 BjuhrI7f9/3hViWkfXzhNBn97nDceA==
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

When the change using pwrseq was added, I nixed the dependency on
POWER_SEQUENCING since we didn't want it pulled in on platforms where
it's not needed [1]. I hadn't, however, considered the link-time
implications of this for configs with POWER_SEQUENCING=m.

[1]: https://lore.kernel.org/r/a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com/

Fixes: e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU power management")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510111806.CMulNMKW-lkp@intel.com/
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dc..7e7ffb9c2257 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -6,6 +6,7 @@ config DRM_POWERVR
 	depends on ARM64
 	depends on DRM
 	depends on PM
+	depends on POWER_SEQUENCING || !POWER_SEQUENCING
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED

---
base-commit: db74b04edce1bc86b9a5acc724c7ca06f427ab60
change-id: 20251013-pwrseq-dep-0c158ad8029c

