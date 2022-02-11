Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057574B2E69
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2390A10EB87;
	Fri, 11 Feb 2022 20:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1D110EB82
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 68DF21F46DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611262;
 bh=YpsRozX87Lwm/mSXO0U4MSM6AfF4eXH6RKFVLo7Qnoo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFUF9yuBa58vKGvvYjpd7ZmmShFRbQeZfFgmi74dKWZO2hZ/tcftiKm2JNuFuikA5
 Yv0H9y3BvOsc7d4jA6x3arXOlclNgF3bRGQItocMdJMvEh20q7E1tyQdlmMlsF5CE9
 V8sR283x1VD0SVUR6MhYippyP5sqT4NdTb3ZksMxqrNvkBF90041krbgldlaKxk3LI
 SmNW7HrXCgODcd02/jYCCz4P94VgzttlEJAlZWpQWGfo+TSglFBdqxTTriLZmmdqp+
 0oUa2tSckbZrYCmn+xOl3iRSQTe9UdPVG+dqiVZt0hWBW5SLMOH4b28yVTX7MVokrU
 J8cH8u7bGtlDQ==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
Date: Fri, 11 Feb 2022 15:27:21 -0500
Message-Id: <20220211202728.6146-3-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Add handling for the HW_ISSUE_TTRX_2968_TTRX_3162 quirk. Logic ported
from kbase. kbase lists this workaround as used on Mali-G57.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 3 +++
 drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_regs.h   | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 50c8922694d7..1c1e2017aa80 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -108,6 +108,9 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 			quirks |= SC_LS_ALLOW_ATTR_TYPES;
 	}
 
+	if (panfrost_has_hw_issue(pfdev, HW_ISSUE_TTRX_2968_TTRX_3162))
+		quirks |= SC_VAR_ALGORITHM;
+
 	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_TLS_HASHING))
 		quirks |= SC_TLS_HASH_ENABLE;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 8e59d765bf19..3af7d723377e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -125,6 +125,9 @@ enum panfrost_hw_issue {
 	 * kernel must fiddle with L2 caches to prevent data leakage */
 	HW_ISSUE_TGOX_R1_1234,
 
+	/* Must set SC_VAR_ALGORITHM */
+	HW_ISSUE_TTRX_2968_TTRX_3162,
+
 	HW_ISSUE_END
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 16e776cc82ea..fa1e1af56e17 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -195,6 +195,7 @@
 #define SC_TLS_HASH_ENABLE		BIT(17)
 #define SC_LS_ATTR_CHECK_DISABLE	BIT(18)
 #define SC_ENABLE_TEXGRD_FLAGS		BIT(25)
+#define SC_VAR_ALGORITHM		BIT(29)
 /* End SHADER_CONFIG register */
 
 /* TILER_CONFIG register */
-- 
2.34.1

