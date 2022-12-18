Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823B565006B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B4C10E255;
	Sun, 18 Dec 2022 16:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F97210E255
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 16:14:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07B9460DCB;
 Sun, 18 Dec 2022 16:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F50C433F0;
 Sun, 18 Dec 2022 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671380066;
 bh=WeOOt14tkYeELBrtRWfPT2/q6Bw4lnOCH2VvxZFmpcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dzmje4hKaeQrYSHdhC+sIKTl3vsoWacmBh8tQRli0WQoXINR+Wqf7Mr1mMLxCBasE
 k7LqmV3sTY8OOk6+9M5zm2XyZVrSPCuQjwCxkfZkoL5t/VEjQrnrny3xTuP/U/5vb3
 AHaHONGG6Kfl8ILtoF53bllgO0bqNgEnNOVYWhGdXez2iqNqEbBM4ECR20H8dWU8zJ
 VxowEVeEmbTITMAuJfKzJnSADTunTJDwQm3aTlWokw/DCyvSstR4Hx5OphJ93pikv8
 RR1bOp1B2B4T8VdKu67+dmU6OxBKjVBQ8JRhZCsDheOuOjWjPeipBaK/zSUbYu/KxQ
 pSYuOEKPUL4mQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 24/46] drm/mediatek: Fix return type of
 mtk_hdmi_bridge_mode_valid()
Date: Sun, 18 Dec 2022 11:12:22 -0500
Message-Id: <20221218161244.930785-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161244.930785-1-sashal@kernel.org>
References: <20221218161244.930785-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 ndesaulniers@google.com, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 890d637523eec9d730e3885532fa1228ba678880 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = mtk_hdmi_bridge_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
'enum drm_mode_status', not 'int'. Adjust the return type of
mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..7613b0fa2be6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1203,9 +1203,10 @@ static enum drm_connector_status mtk_hdmi_detect(struct mtk_hdmi *hdmi)
 	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
-static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
-				      const struct drm_display_info *info,
-				      const struct drm_display_mode *mode)
+static enum drm_mode_status
+mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	struct drm_bridge *next_bridge;
-- 
2.35.1

