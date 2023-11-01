Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912397DDF8A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CFA10E6C0;
	Wed,  1 Nov 2023 10:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DDB10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:36:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F422921A68;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698834981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVvVG4h4/O8YYhjW/qgcKldVEgv6p3ZifQN3s7v8PiU=;
 b=FrKe/yuW+1q0VqvwFjP2xRnFUMrIXNbF3y41mt9F+268ZLGhjIkVUDwsNUBoPx2NAJ4oiD
 6ZXzXrkHVqCiIzccOnX5dcH0fmtY9DWhGYhxV9hONjg7Ng0i1izVmKDumYbHyBLa54NjbU
 +ZgQ/Ce6/ScDONrbjJUGnvZuK+0qg2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698834981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVvVG4h4/O8YYhjW/qgcKldVEgv6p3ZifQN3s7v8PiU=;
 b=7qgbWlY59mGhPDeVrJwkN08dEhkbmAwZGj4wR1wsOwYyfhPM7kS86qxQRFUGWleN+jy9AH
 c8DeuwVbV+bOhnCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C99E61348D;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4FB7MCQqQmVfJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Nov 2023 10:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 2/2] drm: Fix flip-task docs
Date: Wed,  1 Nov 2023 11:35:43 +0100
Message-ID: <20231101103618.23806-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101103618.23806-1-tzimmermann@suse.de>
References: <20231101103618.23806-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Say that drm_flip_work_commit() is safe to call in atomic context. Turn
the name into a hyperlink.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_flip_work.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_flip_work.h b/include/drm/drm_flip_work.h
index 6be4ba6f35143..1eef3283a109c 100644
--- a/include/drm/drm_flip_work.h
+++ b/include/drm/drm_flip_work.h
@@ -31,10 +31,10 @@
 /**
  * DOC: flip utils
  *
- * Util to queue up work to run from work-queue context after flip/vblank.
+ * Utility to queue up work to run from work-queue context after flip/vblank.
  * Typically this can be used to defer unref of framebuffer's, cursor
- * bo's, etc until after vblank.  The APIs are all thread-safe. Moreover,
- * drm_flip_work_queue can be called in atomic context.
+ * bo's, etc until after vblank. The APIs are all thread-safe. Moreover,
+ * drm_flip_work_commit() can be called in atomic context.
  */
 
 struct drm_flip_work;
-- 
2.42.0

