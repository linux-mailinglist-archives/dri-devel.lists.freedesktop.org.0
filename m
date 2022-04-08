Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568E4F8BDB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250EB10E091;
	Fri,  8 Apr 2022 01:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCFD10E091
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 01:39:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 2E48A1F46A39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649381996;
 bh=Zoo0D97gEmqNrY989eMksqTtr9Q81mrxj7dB1t09D6s=;
 h=From:To:Cc:Subject:Date:From;
 b=SQ9QUQfCr2e2hvpXJL9p427drhnonB1hrAQ8NW3YHYwSh7XMHkrq68aZorlrf21qK
 rxNjA+g4ONZ9RezDcpv3/OYQjrUaiaBo0tlbsPaodSI0pBtpPdm0c1Y8JNg25LcGCM
 ocvAOI7iADHCPaxskD5eQYeZ12t3qdFf3IL4SHC8tItqZiP4fJyVaoUdoTvKwCFjRH
 ToDi6AZ2yynJchpugZDEsMe2PFFwramN38bqAYBmAhKLHqP73XvYN5dhhOI7eWrDCT
 5zhHtBpnbQ7QB55NIwNBTgjUNfbVLGYhetLLKjxnMm/NGfObTwaDWENbbgBENwLMlD
 CJpl9ajw90Gjg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Date: Thu,  7 Apr 2022 21:39:50 -0400
Message-Id: <20220408013950.674477-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The configuration for mt8192 was incorrectly using the output formats
from mt8173. Since the output formats for mt8192 are instead the same
ones as for mt8183, which require two bus samples per pixel, the
pixelclock and DDR edge setting were misconfigured. This made external
displays unable to show the image.

Fix the issue by correcting the output format for mt8192 to be the same
as for mt8183, fixing the usage of external displays for mt8192.

Fixes: be63f6e8601f ("drm/mediatek: dpi: Add output bus formats to driver data")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4554e2de1430..e61cd67b978f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -819,8 +819,8 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 150000,
-	.output_fmts = mt8173_output_fmts,
-	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.output_fmts = mt8183_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.35.1

