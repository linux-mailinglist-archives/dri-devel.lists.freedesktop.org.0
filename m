Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AF91D80F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 08:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485510E23B;
	Mon,  1 Jul 2024 06:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nZbgJZCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29A10E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719814996; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=K0ZmPMNyaItxarb5ePgYH1LDi6uPvP8+DUmCHVAnCI8=;
 b=nZbgJZCxTgBcGZlnl0+RLFfGgY7XpOAPSU2LJua1qozkTvwbei+josdHzrtyAtRNneZISkcQFBQJMAvyfx9Jfwe3nYLDxgCwxLuiWmgu3nzOVNcLfCGQ3y40Qs/K9hu7XXVHtB0b6BNWHZbBBRWAIxYqpU/hxW5FoUdsFsIN7vg=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067111;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0W9ZzIKT_1719814985; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W9ZzIKT_1719814985) by smtp.aliyun-inc.com;
 Mon, 01 Jul 2024 14:23:15 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: yannick.fertre@foss.st.com
Cc: raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/stm: Remove unnecessary .owner for lvds_platform_driver
Date: Mon,  1 Jul 2024 14:23:04 +0800
Message-Id: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

Remove .owner field if calls are used which set it automatically.

./drivers/gpu/drm/stm/lvds.c:1213:3-8: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9457
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/stm/lvds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 2fa2c81784e9..06f2d7a56cc9 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1210,7 +1210,6 @@ static struct platform_driver lvds_platform_driver = {
 	.remove = lvds_remove,
 	.driver = {
 		.name = "stm32-display-lvds",
-		.owner = THIS_MODULE,
 		.of_match_table = lvds_dt_ids,
 	},
 };
-- 
2.20.1.7.g153144c

