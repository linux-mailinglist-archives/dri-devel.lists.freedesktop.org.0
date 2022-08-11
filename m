Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271EA58FF61
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C45B4324;
	Thu, 11 Aug 2022 15:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234B4B431F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:29:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77C6861602;
 Thu, 11 Aug 2022 15:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDBBC433D6;
 Thu, 11 Aug 2022 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231757;
 bh=MFVDAdiLEuXcjEP1yPc7pO6eheduwbIcKJcSuRY9kVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NowL7M2YlJC/+wQEd8fyTAIehcBtTLeaONuJnAEa7tIFHCZjhQkp4c/Hb44KR7eoV
 eSsKiiTHrkKw26Di+EfHLHjL4vQMSUDcJ2JmDdD7F+nvoXqf5QOspjspTOpdQkftYg
 XZSK/mXJDWJ//idmHNgDYD20VCfsm0BOt7m3PO8wVqnEKlIPwdq/KZynZrZSgWitmt
 zGEMvXRi8tOPEUjsl5orh8Nxai548RaXRt8Q8fMB0fbDgGzESBCsUcrx4ykGjUFjE4
 qYQ+7TkA7D2H1yOV7XK4utXH1EN+ljIe3GjG9DHtLxRr3FOWbncsQ2RBhdk0RcmTAg
 AxZ0MfRtry/jw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 006/105] drm/panfrost: Handle
 HW_ISSUE_TTRX_2968_TTRX_3162
Date: Thu, 11 Aug 2022 11:26:50 -0400
Message-Id: <20220811152851.1520029-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

[ Upstream commit 382435709516c1a7dc3843872792abf95e786c83 ]

Add handling for the HW_ISSUE_TTRX_2968_TTRX_3162 quirk. Logic ported
from kbase. kbase lists this workaround as used on Mali-G57.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220525145754.25866-3-alyssa.rosenzweig@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 3 +++
 drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_regs.h   | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index aa89926742fd..295bef27fb55 100644
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
index 501a76c5e95f..41a714ce6fce 100644
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
index 0b6cd8fdcb47..accb4fa3adb8 100644
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
2.35.1

