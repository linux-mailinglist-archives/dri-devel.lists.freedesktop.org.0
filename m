Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A70831381
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37A010E142;
	Thu, 18 Jan 2024 07:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641410E142
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 93AC8617F7;
 Thu, 18 Jan 2024 07:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A187C433F1;
 Thu, 18 Jan 2024 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564687;
 bh=VF67ScvZaWBLLIl5rAX1Kh4YdbBo6nKFZPHrtIWu1Y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hzV9XM2oma7CXY2prJ5hO4Kbts/86byd0p9nMAE71rQBKPNnKmCaFUuJhksZ6tiWq
 A4DeNHDswadUILCIUtRzvkMMFjSHKrClNwXM8YlKPhiey55Ge1Geu35zcySFp7xrIh
 g3zCt4gtKuBSfXYLHfm1F3DNLjkpXXasYfrY1gwsZlY8A+rb5ZRiJ8hYADBevSK/GZ
 wecsF4s50veThCCoCiLIMPItmjENtSJPPTaH2HzrGfrJLUeZlQxmNwskMoH/eQTHbz
 LJ6oISId7gI8Gz4YxFtwAYrDidRreY6Ay3kys2ZXctW2eftCVbxdgvPa/XN6HosL4a
 /5zquQEqoeZSA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 02/45] fbcon: make display_desc a static array in
 fbcon_startup()
Date: Thu, 18 Jan 2024 08:57:13 +0100
Message-ID: <20240118075756.10541-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
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

