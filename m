Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB36C55D8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ABC10EA06;
	Wed, 22 Mar 2023 20:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB2F10E9FF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:01:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A44C2B81DE6;
 Wed, 22 Mar 2023 20:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3AEC4339B;
 Wed, 22 Mar 2023 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515272;
 bh=OzFtwA7If/Wya3jhnsAa+8xL/Wy2+Y3Rx8WMX1aLFYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U9KV961f0YtBwJoqYRqCW2kvo6eTZLHt1NaXK/kB6odBKVwTS78QEU7K9tjbYhRVq
 pUHpWdszPOC0dVl+CUNlTtIjVzJXWPWF+suKGYkYp4v/qvmEQY6Iwb4MX/T0k4FI88
 Y0q6HlXmx8zXIm0WSpWrtK3k4E/12ND6NF6zF9u5AlFUod/1pfsPZ80CEuEs51jOQO
 dCdZ+V8q+XgEUYFmFZo8IRCMLj4DXA0RY69QpNFQtkTcGA8MEHokoaCabrLz36tBgX
 fFmWVNob7SziKWRGYsZ9byD1n9mvXzJPHjvFHKh2OJ56HCUMOsWv79ikp6ohknDjSC
 LMBY8qpC3P6Pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 30/34] fbdev: lxfb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 15:59:22 -0400
Message-Id: <20230322195926.1996699-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
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
index 9d26592dbfce9..41fda498406c1 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -235,6 +235,9 @@ static void get_modedb(struct fb_videomode **modedb, unsigned int *size)
 
 static int lxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (var->xres > 1920 || var->yres > 1440)
 		return -EINVAL;
 
-- 
2.39.2

