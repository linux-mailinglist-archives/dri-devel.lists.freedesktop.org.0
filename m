Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628D750235
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EAE10E381;
	Wed, 12 Jul 2023 08:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEE810E381
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:59:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92C31616EB;
 Wed, 12 Jul 2023 08:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699AAC433CA;
 Wed, 12 Jul 2023 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689152388;
 bh=ZrJHzT2K9435cGUOZjdcu1RL4XkwF5n9Ynfmc/OI09Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kHMz1RajGGyT8QAgPhNYUibwugiKRyBupzLguqjKvMqzVnEj4uap14DzDwsl7xEhk
 IhNjzK7h+yaZuqJGS75WXsePAnLedFsRFi6LtzkWK2BeYhGHdq2DXuEaeulC+TmBZ8
 Tf1KHe1DXobmTlW965juIlOyZFmBmtMlSC03TxK2wWGMMMPUGDEGFImqFb1s/hd4zQ
 xp8RhOiPyJqjQeRnPKbedtQA/4/r/PiQsPKsLjSb88pZTiQtOLCVeOx9+GSOiVJWBv
 7PHaMMAYgdTDuUGMMOu6m1Vv/E2RUJE5xGeNJCjMOB7Xr3pnRu995sZWDCBSu80iRU
 P8LR9M37ACinA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 1/7] vgacon: switch vgacon_scrolldelta() and
 vgacon_restore_screen()
Date: Wed, 12 Jul 2023 10:59:36 +0200
Message-ID: <20230712085942.5064-2-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712085942.5064-1-jirislaby@kernel.org>
References: <20230712085942.5064-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch vgacon_scrolldelta() and vgacon_restore_screen() positions, so
that the former is not needed to be forward-declared.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index e25ba523892e..fbed2862c317 100644
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
2.41.0

