Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE378C750
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DA610E334;
	Tue, 29 Aug 2023 14:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8B10E334
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:21:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33ED921862;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693318889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85eywdjr+s4Dlz7EgfspVAn+LVSLK6ku8CULp+IQzqk=;
 b=1t0f3i/0pS5SSu4kFfUn9rlAHosoJxVjkzfNDZ2PshuEdFVVtzQByOyYq0IRZjV0GF3izb
 2l5Lhk07Q0wvElc6sh30hJ+EUM78mqwMQFD2f5bAoZuc4Hs/+rsp4u2sW3869e2e4bhHZi
 DUXQWkED7NTZHygmAl3ZZp0ftNI98TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693318889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85eywdjr+s4Dlz7EgfspVAn+LVSLK6ku8CULp+IQzqk=;
 b=jbn+suS8TLdWgg9CGxC2Zf7jvkzCCd4BtrRF0698qjObu3IbVHfSssMPNwdABF1FRcBftQ
 5bViSOHeg6Jb9XCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06005138E2;
 Tue, 29 Aug 2023 14:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OK+WO+j+7WREewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Aug 2023 14:21:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] fbdev/mmp/mmpfb: Do not display boot-up logo
Date: Tue, 29 Aug 2023 16:15:41 +0200
Message-ID: <20230829142109.4521-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829142109.4521-1-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbcon module takes care of displaying the logo, if any. Remove
the code form mmpfb. If we want to display the logo without fbcon,
we should implement this in the fbdev core code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/mmp/fb/mmpfb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/mmp/fb/mmpfb.c b/drivers/video/fbdev/mmp/fb/mmpfb.c
index 42a87474bcea..2d9797c6fb3e 100644
--- a/drivers/video/fbdev/mmp/fb/mmpfb.c
+++ b/drivers/video/fbdev/mmp/fb/mmpfb.c
@@ -628,13 +628,6 @@ static int mmpfb_probe(struct platform_device *pdev)
 	dev_info(fbi->dev, "loaded to /dev/fb%d <%s>.\n",
 		info->node, info->fix.id);
 
-#ifdef CONFIG_LOGO
-	if (fbi->fb_start) {
-		fb_prepare_logo(info, 0);
-		fb_show_logo(info, 0);
-	}
-#endif
-
 	return 0;
 
 failed_clear_info:
-- 
2.41.0

