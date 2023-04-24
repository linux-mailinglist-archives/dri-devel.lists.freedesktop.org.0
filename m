Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C663A6EC832
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 10:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9457F10E466;
	Mon, 24 Apr 2023 08:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FBC10E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 08:58:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7EFD1FD7B;
 Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682326707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KsN1V3LZEtdFqq36eDVk4nfUTrXtItgjE/Q0UzO78c=;
 b=sjYBGC5tRcaRbxsA0CbMhwi5UJ/73GQmAvfX+FQdgdg6yjeUA7hpEc3l3aU72HBjLNMdsk
 kW0o3nstNkyPoUv1p+3/D9g+HJLRiC03MzUJDvFnrpA0sG30UwZm92GZIBFkX3rSzz1hcM
 0mTidvlMkJONGtc3IwswNns4HLZxurE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682326707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KsN1V3LZEtdFqq36eDVk4nfUTrXtItgjE/Q0UzO78c=;
 b=XCAwZFYnqzDJjsVExF5zNxPQcqXS00+Je86sHFdRXlHUJ9zCjrFRjtCAxO4s29ZqpCxyQe
 j/gs37RoafugclDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 793141391A;
 Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CI+wHLNERmQneQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Apr 2023 08:58:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, geert@linux-m68k.org
Subject: [PATCH 1/3] fbdev/68328fb: Init owner field of struct fb_ops
Date: Mon, 24 Apr 2023 10:58:23 +0200
Message-Id: <20230424085825.18287-2-tzimmermann@suse.de>
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
 drivers/video/fbdev/68328fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index ef49cdfb7dd2..07d6e8dc686b 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -94,6 +94,7 @@ static int mc68x328fb_pan_display(struct fb_var_screeninfo *var,
 static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
 static const struct fb_ops mc68x328fb_ops = {
+	.owner		= THIS_MODULE,
 	.fb_check_var	= mc68x328fb_check_var,
 	.fb_set_par	= mc68x328fb_set_par,
 	.fb_setcolreg	= mc68x328fb_setcolreg,
-- 
2.40.0

