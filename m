Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA7D17EDC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBF610E492;
	Tue, 13 Jan 2026 10:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="tgDdY94n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB5610E119
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5o3eJ3118609; Tue, 13 Jan 2026 10:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=u5C4kQzIEnQBnyXRZM3jJ1r
 p1q8SrMaiZLIPIdGB9Jc=; b=tgDdY94nqtkwtVlfhKCglEHXi5uw0YQ6vV4ft2Z
 HhqFXHW1Alqw/wdpa6f4qgkJFTlEjcPno4UHIn94LTyF+K3OquF+VnbytuVIEeHF
 Cy91Bcb1Ajad3mBT7UVBL8HoVkHETwN22/q+dBMkJWJT0QSPdLwbKZukNvMMuKg6
 GreB0WDt+K+joJoWjdaw4C+3Uk2kzCSAU3W8YskdDiKkLk6+DRkMx5Gmre3+cv59
 x9GWlMi84ebynVKgb/Qt14C+vGSzw+h/GXo4OubvWIFOWUk8iqldi55DEwvyAwdU
 SduYpGIznrq4etMYd1Ek3B150EW5Fbj6LflGOv7TGU6xHEw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:56 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:55 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/6] drm/imagination: Introduce hardware support check
Date: Tue, 13 Jan 2026 10:16:38 +0000
Message-ID: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYbZmkC/x2MQQqAIBAAvxJ7bkGFNPpKdChday8qWhFIf086D
 sxMhUKZqcDUVch0c+EYGsi+A3usYSdk1xiUUFpIYdA1yRKWK6WYT+TgI3qp3Sg3bZQboJUpk+f
 nv87L+36jEYWFZQAAAA==
X-Change-ID: 20260107-device-support-info-f16d81b672d5
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=/yIoESbUCOFTNWhS1YeBSwcz6MhglMwp4kqFlPZE9Ls=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU/r/BV3Rn7l2hl2rKxfuJt9U18/3+2ybn3WUfm1+
 3K9v7480VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATORvPyNCgsHZDrdfmEp2S
 yaprzrHsvD2h5ndMehXbwi1NJzSOzW5k+J/gefdJ5wt2veubuSQSeGZ7zeNU7rx1b4KZio3rgX8
 P53ACAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX5WCOQvhvmQaL
 OV2jA3IMiZE04pF88aBfEM+TBVbUnecLX+IHUnuM+GTLVR9sxvHtMhs0zbsjJgXiVg2JDS2lHZI
 HY3/RkLefWJGBnpkqrqIO/wEOJ8RObOuXi6hYGTJOqVWlig6eOMlMMFPNQ48C68bza3p2MXGRG5
 GBzzPHZBgaHSgXMpqSxVOvSWPseOFIaRpRqg70B2mEVQkNavjX6Vp6CiF62aJo8z7RH9wJtzVb2
 okMr6+ZDBvYu/PDKVIAS9Fe2g7LY9+PNxmcklDRJPwSN72XS1E1jlnf+XX1h0vSqKycEDHJMT7h
 WEb8PI4muElLXNsc0Gg1DgcEi6cVb7Ej4/8aL49KyEjiJ8qhxmtz4zhbF8G+3hXw4LUGEGqwk4W
 RQ4BXo0TZHflpde0EhMhFcDjA4QJg20RlhFELxokX/04Yp5zLwjE3BsHOjwdesbm7QpGCx7JuSJ
 X3CdZJptAENPLtJYLPg==
X-Proofpoint-GUID: jQhh-EGIN44vb7BbSiN3sC6-xGZz9mn_
X-Proofpoint-ORIG-GUID: jQhh-EGIN44vb7BbSiN3sC6-xGZz9mn_
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b98 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=KlEZzXJ0tk8U8U5uoJ8A:9
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

We're seeing an influx of contributions to add support for lots of
different hardware containing Imagination GPUs, and for that we're
incredibly grateful.

Out of an abundance of caution, let's mark anything with intial support
that isn't yet reasonably widely tested as "experimental".

This serves two goals:
 - Don't accidentally declare that hardware with early support is usable
   without sufficient testing.
 - Allow for future breaking changes that would normally not be allowed
   (limited to this experimental hardware).

Here's a quick breakdown of the series:
 - P1-3: General cleanup & other parameter/debugfs-related enhancements.
 - P4: Introduce a module parameter to override the detected gpuid,
       which is useful for testing.
 - P5: Add KUnit infrastructure to the driver for the first time, to
       validate the error-prone task of parsing a gpuid from a string.
 - P6: Introduce the titular check.

Many of the earlier changes could go in on their own, but are not
critical fixes and would all land in the -next tree anyway so it seems
pointless to separate them from the context of the later changes.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Alexandru Dadu (1):
      drm/imagination: Add gpuid module parameter

Matt Coster (5):
      drm/imagination: Simplify module parameters
      drm/imagination: Validate fw trace group_mask
      drm/imagination: Load FW trace config at init
      drm/imagination: KUnit test for pvr_gpuid_decode_string()
      drm/imagination: Warn or error on unsupported hardware

 drivers/gpu/drm/imagination/Kconfig        |  12 ++
 drivers/gpu/drm/imagination/Makefile       |   3 +-
 drivers/gpu/drm/imagination/pvr_debugfs.c  |   2 -
 drivers/gpu/drm/imagination/pvr_device.c   | 200 ++++++++++++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_device.h   |  24 ++--
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 125 +++++++++++++++---
 drivers/gpu/drm/imagination/pvr_fw_trace.h |   3 -
 drivers/gpu/drm/imagination/pvr_params.c   | 147 ---------------------
 drivers/gpu/drm/imagination/pvr_params.h   |  72 -----------
 drivers/gpu/drm/imagination/pvr_test.c     |  73 +++++++++++
 10 files changed, 389 insertions(+), 272 deletions(-)
---
base-commit: 4a768c544f64eaa2fc7cfa91e46f43aa4aad0c40
change-id: 20260107-device-support-info-f16d81b672d5

