Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D07678C3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 00:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761A810E79B;
	Fri, 28 Jul 2023 22:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFCF10E79B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690585144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1z4CG4XPVPLqBvlOoBnJ7hAp50An6oynW+ge2nUWWpM=;
 b=Ju7/ZBcYuq6LQMhhbpoC6ACIcYnx5TyoxnDDAXU0ZCxMlLzjaaZrEFSPXkZ8qRo83zKkZ0
 uVKawTCOh9AwYqFrFnzUD0PnvcvhRmdslyG/MBJ90SSGDbESikHAu7qyknJLdoHTjCUITa
 NCvGkoE0Qt7HMFIpF0nsfDbkUM9K0Os=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-UqOiqX9RNoyrlAbE-XyiPA-1; Fri, 28 Jul 2023 18:59:01 -0400
X-MC-Unique: UqOiqX9RNoyrlAbE-XyiPA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F011006E31;
 Fri, 28 Jul 2023 22:59:00 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.16.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86FB54A9004;
 Fri, 28 Jul 2023 22:58:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD
 issues
Date: Fri, 28 Jul 2023 18:58:57 -0400
Message-Id: <20230728225858.350581-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side of
nouveau in order to read the DPCD of a DP connector, which makes sure we do
the right thing and also check for extended DPCD caps. However, it turns
out we're not currently doing this on the nvkm side since we don't have
access to the drm_dp_aux structure there - which means that the DRM side of
the driver and the NVKM side can end up with different DPCD capabilities
for the same connector.

Ideally in order to fix this, we just want to use the
drm_dp_read_dpcd_caps() helper in nouveau. That's not currently possible
though, and is going to depend on having a bunch of the DP code moved out
of nvkm and into the DRM side of things as part of the GSP enablement work.

Until then however, let's workaround this problem by porting a copy of
drm_dp_read_dpcd_caps() into NVKM - which should fix this issue.

Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 40c8ea43c42f2..b8ac66b4a2c4b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -26,6 +26,8 @@
 #include "head.h"
 #include "ior.h"
 
+#include <drm/display/drm_dp.h>
+
 #include <subdev/bios.h>
 #include <subdev/bios/init.h>
 #include <subdev/gpio.h>
@@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_outp *outp)
 	return outp->dp.rates != 0;
 }
 
+/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()
+ * converted to work inside nvkm. This is a temporary holdover until we start
+ * passing the drm_dp_aux device through NVKM
+ */
+static int
+nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
+{
+	struct nvkm_i2c_aux *aux = outp->dp.aux;
+	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
+	int ret;
+
+	ret = nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_RECEIVER_CAP_SIZE);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Prior to DP1.3 the bit represented by
+	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
+	 * If it is set DP_DPCD_REV at 0000h could be at a value less than
+	 * the true capability of the panel. The only way to check is to
+	 * then compare 0000h and 2200h.
+	 */
+	if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
+		return 0;
+
+	ret = nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd_ext));
+	if (ret < 0)
+		return ret;
+
+	if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
+		OUTP_DBG(outp, "Extended DPCD rev less than base DPCD rev (%d > %d)\n",
+			 outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
+		return 0;
+	}
+
+	if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
+		return 0;
+
+	memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
+
+	return 0;
+}
+
 void
 nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 {
@@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 			memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lttpr));
 		}
 
-		if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, sizeof(outp->dp.dpcd))) {
+		if (!nvkm_dp_read_dpcd_caps(outp)) {
 			const u8 rates[] = { 0x1e, 0x14, 0x0a, 0x06, 0 };
 			const u8 *rate;
 			int rate_max;
-- 
2.40.1

