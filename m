Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46604AD0298
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 14:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDFF10EA82;
	Fri,  6 Jun 2025 12:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UsuohR8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8D10EA90
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749214333;
 bh=ONaGR/IRVw2brl1DvzP1xMGhlckfUTMY9+SsqjrbfPg=;
 h=From:Date:Subject:To:Cc:From;
 b=UsuohR8BVGL3hoDGKOENRcMyYwrH7PXGB6nIzpJJcd9dsTKapwMwwIYfjThp3U4Dj
 CjE2pYUEez99p0mmuzfBhOyyKiF2s5qLMNNuLg1/ULMYVLKfBrQOcphJAoWk+ZdXLF
 8mpXv9jZ7u29tNa4f4z3ZtyBkBmPeDp23ebvVPLnErLe6Ya8E07dAEON8q91eTq1vy
 YE7i54WFjwBLn6EPsvWC0EPaxXsrsfgkWbzr6zcnnsLhNigHIDiCZJOSmMwaiF8+8+
 HU0+OVLXzNp3JVyHzzy3KVfNdix50em8HlLgSO+7aG3reF1ziMjJpsr7sErTDDwjIf
 f9gp6zkfw5Mng==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A8D817E0097;
 Fri,  6 Jun 2025 14:52:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 06 Jun 2025 14:50:12 +0200
Subject: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAPkQmgC/zWN0QrCMAxFf6Xk2UBX2NT9igzp1mwGbTvbqoOxf
 zc4fAon3HvPCpkSU4ZWrZDozZljEKgOCoabDRMhO2Ew2tS60Q36cr+6meWeqnONIy/4STFMOMR
 HTFhb2+uxccaZI8jInEgiP8Gl2znR8yWesj+ht5mk7D2XVgVaCv5d0G3bF5y7KZShAAAA
X-Change-ID: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749214333; l=1912;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ONaGR/IRVw2brl1DvzP1xMGhlckfUTMY9+SsqjrbfPg=;
 b=r+8ZRVrWvUhL7zhQKD0bz2TF1ADcbbp8UxfIUYKGE063dqymCkH8GA0zB9oOA53Fu0uliBLWk
 yAQnN9JQ/64DgZai79+2/AT7eYsADajmrCfzOgjnNv6+STVh5slLa1M
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

Reorder output format arrays in both MT8195 DPI and DP_INTF block
configuration by decreasing preference order instead of alphanumeric
one, as expected by the atomic_get_output_bus_fmts callback function
of drm_bridge controls, so the RGB ones are used first during the
bus format negotiation process.

Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6fb85bc6487a019cdcdb3770dc06a1deab8d5bda..a2fdceadf209f6d2166e7523b82ca18c82c7d435 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1095,7 +1095,6 @@ static const u32 mt8183_output_fmts[] = {
 };
 
 static const u32 mt8195_dpi_output_fmts[] = {
-	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
@@ -1103,18 +1102,19 @@ static const u32 mt8195_dpi_output_fmts[] = {
 	MEDIA_BUS_FMT_YUYV8_1X16,
 	MEDIA_BUS_FMT_YUYV10_1X20,
 	MEDIA_BUS_FMT_YUYV12_1X24,
+	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_YUV8_1X24,
 	MEDIA_BUS_FMT_YUV10_1X30,
 };
 
 static const u32 mt8195_dp_intf_output_fmts[] = {
-	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 	MEDIA_BUS_FMT_RGB101010_1X30,
 	MEDIA_BUS_FMT_YUYV8_1X16,
 	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_BGR888_1X24,
 	MEDIA_BUS_FMT_YUV8_1X24,
 	MEDIA_BUS_FMT_YUV10_1X30,
 };

---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

