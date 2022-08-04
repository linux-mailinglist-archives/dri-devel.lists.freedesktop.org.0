Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B558A169
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 21:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7197FA4F0F;
	Thu,  4 Aug 2022 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CFA5B42
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 19:43:32 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F0396601BF8;
 Thu,  4 Aug 2022 20:43:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659642211;
 bh=JhqZk6xh4Hi5VnjgPmbWNCLylbZ7vVV8Fj4bhoUCc/c=;
 h=From:To:Cc:Subject:Date:From;
 b=gVNpQolsJG7SZu+9kmOgAQd3EexsdCX77uA53ofN7k93qpxPsa17QyQIj0jV5UU11
 jLxDoWd4wMH9N93AbkEzMQdDEPG1+awdm4M4OIdNV1al8Z4wpilXm7Gi2KvzrjFEgs
 A3Q/OUSRXx7z0BXtCuo6Xs0EZYaWFJGJJdZLi5My32W6mia0C8wY3NECn0ITEYfzKj
 Bfrc1G77q0NoVeO/RyI9NfB3TkMqL+/RxNWXwqgkwfSDQ5ABX0TMe5QDF5Ago8ugwG
 4v6U9pliyt3qSqAPrdOeLaOF26RGHYMny3hi6gauNwPWW8b+sZg35CSM2AwXErc1VI
 CReCIxhk18IbA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to
 mtk_dsi_poweroff()
Date: Thu,  4 Aug 2022 15:43:25 -0400
Message-Id: <20220804194325.1596554-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.1
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the comment right before the mtk_dsi_stop() call advises,
mtk_dsi_stop() should only be called after
mtk_drm_crtc_atomic_disable(). That's because that function calls
drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.

Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
refcount, would only be called at the end of
mtk_drm_crtc_atomic_disable(), through the call to mtk_crtc_ddp_hw_fini().
Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
enable/disable and define new funcs") moved the mtk_dsi_stop() call to
mtk_output_dsi_disable(), causing it to be called before
mtk_drm_crtc_atomic_disable(), and consequently generating vblank
timeout warnings during suspend.

Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
getting vblank timeout warnings.

Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/mediatek/mtk_dsi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..f8ad59771551 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -685,6 +685,16 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
+	/*
+	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
+	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
+	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
+	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
+	 * after dsi is fully set.
+	 */
+	mtk_dsi_stop(dsi);
+
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -735,17 +745,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	/*
-	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
-	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
-	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
-	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
-	 * after dsi is fully set.
-	 */
-	mtk_dsi_stop(dsi);
-
-	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
-
 	dsi->enabled = false;
 }
 
-- 
2.37.1

