Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AF960F1E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB9310E343;
	Tue, 27 Aug 2024 14:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BWGWjKPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12BF10E344
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF174A41B5E;
 Tue, 27 Aug 2024 14:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5085FC4FDFA;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770560;
 bh=QZQ5u0mI5GTvIERqL7sO8uE4R1i9WTqn8mFJ1e8m6Cg=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=BWGWjKPD/AvbpNJKSvtRj7sGxxg8NP2mnJKLSXpT/MCkEvGdfhcX45YwzSp907+Fj
 5WzZ8QZmJEPureIe0j5U277lDDnJyo4M24GQGTkPdA9QauhMxhuM5fWW+eeBew9/09
 AMFcvGjr7wx5mbUaFyhRRLqbTlSA4rEJthfxUEiXvRC8qpTrmmAgvCeEUqTW23Gly8
 uNKCmneoeoKdQrRRdJlMdhGBYn5mhTA2zQdFbz6l7LqKkY6NxiqWV2RuwYoXxiZC+a
 +hkiJlwPSqC9kOkjxAWUZKQin4kyyj+4OamshVvEBYs8fzBJyn+4r6PT/ol85MuBzT
 +200DCkqRtAmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 45D75C54734;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay"
 <devnull+jason-jh.lin.mediatek.com@kernel.org>
Subject: [PATCH v3 0/2] Fix missing configuration flags in mtk_crtc_ddp_config
Date: Tue, 27 Aug 2024 22:55:18 +0800
Message-Id: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbozWYC/0XMQQ7CIBCF4as0s3YIFA2tq97DuCBlsFMFGqjGp
 OndJd24/PLy/g0KZaYC12aDTB8unGKFPjUwTjY+CNlVQyvbs+xUjy4H9Px9L3jQXxS1Ths/OgP
 1tGSq6xG83at9TgHXKZP9Z4zUSmotO6Gk6jtUONuSIs6TeHEcAjm2Kz3FmALs+w+OtgfXowAAA
 A==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724770559; l=663;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=QZQ5u0mI5GTvIERqL7sO8uE4R1i9WTqn8mFJ1e8m6Cg=;
 b=vtG4j8YW0CdzhCv8m6K3/A14B+OP06kMhQBxegBLibqv5A+ThNrS9j9AtzKCmfL5WKoGsUltR
 pkKWr0ek2bACtvFDpM7Yc2/BNhHDyMbTxGxk84DGDUjNJmsCM1zIoJP
X-Developer-Key: i=jason-jh.lin@mediatek.com; a=ed25519;
 pk=7Hn+BnFBlPrluT5ks5tKVWb3f7O/bMBs6qEemVJwqOo=
X-Endpoint-Received: by B4 Relay for jason-jh.lin@mediatek.com/20240718
 with auth_id=187
X-Original-From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Reply-To: jason-jh.lin@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Change in v3:
Change config_lock from spin_lock to spin_lock_irqsave

Change in v2:
Add spin_lock protection for config_updating flag.

---
Jason-JH.Lin (2):
      drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
      drm/mediatek: change config_lock from spin_lock to spin_lock_irqsave

 drivers/gpu/drm/mediatek/mtk_crtc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240819-drm-fixup-0819-f51e2d37fcd7

Best regards,
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>


