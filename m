Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1E798F0D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7B610E0B9;
	Fri,  8 Sep 2023 19:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07AC10E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:28:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04BA7B821D4;
 Fri,  8 Sep 2023 19:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AB6C433C8;
 Fri,  8 Sep 2023 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201335;
 bh=4Vb0O7tEAtwagkbyHbC6dQRhTxZ9MQuRYeS7RYl8Q9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LpPSXCAmY+WBbahyVnv3n+0YzS66ASxAhbCp38d2SMU6WXZMKAFNy8pcwHHKC4hDB
 fuNMazIV4u7zJ0KVZpD+6D5Hzc6tx12h3arGw5+ynognDDBYo4mid+s4MSLRiPpCZa
 2TuCDZpHMTBLC+LGQNcVdTBHznTixPnJCMqpDHZWJmeeh5nNIwK9D07on07jeEpix5
 JdAx8uAjDd5U8m4eD3IJRPlnad0W3Uwhjnn+gQyDVdYtge7XGgYMpLHcRcNaGw927X
 Y1cqILveMbu/XylE2yIBxVxCpUZ39hMLq5lBpIe8HKWuLy3P0sGFlvckDsY0eyptQU
 rV55kRu8a93yw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 03/36] drm: bridge: samsung-dsim: Drain command
 transfer FIFO before transfer
Date: Fri,  8 Sep 2023 15:28:14 -0400
Message-Id: <20230908192848.3462476-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 rfoss@kernel.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

[ Upstream commit 14806c6415820b1c4bc317655c40784d050a2edb ]

Wait until the command transfer FIFO is empty before loading in the next
command. The previous behavior where the code waited until command transfer
FIFO was not full suffered from transfer corruption, where the last command
in the FIFO could be overwritten in case the FIFO indicates not full, but
also does not have enough space to store another transfer yet.

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
Link: https://patchwork.freedesktop.org/patch/msgid/20230615201511.565923-1-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 73ec60757dbcb..9e253af69c7a1 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1009,7 +1009,7 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (!(reg & DSIM_SFR_HEADER_FULL))
+		if (reg & DSIM_SFR_HEADER_EMPTY)
 			return 0;
 
 		if (!cond_resched())
-- 
2.40.1

