Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850333E3D2F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 01:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1A898CA;
	Sun,  8 Aug 2021 23:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4B3898C7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 23:47:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21A5560F0F;
 Sun,  8 Aug 2021 23:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628466468;
 bh=vAX7ct7i52crHEpDhW8a+hOoXWU7tRkGXmsRCoFh/F0=;
 h=From:To:Cc:Subject:Date:From;
 b=Zfh9SdjTpJXAXQZziq3FKDbPJgWbqPcZEsHdxHS4tv+OhIwlF4ywJMYdjXuaU75Om
 po/10SD6SPkBi93nV5sVohojN3i786MuuheAzWLYi2+jmoNEHnOyQjn9Dq5Xn35Mei
 +CQ0QawA3evvh7TSmLkGBIaK2Cdrbx5sIQmKPJQStWGV3Q7Rc+TRsLs6wEaXpYq1eQ
 2Os3Q8yj7xXwNFWNrQhoFzLTtoO6Me7Eh7oaGx5JWAKnK3tZVZcSv05mEEypmApt0q
 pTFjRJmdssNv37FHKA3UJGKGNSQlSmdflRovjhSICi7fLQhgaCbnZ+cag6L5jMThcC
 WEf9R1OdAKRww==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
Date: Mon,  9 Aug 2021 07:47:29 +0800
Message-Id: <20210808234733.14782-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
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

These refinements include using standard mailbox callback interface,
timeout detection, and a fixed cmdq_handle.

Changes in v2:
1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
   when CONFIG_MTK_CMDQ is reachable.

Chun-Kuang Hu (4):
  drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
  drm/mediatek: Remove struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout
  drm/mediatek: Add cmdq_handle in mtk_crtc

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++----
 1 file changed, 91 insertions(+), 19 deletions(-)

-- 
2.25.1

