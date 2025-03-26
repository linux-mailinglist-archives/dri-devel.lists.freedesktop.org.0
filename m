Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3309A71C34
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F8A10E175;
	Wed, 26 Mar 2025 16:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="mjtWe4+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCC510E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:49:04 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBt2Se012691;
 Wed, 26 Mar 2025 16:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=Z
 GXJ8vAVm5GpKFPjMgJKp9B5XEamiML4z9GNBKepyk0=; b=mjtWe4+NzfNvEPzfr
 Uslb7uRxFW50pIX8t+RsawoMFTXuuw0E4qDxyvgYdyzNeOt1414lufU5yU8JuoiS
 CIuoWhfegfc1PVobEoSgScODdAAVCM6LkeRmnbv7EHbJm4FLopNkJ3PpGLq6xdxf
 gCr8mq8WlKIalGVML4PM4EKa3nQ+ZMDHSU0hkzrRYfe4grY8mHOUTiKXe341CHef
 1J6WxI7x58sv8Pmt8ZCyWezPtUR2RZelJntELABqv7MfVKG+j67jaRaXtFqSJ+LL
 yYHeceiZ0WqXt9eFd6QO7Bx0mzwCAqKvJBq6mLu1S8hvul+qVVoIMCgkl4Ng0R2N
 AnUiw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45kbmy9d6d-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Mar 2025 16:48:56 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 16:48:44 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 26 Mar 2025 16:48:26 +0000
Subject: [PATCH v5 06/18] drm/imagination: Mask GPU IRQs in threaded
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250326-sets-bxs-4-64-patch-v1-v5-6-e4c46e8280a9@imgtec.com>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=+56HizUNukrV1UPbwW3RErbxjFb9fVb+4F+2bHgS3B4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaQ/0X/yxuXB7F9H5c/s8Ip7e0nq3W3x47NUbqyNTuEon
 lf9fHv2zI4SFgYxDgZZMUWWHSssV6j9UdOSuPGrGGYOKxPIEAYuTgGYCIszI8OSY+tZNu4/maP6
 nymKOddE+o0Fy9KmNjurwNJF8bkTfrkzfHf5yTG9fNeBgKK1d/91PWKQ5XBIOLrBR03Xw9Mt5OJ
 fLgA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 1o7_5ICtEc8rfmKRAzjciJK_fah1gZLT
X-Authority-Analysis: v=2.4 cv=L+sdQ/T8 c=1 sm=1 tr=0 ts=67e42ff8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=MXbv0OSQah28ATDbmwsA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 1o7_5ICtEc8rfmKRAzjciJK_fah1gZLT
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

From: Alessio Belle <alessio.belle@imgtec.com>

Pass IRQF_ONESHOT flag to request_threaded_irq(), so that interrupts will
be masked by the kernel until the end of the threaded IRQ handler. Since
the calls to pvr_fw_irq_enable() and pvr_fw_irq_disable() are now
redundant, remove them.

Interrupts to the host from the soon-to-be-added RISC-V firmware
processors cannot be masked in hardware. This change allows us to continue
using the threaded handler in GPUs with a RISC-V firmware.

For simplicity, the same approach is taken for all firmware processors.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-6-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-6-143b3dbef02f@imgtec.com
Changes in v3:
- Added
---
 drivers/gpu/drm/imagination/pvr_device.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..b6ce936f07c8bb26d240e50b72a1d991dbe4b045 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -169,8 +169,6 @@ static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 		ret = IRQ_HANDLED;
 	}
 
-	/* Unmask FW irqs before returning, so new interrupts can be received. */
-	pvr_fw_irq_enable(pvr_dev);
 	return ret;
 }
 
@@ -181,10 +179,6 @@ static irqreturn_t pvr_device_irq_handler(int irq, void *data)
 	if (!pvr_fw_irq_pending(pvr_dev))
 		return IRQ_NONE; /* Spurious IRQ - ignore. */
 
-	/* Mask the FW interrupts before waking up the thread. Will be unmasked
-	 * when the thread handler is done processing events.
-	 */
-	pvr_fw_irq_disable(pvr_dev);
 	return IRQ_WAKE_THREAD;
 }
 
@@ -213,9 +207,13 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 	pvr_fw_irq_clear(pvr_dev);
 	pvr_fw_irq_enable(pvr_dev);
 
+	/*
+	 * The ONESHOT flag ensures IRQs are masked while the thread handler is
+	 * running.
+	 */
 	return request_threaded_irq(pvr_dev->irq, pvr_device_irq_handler,
 				    pvr_device_irq_thread_handler,
-				    IRQF_SHARED, "gpu", pvr_dev);
+				    IRQF_SHARED | IRQF_ONESHOT, "gpu", pvr_dev);
 }
 
 /**

-- 
2.49.0

