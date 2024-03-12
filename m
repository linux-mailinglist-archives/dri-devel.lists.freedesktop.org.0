Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D121D879831
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B716112ECC;
	Tue, 12 Mar 2024 15:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="x8yWxvCP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WfbxwxrU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x8yWxvCP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WfbxwxrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96F7112EBC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:48:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA0E35D6CD;
 Tue, 12 Mar 2024 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3jobBYVSb7aHLcyPcp4C70Q5yD6wk7vtIK+a1bf1GE=;
 b=x8yWxvCPc4fPODFFHiOnL57Yfp/Zev8noyolJDwM53W7dkVjwiGVEdMnodJOst4WGqqN8H
 W0nx2tjPq4RcoQnJ9blyDgemSELTYbIbfZuRyG0GmuJFPyHEhZ93Wf/DJWmFfxEqgW5Bpp
 JhJhSk3phmrsEYWqMY6ogExkdGrr2u4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3jobBYVSb7aHLcyPcp4C70Q5yD6wk7vtIK+a1bf1GE=;
 b=WfbxwxrU3ghgHtWrPsdkJQgHJmaJGcPrul9aEplkeyHfrdcauFbsCy8aBzTwMk7xLzRbBW
 Xtqoflrzb+myM/Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3jobBYVSb7aHLcyPcp4C70Q5yD6wk7vtIK+a1bf1GE=;
 b=x8yWxvCPc4fPODFFHiOnL57Yfp/Zev8noyolJDwM53W7dkVjwiGVEdMnodJOst4WGqqN8H
 W0nx2tjPq4RcoQnJ9blyDgemSELTYbIbfZuRyG0GmuJFPyHEhZ93Wf/DJWmFfxEqgW5Bpp
 JhJhSk3phmrsEYWqMY6ogExkdGrr2u4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3jobBYVSb7aHLcyPcp4C70Q5yD6wk7vtIK+a1bf1GE=;
 b=WfbxwxrU3ghgHtWrPsdkJQgHJmaJGcPrul9aEplkeyHfrdcauFbsCy8aBzTwMk7xLzRbBW
 Xtqoflrzb+myM/Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 641FF13976;
 Tue, 12 Mar 2024 15:48:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Fe8Fld58GUhPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 09/43] drm/ast: Use fbdev-shmem
Date: Tue, 12 Mar 2024 16:45:04 +0100
Message-ID: <20240312154834.26178-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.87 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.03)[56.96%]
X-Spam-Score: 0.87
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 90bcb1eb9cd94..4fcab4304e176 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -32,7 +32,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
@@ -359,7 +359,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_shmem_setup(drm, 32);
 
 	return 0;
 }
-- 
2.44.0

