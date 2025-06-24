Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5EAE6A7B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2010E5E2;
	Tue, 24 Jun 2025 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="m83Fpi08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC94710E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:01:58 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 55O5wNdg3005600; Tue, 24 Jun 2025 16:01:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=cQKgaLvQ+D/2DvvXuFe6FaJ
 v2T0kdN2W5DEEKlrXp1I=; b=m83Fpi08/igY+mhnDvbmbNIerXGeUH0cFPeQJo0
 9huj6S0+LG2jMdKcg8xeLZBEzhoeouN93OvsEl3lzmhKeGiMiO+CDp48zuXhY0wG
 h7XDNM67Pb/cwatwtO0fTEqwtB2thYD8zNxGG6fL1GxVtN9SbOVtCp2SSxNvx6rd
 RHvu2XVZySyp7yTXf/PbqzQxJ4hBO+e2MffU4XTRsXD3wdpTXIhmMUJ2PVMDd3/T
 WnX+trt1HqfmtduqvHDw8AmHWzSt5FuJkOcfC36NsYG0aOQmdo0rMsNvLEVL0YaM
 CfSTZAJIND5kYnfUmJOzlbtgBUWERCEFEPRVJZ4wJYf5rdg==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47dmtt2dqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Jun 2025 16:01:46 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.4.175) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 16:01:44 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Tue, 24 Jun 2025 16:01:31 +0100
Subject: [PATCH] drm/imagination: Clear runtime PM errors while resetting
 the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAMq9WmgC/x3MwQqCQBQF0F+Rt+6BGiNOvxItdLrZg9LhPgtB/
 PeGlmdzdnHQ4HKpdiG+5rbMBc2pkvQc5glq92Jp6zbUXRM1vTBQmd8KcqHrlD9KOFY9h4g0pj5
 0fZQSZOJh2z+/3o7jB5KTwPRsAAAA
X-Change-ID: 20250619-clear-rpm-errors-gpu-reset-359ecbc85689
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Alessio Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750777304; l=3203;
 i=alessio.belle@imgtec.com; s=20250219; h=from:subject:message-id;
 bh=CtuLQvRtO65Ros5CHwUg+1NaIE2RHL8lWkmNeL8REZM=;
 b=lW0lpHYlmENdGZB0U8yMJ7YmHkI/4GkC2sHUS6Aee5GYtT7eydUHo2LNNqcRlD2twF82COS0y
 +94HQPTXx2OAyXe4s03u5du96F/7hmYfmgRPlXxYbd7zVqi5w6nZkv0
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=461lRgRg6AriUFORrCd1maNrcZ+FQJK9D+lWwEPvRPk=
X-Originating-IP: [172.25.4.175]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=SeD3duRu c=1 sm=1 tr=0 ts=685abdda cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vQ5Q824bo0gA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=r_1tXGB3AAAA:8
 a=PmVAM59sefJl7ShyuMcA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: G9HfxhPbnkXROQs07Bbs4emSDoaXWKSW
X-Proofpoint-GUID: G9HfxhPbnkXROQs07Bbs4emSDoaXWKSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDAxNiBTYWx0ZWRfX3NGYHVcjxDj+
 m29lMTc82VAYa3aI3/wqbLKMABZ+uXjxzlmDkqv0w4iornpsejnm9Onp98aOyIopADzUga1yGRb
 5MVtZufm++9Mr5ZaDxva7tGIFheL+n3kKJmYdKLs0fVz4CYk1Fe19O7ife12AKTM6VcCV9+FTm2
 zgLM0CwkICeK+nLsVLmhODwLXCmXuzt6dqK0lUpZILKnWCUNHNnT/PD9U8NcijITsfa2HbponT1
 h8aS1lTWn4nSE3UP3D/alq044TVmd1eD682Q2iuQjHS8hnIkygGJjdLqaw39Sy9YT7uDKC4qk+h
 4FnAotL9LwNHuFrHY91XCW3DFN/54qhfms3TcYR0xrWRIEWT5vpGnoiLRmwV2xjx19XtLngi+/G
 BYDl0jpY
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

The runtime PM might be left in error state if one of the callbacks
returned an error, e.g. if the (auto)suspend callback failed following
a firmware crash.

When that happens, any further attempt to acquire or release a power
reference will then also fail, making it impossible to do anything else
with the GPU. The driver logic will eventually reach the reset code.

In pvr_power_reset(), replace pvr_power_get() with a new API
pvr_power_get_clear() which also attempts to clear any runtime PM error
state if acquiring a power reference is not possible.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 59 ++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 41f5d89e78b854cf6993838868a4416a220b490a..65642ded051db83e82e32e3c3e9f82508ad8d4cc 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -340,6 +340,63 @@ pvr_power_device_idle(struct device *dev)
 	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
 }
 
+static int
+pvr_power_clear_error(struct pvr_device *pvr_dev)
+{
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+	int err;
+
+	/* Ensure the device state is known and nothing is happening past this point */
+	pm_runtime_disable(dev);
+
+	/* Attempt to clear the runtime PM error by setting the current state again */
+	if (pm_runtime_status_suspended(dev))
+		err = pm_runtime_set_suspended(dev);
+	else
+		err = pm_runtime_set_active(dev);
+
+	if (err) {
+		drm_err(from_pvr_device(pvr_dev),
+			"%s: Failed to clear runtime PM error (new error %d)\n",
+			__func__, err);
+	}
+
+	pm_runtime_enable(dev);
+
+	return err;
+}
+
+/**
+ * pvr_power_get_clear() - Acquire a power reference, correcting any errors
+ * @pvr_dev: Device pointer
+ *
+ * Attempt to acquire a power reference on the device. If the runtime PM
+ * is in error state, attempt to clear the error and retry.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_power_get() or the runtime PM API.
+ */
+static int
+pvr_power_get_clear(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = pvr_power_get(pvr_dev);
+	if (err == 0)
+		return err;
+
+	drm_warn(from_pvr_device(pvr_dev),
+		 "%s: pvr_power_get returned error %d, attempting recovery\n",
+		 __func__, err);
+
+	err = pvr_power_clear_error(pvr_dev);
+	if (err)
+		return err;
+
+	return pvr_power_get(pvr_dev);
+}
+
 /**
  * pvr_power_reset() - Reset the GPU
  * @pvr_dev: Device pointer
@@ -364,7 +421,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 	 * Take a power reference during the reset. This should prevent any interference with the
 	 * power state during reset.
 	 */
-	WARN_ON(pvr_power_get(pvr_dev));
+	WARN_ON(pvr_power_get_clear(pvr_dev));
 
 	down_write(&pvr_dev->reset_sem);
 

---
base-commit: 1a45ef022f0364186d4fb2f4e5255dcae1ff638a
change-id: 20250619-clear-rpm-errors-gpu-reset-359ecbc85689

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

