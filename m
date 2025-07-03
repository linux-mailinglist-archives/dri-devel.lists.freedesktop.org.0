Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB8AF7B28
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D18110E87B;
	Thu,  3 Jul 2025 15:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SW88V0n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963210E87B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:22:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1348461446;
 Thu,  3 Jul 2025 15:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFEEC4CEE3;
 Thu,  3 Jul 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751556157;
 bh=V+pH3XO9nKwiO/o2VhZUCqJmxYoigW77zAeSAZhnX7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SW88V0n0ECjB7nxaKHeQfaEcxxbOPtYQrL6WaByoRvPRnJvxr+osFu7o5d9oHKqlS
 llajgoUEsFVLHG1ZAFTrmsHb8UGVN8HszwYkn49+ExyilzyKpuLKTI+ij8/IQtb8BG
 li8ljfnY9s/hIBzH3gTL9XNb9b8dPnK6u4Kwa9NI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 063/132] vgacon: switch vgacon_scrolldelta() and
 vgacon_restore_screen()
Date: Thu,  3 Jul 2025 16:42:32 +0200
Message-ID: <20250703143941.888335092@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703143939.370927276@linuxfoundation.org>
References: <20250703143939.370927276@linuxfoundation.org>
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

6.1-stable review patch.  If anyone has any objections, please let me know.

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
index e960b27caadab..065da55f20d89 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -142,12 +142,6 @@ static inline void vga_set_mem_top(struct vc_data *c)
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
@@ -155,6 +149,12 @@ static void vgacon_scrolldelta(struct vc_data *c, int lines)
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



