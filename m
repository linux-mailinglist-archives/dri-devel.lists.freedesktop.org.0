Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3836A9952E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 18:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4B510E6D4;
	Wed, 23 Apr 2025 16:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZrWWoK2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A821910E6D4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 16:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2422A4BD17;
 Wed, 23 Apr 2025 16:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CBAC4CEE2;
 Wed, 23 Apr 2025 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745425939;
 bh=TOWmoiV7dROcpvE8FI0qo5GdrkaDw81r/N34kGCjJtY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZrWWoK2FIyu47dEDN67BKoV+SEHzd7+JgGowrCnt5CO4JbrhU8uqabYPDlfvKPZF0
 SQs2xCD0CzM1tM8890V0fAc2K4n94XpC/GSEzVeOsSSLMOJD//XV28HhSjx2HrsrqR
 YRrMvqIvE0BwU4YM5UVF6LS9yGTYIMRWYkd9WmvVyYq3t1GFSLlzgU1mg1U6aI4lwn
 S5U7Btx+YvuUPlgOQwWgRJ23kb4EdCO+pzLckbCdRi7a6bWbAuUsoMexbRc3/vyevB
 kTKz+DcMGSD4ToIYk8BeZZE+3SI/o805BEGEbNWIR1YXQs0WziLJQ8dn60+bdrydF3
 PafBwb7rydKAg==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
Date: Wed, 23 Apr 2025 18:32:07 +0200
Message-Id: <20250423163214.2276114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

goa_even_valid is only initialized in one branch but not the other:

drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
  838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
  842 |         if (goa_odd_valid != goa_even_valid)
      |                              ^~~~~~~~~~~~~~

Change the initialization to set it to the value of the condition instead.

Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index b48b350b62da..4f548430654a 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -835,8 +835,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
 			num_zero++;
 	}
 
-	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
-		goa_even_valid = false;
+	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
 
 	/* Programming one without the other would make no sense! */
 	if (goa_odd_valid != goa_even_valid)
-- 
2.39.5

