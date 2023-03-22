Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F816C5592
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ABE10E9E0;
	Wed, 22 Mar 2023 19:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0F10EA0F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 19:59:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A22FB81DEB;
 Wed, 22 Mar 2023 19:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB0BC4339C;
 Wed, 22 Mar 2023 19:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515159;
 bh=GZPVYcrHtGWQvUQ8YdKknhqUfDuUeXv2O0AacKE8YH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h/vSuUwX2Yh3MgXEDBS9oeb0xe0l3f7P4fLSxOH3cibIliyNtFrAGIxm2upShHwXS
 ousoS71arUUpdWFU68DNxuoi3AR7sFURSZzOja+HYZxffm3UwP3YwsAo6l2qzTjXia
 cHElJrP9PDJ/gciE3iwu/gvyqLiOqVJ54H6Qq1jiX0VyP6tIEOJI94xJ/pGlv4xu61
 LoRiyv8j3WMbw/cAqjuCF8e26P+c63QO9l6qKUn1TYv0W4hj3bzgtDJcJG2pzkNiX6
 e9cMj6OV9qX88vBpzFeTynDFU1gQTjmx/5gFv3RsD4z2O/1R1rhs+T+PfgGZdKkAHp
 L3Fx771JULgyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 41/45] fbdev: lxfb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 15:56:35 -0400
Message-Id: <20230322195639.1995821-41-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
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
index 8130e9eee2b4b..556d8b1a9e06a 100644
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

