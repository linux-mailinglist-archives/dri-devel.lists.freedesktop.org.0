Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA264FF7E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7A10E1D2;
	Sun, 18 Dec 2022 16:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AEB10E1D0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 16:03:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00C40B803F1;
 Sun, 18 Dec 2022 16:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53521C433EF;
 Sun, 18 Dec 2022 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379388;
 bh=UGuOnxnM7GPmefNXCCPZBE0jOJo+3GsKpHYT1te8Qhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oP+8czzkgNR8RJkxPdHfE59EGgDaEgZY2xbsylV6QCHyRRG12WIjdwlcS1Mb/NLn9
 kNwXZe79rnMp4LoyyaA1IwLonHTtSNBgO+hhVhQz/bdkGAMDUBO/ufySp0SsQyUQmr
 HdqlUDpt0ha7uS7lZ16Hv5Jnab5iYbYVStThD15sbkLDOG6lIMlF8egaqAV/pHQc3M
 grSg5RH8vurSUIu6xGE88RKnCAevnFPlN2ISfziYxCeuPyoRrmOlWfpcL+EMcAdCuA
 IxclxO15vlBuIKhJGW50mZ2C6B+4svb6tUX1/A53hH2HNEnsIDYJCQQFLbhUIKWKP9
 B2VOvrqOA/QcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 22/85] drm/meson: Fix return type of
 meson_encoder_cvbs_mode_valid()
Date: Sun, 18 Dec 2022 11:00:39 -0500
Message-Id: <20221218160142.925394-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, khilman@baylibre.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 6c4e4d35203301906afb53c6d1e1302d4c793c05 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/meson/meson_encoder_cvbs.c:211:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = meson_encoder_cvbs_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
'enum drm_mode_status', not 'int'. Adjust the return type of
meson_encoder_cvbs_mode_valid() to match the prototype's to resolve the
warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20221102155242.1927166-1-nathan@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 5675bc2a92cf..3f73b211fa8e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -116,9 +116,10 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
 	return i;
 }
 
-static int meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
-					const struct drm_display_info *display_info,
-					const struct drm_display_mode *mode)
+static enum drm_mode_status
+meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
+			      const struct drm_display_info *display_info,
+			      const struct drm_display_mode *mode)
 {
 	if (meson_cvbs_get_mode(mode))
 		return MODE_OK;
-- 
2.35.1

