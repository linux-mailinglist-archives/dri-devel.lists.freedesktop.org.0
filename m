Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E894AF650
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292FE89A74;
	Wed,  9 Feb 2022 16:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007589861
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:16:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5FAE21F395;
 Wed,  9 Feb 2022 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644423381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiMELKXopbaFPoaA/mEqSnpERzxd+S3FKfW8ky/hcS8=;
 b=wXxUIVEnp0vaDlOjmroh1ZpE47A45XtyP5m9ZvYegQzel6KU84Pxb72h/Eo/zgWZ/KC13X
 +XcrQiH7NsS91ZmSw5sT8F+yD+cSwbAc6zQmRWNPAnsgCQoR0FXTrvsVXRDPXMjC1/CTcS
 HZn225X6XjYN4xGeq3SQaiDG0MoQhUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644423381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiMELKXopbaFPoaA/mEqSnpERzxd+S3FKfW8ky/hcS8=;
 b=l4RrH44iHQje2fQfA6JqOeSkizr6I3lK06I+4aVN0FCUM0g25gIKXH5okHGaSa3lrXeQY7
 eNW4lyAfpElvSYDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D85013B0C;
 Wed,  9 Feb 2022 16:16:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GFwxCtXoA2KfJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 16:16:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH v2 5/5] drm/fb-helper: Clip damage area horizontally
Date: Wed,  9 Feb 2022 17:16:17 +0100
Message-Id: <20220209161617.3553-6-tzimmermann@suse.de>
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

Clip the damage area horizontally if only a single scanline has been
changed. This is helpful to reduce the memcpy overhead for small writes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4d5410dd96c5..e05a7bd6fb12 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -690,6 +690,18 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 	u32 x2 = info->var.xres;
 	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
 
+	if ((y2 - y1) == 1) {
+		/*
+		 * We've only written to a single scanline. Try to reduce
+		 * the number of horizontal pixels that need an update.
+		 */
+		off_t bit_off = (off % info->fix.line_length) * 8;
+		off_t bit_end = (end % info->fix.line_length) * 8;
+
+		x1 = bit_off / info->var.bits_per_pixel;
+		x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
+	}
+
 	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
 }
 
-- 
2.34.1

