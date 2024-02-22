Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33685FCBE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F6F10E98E;
	Thu, 22 Feb 2024 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qcu2M+N4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7264510E98B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAA4C6188A;
 Thu, 22 Feb 2024 15:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B457CC433C7;
 Thu, 22 Feb 2024 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616514;
 bh=TyYfmOPE/p3NSd8TeId10uLJdlRXk+ZcnArj63ZnB78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qcu2M+N40lnWO0VRIjirr4tmgHxDycIihP1hNLX/vwGiRrExvp4aZrtKxMjGVbO/W
 CBLfCfyrPZH7R+m/3nGdAvmq/SDiPRQg0oGXxG8peloIbT/vIJMbsk4YROvB16QtZg
 7chEHJhemcr7VY6Cda3yNzVUcCbZdmdbvEgbBBu2mnARRfTGrmNgSUOHm0mH7Fp/DN
 mfSKHNVYx0WbaDJ7SaRIWbPGejb4IbGX/0YX69D8G9lhcLvLDIkZqvFnGfPnXfRN5E
 oT/eQXFrH2F0Fq47VyZuN8iiG7CgBgBDdqLxgpXg6znePkxnGLTDcfbrRthubA1kdn
 xp2RIuy2lFMXg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 08/12] drm/mediatek: Use cmdq_pkt_eoc() instead of
 cmdq_pkt_finalize()
Date: Thu, 22 Feb 2024 15:41:16 +0000
Message-Id: <20240222154120.16959-9-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
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

For some client driver, it want to reduce latency between excuting
previous packet command and next packet command, so append jump
command to the end of previous packet and the jump destination
address is the start address of next packet command buffer. Before
next packet exist, the previous packet has no information of where
to jump to, so append nop command first. When next packet exist,
change nop command to jump command. For mediatek drm driver, it
never has next packet, so appending nop command is redundant.
Because cmdq_pkt_finalize() would append nop command, so change
calling cmdq_pkt_finalize() to cmdq_pkt_eoc() to prevent append
redundant nop command.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c729af3b9822..df693fa268ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -593,7 +593,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
-		cmdq_pkt_finalize(cmdq_handle);
+		cmdq_pkt_eoc(cmdq_handle);
 		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
-- 
2.34.1

