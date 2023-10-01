Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935847B46C1
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B1F10E1F3;
	Sun,  1 Oct 2023 10:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490310E1F3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:26:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 40800B808CE;
 Sun,  1 Oct 2023 10:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74055C433C9;
 Sun,  1 Oct 2023 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696155966;
 bh=V7OXee8raUC8dwb0bE/FHj2NE8mjYScLr3Xy6xI6M8w=;
 h=From:Date:Subject:To:Cc:From;
 b=N80L8JfpgWjWlJsiV3V1Nn9qRslzlMmC9FqQdcakAFy4pf1S//kWMYSJXQ2twoa6l
 WBxzinVVKCTazkbAYGW8HqAs8VbG9e0h4tnOKR/xe9di0Pd1VRfCqfnv0vQDZEjYge
 nJKgLGHvVkB1mgSLkR5MF1pppld2Wh8FME5oSGA61oeAAUrpNEgO+zTDn5gu2Pc5m6
 so168JQE6fOQl68x9uorLhHrLNBPjT4N3kCFR5MDM2urbpdlPtcIQNoy+8mDHLxT3l
 DJSNpvOJiMBy77VuJ6c29UkHaTv15LN0k4fctRtfhzVGbiXpkrTqUNJM8xeV2hPCDE
 gRAiM3kO6aHLA==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 01 Oct 2023 11:24:49 +0100
Subject: [PATCH] drm/bridge: lt9211: Convert to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-drm-lt9211-maple-v1-1-1cf74fb10991@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPBIGWUC/x3MQQqAIBBA0avErBvQiSi7SrSwnGogLTQiiO6et
 HyL/x9IHIUTdMUDkS9JsocMXRYwrTYsjOKygRRVypBBFz1upyGt0dtjY5xpVK1q7OTqCnJ2RJ7
 l/pf98L4fUvH3PmIAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V7OXee8raUC8dwb0bE/FHj2NE8mjYScLr3Xy6xI6M8w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlGUk7Pbq47HdMAkKf8TTVJkgCz7sN/pPbocs8f
 n4PSEdATuGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRlJOwAKCRAk1otyXVSH
 0JvKB/9gAuu+FkI5060DDDy64WpKt3+zKAM4KyMlW/FpnC18Qk9M1sx7PKpP2xRYpiZpXYrZ2+f
 +X7uFSzbRkPlgrWTppzExOFTxG1M/HaqlX5kJwKwH/kWRvMDcBIiPUms1FlbrkFMVMzb3th+Msh
 O1h/4cGSiEiKvGU2PW5ln/vyeWGSXriB55wQWqse+7aqkWZW5gRgU8mE1qmShLt5a33YIIXQGos
 iy5mE7cuFtYUD4bpDjbmuKos5M6ouGZd/rhe/EorSq5InJfqe+ULMm+JgoLLT5dud3I7OaTHUw9
 m8vilck7pmNRRhjR5ThzArxTsQ64YNToqeOVZIvInLfgi0F4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 4d404f5ef87e..c8881796fba4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -89,7 +89,7 @@ static const struct regmap_config lt9211_regmap_config = {
 	.volatile_table	= &lt9211_rw_table,
 	.ranges = &lt9211_range,
 	.num_ranges = 1,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = 0xda00,
 };
 

---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230929-drm-lt9211-maple-f2b0807acd53

Best regards,
-- 
Mark Brown <broonie@kernel.org>

