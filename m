Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B465A7229B0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4210E2C7;
	Mon,  5 Jun 2023 14:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56510E2B8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5AE0121B6A;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gW4tX9hJ17h46QCBag0ejdOFv0khIYPIDXuua2Or5GQ=;
 b=Q0vyLYSo5gJ7Wz0LZRcD75wZ2R53C1n0w1iv08tyjEnvjuh5Wajy2cWyC/q65ZhktwTOGd
 8be633qPXZtJ0xPdQvPORmoNm/AGUHfbvfK1gqFzPhghJcwhmDy0V4hC8V8GtO0UoQ0RpK
 DwYHlT3oDkT8HwF51MHp+FFgLbL25pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gW4tX9hJ17h46QCBag0ejdOFv0khIYPIDXuua2Or5GQ=;
 b=9SQihTzinOzC1vFvkXBvG6tFMrnOVHrD1UeOm22dGFQTk4eZjWBp+uOMrJhZA2sDsNVNv1
 SbvJxasC+Yi0sNAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14577139C8;
 Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eJYfBLX1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from refcount
Date: Mon,  5 Jun 2023 16:48:04 +0200
Message-Id: <20230605144812.15241-23-tzimmermann@suse.de>
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Detect registered instances of fb_info by reading the reference
counter from struct fb_info.read. Avoids looking at the dev field
and prepares fbdev for making struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
---
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 17cec62cc65d..adb2b1fe8383 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
 	u8 *edid;
 	int i, result = 0, tries = 3;
 
-	if (info->dev) /* only use mutex if info has been registered */
+	if (refcount_read(&info->count)) /* only use mutex if info has been registered */
 		mutex_lock(&info->lock);
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
@@ -1610,7 +1610,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
 	if (edid && (dev->edid != edid))
 		kfree(edid);
 
-	if (info->dev)
+	if (refcount_read(&info->count))
 		mutex_unlock(&info->lock);
 
 	return result;
-- 
2.40.1

