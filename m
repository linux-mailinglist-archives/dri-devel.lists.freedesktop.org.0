Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE885FCB3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8710E2F6;
	Thu, 22 Feb 2024 15:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTvQ8XMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8B10E2F6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E899ECE21A0;
 Thu, 22 Feb 2024 15:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35792C433F1;
 Thu, 22 Feb 2024 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616489;
 bh=pjixf3oXo63dg7qf7lXjwZCTLnX0p47lkDin0H4I8LU=;
 h=From:To:Cc:Subject:Date:From;
 b=jTvQ8XMWDulUTguO1lrSEX+LInOIjmnQhNbrGk7y8o2w699XXvhWZcAgJYmiY2KON
 0sUvlq7/4FDFHEw8Lvn78gWeubpi7fVJjcaZjgo/G4hGOoROEwq2pdFXbSkyvp2ae+
 did0penN8Xd26Y30/5mxSFS6CecVq7wdM3tmRn/SWunNkeqziWhj4ifCN6MH8kQSn2
 D577EuZiKtmQf4eXSgqWqV8AbzBJILrLIX+L9/RF5T//HavbM3WEHnEOhSczsLy9Ax
 xunLJqrFaYar7GJrBEGLTpu0AFUnbHdGp7c40xhoWAqs9NGuOM4uh6NgCL2fudjoPQ
 2fi/Mp1krDFVA==
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
Subject: [PATCH v2 00/12] Remove cl in struct cmdq_pkt
Date: Thu, 22 Feb 2024 15:41:08 +0000
Message-Id: <20240222154120.16959-1-chunkuang.hu@kernel.org>
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

Changes in v2:
1. Fix typo of CMDQ_JUMP_RELATIVE
2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
4. Add cmdq_pkt_jump_rel() helper function
5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9

Chun-Kuang Hu (12):
  soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
  soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
  soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
  soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
  soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
  soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
  soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()
  drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
  drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 48 ++----------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 48 ++----------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 73 ++++++-------------
 include/linux/soc/mediatek/mtk-cmdq.h         | 60 +++++++++------
 6 files changed, 73 insertions(+), 159 deletions(-)

-- 
2.34.1

