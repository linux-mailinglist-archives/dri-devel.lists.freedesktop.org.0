Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6A565E80
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C1710F1B1;
	Mon,  4 Jul 2022 20:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E1110F044
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:31:58 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 8SjZo3fqFNUm18SjZokYxx; Mon, 04 Jul 2022 22:31:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 04 Jul 2022 22:31:54 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] gpu: host1x: Use the bitmap API to allocate bitmaps
Date: Mon,  4 Jul 2022 22:31:51 +0200
Message-Id: <e46ef2e2190fd0183b3b64728fbec209f5b4e57b.1656966695.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-tegra@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

While at it, remove a useless bitmap_zero() call. The bitmap is already
zero'ed when allocated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/host1x/channel.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 2a9a3a8d5931..2d0051d6314c 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -21,22 +21,18 @@ int host1x_channel_list_init(struct host1x_channel_list *chlist,
 	if (!chlist->channels)
 		return -ENOMEM;
 
-	chlist->allocated_channels =
-		kcalloc(BITS_TO_LONGS(num_channels), sizeof(unsigned long),
-			GFP_KERNEL);
+	chlist->allocated_channels = bitmap_zalloc(num_channels, GFP_KERNEL);
 	if (!chlist->allocated_channels) {
 		kfree(chlist->channels);
 		return -ENOMEM;
 	}
 
-	bitmap_zero(chlist->allocated_channels, num_channels);
-
 	return 0;
 }
 
 void host1x_channel_list_free(struct host1x_channel_list *chlist)
 {
-	kfree(chlist->allocated_channels);
+	bitmap_free(chlist->allocated_channels);
 	kfree(chlist->channels);
 }
 
-- 
2.34.1

