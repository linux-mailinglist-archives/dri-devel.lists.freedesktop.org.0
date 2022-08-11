Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DA590201
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8E18AC71;
	Thu, 11 Aug 2022 16:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A66611A757
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:04:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D772B821AD;
 Thu, 11 Aug 2022 16:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDA1C433C1;
 Thu, 11 Aug 2022 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233876;
 bh=+RjJG6Z5r0AKjZAZ8/wjh2iRo3+7jNEgJwlOOFqzjr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CTJx2A8XPqoX3QyeEBHrbLCRt1tSNPMYZPxb3eLgWJnHeTOX2MmEJTQJMmQMPw06O
 oNQzyt/VmMFsMTN2L5d7q+Y3LJSiL4XYhIdOBqXIrhxlCgQPhBx+ujUBy8coJv+JtJ
 Jmc20RMBEAtXKYjtmaeQkuj7Jld6exbfShyC61zCICE8QkXeOpA1YnbObIzNk2tRYy
 uB1gBXXxd53Soy4l7fuEYWojlJd4js5zgrYsZBMVLVFD6oM9A2pPoWN1GKEh7Han/N
 1Mxedp12tRiJCMEiwNc5EOTqFdubaHaFa/bCFGtO5DeQK2DXYOay3TUX7EGFeXjlPd
 SSxQzv/EeOzMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/46] drm/panfrost: Handle
 HW_ISSUE_TTRX_2968_TTRX_3162
Date: Thu, 11 Aug 2022 12:03:29 -0400
Message-Id: <20220811160421.1539956-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
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
index 107ad2d764ec..d22bb2589cb1 100644
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
index 2ae3a4d301d3..80e5969237c2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -194,6 +194,7 @@
 #define SC_TLS_HASH_ENABLE		BIT(17)
 #define SC_LS_ATTR_CHECK_DISABLE	BIT(18)
 #define SC_ENABLE_TEXGRD_FLAGS		BIT(25)
+#define SC_VAR_ALGORITHM		BIT(29)
 /* End SHADER_CONFIG register */
 
 /* TILER_CONFIG register */
-- 
2.35.1

