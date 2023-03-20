Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1C6C16AE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8910E2B6;
	Mon, 20 Mar 2023 15:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C355B10E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8417C1F890;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8iEY6hvgFvbfS66JBlGNNOLt4qzuk1VBL9oz6gKuvc=;
 b=tY3Ql9iJDGGUUtONILGkHGG9FkJ4d9+WsA4v6XorK3nOjS8nwd/c9ARNmeDsL2oInbTdBk
 +jjMeGO2eWrXoxoWPVVmq+q+uKVjNnZGnZNLZgb9eDNDiHzt/DjxEA41p2sJMh2zEmtmBI
 RYDdLudpgImprfPhVYTQys7obZanak8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8iEY6hvgFvbfS66JBlGNNOLt4qzuk1VBL9oz6gKuvc=;
 b=Tu6H19lK1lCbh1UVuI64UqkklNSYStJ8GirUbFDfpkbi6pGsClREeT6sWYG4wRjNnnoT9g
 g69nLVjVwqw9V3DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 453D613A00;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sIoPEMp2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 4/8] drm/fb-helper: Support smem_len in deferred I/O
Date: Mon, 20 Mar 2023 16:07:47 +0100
Message-Id: <20230320150751.20399-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The size of the framebuffer can either be stored in screen_info or
smem_len. Take both into account in the deferred I/O code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7e96ed9efdb5..bb0b25209b3e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -672,7 +672,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct drm_fb_helper *helper = info->par;
-	unsigned long start, end, min_off, max_off;
+	unsigned long start, end, min_off, max_off, total_size;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
 
@@ -690,7 +690,11 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	 * of the screen and account for non-existing scanlines. Hence,
 	 * keep the covered memory area within the screen buffer.
 	 */
-	max_off = min(max_off, info->screen_size);
+	if (info->screen_size)
+		total_size = info->screen_size;
+	else
+		total_size = info->fix.smem_len;
+	max_off = min(max_off, total_size);
 
 	if (min_off < max_off) {
 		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-- 
2.40.0

