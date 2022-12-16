Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA4164F1CF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 20:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4F410E629;
	Fri, 16 Dec 2022 19:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBEB10E628
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 19:30:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97BF21F37C;
 Fri, 16 Dec 2022 19:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671219007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oY9qiKpbYpZVFGJsPYuk+whdHR3d+Jocoa9Z3bNK0O0=;
 b=d13MX770sjkb+IyKPiFCKee77ZppfuBkdKzFJCnT88lxVy5EGRLVEopvK+ZOdTeKzyjaxg
 EOZWi+N8IUbVVP67B+ZgVMzOuCT3CAfUTe/tVaoN+h34Pc129dfWkEIlVrunnygFggV/Vc
 /96S5OkhS7d/MUlT946yXoTgxqanVEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671219007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oY9qiKpbYpZVFGJsPYuk+whdHR3d+Jocoa9Z3bNK0O0=;
 b=Eg5xe6oMsWdF8tHqNOnfOPnbvIISRYLozxjtF8tJykh1KinkGlPUdOktxDB45ZJlAKiAzk
 cSnmetOqnWUrUgAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D252138FD;
 Fri, 16 Dec 2022 19:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rESsGT/HnGMucgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Dec 2022 19:30:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH] drm/ast: Init iosys_map pointer as I/O memory for damage
 handling
Date: Fri, 16 Dec 2022 20:30:05 +0100
Message-Id: <20221216193005.30280-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ast hardware scans out the primary plane from video memory, which
is in I/O-memory space. Hence init the damage handler's iosys_map
pointer as I/O memory.

Not all platforms support accessing I/O memory as system memory,
although it's usually not a problem in ast's x86-based systems.

The error report is at [1].

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/lkml/202212170111.eInM0unS-lkp@intel.com/T/#u # 1
---
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c7443317c747..e82e9a8d85e5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -636,7 +636,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
 			      struct drm_framebuffer *fb,
 			      const struct drm_rect *clip)
 {
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(ast_plane->vaddr);
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
-- 
2.38.1

