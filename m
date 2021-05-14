Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF0380AC8
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 15:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45C36EE8C;
	Fri, 14 May 2021 13:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5276EE8C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 13:54:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B88A96145D;
 Fri, 14 May 2021 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621000458;
 bh=haYYppupxvHuhUIKA3QMcFKRuxX9YTEisX5WRN7glNs=;
 h=From:To:Cc:Subject:Date:From;
 b=JITqAa6PVGHDm2jgSPG4RO7XwojkLMDFukp6ytGeWwTHklP1fCLIetId/duPWnh3C
 xJTMtQwZ4ujnRrTZiCIEoTPGJv4HWvsYzcO79j2k5r3gvyD4CCcvLQD59snvjDXDOQ
 H/+XhRIEMe+puYhqVqT5RwqZHhzB6jaSiIF4IfertEVkeRzeT0cdf5XlQVW9GM2uki
 ICnmPEpnJEDSYPQvcYytX1c4PB7sJnJ1m8e3IJGkP70Tm3v1OtaOM932QMdPVSeOry
 PFK4dkmjRhJOclJA0yXO4GVSAideUMgDD0qOuB5RWxUma9iMaFxM5KBGAlP1h5TNWh
 7sU3Qi+fEoAfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: fix 32-bit DMA address calculation
Date: Fri, 14 May 2021 15:53:18 +0200
Message-Id: <20210514135328.2543521-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc points out an invalid bit shift operation on 32-bit architectures
with 64-bit dma_addr_t:

drivers/gpu/drm/tegra/hub.c: In function 'tegra_shared_plane_atomic_update':
include/vdso/bits.h:7:40: error: left shift count >= width of type [-Werror=shift-count-overflow]
    7 | #define BIT(nr)                 (UL(1) << (nr))
      |                                        ^~
drivers/gpu/drm/tegra/hub.c:513:25: note: in expansion of macro 'BIT'
  513 |                 base |= BIT(39);
      |                         ^~~

Use the correct BIT_ULL() macro to always generate a 64-bit mask.
Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 79bff8b48271..bfae8a02f55b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -510,7 +510,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	 * dGPU sector layout.
 	 */
 	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
-		base |= BIT(39);
+		base |= BIT_ULL(39);
 #endif
 
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
-- 
2.29.2

