Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCE41B784
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 21:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC86E8B4;
	Tue, 28 Sep 2021 19:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81F56E8B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 19:24:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D56936135E;
 Tue, 28 Sep 2021 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632857041;
 bh=+uYxSqaD7aVPBaKXaT32Yr5tLRoGFr0pFL+5Ay/e56Y=;
 h=From:To:Cc:Subject:Date:From;
 b=HNBMYr2YKcPOeolmmRJogIQ4BKEElzd/WHD5HZ7bOpPYdHd+Aa4Sj5Af3x2216PHB
 DVPW7QrTR+G9RuWhEhTQsc5ygIXAJ6ItscmbGx2wfaq9kuw4JcNRUIZ3dqLviT4rWw
 fLYtbIxNe4Ke+lNQ2otBEPkFjuq57NN2atgrEKMXs+oqnmxir305Uid08jOBw1VB7y
 hlfNIja/5Dp5ifw/BKCJQT7FohkesAfeEwSbV/hCwqvcfR2YknFnSApoRXw+n74oq9
 plzAafbM/RMg7knADtibv50AiSZxOLuuj/IMuqe79IR304veQAB5moXvAw37SwXqm/
 wQsiLELWiQvLA==
From: Nathan Chancellor <nathan@kernel.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/kmb: Remove set_test_mode_src_osc_freq_target_{hi,
 low}_bits()
Date: Tue, 28 Sep 2021 12:23:38 -0700
Message-Id: <20210928192338.1987872-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.591.gddb1055343
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

clang with W=1 warns:

drivers/gpu/drm/kmb/kmb_dsi.c:812:2: error: unused function
'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
        ^
drivers/gpu/drm/kmb/kmb_dsi.c:824:2: error: unused function
'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
        ^
2 errors generated.

Remove them, as they have been unused since the driver's introduction in
commit 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver").

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 1793cd31b117..ae24c5fc35a5 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -808,34 +808,6 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, u32 dphy_no,
 	}
 }
 
-static inline void
-	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
-						   u32 dphy_no,
-						   u32 freq)
-{
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[7:0]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
-		       (freq & 0x7f));
-}
-
-static inline void
-	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
-						  u32 dphy_no,
-						  u32 freq)
-{
-	u32 data;
-
-	/* Flag this as high nibble */
-	data = ((freq >> 6) & 0x1f) | (1 << 7);
-
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[11:7]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
-}
-
 static void mipi_tx_get_vco_params(struct vco_params *vco)
 {
 	int i;

base-commit: 93ee1a2c0f08345ab17c51198f725d4c95984f4c
-- 
2.33.0.591.gddb1055343

