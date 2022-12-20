Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E76517FF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 02:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8052010E327;
	Tue, 20 Dec 2022 01:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961BF10E30E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:23:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ADC261171;
 Tue, 20 Dec 2022 01:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42661C433EF;
 Tue, 20 Dec 2022 01:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671499352;
 bh=PEIRubEA3fZUjLHgXVWXuXwNJdvRH2v7g+9z6cMocgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ak7uZpd6qqR9F7E5GV4zTkxnJp9LyfzdtXyMvsVhLTNLqSxD4SsyDSqMgu/4JNh3U
 11cHKPfumZAR0syI3XKKWL0yh1u7t0QIxeJDE+UuniZf0JWihOFSDwDnEDdww+NcfU
 GDhZk6xR567cWsUzV8gIzZBBr4i3WuxrIxxDwx3jq2MzTUxfmeEcAR3cffyaFsPnkI
 t3RcID88HJNY6BORgZCNmLP0dcQcENBPEz0JRkbPLiNB27ZJcrMZpOtuuwJ/JlBJg4
 2Gz0VhoiCs8R+3eg8INPjrVLvdcztpevj4sX7/aeiTxn4FSz0VLr6bl0OurMKKAkzc
 R0k4VtHdGrKbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/5] drm/fsl-dcu: Fix return type of
 fsl_dcu_drm_connector_mode_valid()
Date: Mon, 19 Dec 2022 20:22:24 -0500
Message-Id: <20221220012227.1222729-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220012227.1222729-1-sashal@kernel.org>
References: <20221220012227.1222729-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, alison.wang@nxp.com,
 ndesaulniers@google.com, Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 96d845a67b7e406cfed7880a724c8ca6121e022e ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c:74:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = fsl_dcu_drm_connector_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
type of 'enum drm_mode_status', not 'int'. Adjust the return type of
fsl_dcu_drm_connector_mode_valid() to match the prototype's to resolve
the warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221102154215.78059-1-nathan@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index a92fd6c70b09..8de9bc8343a2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -70,8 +70,9 @@ static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(fsl_connector->panel);
 }
 
-static int fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
-					    struct drm_display_mode *mode)
+static enum drm_mode_status
+fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
+				 struct drm_display_mode *mode)
 {
 	if (mode->hdisplay & 0xf)
 		return MODE_ERROR;
-- 
2.35.1

