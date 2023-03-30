Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8F6D0809
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5FC10EE89;
	Thu, 30 Mar 2023 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1110EE76
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:20:43 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 166E9660000E;
 Thu, 30 Mar 2023 15:20:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680186042;
 bh=l7DxgZbkLf1a/NAX8ACnOYom2qi3A95N4rbvhFxlUX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G+N7Mm5p05ibAjldy0ztpMj2bog3cgiYrH6vEB4EDL/2kVNHu6Wdcd/0CHcpnOdy9
 PkVQnTF0JZowrF0aJhNMRqikGo19zxRYJs4VBNIYHpcZkbxAwcxPJyWJsmTFP2WOKP
 qRFrx3+GiO52hsZejPFSNbIxuhdi/m7u+k92akp2y3bLcHD+00rp0OeqLNsOoG3LJO
 0/KzS5KP4piExrR/Fn3UropaOKfZRXV85m7umZK0qYDVE/pbOEkwZbFvHZk+cv1hxl
 oATil3lGCIuzoPjuCCCGmLV+eF4EhdQB0opGbFPK3sFE2vW1gsrWQG7zqXXhRN4d5Z
 Y4V30RHoIja9A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 3/8] drm/mediatek: dp: Always return connected status for
 eDP in .detect()
Date: Thu, 30 Mar 2023 16:20:30 +0200
Message-Id: <20230330142035.191399-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
References: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If this is an eDP panel it's not removable, hence it's always connected:
as a shortcut, always return connector_status_connected in the .detect()
callback for eDP connector, avoiding a poweron, a check for sink count
and a poweroff.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 76ea94167531..c82dd1f0675d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1957,6 +1957,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		return connector_status_connected;
+
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
 
-- 
2.40.0

