Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E225B4AB1AE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D410F2F9;
	Sun,  6 Feb 2022 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A4B10E241
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:29:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52AB41F386;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644175779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qn2YEnnkh0K8jChe/bWTsgMM/PVWs5HZfXZiHlsaRI=;
 b=0CRTADOKMWxTJX9u8EFG5uofzw2tTBs9AcwszfWo/JihopmPuWHMAerysUmMWo3jxMPKOm
 6AQIX2A2n9ghkXFFnHGAhMbvNbbpR/nWXo/3DVNLOLFtcKqKsGbavFmP5CBMrl7NcDc5nO
 iZjp7v96yruLfH0wyUaHwZx1fZtj6EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644175779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qn2YEnnkh0K8jChe/bWTsgMM/PVWs5HZfXZiHlsaRI=;
 b=cJfgOlmxUNskrzGyXARDNQM71MwNTronfDCwkpbNuJwybC23tbK1dZtpYSLJoKim0nVCua
 r2oZBRh9SlEHGDBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DDF413A05;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sCAzBqMhAGLlJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Feb 2022 19:29:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 1/5] drm/fb-helper: Fix clip rectangle height
Date: Sun,  6 Feb 2022 20:29:31 +0100
Message-Id: <20220206192935.24645-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220206192935.24645-1-tzimmermann@suse.de>
References: <20220206192935.24645-1-tzimmermann@suse.de>
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

