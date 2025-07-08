Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B9AFD393
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E83789C05;
	Tue,  8 Jul 2025 16:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SW75u4yX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA8089C05
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61CD1A54055;
 Tue,  8 Jul 2025 16:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F31C4CEED;
 Tue,  8 Jul 2025 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751993881;
 bh=O8DY9iQvQuri9ETtgEtgVX+GYzEbahHXVwYWnNZ/LgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SW75u4yXfuGz4+cKzD4PijbaRETyCpIe1r6IOu7CWsslFc/X+Nwy9StmXAKrWqape
 V95zDxIHXdMWQo8ztGIGCHhFojeVA45f4OZKWX3HqIMbVvpSEqx969I7wZldSiS3/h
 NkVKKdnZOcekPHfkEoD4KONyLt/tT7xjpqf2RPtM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 051/160] vgacon: switch vgacon_scrolldelta() and
 vgacon_restore_screen()
Date: Tue,  8 Jul 2025 18:21:28 +0200
Message-ID: <20250708162232.956317981@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708162231.503362020@linuxfoundation.org>
References: <20250708162231.503362020@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

[ Upstream commit 03b89a08484a88fb9e0604cab2b3eb0c2f265c74 ]

Switch vgacon_scrolldelta() and vgacon_restore_screen() positions, so
that the former is not needed to be forward-declared.

Signed-off-by: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Helge Deller <deller@gmx.de>
Stable-dep-of: 03bcbbb3995b ("dummycon: Trigger redraw when switching consoles with deferred takeover")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/console/vgacon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 7bce5a174f388..b2180fd183307 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -163,12 +163,6 @@ static inline void vga_set_mem_top(struct vc_data *c)
 	write_vga(12, (c->vc_visible_origin - vga_vram_base) / 2);
 }
 
-static void vgacon_restore_screen(struct vc_data *c)
-{
-	if (c->vc_origin != c->vc_visible_origin)
-		vgacon_scrolldelta(c, 0);
-}
-
 static void vgacon_scrolldelta(struct vc_data *c, int lines)
 {
 	vc_scrolldelta_helper(c, lines, vga_rolled_over, (void *)vga_vram_base,
@@ -176,6 +170,12 @@ static void vgacon_scrolldelta(struct vc_data *c, int lines)
 	vga_set_mem_top(c);
 }
 
+static void vgacon_restore_screen(struct vc_data *c)
+{
+	if (c->vc_origin != c->vc_visible_origin)
+		vgacon_scrolldelta(c, 0);
+}
+
 static const char *vgacon_startup(void)
 {
 	const char *display_desc = NULL;
-- 
2.39.5



