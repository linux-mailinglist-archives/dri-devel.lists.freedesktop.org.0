Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D006C55EA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39DC10EA0C;
	Wed, 22 Mar 2023 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CB710EA0C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:01:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31462622C1;
 Wed, 22 Mar 2023 20:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B681BC433AC;
 Wed, 22 Mar 2023 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515317;
 bh=LaxIYNbHqf7qY6iMl1u/QsdgKbWswnQNq7WEczQzRQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ge+Hv7NJhVb7hYODjZSpyV1jasKf3FV1/1ZxG+n3bcPI3TMYjhQMQ1cbgBSy80DQX
 WxtqawnS/eF8pkI8ySol2/JWBI/Lim4cbkiz5j+K32mk5cqESClWrwxE+pGDHnSc/N
 nhlZcnI7D9KPVSUqQV0xCGJ1F15Qwvmv8TRTRkdJZk1kiSL0sgF8tctTs6bjojlDcb
 OxNtM8f8vfgpQBQ865JYrY256MEfSjjTfpbf3s/rLTVR5vtwMHoZX9T7mHuj+RL1no
 VlRj0MQWsHYQX5NOdXXVybfk+peNAUZgUxx2CDy9X+F9jMUYEkpYIxsjQGXq2IxAA3
 RwzVWeOWsb6Vg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/16] fbdev: lxfb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 16:01:16 -0400
Message-Id: <20230322200121.1997157-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200121.1997157-1-sashal@kernel.org>
References: <20230322200121.1997157-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>,
 dilinger@queued.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit 61ac4b86a4c047c20d5cb423ddd87496f14d9868 ]

var->pixclock can be assigned to zero by user. Without proper
check, divide by zero would occur in lx_set_clock.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/geode/lxfb_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 66c81262d18f8..6c6b6efb49f69 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -234,6 +234,9 @@ static void get_modedb(struct fb_videomode **modedb, unsigned int *size)
 
 static int lxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (var->xres > 1920 || var->yres > 1440)
 		return -EINVAL;
 
-- 
2.39.2

