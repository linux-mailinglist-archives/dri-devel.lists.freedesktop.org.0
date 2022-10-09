Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DE5F949E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504FA10E612;
	Sun,  9 Oct 2022 23:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4988010E5F6
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:57:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C630F60C27;
 Sun,  9 Oct 2022 23:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952F4C43143;
 Sun,  9 Oct 2022 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359859;
 bh=68484usKTHxDSlDitAPfp628Cran1WU7zwP/eWP86Gw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lz8DXgxUCo36HAfVU1HSaF50/BNpFJyelblOAqqkw2QrkFWXmnkY0CgTe1guz71fL
 YgYX4PSfgpv47Z+STiXUgu12uM7Dn5D4k0T9Fsc8jw6CT3g6e/nRX0PQNoXzXVYCWE
 /Zk2oFmgbwjKf1Zr4ZBceqa1wDx+c2jJ+CWNehwrLOUb5Do4N8S4yxmjjY8N563WZz
 J4qHcS5tsrpBCmGrbz0tIK+osG8c98hnjBFKFabIbFRurnLx9P9FXVAjzoT3YjfTS8
 psp73axcTTQqsjUqjlMALcGSZngg2q70//xI7boyGCGI/bn8TFx22U/Fi93upB1Sgf
 yCmya1tDxF7ZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/14] drm/exynos: Fix return type for
 mixer_mode_valid and hdmi_mode_valid
Date: Sun,  9 Oct 2022 19:57:08 -0400
Message-Id: <20221009235710.1231937-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235710.1231937-1-sashal@kernel.org>
References: <20221009235710.1231937-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, nathan@kernel.org,
 linux-samsung-soc@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 ndesaulniers@google.com, llvm@lists.linux.dev, sw0312.kim@samsung.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit 1261255531088208daeca818e2b486030b5339e5 ]

The field mode_valid in exynos_drm_crtc_ops is expected to be of type enum
drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
                                   const struct drm_display_mode *mode);

Likewise for mode_valid in drm_connector_helper_funcs.

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mixer_mode_valid and hdmi_mode_valid should be changed
from int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://protect2.fireeye.com/v1/url?k=3e644738-5fef521d-3e65cc77-
74fe485cbff6-36ad29bf912d3c9f&q=1&e=5cc06174-77dd-4abd-ab50-
155da5711aa3&u=https%3A%2F%2Fgithub.com%2FClangBuiltLinux%2Flinux%2Fissues%2F
1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 0073a2b3b80a..838a638fb03a 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -911,8 +911,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	return -EINVAL;
 }
 
-static int hdmi_mode_valid(struct drm_connector *connector,
-			struct drm_display_mode *mode)
+static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
+					    struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 22f494145411..07c59e647fc2 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1039,7 +1039,7 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
+static enum drm_mode_status mixer_mode_valid(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *mode)
 {
 	struct mixer_context *ctx = crtc->ctx;
-- 
2.35.1

