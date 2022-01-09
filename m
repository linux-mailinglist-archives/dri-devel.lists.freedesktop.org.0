Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05177488AD3
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CFA89FEC;
	Sun,  9 Jan 2022 17:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101C10E814
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:09:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 5E8CB1F4380E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641748170;
 bh=xeOXH/rxXIFjWYifYSehO8x4iP5GuWnkz6SV02KDtok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bX4xDw5eao1mYAO6qY0Xl3o7kbpL47cichIYhJ+JmOdgZs+zK4ncmzh8rbkpBjxZ2
 pvZnnOjc9pm9XXiWlq0GJa18TyeB28qwtgeZ+pg5Oueyxj1YIpyeMGdRk7J4pKwApz
 0YS+DqMOYk0IHflUCvhxZBHcbDhUlqTMZW8u7kWH90mpRBJwUWhcPsyTCJzbvk7/V6
 NSsnAfBCclq8yOOsCIngecYzFgXPeCDbAfTR8tEn4Lmnbeg8HBzDAZZEw1+/MdEFUj
 MUtvOnEY5Xup/WF6zmiS220e5Y8JlnhPhlf8LDhhIHewQpIZoxh2AW/3IQYoM88XH2
 7LM3Je6iWXuZQ==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panfrost: Merge some feature lists
Date: Sun,  9 Jan 2022 12:09:19 -0500
Message-Id: <20220109170920.2921-3-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we only list features of interest to kernel space, lots of GPUs
have the same feature bits. To cut down on the repetition in the file,
merge feature lists that are identical between similar GPUs.

Note that this leaves some unmerged identical Bifrost feature lists, as
there are more features affecting Bifrost kernel space that we do not
yet hanlde.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 40 ++++----------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index f557fad5d5ff..34f2bae1ec8c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -27,14 +27,9 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
 	BIT_ULL(HW_FEATURE_V4))
 
-#define hw_features_t620 (\
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
-	BIT_ULL(HW_FEATURE_V4))
-
-#define hw_features_t720 (\
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
-	BIT_ULL(HW_FEATURE_V4))
+#define hw_features_t620 hw_features_t600
 
+#define hw_features_t720 hw_features_t600
 
 #define hw_features_t760 (\
 	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
@@ -42,26 +37,13 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_XAFFINITY) | \
 	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
 
-// T860
-#define hw_features_t860 (\
-	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
-	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
-	BIT_ULL(HW_FEATURE_XAFFINITY) | \
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
+#define hw_features_t860 hw_features_t760
 
-#define hw_features_t880 hw_features_t860
+#define hw_features_t880 hw_features_t760
 
-#define hw_features_t830 (\
-	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
-	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
-	BIT_ULL(HW_FEATURE_XAFFINITY) | \
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
+#define hw_features_t830 hw_features_t760
 
-#define hw_features_t820 (\
-	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
-	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
-	BIT_ULL(HW_FEATURE_XAFFINITY) | \
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
+#define hw_features_t820 hw_features_t760
 
 #define hw_features_g71 (\
 	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
@@ -82,15 +64,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
-#define hw_features_g51 (\
-	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
-	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
-	BIT_ULL(HW_FEATURE_XAFFINITY) | \
-	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
-	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
-	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
-	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
-	BIT_ULL(HW_FEATURE_COHERENCY_REG))
+#define hw_features_g51 hw_features_g72
 
 #define hw_features_g52 (\
 	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
-- 
2.34.1

