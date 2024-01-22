Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40583606B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44310ED68;
	Mon, 22 Jan 2024 11:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928DD10ED68
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:04:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 114A1612DD;
 Mon, 22 Jan 2024 11:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0025AC43390;
 Mon, 22 Jan 2024 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921451;
 bh=VF67ScvZaWBLLIl5rAX1Kh4YdbBo6nKFZPHrtIWu1Y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uM/HDbBn28ozw8+m7zBAf4iUG1ywiPVlR8oK74pQvtUEL9V43tD0ZD3K5myV8i8Ru
 qBXm1NbMTMoFrmfWHbwH5FJr2B3Rpju4y9SYpJH9uMFbEfAPpXrGQ3H3xglEvjmO6s
 8CaHFB7e95X4jVgDZga1cLZJi/2kJx3SUs8a5yx+RPbficQy2hzgTZppJeNnOvPhvo
 VqQZv9bqjc6vszod5BCWLtEGKg7AWC3ZQrdBk1JSxFTOHdDJIAVVvZRPYDgmMGxMbQ
 IQuVblg76l6cj0umvemrD3tOsammT6mwMvKBqCZsCc/Qr2K1/1kbIbOTWw2PZI+UBV
 ULDUfIVSte/LA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 02/47] fbcon: make display_desc a static array in
 fbcon_startup()
Date: Mon, 22 Jan 2024 12:03:16 +0100
Message-ID: <20240122110401.7289-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

display_desc is a pointer to a RO string. Instead, switch display_desc
to a static array as we are used to. It BTW saves unnecessary 8B on the
stack.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 63af6ab034b5..a8c32cb4c878 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -921,7 +921,7 @@ static void display_to_var(struct fb_var_screeninfo *var,
 
 static const char *fbcon_startup(void)
 {
-	const char *display_desc = "frame buffer device";
+	static const char display_desc[] = "frame buffer device";
 	struct fbcon_display *p = &fb_display[fg_console];
 	struct vc_data *vc = vc_cons[fg_console].d;
 	const struct font_desc *font = NULL;
-- 
2.43.0

