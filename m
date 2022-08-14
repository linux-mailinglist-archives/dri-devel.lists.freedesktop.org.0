Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1859214A
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 17:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACFBCD124;
	Sun, 14 Aug 2022 15:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBAEC81EF
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 15:34:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5B4BB80B27;
 Sun, 14 Aug 2022 15:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46901C43142;
 Sun, 14 Aug 2022 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660491281;
 bh=YA7qGjAoZ0w68jbN59Y8bWwXYBlkSuhDhVnrXYHcvq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gm4z/RmK99ADP92vAmkMgCQZWIqkJyKWbr7udGFL/53K3QjQazR0QiDYMmVx9PvHn
 ljity6+kBBgl5Y51Gz9PfErPP9qTA8jOuQF93aPVjVLZPrM6aiElKYRuCx+EL3qAdE
 d0i4YrWni1ykO+48ZRiAQt4lix4KZNLUuhwbpTZLClp/veho6HjbJ3yWIms6Di+tfh
 XrZGKmqyqf7UM5d0pLMHjPb+T/e4I4oGWjHi06+PvzDEcYKooVfO2hav7T4ggQPGwE
 aFqmtwEc8gn8CSVGg2oSJi/1H1miRlXGJx8Slq/iuszBF+wA3RWmuFABezfGdp41Wr
 Pa7Z9N1ELeF7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/31] drm/meson: Fix overflow implicit
 truncation warnings
Date: Sun, 14 Aug 2022 11:34:06 -0400
Message-Id: <20220814153431.2379231-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153431.2379231-1-sashal@kernel.org>
References: <20220814153431.2379231-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

[ Upstream commit 98692f52c588225034cbff458622c2c06dfcb544 ]

Fix -Woverflow warnings for drm/meson driver which is a result
of moving arm64 custom MMIO accessor macros to asm-generic function
implementations giving a bonus type-checking now and uncovering these
overflow warnings.

drivers/gpu/drm/meson/meson_viu.c: In function ‘meson_viu_init’:
drivers/gpu/drm/meson/meson_registers.h:1826:48: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
 #define  VIU_OSD_BLEND_REORDER(dest, src)      ((src) << (dest * 4))
                                                ^
drivers/gpu/drm/meson/meson_viu.c:472:18: note: in expansion of macro ‘VIU_OSD_BLEND_REORDER’
   writel_relaxed(VIU_OSD_BLEND_REORDER(0, 1) |
                  ^~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/meson/meson_viu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 259f3e6bec90..bb7e109534de 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -469,17 +469,17 @@ void meson_viu_init(struct meson_drm *priv)
 			priv->io_base + _REG(VD2_IF0_LUMA_FIFO_SIZE));
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
-		writel_relaxed(VIU_OSD_BLEND_REORDER(0, 1) |
-			       VIU_OSD_BLEND_REORDER(1, 0) |
-			       VIU_OSD_BLEND_REORDER(2, 0) |
-			       VIU_OSD_BLEND_REORDER(3, 0) |
-			       VIU_OSD_BLEND_DIN_EN(1) |
-			       VIU_OSD_BLEND1_DIN3_BYPASS_TO_DOUT1 |
-			       VIU_OSD_BLEND1_DOUT_BYPASS_TO_BLEND2 |
-			       VIU_OSD_BLEND_DIN0_BYPASS_TO_DOUT0 |
-			       VIU_OSD_BLEND_BLEN2_PREMULT_EN(1) |
-			       VIU_OSD_BLEND_HOLD_LINES(4),
-			       priv->io_base + _REG(VIU_OSD_BLEND_CTRL));
+		u32 val = (u32)VIU_OSD_BLEND_REORDER(0, 1) |
+			  (u32)VIU_OSD_BLEND_REORDER(1, 0) |
+			  (u32)VIU_OSD_BLEND_REORDER(2, 0) |
+			  (u32)VIU_OSD_BLEND_REORDER(3, 0) |
+			  (u32)VIU_OSD_BLEND_DIN_EN(1) |
+			  (u32)VIU_OSD_BLEND1_DIN3_BYPASS_TO_DOUT1 |
+			  (u32)VIU_OSD_BLEND1_DOUT_BYPASS_TO_BLEND2 |
+			  (u32)VIU_OSD_BLEND_DIN0_BYPASS_TO_DOUT0 |
+			  (u32)VIU_OSD_BLEND_BLEN2_PREMULT_EN(1) |
+			  (u32)VIU_OSD_BLEND_HOLD_LINES(4);
+		writel_relaxed(val, priv->io_base + _REG(VIU_OSD_BLEND_CTRL));
 
 		writel_relaxed(OSD_BLEND_PATH_SEL_ENABLE,
 			       priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
-- 
2.35.1

