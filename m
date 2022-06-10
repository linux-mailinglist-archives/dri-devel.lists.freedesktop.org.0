Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E971D54671D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 15:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44DF10EB33;
	Fri, 10 Jun 2022 13:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027EE10EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 13:09:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v14so10213298wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvMLQyCpX4I7EUgax4yyuPoiR3vnUAJVSMXTDQWafgE=;
 b=L6IIf5wmRxBm24rEsS8xhGTOFhip3gH3gRygBHAg3oTaILjMQNPDXFjKkHT4SSc8rm
 xm9+dSpqI8sMs2OK0arBHn5FXweTnx98aiS82EZiIZ7cQTYGAGULv16DEI0MtAf+U0Vn
 z0i4AnDEEq2qkPWxICHmtY5tfAP/wi/pNzSX7Xt6tbJOLTf++7F4U5I+7kHUKQul58jJ
 i6U6R9guUi9DSRys/+rjQnlqVZfzFo/3+bVawcBI4hD+GW0+bPPqZrIZj/jJsZ7rrVYu
 YtyCZpytxv4sqklcFL2d94sUTXgqZGfJha35Ek1WNDNSzyt7Xz2tctbdWj7MCz8YHzFG
 HTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvMLQyCpX4I7EUgax4yyuPoiR3vnUAJVSMXTDQWafgE=;
 b=liKVna8KQCNKSUVsxfp/2xJHEROJTnOoBe74pB7aL15LNr9a1+VlpwobGiXOLBsRY9
 xiWrh56hojD/YtUY+dRwoAHOSzIeb0zH71qjdoJhq4TKhx//6kVymQNKPUpA7cgf1n4i
 2rAMxFXuU9Q03BP5IsjxyifUTvdA/PyaVs3FdWpeCqGzTIOeUNLr9E33Tfaa1CnzUT3t
 bZb9Xgl7eSdw/OFNoRCqSwlDlK9OySRZHLdM31IucWr9ApooF8MmsPmL5n3gYmiXMKQl
 GJTnYU5R/HkBXw8VDtDUUYVi7fXO6QyQ/dfKssUaKoLTV3z+XxhmrA8TE4Q5HFBll5Ev
 MYWw==
X-Gm-Message-State: AOAM5331/CHXkIpYZewLvVqt5UKFCJiOHGQL5y1TVfqFmA/UQbxfIMZC
 62PBTjbHnknd+c26xHs1az3nvFmhpfc=
X-Google-Smtp-Source: ABdhPJxRp/vG1p3S2vxxtMjDLuILpuLc+WEs+fRfWsUGVN9ZTFMSlgcLcbG2FQQJo0IfsOUlZkWGwg==
X-Received: by 2002:a5d:64a3:0:b0:218:639a:d7ff with SMTP id
 m3-20020a5d64a3000000b00218639ad7ffmr13740128wrp.191.1654866567956; 
 Fri, 10 Jun 2022 06:09:27 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 i7-20020a1c3b07000000b0039744bd664esm3128174wma.13.2022.06.10.06.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 06:09:26 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: Fix SDVO command debug printing
