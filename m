Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D04AF64C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC198940F;
	Wed,  9 Feb 2022 16:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA828940F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:16:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 795791F391;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644423380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N3hwcZ6U0eeB2bB4kBMlba2G8Dou5+SERWSqy8K9kg=;
 b=c64mkdQpya3J4ld/jR20tQ/GEcE/EDe1mDNJ3haY1mhIdo3ioe2jIIcrlSKZAyXzDvhXBg
 DPBdRuGBBSSujk8/mb4a8gUl0vENdCh86GmKn6SWpSJUOKtSaV+zZ9PDdmq2TPytsrhmWh
 TvCX/1TQWdawF+giujStxoTYlmo13A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644423380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N3hwcZ6U0eeB2bB4kBMlba2G8Dou5+SERWSqy8K9kg=;
 b=y0q2U3FeIF64JRH6l1RbzNH9/b2GYh00eF6aEIRhCxuHd5VUvpBFuNb16Zha2Qg4/WFVib
 +T8856TlwHg7LPDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4405113D58;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gKt5D9ToA2KfJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 16:16:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH v2 1/5] drm/fb-helper: Fix clip rectangle height
Date: Wed,  9 Feb 2022 17:16:13 +0100
Message-Id: <20220209161617.3553-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209161617.3553-1-tzimmermann@suse.de>
References: <20220209161617.3553-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Computing the clip rectangle is prone to off-by-one errors when writes
happen near the end of a memory page. Point the end of the memory area
to the first trailing byte, so that (end - start) returns the area's
length.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f15127a32f7a..a37fb4a980c8 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -699,7 +699,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 	max = 0;
 	list_for_each_entry(page, pagelist, lru) {
 		start = page->index << PAGE_SHIFT;
-		end = start + PAGE_SIZE - 1;
+		end = start + PAGE_SIZE;
 		min = min(min, start);
 		max = max(max, end);
 	}
-- 
2.34.1

