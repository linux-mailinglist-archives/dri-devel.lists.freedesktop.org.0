Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8B967715
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 16:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1670B10E19D;
	Sun,  1 Sep 2024 14:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXkoa9zK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0739C10E19D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 14:33:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72A415C56BC;
 Sun,  1 Sep 2024 14:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83635C4CEC3;
 Sun,  1 Sep 2024 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725201187;
 bh=kwPiH44pV1ANFJhkdOlQ2NoEBgwHo7h8ejpepwo1EGg=;
 h=From:To:Cc:Subject:Date:From;
 b=WXkoa9zK+zwyHz3IGIZIBI49Cak3R/xK0dOG42JMjUdpekcS9VOsXzkkAj37LChqv
 12/aGUKYtkBI/aLxQdYq9pG0dWmFRYL05d4yGOKcgm3SYMhhhib+YruMcc6pSWt2u4
 RWxmHE+d7QEe/Go6VfP+1ipw6eufotuX7wutA0tfE1tJ3ScPfg61GnzskzBTbTWF02
 3mKTBYRCp8M9n10iZRsPPuBkhMpaXMKhbO+XCEFcNEJ4eVPo9/RgUq4ALHvtHAXLQN
 xS+bZxQp/ojwtOI22cq6rjTdjRhynrZPAk2Yyz4W7dJiemdBR7f9gPVSyzOxBCjh8e
 cV7cuBMUi+BQQ==
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
Subject: [PATCH v4 0/3] Remove cl in struct cmdq_pkt
Date: Sun,  1 Sep 2024 14:32:56 +0000
Message-Id: <20240901143259.16849-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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

cl in struct cmdq_pkt is used to store struct cmdq_client, but every client
driver has the struct cmdq_client information, so it's not necessary to
store struct cmdq_client in struct cmdq_pkt. Because mailbox maintainer
do not like to mix mailbox patch with other patches in a series, so
mailbox patch [1] would be sent independently.

Changes in v4:
1. Rebase onto mediatek-drm-next-6.12
2. Fix build error in mpd3 driver
Changes in v3:
1. Rebase onto Linux 6.11-rc1 and fix conflicts.
Changes in v2:
1. Fix typo of CMDQ_JUMP_RELATIVE
2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
4. Add cmdq_pkt_jump_rel() helper function
5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9


Chun-Kuang Hu (3):
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 49 +++----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 22 ---------
 include/linux/soc/mediatek/mtk-cmdq.h         | 13 -----
 6 files changed, 11 insertions(+), 77 deletions(-)

-- 
2.34.1

