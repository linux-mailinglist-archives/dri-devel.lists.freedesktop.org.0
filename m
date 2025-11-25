Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A026DC874AA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 23:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6B10E48E;
	Tue, 25 Nov 2025 22:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Df1krrSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75A410E492
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 22:14:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BED943FA4;
 Tue, 25 Nov 2025 22:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4934C4CEF1;
 Tue, 25 Nov 2025 22:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764108871;
 bh=7VbNqwAxa2N0OP450xn7XUR+uM75sQSKDCch+WQswe4=;
 h=From:Date:Subject:To:Cc:From;
 b=Df1krrSEl3wdi2zNkUX7BEUpByp1N0DkH67EmheG0nQTPU1K6QVPOjYURtZmQEVf2
 Om6EaatlGCObsv+mtwolZCm/oWWd5+YaF+fJcQlGWvPOG53eW00U1qnx+pqdhlPFZ2
 T0OkyH1dsaP//A5UIuy/Nfh7FuBFgAvCBGsakOFtjRbAyUzbS00tpQZstQmndUeQi1
 rks0VOxbNjPVQO7wt0IODVHXzU2CgssjlaqosZE1YAuLNKsolaL/2eooC17cf2Zdf3
 NOazRzGudmlC1s+nrylXWcIwSeahH3vPHjkFmpSCAUIfLzzUJOtoGfYY7Z8lC3Tgvy
 NefcgkB6u6xmg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 25 Nov 2025 15:14:23 -0700
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: Fix return type of
 mtk_hdmi_v2_tmds_char_rate_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-drm-mediatek-hdmi-v2-wifpts-v1-1-a6c7582cf69a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD4qJmkC/yXMwQqDMAwA0F+RnA3YQpTtV4YHNVGzUSdN5wbiv
 6+bx3d5O5hEFYNrsUOUTU2fS4YrCxjmbpkElbPBV56c84QcAwZh7ZI8cOaguHl867gmQ66bnsg
 1VFcXyMMaZdTPf7+1p+3V32VIvxKO4wujpQxhfwAAAA==
X-Change-ID: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7VbNqwAxa2N0OP450xn7XUR+uM75sQSKDCch+WQswe4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlqWi4sKa6RlUEHX+YYpj68/Dzl/capfHcDFkntCmZWv
 JVgzXqzo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkfwfDP532ctkJ97YxMU4T
 kFlRncgS/Ehp3yTJ0K0FEYFnMuZdNmP4K/ND99HBGU/M7q1OOuUzLXXTnU0xWcfPr1eexiCzuPv
 yGR4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

When building with -Wincompatible-function-pointer-types-strict, a
warning designed to catch kernel control flow integrity (kCFI) issues at
build time, there is an instance in the new HDMI v2 drm/mediatek code:

  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1331:31: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(const struct drm_bridge *, const struct drm_display_mode *, unsigned long long)' with an expression of type 'int (const struct drm_bridge *, const struct drm_display_mode *, unsigned long long)' [-Werror,-Wincompatible-function-pointer-types-strict]
   1331 |         .hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
regular warning from -Wincompatible-function-pointer-types, the mismatch
will trigger a kCFI violation when mtk_hdmi_v2_tmds_char_rate_valid() is
called indirectly.

Update the return type of mtk_hdmi_v2_tmds_char_rate_valid() to be 'enum
drm_mode_status' to clear up the warning and kCFI violation.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..454b8b93b834 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1120,9 +1120,10 @@ static void mtk_hdmi_v2_hpd_disable(struct drm_bridge *bridge)
 	mtk_hdmi_v2_disable(hdmi);
 }
 
-static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-						 const struct drm_display_mode *mode,
-						 unsigned long long tmds_rate)
+static enum drm_mode_status
+mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      unsigned long long tmds_rate)
 {
 	if (mode->clock < MTK_HDMI_V2_CLOCK_MIN)
 		return MODE_CLOCK_LOW;

---
base-commit: a846505a193d7492ad3531e33cacfca31e4bcdd1
change-id: 20251125-drm-mediatek-hdmi-v2-wifpts-d67b55175609

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

