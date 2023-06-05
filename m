Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3972299B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102B388647;
	Mon,  5 Jun 2023 14:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBA510E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DB221FE67;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rooyozc3rlPb79s02PNsXsYq23KYMMNHU3oE3QDqmfg=;
 b=h8sKh6syTV0qlp1UO0HImeSqExfoLBqEDgRrp3laLwbTUWWJZU1LjtE/s1MWIJEHSJC9mg
 JXqjz3zdMTC6ZYPg+gCKyDPBSzZSY1p+wcs+NRKQnZmedFxcJdzuBegbg/vvP8sjkjjdBW
 ENSG15WOzhALh+rWJtmh49rg+GpvWis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rooyozc3rlPb79s02PNsXsYq23KYMMNHU3oE3QDqmfg=;
 b=rSvpl4n3MI3GWT2T/kmy9UcSmq5DH8kHmvagcxWaZC6zR0nKY+RiA1QtafefbG/4iNdbCG
 piINtxEJqySyecCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E38513A3C;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sM8eFrX1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 23/30] fbdev/tdfxfb: Set i2c adapter parent to hardware device
Date: Mon,  5 Jun 2023 16:48:05 +0200
Message-Id: <20230605144812.15241-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the 3dfx hardware device from the Linux device hierarchy as
parent device of the i2c adapter. Aligns the driver with the rest
of the codebase and prepares fbdev for making struct fb_info.dev
optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/tdfxfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index cdf8e9fe9948..dd0fa42eceb9 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1327,8 +1327,8 @@ static void tdfxfb_create_i2c_busses(struct fb_info *info)
 	par->chan[0].par = par;
 	par->chan[1].par = par;
 
-	tdfxfb_setup_ddc_bus(&par->chan[0], "Voodoo3-DDC", info->dev);
-	tdfxfb_setup_i2c_bus(&par->chan[1], "Voodoo3-I2C", info->dev);
+	tdfxfb_setup_ddc_bus(&par->chan[0], "Voodoo3-DDC", info->device);
+	tdfxfb_setup_i2c_bus(&par->chan[1], "Voodoo3-I2C", info->device);
 }
 
 static void tdfxfb_delete_i2c_busses(struct tdfx_par *par)
-- 
2.40.1