Date: Fri, 10 Jun 2022 15:09:25 +0200
Message-Id: <20220610130925.8650-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some point the DRM printers started adding a newline after each
print. This caused SDVO command debug printing to look weird. Fix this
by using snprintf to print into a buffer which can be printed as a whole
by DRM_DEBUG_KMS(). Code is heavily inspired by i915.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 62 ++++++++++++++++---------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index a85aace25548..bdced46dd333 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -400,26 +400,38 @@ static const struct _sdvo_cmd_name {
 #define IS_SDVOB(reg)	(reg == SDVOB)
 #define SDVO_NAME(svdo) (IS_SDVOB((svdo)->sdvo_reg) ? "SDVOB" : "SDVOC")
 
-static void psb_intel_sdvo_debug_write(struct psb_intel_sdvo *psb_intel_sdvo, u8 cmd,
-				   const void *args, int args_len)
+static void psb_intel_sdvo_debug_write(struct psb_intel_sdvo *psb_intel_sdvo,
+				       u8 cmd, const void *args, int args_len)
 {
-	int i;
+	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	int i, pos = 0;
+	char buffer[73];
+
+#define BUF_PRINT(args...) \
+	pos += snprintf(buffer + pos, max_t(int, sizeof(buffer) - pos, 0), args)
+
+	for (i = 0; i < args_len; i++) {
+		BUF_PRINT("%02X ", ((u8 *)args)[i]);
+	}
+
+	for (; i < 8; i++) {
+		BUF_PRINT("   ");
+	}
 
-	DRM_DEBUG_KMS("%s: W: %02X ",
-				SDVO_NAME(psb_intel_sdvo), cmd);
-	for (i = 0; i < args_len; i++)
-		DRM_DEBUG_KMS("%02X ", ((u8 *)args)[i]);
-	for (; i < 8; i++)
-		DRM_DEBUG_KMS("   ");
 	for (i = 0; i < ARRAY_SIZE(sdvo_cmd_names); i++) {
 		if (cmd == sdvo_cmd_names[i].cmd) {
-			DRM_DEBUG_KMS("(%s)", sdvo_cmd_names[i].name);
+			BUF_PRINT("(%s)", sdvo_cmd_names[i].name);
 			break;
 		}
 	}
+
 	if (i == ARRAY_SIZE(sdvo_cmd_names))
-		DRM_DEBUG_KMS("(%02X)", cmd);
-	DRM_DEBUG_KMS("\n");
+		BUF_PRINT("(%02X)", cmd);
+
+	drm_WARN_ON(dev, pos >= sizeof(buffer) - 1);
+#undef BUF_PRINT
+
+	DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(psb_intel_sdvo), cmd, buffer);
 }
 
 static const char *cmd_status_names[] = {
@@ -490,13 +502,13 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 }
 
 static bool psb_intel_sdvo_read_response(struct psb_intel_sdvo *psb_intel_sdvo,
-				     void *response, int response_len)
+					 void *response, int response_len)
 {
+	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	char buffer[73];
+	int i, pos = 0;
 	u8 retry = 5;
 	u8 status;
-	int i;
-
-	DRM_DEBUG_KMS("%s: R: ", SDVO_NAME(psb_intel_sdvo));
 
 	/*
 	 * The documentation states that all commands will be
@@ -520,10 +532,13 @@ static bool psb_intel_sdvo_read_response(struct psb_intel_sdvo *psb_intel_sdvo,
 			goto log_fail;
 	}
 
+#define BUF_PRINT(args...) \
+	pos += snprintf(buffer + pos, max_t(int, sizeof(buffer) - pos, 0), args)
+
 	if (status <= SDVO_CMD_STATUS_SCALING_NOT_SUPP)
-		DRM_DEBUG_KMS("(%s)", cmd_status_names[status]);
+		BUF_PRINT("(%s)", cmd_status_names[status]);
 	else
-		DRM_DEBUG_KMS("(??? %d)", status);
+		BUF_PRINT("(??? %d)", status);
 
 	if (status != SDVO_CMD_STATUS_SUCCESS)
 		goto log_fail;
@@ -534,13 +549,18 @@ static bool psb_intel_sdvo_read_response(struct psb_intel_sdvo *psb_intel_sdvo,
 					  SDVO_I2C_RETURN_0 + i,
 					  &((u8 *)response)[i]))
 			goto log_fail;
-		DRM_DEBUG_KMS(" %02X", ((u8 *)response)[i]);
+		BUF_PRINT(" %02X", ((u8 *)response)[i]);
 	}
-	DRM_DEBUG_KMS("\n");
+
+	drm_WARN_ON(dev, pos >= sizeof(buffer) - 1);
+#undef BUF_PRINT
+
+	DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(psb_intel_sdvo), buffer);
 	return true;
 
 log_fail:
-	DRM_DEBUG_KMS("... failed\n");
+	DRM_DEBUG_KMS("%s: R: ... failed %s\n",
+		      SDVO_NAME(psb_intel_sdvo), buffer);
 	return false;
 }
 
-- 
2.36.1

