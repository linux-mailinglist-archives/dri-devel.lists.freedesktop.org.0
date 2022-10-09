Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C45F9463
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D110E5CF;
	Sun,  9 Oct 2022 23:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515410E5C1
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:55:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71C5360B85;
 Sun,  9 Oct 2022 23:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28429C433B5;
 Sun,  9 Oct 2022 23:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359717;
 bh=SX0GqgOA8NN1x9UoZzDYjtv0281u8oPohNcPl7py/Fk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JwBZqeR+h73t1N4u4V28v4NpOo1PxOkzeu1vKw+z/3hdE+Cw46NpdMMw1cbz686ZN
 VddtwUjT3gDVgCCM9pP42q4CzydlAXBAzCheyZS0nbV9b8IPkzI1ToAjHWFFfaTfJs
 0Tduzi1AfVL/EqzQiUrGBn26oWxov5jxrFv0uI1msgGwIgSNAf5FEYQSJn7nRLlHHD
 4UaX6/Ki6fIBKQMnU+z5yhi49FIHtEwMSNl3kZ+nev2mxlw2z5PMiOxBdA6ubrJ8zD
 sMpqrnic1VwLbsIF4n3jzZQb0X1GrZ/9CEXcBSraWArpt3AAPh/rkDycLCnMEB5FyL
 JUOAt59OCE+6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 21/25] drm/exynos: Fix return type for
 mixer_mode_valid and hdmi_mode_valid
Date: Sun,  9 Oct 2022 19:54:21 -0400
Message-Id: <20221009235426.1231313-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
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
index 7655142a4651..912a7df9f8c4 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -922,8 +922,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
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
index 41c54f1f60bc..8d01e1068245 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1044,7 +1044,7 @@ static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
+static enum drm_mode_status mixer_mode_valid(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *mode)
 {
 	struct mixer_context *ctx = crtc->ctx;
-- 
2.35.1

