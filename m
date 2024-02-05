Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E880849E1B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 16:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E40810E4EA;
	Mon,  5 Feb 2024 15:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="lsJ7xPwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3210E4EA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 15:28:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4TT99m6LV3z9t3f;
 Mon,  5 Feb 2024 16:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707146572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uta2Nryx0fYmEgPuIsmh9A9sOCuB/mTE4m8nKAVHA8Q=;
 b=lsJ7xPwSdL7B4+pW5JQoBa6ENjytk87Ee0zBakVyxREbgOL2C9gYzXJeDDZRMbgD/qWdQq
 mwg5aeXNeIzoxIKw2LxUVZ441guKRszDAcVXXTDPjX3utFo/UTOfLuHUZY5Enf/ZW7hpjS
 Zx0MI/tfdJyVeLHMZzTtLFPiJo7sQHo9txDOkcC6npxzMowoj+EP8Narobrcsm2gIlz9BI
 0muEV9WrFEWOwFiaM77bQgxbR1hFiV6h+HBjPaCrQpaSVyN+PEkdo7WDpF12IgGT/HR15q
 JU5CkoOGdD9oUJr/wGfx1pspbYRnzO64z9VAAA3aR8oZddnODhXNpDgZ2ppuaw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 05 Feb 2024 16:22:24 +0100
Subject: [PATCH v2 1/6] clk: sunxi-ng: nkm: Support constraints on m/n
 ratio and parent rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pinephone-pll-fixes-v2-1-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=SMz7oXCauq2UtH/EdNshDEESJjkCnkK/ixNVXPl/TYE=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlwP0+pe4JnotZRs/UXF6HlNDa9bl3VgkiZTM5l
 VEOUAv9h1KJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZcD9PgAKCRCaaaIIlErT
 xwlIC/9hxvGWs1GKMhVzxbaLGtyJWEFaVNQr/lzeqPpbqBCYwSOV7ckyAre1awUZ4uAEAp8GanA
 nDGgiORBExs5h1YYGQz0MD8ETP4OlPQndoEuXT8uaAPKHpNoPp/pjsAwBvrcjDIQ+1BWeOli9ZY
 r+NmL0jCdaGn98KSlLJKBcdlxLEt4Ywr+KPPuBH1sAdRdXOiw2K4smqlFs9QqD+5COCTF77i7sz
 LwpF8Awp+DyrobksONjAMf5F9tr8fvL3V/0HaMdYNchBXM7oLJUlvFGzRwSACUNxO/o59bHYu1N
 9x9kkChfsztI65nTzq1CVTGyuAomU+Fwh008WXOnQ86gFRwJdywtOr4Omkbk8oFz5XVF2x9jgwB
 8KcFHIfLwp7bSBqkmYDYEjAdgTKYvtJHfmR1uEChNJ7Mo6nJSY8fsiHG42eI+aovsapCCme+hO1
 PoIeFzFK/l6aw12HdOY4xCBZpNbpy0f1FtS2gvYFoEEkHI8oN2LSIBaRjA89ONrBWZjuU=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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

The Allwinner A64 manual lists the following constraints for the
PLL-MIPI clock:
 - M/N <= 3
 - (PLL_VIDEO0)/M >= 24MHz

The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support for
these constraints.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 21 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 853f84398e2b..1168d894d636 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -16,6 +16,20 @@ struct _ccu_nkm {
 	unsigned long	m, min_m, max_m;
 };
 
+static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long parent,
+				  unsigned long n, unsigned long m)
+{
+	struct ccu_nkm *nkm = container_of(common, struct ccu_nkm, common);
+
+	if (nkm->max_m_n_ratio && (m > nkm->max_m_n_ratio * n))
+		return false;
+
+	if (nkm->min_parent_m_ratio && (parent < nkm->min_parent_m_ratio * m))
+		return false;
+
+	return true;
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -31,6 +45,10 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 				unsigned long tmp_rate, tmp_parent;
 
 				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
+
+				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
+					continue;
+
 				tmp_rate = tmp_parent * _n * _k / _m;
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
@@ -64,6 +82,9 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
 		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
+				if (!ccu_nkm_is_valid_rate(common, parent, _n, _m))
+					continue;
+
 				unsigned long tmp_rate;
 
 				tmp_rate = parent * _n * _k / _m;
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
index 6601defb3f38..c409212ee40e 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.h
+++ b/drivers/clk/sunxi-ng/ccu_nkm.h
@@ -27,6 +27,8 @@ struct ccu_nkm {
 	struct ccu_mux_internal	mux;
 
 	unsigned int		fixed_post_div;
+	unsigned long		max_m_n_ratio;
+	unsigned long		min_parent_m_ratio;
 
 	struct ccu_common	common;
 };

-- 
2.43.0

