Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB4817B14
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3AF10E377;
	Mon, 18 Dec 2023 19:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9E110E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:32:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Sv1736BG3z9srG;
 Mon, 18 Dec 2023 14:35:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1702906559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhH/bcgkoYYVusGSERNWzcLW4QNviF8TX6rnqWIzeCk=;
 b=R36Ei/tlA/gFrncF84P2coFPyvM/2UGH+zakg6uG0U2xBTPmMgBtM/aJDBiAOy7qbE++a1
 u0eqzA6MY87MmDoGspbgp7M3GoPMF2seV4yqJrx4bSFKuHO64sFzxgmis8I9NmyDagi6KP
 Eaj7zcOsm9Yv1Dt2nIh1riZkpicGycYuif/tK27Ch9i7zn+sUMfpF3g92cRsLZ9S7fUl4O
 jZ1Wk2Y6Kt5Q+PIARxMjra8ChiJvwJVcFu8AFnIm/oyu9xBUjQQ2RoOSSNhzQ4rdc70dqS
 aa6Z+qQIhhMqFXorBq31wf7cWiRwSIh8tSnGHxKVLbd5Ujy9aohAaNk4eIFoag==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 18 Dec 2023 14:35:19 +0100
Subject: [PATCH 1/5] clk: sunxi-ng: nkm: Support constraints on m/n ratio
 and parent rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2994; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=Rra44nc/cyGyhsB+ze6yf+US4TD8Cx4NQMigrd6Oh5g=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlgEq050/yrkshXjJqwGSt+TqqVkIWZwZHmQeVe
 ZO1qf59R+CJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZYBKtAAKCRCaaaIIlErT
 x4L5C/9hvff5Q65+OLSZfpUZPdoijXeP/TEQl4/8FkstsruiiD336QDB9l0KY9TIo7BmfDG2Xm+
 6bQ37ParFNTIddTR5t/iJ7aqaJpqNd23/AkVelTS77zBSnIFhhnA4TWq6ECVkq2aaEaHMnPXgAR
 BzbHRdygkHfhaFtwBU/Bq15B06d4Hp6vDO7+rSO2FQkdE4oKY6Hm3231xgcYZPu+juai/M+KsGE
 iiotrp0y0jlpiyp//LWdJjzRCVKFO4tJR0QgpxpaynX6aBeRM1F/FMOBk6KlZ7i3e9g5cZ1+9s+
 1y6AB02qRwDcggQHFQBcASrjApe/l9ACg4BS9tON9u1mIjZuO/wrskwtE+ivHbUkv3Tu9iPJtTW
 15E1DOzSZGI0Kv0FT7L0I7SkSYjiJtGxXtjTw6Eu47FadaMMcxAVwxmMO6YN3rZ1jP68JHHOym0
 6k4mMUr8/uHhjdGUt3trg58gYdjbUOzeYL30hTt7PNh0tRJBeOUSQhRjpdaGQDh6ScLK4=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner A64 manual lists the following constraints for the
PLL-MIPI clock:
 - M/N >= 3
 - (PLL_VIDEO0)/M >= 24MHz

The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support for
these constraints.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 23 +++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index eed64547ad42..2af5c1ebd527 100644
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
+	if (nkm->max_mn_ratio && (m > nkm->max_mn_ratio * n))
+		return false;
+
+	if (nkm->parent_wo_nk && (parent < nkm->parent_wo_nk * m))
+		return false;
+
+	return true;
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -32,6 +46,9 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 
 				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
 
+				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
+					continue;
+
 				tmp_rate = tmp_parent * _n * _k / _m;
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
@@ -65,6 +82,12 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
 		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
+				if ((common->reg == 0x040) && (_m > 3 * _n))
+					break;
+
+				if ((common->reg == 0x040) && (parent < 24000000 * _m))
+					continue;
+
 				unsigned long tmp_rate;
 
 				tmp_rate = parent * _n * _k / _m;
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
index 6601defb3f38..d3d3eaf55faf 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.h
+++ b/drivers/clk/sunxi-ng/ccu_nkm.h
@@ -16,6 +16,12 @@
  * struct ccu_nkm - Definition of an N-K-M clock
  *
  * Clocks based on the formula parent * N * K / M
+ *
+ * @max_mn_ratio:	Maximum value for M / N.
+ * @parent_wo_nk:	The minimum rate the parent must provide after applying the divisor,
+ *			but without applying the multipliers, i.e. the contstraint
+ *			   (parent rate)/M >= parent_wo_nk
+ *			must be fulfilled.
  */
 struct ccu_nkm {
 	u32			enable;
@@ -27,6 +33,8 @@ struct ccu_nkm {
 	struct ccu_mux_internal	mux;
 
 	unsigned int		fixed_post_div;
+	unsigned long		max_mn_ratio;
+	unsigned long           parent_wo_nk;
 
 	struct ccu_common	common;
 };

-- 
2.43.0

