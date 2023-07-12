Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29775023A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E20210E3BF;
	Wed, 12 Jul 2023 08:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2643310E3B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:59:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2A68616EB;
 Wed, 12 Jul 2023 08:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7850CC433CA;
 Wed, 12 Jul 2023 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689152392;
 bh=y3hv9WFGlNw1n+L3OTmMN+6+YqGwW/2IDAh5UD/0MEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qe5T2rMBOLg417NRLdwwzjsIGBMzX/k6o/ISyoMrX0uLuuXnO1SomP2eRgYhc6uH4
 mGzNYeYi5EJjI7C5MipUa7iJuurwPLtEVR7w91m365rcsTQeegPZ8KJqNdJTGA/fbG
 doUUbkkLHEkb8lUGUBqxEUtuoqZR4es5Co1g1NICBOp/Sn5KoNwRPSTzoVlq1MFi/e
 UEe+hbkfsEptDpv6o8PSVjFsRVFQ+gDpkQx05EuC9w9O5zU4ZGA23gkY33+vFK3OUX
 ANyC+mZV8ABYZD+hr9GF4Y164fLwbDJwiy+stWRJc3JY56ID316t9iBux8/69R36M6
 uESumahRtoC8g==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 3/7] vgacon: remove unused xpos from vgacon_set_cursor_size()
Date: Wed, 12 Jul 2023 10:59:38 +0200
Message-ID: <20230712085942.5064-4-jirislaby@kernel.org>
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

xpos is unused, remove it.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index a34cdfcc10c2..7cb15851ea56 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -437,7 +437,7 @@ static void vgacon_invert_region(struct vc_data *c, u16 * p, int count)
 	}
 }
 
-static void vgacon_set_cursor_size(int xpos, int from, int to)
+static void vgacon_set_cursor_size(int from, int to)
 {
 	unsigned long flags;
 	int curs, cure;
@@ -479,9 +479,9 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 	case CM_ERASE:
 		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
 	        if (vga_video_type >= VIDEO_TYPE_VGAC)
-			vgacon_set_cursor_size(c->state.x, 31, 30);
+			vgacon_set_cursor_size(31, 30);
 		else
-			vgacon_set_cursor_size(c->state.x, 31, 31);
+			vgacon_set_cursor_size(31, 31);
 		break;
 
 	case CM_MOVE:
@@ -489,8 +489,7 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
 		switch (CUR_SIZE(c->vc_cursor_type)) {
 		case CUR_UNDERLINE:
-			vgacon_set_cursor_size(c->state.x,
-					       c->vc_cell_height -
+			vgacon_set_cursor_size(c->vc_cell_height -
 					       (c->vc_cell_height <
 						10 ? 2 : 3),
 					       c->vc_cell_height -
@@ -498,35 +497,31 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 						10 ? 1 : 2));
 			break;
 		case CUR_TWO_THIRDS:
-			vgacon_set_cursor_size(c->state.x,
-					       c->vc_cell_height / 3,
+			vgacon_set_cursor_size(c->vc_cell_height / 3,
 					       c->vc_cell_height -
 					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_LOWER_THIRD:
-			vgacon_set_cursor_size(c->state.x,
-					       (c->vc_cell_height * 2) / 3,
+			vgacon_set_cursor_size((c->vc_cell_height * 2) / 3,
 					       c->vc_cell_height -
 					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_LOWER_HALF:
-			vgacon_set_cursor_size(c->state.x,
-					       c->vc_cell_height / 2,
+			vgacon_set_cursor_size(c->vc_cell_height / 2,
 					       c->vc_cell_height -
 					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_NONE:
 			if (vga_video_type >= VIDEO_TYPE_VGAC)
-				vgacon_set_cursor_size(c->state.x, 31, 30);
+				vgacon_set_cursor_size(31, 30);
 			else
-				vgacon_set_cursor_size(c->state.x, 31, 31);
+				vgacon_set_cursor_size(31, 31);
 			break;
 		default:
-			vgacon_set_cursor_size(c->state.x, 1,
-					       c->vc_cell_height);
+			vgacon_set_cursor_size(1, c->vc_cell_height);
 			break;
 		}
 		break;
-- 
2.41.0

