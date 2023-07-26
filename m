Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D79762F9F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2A310E185;
	Wed, 26 Jul 2023 08:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905C10E447
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:22:55 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1ADB466015A0;
 Wed, 26 Jul 2023 09:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690359774;
 bh=2FI4H4ZuB88bJj5ThgiVFOLbFXbRfR4pQKiai84ySXE=;
 h=From:To:Cc:Subject:Date:From;
 b=htPJevGv9woHxVLnVshT+DxXQ5Qw8YdZjOtXszz0ml3btE1K0XA7IPUhfVbs9XjPh
 QzdxoOiMk4L2UZo17kkxO8JGF7UBJy0rPPkLsOMqzI69EYcJFD+94a1vu2zDqY6fJm
 rC2oqWJAaH+oHnrBtVzJxlPDLP6Lc5ud5TYMjaEsHX+AOs6Vk9OdXuMjavwthuWx3m
 tAVNnzjbFvM3wycKbTaxR+Y0jLqSs6rqBZ6c2svDMgUj0wY3TealqIAX/54mOBC/hv
 C1OcuptPopAWpMFyFlemQ2QSH7WdeY4kxWZZS0vh7xIoMnl7hhVWt3Y7GFmFMrC9P0
 dX1l16lkpjqzw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 0/6] drm/mediatek: Small mtk-dpi cleanups
Date: Wed, 26 Jul 2023 10:22:39 +0200
Message-ID: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: fshao@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v3:
 - Fixed removal of mtk_dpi pointer in mtk_dpi_remove on patch [1/6]
   instead of patch [3/6]; thanks CK Hu!

Changes in v2:
 - Removed drm_bridge_remove() call in patch 1
 - Added dev_err_probe print to devm_drm_of_get_bridge()
   call error handling
 - Switched to devm_platform_ioremap_resource() to remove
   the useless pointer to struct resource in probe function
 - Added a commit to compress struct of_device_id entries
 - Added a commit to switch to .remove_new() callback

This is a small cleanup of the mtk-dpi driver, switching it to devm
variants where possible and where it made sense, and reducing lines
while retaining and improving human readability.

AngeloGioacchino Del Regno (6):
  drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
  drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
  drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
  drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
  drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
  drm/mediatek: mtk_dpi: Compress struct of_device_id entries

 drivers/gpu/drm/mediatek/mtk_dpi.c | 100 +++++++++--------------------
 1 file changed, 32 insertions(+), 68 deletions(-)

-- 
2.41.0

