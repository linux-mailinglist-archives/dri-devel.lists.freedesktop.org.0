Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C542B96904
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A56010E210;
	Tue, 23 Sep 2025 15:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vpt8l3/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D5310E204
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1755244D16;
 Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED311C19424;
 Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758641173;
 bh=c0az61wbtOZUqLNGV0rJC8DczNsHSPgRUfjfrHYMoFI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vpt8l3/lzn7Ssa2Vt1YoSEs93/7jzHiV360V7dvgkCxApbJjTW2GOqMdkr1EvTVIs
 9xD3YVVCF7FDl7hjP9EqhjPFNIXWXndoKHp65Y81ZklzZN0to7BHHENOXKnOgcyGrm
 UpJ7Dtgulcsj+ikFf1VNQEFgBqhIZaC21i2atkyT/TwGouHp+3dmyhExhEeyjOs4Gv
 9FnRPmicXvu7OIzCcIfU+oo/I847RqUe23Ux5QvyCdJQfBUN3Ur9voYhUItzx/qF3n
 WsGQqHH4RUkdl9Ot9PC9GqtGJGTlLUCZ9mbT52G8g57gvX/SkZ4YU7oPq5fduJOVi+
 a3cKWgfhG/jGg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v14u7-000000004my-12OL;
 Tue, 23 Sep 2025 17:26:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: [PATCH 5/5] drm/mediatek: ovl_adaptor: fix probe device leaks
Date: Tue, 23 Sep 2025 17:23:40 +0200
Message-ID: <20250923152340.18234-6-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to drop the references taken to the component devices by
of_find_device_by_node() during probe on probe failure (e.g. probe
deferral) and on driver unbind.

Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Cc: stable@vger.kernel.org	# 6.4
Cc: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index fe97bb97e004..c0af3e3b51d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -527,6 +527,13 @@ bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
 	       type == OVL_ADAPTOR_TYPE_PADDING;
 }
 
+static void ovl_adaptor_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
 {
 	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
@@ -560,6 +567,11 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		if (!comp_pdev)
 			return -EPROBE_DEFER;
 
+		ret = devm_add_action_or_reset(dev, ovl_adaptor_put_device,
+					       &comp_pdev->dev);
+		if (ret)
+			return ret;
+
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 
 		drm_of_component_match_add(dev, match, component_compare_of, node);
-- 
2.49.1

