Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC16EC830
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 10:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFED210E0E3;
	Mon, 24 Apr 2023 08:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38B10E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 08:58:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 065C41FD7D;
 Mon, 24 Apr 2023 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682326708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5qi3O2aD7rdQoBAZWbZmBTd/WmQHLMl1hHZDUbTNtE=;
 b=hWANSOtgxyn3ZNoTcRSEc/O5/Oo2oB4fBC3JSH0R1tvF7+vQfT/OjqR9YLMt0QTWOz27VX
 YAxu93Hjj+e4bASRIDMUcQy7aSlY3+/EbLEFzrC44CI1ei0OrMZfmnUj3kT6Ix5FBH3mFm
 tcJtTW/FwT18rj8pDhIQev+mjj0NEpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682326708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5qi3O2aD7rdQoBAZWbZmBTd/WmQHLMl1hHZDUbTNtE=;
 b=bxkYG1tZc12Cp9Xm2FMtZGWzZt2B4oY9WD2lpM0S/4OQwd4CgyjxKbouDi0Hqi4zjCzTdo
 GCyoQlXE4n8ERZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC09A13780;
 Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aPXjLLNERmQneQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Apr 2023 08:58:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, geert@linux-m68k.org
Subject: [PATCH 2/3] fbdev/ps3fb: Init owner field of struct fb_ops
Date: Mon, 24 Apr 2023 10:58:24 +0200
Message-Id: <20230424085825.18287-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424085825.18287-1-tzimmermann@suse.de>
References: <20230424085825.18287-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the owner field of struct fb_ops. Required to prevent
module unloading while the driver is in use.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ps3fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 2fe08b67eda7..98aaa330a193 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -936,6 +936,7 @@ static irqreturn_t ps3fb_vsync_interrupt(int irq, void *ptr)
 
 
 static const struct fb_ops ps3fb_ops = {
+	.owner		= THIS_MODULE,
 	.fb_open	= ps3fb_open,
 	.fb_release	= ps3fb_release,
 	.fb_read        = fb_sys_read,
-- 
2.40.0

