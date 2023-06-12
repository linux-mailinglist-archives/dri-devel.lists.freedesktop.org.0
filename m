Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9672C793
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7A10E263;
	Mon, 12 Jun 2023 14:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F710E058
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:14:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B52E2048B;
 Mon, 12 Jun 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686579240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbUjj/PueO+Es73bAqXH5DD3UCVS6BRl+fKU1vkiyGY=;
 b=KEJxLICdhH0tm46UM+vGa6MA1q5H4k2lbtjGIeYeHGiMAy5XIAQurXLAbBIeDClzC6V6nV
 XqjzvBAeknCZEAY5CTfk34VoO1dFdI6LyV7pJzlophEfJatxJva0cxSBSxdfRbF22sl39z
 IGpqe4k5O1D/vXJUfxnIbwZKtSIhOX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686579240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbUjj/PueO+Es73bAqXH5DD3UCVS6BRl+fKU1vkiyGY=;
 b=TOnbRsF5IjIS4iot6RtRpIrgIU3/ZxJuA71pk2pYhnF/DMQix38TToCkmp8DZZ0hJx2XM5
 I5U66om943pHYIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B9321357F;
 Mon, 12 Jun 2023 14:14:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YJ53ESgoh2RwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v2 17/38] fbdev/metronomefb: Use hardware device for dev_err()
Date: Mon, 12 Jun 2023 16:07:55 +0200
Message-ID: <20230612141352.29939-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
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
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of the fbdev software device, stored in struct
fb_info.dev, with the hardware device from struct fb_info.device
in load_waveform(). The device is only used for printing errors
with dev_err().

This change aligns load_waveform() with the rest of the driver and
prepares fbdev for making struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/metronomefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index bac255c749e78..3e1daca76e114 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -181,7 +181,7 @@ static int load_waveform(u8 *mem, size_t size, int m, int t,
 	int mem_idx = 0;
 	struct waveform_hdr *wfm_hdr;
 	u8 *metromem = par->metromem_wfm;
-	struct device *dev = par->info->dev;
+	struct device *dev = par->info->device;
 
 	if (user_wfm_size)
 		epd_frame_table[par->dt].wfm_size = user_wfm_size;
-- 
2.41.0

