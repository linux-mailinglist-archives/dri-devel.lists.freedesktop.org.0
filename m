Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE27B46BA
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471C310E1F1;
	Sun,  1 Oct 2023 10:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB9D10E1F1
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:24:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF12A60B87;
 Sun,  1 Oct 2023 10:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552FEC433C8;
 Sun,  1 Oct 2023 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696155866;
 bh=HXGeAMZr4b28kGCpvXR8zaxGeeL/xNxHkFhtrUEbvvA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hZKEMFg9c8PCe2pzd9h4YdUxbxfFn4eKADK0KsByzGHRZFKsKTUBqbPSHkLBLn+Gh
 75b4m5daka8Vfpvt7ghlVqHOGLASK+aPF2gJqYsbYnTsll3GdcuE6CKKn7/vTlXsKM
 eJcnYW+1cdTAXkTNWIZaLdqM9KrPpCmdKk7mDQ5DPwzp+62M+0JnBjOT5+g2Ndorg4
 Su78W53ZZikL0IV1Xk0ri7GRNtM3OH4vTZMRf3gJdrnsN7GRVX41KCQ12JXhzbzpL8
 w9xyLc1GT6xzst2mO8zPLA31zbjoh4d1sOOuudnCTZoOgxWs769P3liu7VXLXHcdFy
 02H+PS4LBL9iA==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 01 Oct 2023 11:24:13 +0100
Subject: [PATCH 1/2] drm/panel: ili9322: Remove redundant volatle_reg()
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-drm-sn65dsi83-maple-v1-1-5519799a55e5@kernel.org>
References: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
In-Reply-To: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HXGeAMZr4b28kGCpvXR8zaxGeeL/xNxHkFhtrUEbvvA=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhlRJj8sv7G4HuGfPT89eULPD9bKlwxLbM/cNucMSV/ata
 ElInfSrk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYiK8Y+/9SHoN/QZUZ6Z7G
 Dyq/li3kX71YlXHHYi9Hz8p7HwW+nbwYt2m5N3vbm/fRXNcXJN/2MFZoPv5et35T54nWpIxF8r2
 7V9fP3xMd8/dOox5re9QLs3xNpgQ906bfx65PkU40PdeTn2EuuetBtP6RRVc733RFrdI4OsvBeU
 12FnMEX3uuh32b3cq6K36KL6e4fyo+FmhidORB29GkyNfJ67+G7Tm9etk33jOyFeUxfn2W76PEI
 7bxGMYcuX6loUlc2d9uBa9hYbBNwFLOoFd1HeeTpzbez3rC4elQ+Lfp/a7ay6FPNzi8rmOMvVE0
 /1Vn5MHcCVGGLLdcPgcvEpyT+NW2eQqLA9vsNJs9lovDAA==
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

The ili9322 driver has a volatile_reg() operation in it's regmap which
always returns false. This is redundant since it is the default in the
regmap core, remove the operation for a trivial code size and performance
improvement.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 61c872f0f7ca..15b81e5228b5 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -325,11 +325,6 @@ static struct regmap_bus ili9322_regmap_bus = {
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
-static bool ili9322_volatile_reg(struct device *dev, unsigned int reg)
-{
-	return false;
-}
-
 static bool ili9322_writeable_reg(struct device *dev, unsigned int reg)
 {
 	/* Just register 0 is read-only */
@@ -343,7 +338,6 @@ static const struct regmap_config ili9322_regmap_config = {
 	.val_bits = 8,
 	.max_register = 0x44,
 	.cache_type = REGCACHE_RBTREE,
-	.volatile_reg = ili9322_volatile_reg,
 	.writeable_reg = ili9322_writeable_reg,
 };
 

-- 
2.39.2

