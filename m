Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89381650FF8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBF410E002;
	Mon, 19 Dec 2022 16:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217F210E2BA;
 Mon, 19 Dec 2022 16:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B36CB6089B;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVYvLsFG6f+exAHX9YV2exCISsylgNZMOA5W08XvPSQ=;
 b=WDWo93d+J2PYNjBpbcWDD3AL8nfm2we1M6PNPvbJFxhIjK1TbLS+wJRRCLoSGIgT7jjL0q
 5+iemEoD93yfLjOoycJUnrNs4iF1NUfDrs2VAHOfs9H3zg648rJKWhktVvEmKweAj5YHIM
 SrHlgeZZTrHu84SnOlEaP7pQr2HGb54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVYvLsFG6f+exAHX9YV2exCISsylgNZMOA5W08XvPSQ=;
 b=+xrS6xZIUrSmCMlgO66EWNJJ3CEPP+VBlznk8HddOxqlBDznZvrjsXBPed+3YaY1zpA5oU
 H04kQ+iuTDU1GcDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E2D713910;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OEPfHcCLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 09/18] vfio-mdev/mdpy-fb: Do not set struct fb_info.apertures
Date: Mon, 19 Dec 2022 17:05:07 +0100
Message-Id: <20221219160516.23436-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic fbdev drivers use the apertures field in struct fb_info to
control ownership of the framebuffer memory and graphics device. Do
not set the values in mdpy-fb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 samples/vfio-mdev/mdpy-fb.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 9ec93d90e8a5..1de5801cd2e8 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -161,14 +161,6 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 		goto err_release_fb;
 	}
 
-	info->apertures = alloc_apertures(1);
-	if (!info->apertures) {
-		ret = -ENOMEM;
-		goto err_unmap;
-	}
-	info->apertures->ranges[0].base = info->fix.smem_start;
-	info->apertures->ranges[0].size = info->fix.smem_len;
-
 	info->fbops = &mdpy_fb_ops;
 	info->flags = FBINFO_DEFAULT;
 	info->pseudo_palette = par->palette;
-- 
2.39.0

