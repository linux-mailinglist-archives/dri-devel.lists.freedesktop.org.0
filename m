Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D2A825A5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA84510E88E;
	Wed,  9 Apr 2025 13:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pKLRkHXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714110E88E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204392;
 bh=os6fwx/KmcGx48eeTShCfonZ2h/wBxh0gQYferMBJH4=;
 h=From:To:Cc:Subject:Date:From;
 b=pKLRkHXIRT0xA7HFsZp7jFX2hYyn8nVI/Rq44+AxaqOnEcaqH/LlPJVL9CLHXa2OP
 +BAZsZ05lFd00wBuXehVrRL+Je/JKjglL8pvNafdrvjuvyBeSqlr742WhJPSam9NH9
 cZrkbD8EXFDdPj48lOjWsCnRUuFcxkvsh/wV97F+U9eBISMrKLV9X/I2Lk2rWnVqgj
 KxxNwcmVALF5DMPIsLyC9APpO3beWJNYlkbOz6o/hJ93Ps37PaXwZTwpy3xw/SFJTP
 /Lal0LLdsCxoHgokw8z+jy1EBGLLFeqwDQfOOyvVvlvC81taR10sTnUiYFCjbTs91P
 hCH0Cm03ZDcBg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D0B8E17E07F2;
 Wed,  9 Apr 2025 15:13:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
Date: Wed,  9 Apr 2025 15:13:01 +0200
Message-ID: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
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

This series adds support to configure the MediaTek DPI IP to output
more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
and RGB 10 bits, and also performs some cleanups that improve the code
readability when those are added.

Even though some of those formats are also supported by MT8173, MT8183,
MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
are the only two that I was able to test.

This was tested on:
 - MT8195 Tomato Chromebook
 - MT8395 Radxa NIO-12L
 - MT8390 MediaTek Genio 700 EVK

AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
  drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
  drm/mediatek: mtk_dpi: Add support for additional output formats
  drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
  drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF

 drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 15 deletions(-)

-- 
2.49.0

