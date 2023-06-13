Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AEF72E0D6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1E310E3A0;
	Tue, 13 Jun 2023 11:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4BE10E374
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9B81FD9F;
 Tue, 13 Jun 2023 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8X3yQyHtdAGbqV8Nngj4Yuzd3t4nUJygtIKDANSM4Nc=;
 b=fb7NQvigOWfhSdnOuUEs6DjDj7KZWtfFk1LzP6QBPaIkgtQA5InjB14ZVT6672flPB+BLs
 7w5vg5hCN0Jx0MbRsSJPXZut1QFSlUmzbWVrOzVxgurthL+kr/m7rGCTZ+tegz7usQXpVE
 Ri1EkrJzKAAVLZkzXsdMVwoyIh2UVts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8X3yQyHtdAGbqV8Nngj4Yuzd3t4nUJygtIKDANSM4Nc=;
 b=AdvR9dycWkCIy6DpzBXW2dHx5vLGmuDV3+7VOZjIDE3AeDwVemIh4qXwnOxeWXTr9GiIpS
 yIcMhODSkwuCGaDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C842213483;
 Tue, 13 Jun 2023 11:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDweMIlOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 18/38] fbdev/nvidiafb: Reorder backlight and framebuffer
 init/cleanup
Date: Tue, 13 Jun 2023 13:06:53 +0200
Message-ID: <20230613110953.24176-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/nvidia/nvidia.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index ea4ba3dfb96bb..039e886346fa6 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1400,14 +1400,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pd, info);
 
-	if (backlight)
-		nvidia_bl_init(par);
-
 	if (register_framebuffer(info) < 0) {
 		printk(KERN_ERR PFX "error registering nVidia framebuffer\n");
 		goto err_out_iounmap_fb;
 	}
 
+	if (backlight)
+		nvidia_bl_init(par);
+
 	printk(KERN_INFO PFX
 	       "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
 	       info->fix.id,
@@ -1439,9 +1439,9 @@ static void nvidiafb_remove(struct pci_dev *pd)
 
 	NVTRACE_ENTER();
 
+	nvidia_bl_exit(par);
 	unregister_framebuffer(info);
 
-	nvidia_bl_exit(par);
 	arch_phys_wc_del(par->wc_cookie);
 	iounmap(info->screen_base);
 	fb_destroy_modedb(info->monspecs.modedb);
-- 
2.41.0

