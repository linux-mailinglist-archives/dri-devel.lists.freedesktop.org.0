Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D57B46BB
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F67A10E1F2;
	Sun,  1 Oct 2023 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E910E1F2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24D70CE0A54;
 Sun,  1 Oct 2023 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19773C433CA;
 Sun,  1 Oct 2023 10:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696155869;
 bh=yoJaYufx0bDHukVriI2up9rpCoy/yNPOKsU2euT4nUs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HsvrXYa4+n75/j7GM6S3kJy/In/n04B2J7QbMZoijCqpx2VN3oJC0M/g0jIGPp5ne
 qIqLGLaUYo/16/U6iehlFfp+aszTeZF1eaX97SAAAU9ieLPpPx0muJ8okGfI/rGEQH
 gD2PEfp26SQgbLmVTGGTh9vmfRdp1jd7UuK8RreuBvcdo/UV6iDaO5DfRdqyiGZpIP
 pi8UjxtSYLQpkcQ2N9o9/dACMRvDkMRM5MDi76+7Eg/6fEBLqrxxfZEN7vUJQBmPeh
 Kbe5xg2ab9YGkrdVx4aVzV6jWnvcv7FejFjsS9fR2PJPNVeoJMkkzHlwgm6YZGL5PY
 WaIU0F7A6umLw==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 01 Oct 2023 11:24:14 +0100
Subject: [PATCH 2/2] drm/panel: ili9322: Convert to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-drm-sn65dsi83-maple-v1-2-5519799a55e5@kernel.org>
References: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
In-Reply-To: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yoJaYufx0bDHukVriI2up9rpCoy/yNPOKsU2euT4nUs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlGUjUbXAPIdcoIRaC7s5THEK47MDpYdRSIEfxh
 0NG/vkXOGCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRlI1AAKCRAk1otyXVSH
 0GZBB/sFh5p2w/DzoAd52ovSQCJ9Yk9dNho4/e/uF9fmrOQuWI1OiHPC18DjG1UYqn68tTH7N28
 NKQqEOahpkorLzercnkkhVj0j4FWnZqcoerfBVGiB2v7gnvW0bV6GLY9lkh35GM0aF5mCLIBQ0F
 Ccjpdu5q7bmkYLBYNAwIkK1dtmUGfbLNXUBY+4MQodxjDZMiIYx6yQbOfCOoxhFQ17tfuMa/FJN
 sCEoVh4MquIQvUporpy4eZ1WSgRbNS5zq+3uFt6Ty/vIbh/bizE4uE/6mdlynRrHUhcAbWhjOQ5
 IqPHS3ilhqu+9+0foiKHkUewvKmN7PFtwhd/ZT6/FaOw33fe
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
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 15b81e5228b5..4a6dcfd781e8 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -337,7 +337,7 @@ static const struct regmap_config ili9322_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x44,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.writeable_reg = ili9322_writeable_reg,
 };
 

-- 
2.39.2

