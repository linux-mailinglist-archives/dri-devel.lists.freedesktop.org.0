Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2268632FEB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 23:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFE610E341;
	Mon, 21 Nov 2022 22:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6C10E354
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 22:37:23 +0000 (UTC)
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 58A616602A54;
 Mon, 21 Nov 2022 22:37:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669070241;
 bh=7RSaxYNrftEuEHu+tdPORhiDIvSBvNUAw0lshzAfmW0=;
 h=From:To:Cc:Subject:Date:From;
 b=RNpYOKiZRomfKJVTk6xKJYXs9oDDsrn8DyTriqLeISTgtDL4nwq7K7zJ0T3DyUZDg
 e1Znk/FAqixHf9VrLV4R7eLpaLCHRWjlc4oJ4HfnyPs/ePUEGk7zTZfusgmc4ny6B3
 pvaiwuZzBHKwvL5esWfDrjN28hi1ZPwItelCh+N/8ql8wJ0XDfgKeAlNt9TZfotUu1
 A0b3d2Tgv3YsAEWG0OcBCQopwpkgCEEgNC91DQTNaZE0P2ljBZUgxm8WoVT+JSwlNs
 gCnPobdNtEb8JYSO4wLySkg8gCNXOm9W+zgSZRlTRl62dEnc2qs1BNu9gMeFg/7vNM
 qYy4bUkmz6rag==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: Clean dangling pointer on bind error path
Date: Mon, 21 Nov 2022 17:37:17 -0500
Message-Id: <20221121223717.3429913-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_drm_bind() can fail, in which case drm_dev_put() is called,
destroying the drm_device object. However a pointer to it was still
being held in the private object, and that pointer would be passed along
to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
point, resulting in a panic. Clean the pointer when destroying the
object in the error path to prevent this from happening.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 39a42dc8fb85..a21ff1b3258c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
 err_deinit:
 	mtk_drm_kms_deinit(drm);
 err_free:
+	private->drm = NULL;
 	drm_dev_put(drm);
 	return ret;
 }
-- 
2.38.1

