Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3117B44A3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 01:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEBA10E07B;
	Sat, 30 Sep 2023 23:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2D610E07B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 23:42:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0D90CE0973;
 Sat, 30 Sep 2023 23:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0F1C433C7;
 Sat, 30 Sep 2023 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696117354;
 bh=0ytQ9HpXby7M4nyyYVZWhOlBlAjnKhVwuxoduMc529I=;
 h=From:Date:Subject:To:Cc:From;
 b=HBYqU0dOI72BQH20m1Lo8lyu8Nb72DuBKjQfBely1aHJTSW+eWXvyNCdlr3rptD8B
 RFvYja/OoFwAy1k+OkQ6iXubYJ1zaE8+6xQdhUB5fIbDaZwsIwLAncByukQLCtfV7P
 p08O3HDnWpNCpE9pHnw2kDt5p+HntbqJKdPMk/i/TZoP48kuClDKhn3Ona31QPQ9UT
 YwcTdlV7sjbnMOhBgoJ2GjZRi7+EkW4AeCk+vDPQkYu0jk0iSfH9QAP0V+NcWHGFt4
 EjaOaszqm8pll9W0y2qUpzyIvC91nnIsp7RuwdZbt7y/yxHp8tG11NY2EDdgl1ngZ4
 gcPyS6Odmv+bg==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 01 Oct 2023 01:42:24 +0200
Subject: [PATCH] drm/bridge: dpc3433: Convert to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-drm-dlpc3433-maple-v1-1-7d71170c010b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAF+yGGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSyNL3ZSiXN2UnIJkYxNjY93cxIKcVF3zVHOzpESLVFPLpFQloMaCotS
 0zAqwodGxtbUAN9FigWQAAAA=
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0ytQ9HpXby7M4nyyYVZWhOlBlAjnKhVwuxoduMc529I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlGLJmecWWH27uJqayRORISTISVlGtL2INSmXwT
 HSS8CHqIeGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRiyZgAKCRAk1otyXVSH
 0F3qB/97JbG/dDX+0unSV53R5soNQR6+Ad75Bk+WuzJoitBUJhOZsUus5YytqAQwJH4woAQULD4
 WfPy4ZwJZz4sxraX9qoX1PqREHMJWCASlY0RXsIy1+SlDZA84FiclVCJ9aTIXc+bWU+680b4AgO
 Us1f8BVm+CeTF+CBjtrvWGYfNf2tQPPQ0GHFQLZ2Uk4x5yhiCQHoPsopQSQYbZjuBHFVeJkE2ts
 ZJghtOKNeI2GbINSFl+rP1gMKn6D+a/YiK4kMJaPK1y8T1d8zcAU20KqD3rPPEjIhLct6WSBKCW
 Hp313vOtZnpXA347SBTCGhRPfsOqCvuE5YW6QKVLe6goophr
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
 drivers/gpu/drm/bridge/ti-dlpc3433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index b65632ec7e7d..ca3348109bcd 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -100,7 +100,7 @@ static struct regmap_config dlpc_regmap_config = {
 	.max_register		= WR_DSI_PORT_EN,
 	.writeable_noinc_reg	= dlpc_writeable_noinc_reg,
 	.volatile_table		= &dlpc_volatile_table,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 	.name			= "dlpc3433",
 };
 

---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230929-drm-dlpc3433-maple-7e76ba8e59be

Best regards,
-- 
Mark Brown <broonie@kernel.org>

