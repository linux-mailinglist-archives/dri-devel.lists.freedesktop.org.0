Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094264B2E66
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DAE10EB83;
	Fri, 11 Feb 2022 20:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A3710EB84
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 8D4BC1F46DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611264;
 bh=Zy+MUtoNN87qk7Jck89n2yvVWUk0jhM3HgKR47z9nvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TF7H60Xu6+Dl0o3c/L63qOZUhqBB6EXz82z9MDmCZvyXT17aP9QQRvyndwArLsI8b
 GpRJRxKpzI/NukAOe3pmFH333w0UbxYSaqdT118N0YGEkUSe+9Ey5pHhGN7vV5U7TP
 SkDPCbA+idc8PaRRdSq+3+Clem6NLMkHeuFOSFKkTx19COOqfgt9TZ9ecELUJgb8TK
 72k9sOGtGiHG1yzsBXi73RCvu+Nvr9T4iF3LRMTpRI3sUePTxp6Nh8jTCeVyx5ID3c
 GfqIpc5uBQwVjYPNwIsX2A6Z7zXdtPCn0km0s5x1R26u9pqJlA6T/6km7NmgvMBhea
 VJf84uxWW5wpA==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/panfrost: Constify argument to has_hw_issue
Date: Fri, 11 Feb 2022 15:27:22 -0500
Message-Id: <20220211202728.6146-4-alyssa.rosenzweig@collabora.com>
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

Logically, this function is free of side effects, so any pointers it
takes should be const. Needed to avoid a warning in the next patch.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_issues.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 3af7d723377e..a66692663833 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -251,7 +251,7 @@ enum panfrost_hw_issue {
 
 #define hw_issues_g76 0
 
-static inline bool panfrost_has_hw_issue(struct panfrost_device *pfdev,
+static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
 					 enum panfrost_hw_issue issue)
 {
 	return test_bit(issue, pfdev->features.hw_issues);
-- 
2.34.1

