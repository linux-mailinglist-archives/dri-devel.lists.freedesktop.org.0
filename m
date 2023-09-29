Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F27B32E3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 14:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B810E70E;
	Fri, 29 Sep 2023 12:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C76310E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:54:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 77EFBB81F20;
 Fri, 29 Sep 2023 12:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57D9C433C7;
 Fri, 29 Sep 2023 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695992067;
 bh=tRnpRfGBeMRp6IfZrKTVrBAhPucr7GxiZi16rzQMy/U=;
 h=From:Date:Subject:To:Cc:From;
 b=PBdROqmNKMZivlZmtimCUCf3QH4ML15A21US8hDmDSA8l3sPo8OhWcyOmIvHxtck+
 sVkggJOMiIkd5zHAyuu4dsAXwmrLX/83QkRcBentBUfci+nDzLYJG6tSwpoMFKNKi5
 KLo1aqK+VR/WNaXsL6apyvth2QPLP9I4MprrHgoE/nuEhxkRsjbQd1303lSZvx8I7D
 QVTSTk5AJO/TT1JUeQb+ml+hMyLtmR5LG8v6KsEPqCjRdeeEFUMhtwhntqcWj0gYC0
 KDab9T8wZEj/s/2GmJaGXwyLiBKGnGtG/wfHtU9LVwT5ayyjFk/98RBJUZz/P967jh
 bHMxlubh3ZaYw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 29 Sep 2023 14:54:19 +0200
Subject: [PATCH] drm/bridge: adv7511: Convert to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPrIFmUC/x2MQQqAIBAAvyJ7TtANKftKdJBcaw9ZKEgg/j3pO
 AMzFTIlpgyLqJCocOY7dtCDgP108SDJvjOgwlFZtNKnSzpfJqO1RG+6Qh1mh9CLJ1Hg97+tW2s
 fxMjI6l0AAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tRnpRfGBeMRp6IfZrKTVrBAhPucr7GxiZi16rzQMy/U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlFskAjFhsjZWz0XIa6I5wBGauk9FhkkAthyvLS
 3FzaycQku6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRbJAAAKCRAk1otyXVSH
 0JiyB/wOZy4CMdhPJKQhW70zxNq/FfxPnYM4DDO2HtKSVfAsdfz1uBuqw5FwWSuCHf4kMR3QEEY
 /h2/b+kVBYuYe5xB7U7RVzOqJ3YAk7k78NjWKmqxByH+2iZfc3CmEhLLo04dir4ExdvOxmDiycA
 t6QuZVirLXBkz2UDd0fVLEUUZ43BkUGylC2qrw66pz3BZt7tmju2fUrdJ0vGn5l4kbk75o+5AVl
 5lI4VLX2Lv9RsSFqgZe5lUk7YJ8IBTGLjvuuRkxjHrN7/hMz59MG9Bz/zDtk+NBq2ae/QKf6MgC
 ldk+SwQuQ8+Z7VjaCQqAOFCAQmclsWyFQTJ0bMlU3WjAU+fT
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2611afd2c1c1..d518de88b5c3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -121,7 +121,7 @@ static const struct regmap_config adv7511_regmap_config = {
 	.val_bits = 8,
 
 	.max_register = 0xff,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults_raw = adv7511_register_defaults,
 	.num_reg_defaults_raw = ARRAY_SIZE(adv7511_register_defaults),
 
@@ -1068,7 +1068,7 @@ static const struct regmap_config adv7511_cec_regmap_config = {
 	.val_bits = 8,
 
 	.max_register = 0xff,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.volatile_reg = adv7511_cec_register_volatile,
 };
 

---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230929-drm-adv7511-2d592921f8a2

Best regards,
-- 
Mark Brown <broonie@kernel.org>

