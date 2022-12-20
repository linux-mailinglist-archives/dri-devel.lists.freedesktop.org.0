Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65646517C1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 02:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA1210E02C;
	Tue, 20 Dec 2022 01:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF310E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:22:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CBDE61171;
 Tue, 20 Dec 2022 01:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F38C433F1;
 Tue, 20 Dec 2022 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671499335;
 bh=FVfDKRpzHO2WrsYuxclffLdnxSFbXK+df/8hBV1QH28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qSIjp5Ki0w1Ok4z1RrwsiPnCdiYAUQrIs9XlXiK5IXeOBW+3J4Sgqc1k8UAljL2nu
 WNSww4DrubsXIdXP9q13pQwsnx5Kf1jNtSxZrdfbXbYaDc7mZJgdjA5DMjxk56KNTy
 kbkpDUASdmVG96pAxerHO4ZPVLMFiN+VgLZa7HietvTX3cYhPyZ5caKREpc+NIQKWr
 vRk4iAxipCrkLHCPpjCutdtUvtMJcsYIMPxVBLfINcsWrTUnmrZHVHtvWUkRB9++GJ
 Y2922ceB8wnVx0ifTDPezpnx+nStb7JTIZv5S3jUJkqDbhGUq6yW7QDnWp0o368psu
 tyjMpfyAhzeTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 7/9] drm/sti: Fix return type of sti_{dvo, hda,
 hdmi}_connector_mode_valid()
Date: Mon, 19 Dec 2022 20:21:57 -0500
Message-Id: <20221220012159.1222517-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220012159.1222517-1-sashal@kernel.org>
References: <20221220012159.1222517-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kees Cook <keescook@chromium.org>,
 llvm@lists.linux.dev, ndesaulniers@google.com, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, alain.volmat@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 0ad811cc08a937d875cbad0149c1bab17f84ba05 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/sti/sti_hda.c:637:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = sti_hda_connector_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/sti/sti_dvo.c:376:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = sti_dvo_connector_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/sti/sti_hdmi.c:1035:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = sti_hdmi_connector_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
type of 'enum drm_mode_status', not 'int'. Adjust the return type of
sti_{dvo,hda,hdmi}_connector_mode_valid() to match the prototype's to
resolve the warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221102155623.3042869-1-nathan@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sti/sti_dvo.c  | 5 +++--
 drivers/gpu/drm/sti/sti_hda.c  | 5 +++--
 drivers/gpu/drm/sti/sti_hdmi.c | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index b6ee8a82e656..076d5f30a09c 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -346,8 +346,9 @@ static int sti_dvo_connector_get_modes(struct drm_connector *connector)
 
 #define CLK_TOLERANCE_HZ 50
 
-static int sti_dvo_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+sti_dvo_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
 {
 	int target = mode->clock * 1000;
 	int target_min = target - CLK_TOLERANCE_HZ;
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 03f3377f918c..1959387cda98 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -600,8 +600,9 @@ static int sti_hda_connector_get_modes(struct drm_connector *connector)
 
 #define CLK_TOLERANCE_HZ 50
 
-static int sti_hda_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+sti_hda_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
 {
 	int target = mode->clock * 1000;
 	int target_min = target - CLK_TOLERANCE_HZ;
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f3ace11209dd..dd256c7b9060 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1003,8 +1003,9 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 
 #define CLK_TOLERANCE_HZ 50
 
-static int sti_hdmi_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+sti_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
 {
 	int target = mode->clock * 1000;
 	int target_min = target - CLK_TOLERANCE_HZ;
-- 
2.35.1

