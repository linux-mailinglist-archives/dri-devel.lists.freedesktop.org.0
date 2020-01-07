Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED8133CD1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784E86E192;
	Wed,  8 Jan 2020 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A756E0D5;
 Tue,  7 Jan 2020 15:13:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q6so54266410wro.9;
 Tue, 07 Jan 2020 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AsRjqmSddZiXaJNHfNW43Wmc9oWEosMDJEk7wL2FDo=;
 b=YG9RW5e5joOPxoDvG6pcPCuwA5GGyBjDMtnNvp5f/ELEqUTKtwEnKSr1KC+XJFYnOz
 eT7E63bexxp0XZrUJ7aiQmVw4+tESSdP8UGAtPPdMAd8MIsxcnj7Jpfa84Ylv2YVUfyI
 c4TWnoRmaxbmfDYTVMg9WesEKPmYIj/cGE2Te8+GVnCh65PxuyOpD2RB5Br2kaIp/7WR
 niPNBhOheVKA5BYpw6IgR3f7mEX3tQ0SA5enxIkkxMlPPLqDXeFFzfw9UBEKMlGYJxNE
 rEaYaJ03vbvyNC9QVg1X5uyeULhRyfa3dIYEu1t5jQx8ZsDRySrovW7EtZ03T6je8LH8
 aEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0AsRjqmSddZiXaJNHfNW43Wmc9oWEosMDJEk7wL2FDo=;
 b=KoK3tD0Xwcsx7nTBj4LP0qR1opdVFLMIqzi7kvDW8P7ns2Ge0dEI6OkoTlnL0neXPz
 6fzvS93WwaDNAgihJNH4Hxl7YiPVhsV3gE1Akc1IsalMw1fR54LrfhNVO1BEY8cD2nha
 Z3XFM/POtnW0jLSUJdPeDCNfqFUEPy1JOTvQe0AFsSlgGb55f7d1+NFyE9UoRr74iLJX
 uFTzjB8xfiyr5PxAAjGkOgiIiSfuZHtJpKxmguHMHpOZ14vVcvXmBcOjFPTyGssXMXKZ
 BBiqe7kDGNFFNStHsVfuF6TAtBXZYoOh/diJ4KEGixF85C79cvxJkfl1fo/222rRsDGk
 4A0g==
X-Gm-Message-State: APjAAAVNlLqmiVmJ73Ej+nUC3PxDFb5kz7BHziHcHDmtCdOlW8rTdE5j
 FGpkSWNyiLJtxWiVGxGVjsU=
X-Google-Smtp-Source: APXvYqw9no5TtCcHAL2JCCdsE234J86HIbQroWZ5MeM6G0gn2jqlCqz9Gj/EcaDxk+UmLF3m63z07Q==
X-Received: by 2002:adf:e984:: with SMTP id h4mr107119108wrm.275.1578410030242; 
 Tue, 07 Jan 2020 07:13:50 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id c4sm27076664wml.7.2020.01.07.07.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:13:49 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/5] drm/i915: convert to using new struct drm_device logging
 macros
Date: Tue,  7 Jan 2020 18:13:32 +0300
Message-Id: <ae253ecf3ca878fae7f1f246d75c2136fb6bd72c.1578409433.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578409433.git.wambui.karugax@gmail.com>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of printk based debugging macros with the struct
drm_device based logging macros in i915/intel_sideband.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_sideband.c | 29 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_sideband.c b/drivers/gpu/drm/i915/intel_sideband.c
index e06b35b844a0..cbfb7171d62d 100644
--- a/drivers/gpu/drm/i915/intel_sideband.c
+++ b/drivers/gpu/drm/i915/intel_sideband.c
@@ -105,8 +105,8 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 	if (intel_wait_for_register(uncore,
 				    VLV_IOSF_DOORBELL_REQ, IOSF_SB_BUSY, 0,
 				    5)) {
-		DRM_DEBUG_DRIVER("IOSF sideband idle wait (%s) timed out\n",
-				 is_read ? "read" : "write");
+		drm_dbg(&i915->drm, "IOSF sideband idle wait (%s) timed out\n",
+			is_read ? "read" : "write");
 		return -EAGAIN;
 	}
 
@@ -129,8 +129,8 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 			*val = intel_uncore_read_fw(uncore, VLV_IOSF_DATA);
 		err = 0;
 	} else {
-		DRM_DEBUG_DRIVER("IOSF sideband finish wait (%s) timed out\n",
-				 is_read ? "read" : "write");
+		drm_dbg(&i915->drm, "IOSF sideband finish wait (%s) timed out\n",
+			is_read ? "read" : "write");
 		err = -ETIMEDOUT;
 	}
 
@@ -283,7 +283,8 @@ static int intel_sbi_rw(struct drm_i915_private *i915, u16 reg,
 	if (intel_wait_for_register_fw(uncore,
 				       SBI_CTL_STAT, SBI_BUSY, 0,
 				       100)) {
-		DRM_ERROR("timeout waiting for SBI to become ready\n");
+		drm_err(&i915->drm,
+			"timeout waiting for SBI to become ready\n");
 		return -EBUSY;
 	}
 
@@ -301,12 +302,13 @@ static int intel_sbi_rw(struct drm_i915_private *i915, u16 reg,
 	if (__intel_wait_for_register_fw(uncore,
 					 SBI_CTL_STAT, SBI_BUSY, 0,
 					 100, 100, &cmd)) {
-		DRM_ERROR("timeout waiting for SBI to complete read\n");
+		drm_err(&i915->drm,
+			"timeout waiting for SBI to complete read\n");
 		return -ETIMEDOUT;
 	}
 
 	if (cmd & SBI_RESPONSE_FAIL) {
-		DRM_ERROR("error during SBI read of reg %x\n", reg);
+		drm_err(&i915->drm, "error during SBI read of reg %x\n", reg);
 		return -ENXIO;
 	}
 
@@ -426,8 +428,9 @@ int sandybridge_pcode_read(struct drm_i915_private *i915, u32 mbox,
 	mutex_unlock(&i915->sb_lock);
 
 	if (err) {
-		DRM_DEBUG_DRIVER("warning: pcode (read from mbox %x) mailbox access failed for %ps: %d\n",
-				 mbox, __builtin_return_address(0), err);
+		drm_dbg(&i915->drm,
+			"warning: pcode (read from mbox %x) mailbox access failed for %ps: %d\n",
+			mbox, __builtin_return_address(0), err);
 	}
 
 	return err;
@@ -447,8 +450,9 @@ int sandybridge_pcode_write_timeout(struct drm_i915_private *i915,
 	mutex_unlock(&i915->sb_lock);
 
 	if (err) {
-		DRM_DEBUG_DRIVER("warning: pcode (write of 0x%08x to mbox %x) mailbox access failed for %ps: %d\n",
-				 val, mbox, __builtin_return_address(0), err);
+		drm_dbg(&i915->drm,
+			"warning: pcode (write of 0x%08x to mbox %x) mailbox access failed for %ps: %d\n",
+			val, mbox, __builtin_return_address(0), err);
 	}
 
 	return err;
@@ -519,7 +523,8 @@ int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	DRM_DEBUG_KMS("PCODE timeout, retrying with preemption disabled\n");
+	drm_dbg_kms(&i915->drm,
+		    "PCODE timeout, retrying with preemption disabled\n");
 	WARN_ON_ONCE(timeout_base_ms > 3);
 	preempt_disable();
 	ret = wait_for_atomic(COND, 50);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
