Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD542798F6C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68AA10E1F4;
	Fri,  8 Sep 2023 19:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283C10E1DD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:32:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF11CB821E5;
 Fri,  8 Sep 2023 19:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A19C43397;
 Fri,  8 Sep 2023 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201529;
 bh=Ge+4fWFayUbITINuJLiw6XbxOHKzoUCdo4Ja6QrasUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YyCC004oNi5VcPbauASoz4ZOrVHGxyd0aH+i7boLKCPRhIIYbDL+99/fmx3YIixB1
 Nr5EYWvJE8lDkeYwzCzcHS1Ph34LSsciFx7i6pQSbQYNGuGpW4b7WO5uOOU0K4uq7m
 sdky45hcmpFeptZV4Yr8kUTiquA8MAXbsuPXOD7d58KKY7h7EkVmdLoXsIZWUg6Lr8
 TeZo0AeWLLz8KKAeEJhCFqWMaxAsXFSwX506PQyEvXXHc9E5WksO32bFVY0dmpEXSP
 vS2dZAjdwYzx1aZ/+AYBkqa4a/sU8rYv5S0ysVSX+RMfq7TJD+JJ52pC0MdUNxWpYN
 qbHLoxiBsGLyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 03/31] drm: bridge: samsung-dsim: Drain command
 transfer FIFO before transfer
Date: Fri,  8 Sep 2023 15:31:32 -0400
Message-Id: <20230908193201.3462957-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
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
index 3194cabb26b32..891ec0245a910 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -932,7 +932,7 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (!(reg & DSIM_SFR_HEADER_FULL))
+		if (reg & DSIM_SFR_HEADER_EMPTY)
 			return 0;
 
 		if (!cond_resched())
-- 
2.40.1

