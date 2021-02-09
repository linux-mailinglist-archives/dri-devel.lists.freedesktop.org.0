Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD1315A57
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 00:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066BF6EC02;
	Tue,  9 Feb 2021 23:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so15.mailgun.net (so15.mailgun.net [198.61.254.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565676EC02
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 23:57:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612915059; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=m4sOxKBKLmTi6eZIh2OP00gB5CPUIiEGD54N02UPzOI=;
 b=IcU+DhFn20YM7hiwqlK61w1SdwxJqt76xBsN2C2czhmvgZdVRZqWgIe7zCyTpTsLg3OSymfw
 PmgrUi3DzdYXqEhKBGxDZOc3oJVjA3Ih3B1gbpCGcNY/XUcu8cS79dpuIaM6P8kG+MUEyH0Y
 UEjO2ErX9XQ6PZuxERvzlt215DM=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60232164f112b7872c40c470 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 23:57:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 70C4CC43465; Tue,  9 Feb 2021 23:57:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 315C8C433CA;
 Tue,  9 Feb 2021 23:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 315C8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: a6xx: Make sure the SQE microcode is safe
Date: Tue,  9 Feb 2021 16:57:17 -0700
Message-Id: <20210209235717.768010-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most a6xx targets have security issues that were fixed with new versions
of the microcode(s). Make sure that we are booting with a safe version of
the microcode for the target and print a message and error if not.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 67 +++++++++++++++++++++------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba8e9d3cf0fe..cfb0d5f63784 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -522,28 +522,61 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
-static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
+/*
+ * Check that the microcode version is new enough to include several key
+ * security fixes. Return true if the ucode is safe.
+ */
+static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		struct drm_gem_object *obj)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 *buf = msm_gem_get_vaddr(obj);
+	bool ret = false;
 
 	if (IS_ERR(buf))
-		return;
+		return false;
 
 	/*
-	 * If the lowest nibble is 0xa that is an indication that this microcode
-	 * has been patched. The actual version is in dword [3] but we only care
-	 * about the patchlevel which is the lowest nibble of dword [3]
-	 *
-	 * Otherwise check that the firmware is greater than or equal to 1.90
-	 * which was the first version that had this fix built in
+	 * Targets up to a640 (a618, a630 and a640) need to check for a
+	 * microcode version that is patched to support the whereami opcode or
+	 * one that is new enough to include it by default.
 	 */
-	if (((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1)
-		a6xx_gpu->has_whereami = true;
-	else if ((buf[0] & 0xfff) > 0x190)
-		a6xx_gpu->has_whereami = true;
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
+		adreno_is_a640(adreno_gpu)) {
+		/*
+		 * If the lowest nibble is 0xa that is an indication that this
+		 * microcode has been patched. The actual version is in dword
+		 * [3] but we only care about the patchlevel which is the lowest
+		 * nibble of dword [3]
+		 *
+		 * Otherwise check that the firmware is greater than or equal
+		 * to 1.90 which was the first version that had this fix built
+		 * in
+		 */
+		if ((((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1) ||
+			(buf[0] & 0xfff) > 0x190) {
+			a6xx_gpu->has_whereami = true;
+			ret = true;
+		}
+	}  else {
+		/*
+		 * a650 tier targets don't need whereami but still need to be
+		 * equal to or newer than 1.95 for other security fixes
+		 */
+		if (adreno_is_a640(adreno_gpu)) {
+			if ((buf[0] & 0xfff) >= 0x195)
+				ret = true;
+		}
+
+		/*
+		 * When a660 is added those targets should return true here
+		 * since those have all the critiical security fixes built in
+		 * from the start
+		 */
+	}
 
 	msm_gem_put_vaddr(obj);
+	return ret;
 }
 
 static int a6xx_ucode_init(struct msm_gpu *gpu)
@@ -566,7 +599,15 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
 		}
 
 		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
-		a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo);
+		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo)) {
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"SQE ucode version is too old. It is likely unsafe\n");
+			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
+			drm_gem_object_put(a6xx_gpu->sqe_bo);
+
+			a6xx_gpu->sqe_bo = NULL;
+			return -EPERM;
+		}
 	}
 
 	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE_LO,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
