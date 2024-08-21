Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D9959F1F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDE810E575;
	Wed, 21 Aug 2024 13:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K3NhJ+SA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sfXACtKR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3NhJ+SA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sfXACtKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564B10E575;
 Wed, 21 Aug 2024 13:57:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 046D221D5B;
 Wed, 21 Aug 2024 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724248673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=66MS1vAMdhKiRnj4JVgklKnWebOl3sxpMfpANfT8of4=;
 b=K3NhJ+SAw2PKvlhOVZm/Fx0/NTV0bOHG+cDjLPRzqw0cWwMBH4xcl+iz2XdqVtdQez9pqv
 0P99wrHF/U5DMov25L9sKFMe7SFoC+G28fLw37VxAZLzVJ3t5qB96WDPbBeKxBU2+oQIkW
 u2Y6e2LysRLfP3qI3+rJHErdFAvE4Q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724248673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=66MS1vAMdhKiRnj4JVgklKnWebOl3sxpMfpANfT8of4=;
 b=sfXACtKRTv168NmE/oscJ/emfR1gI/kH0C8ZhT9QVXkvF2a4vZ7lkwDkxD+haCgC0IkBE2
 4NuQhc8FQjQFvWCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K3NhJ+SA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sfXACtKR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724248673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=66MS1vAMdhKiRnj4JVgklKnWebOl3sxpMfpANfT8of4=;
 b=K3NhJ+SAw2PKvlhOVZm/Fx0/NTV0bOHG+cDjLPRzqw0cWwMBH4xcl+iz2XdqVtdQez9pqv
 0P99wrHF/U5DMov25L9sKFMe7SFoC+G28fLw37VxAZLzVJ3t5qB96WDPbBeKxBU2+oQIkW
 u2Y6e2LysRLfP3qI3+rJHErdFAvE4Q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724248673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=66MS1vAMdhKiRnj4JVgklKnWebOl3sxpMfpANfT8of4=;
 b=sfXACtKRTv168NmE/oscJ/emfR1gI/kH0C8ZhT9QVXkvF2a4vZ7lkwDkxD+haCgC0IkBE2
 4NuQhc8FQjQFvWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF1F4139C2;
 Wed, 21 Aug 2024 13:57:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t3VnKWDyxWaTKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:57:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
Date: Wed, 21 Aug 2024 15:56:59 +0200
Message-ID: <20240821135750.102117-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 046D221D5B
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Setting 'nomodeset' on the kernel command line disables all graphics
drivers with modesetting capabilities; leaving only firmware drivers,
such as simpledrm or efifb.

Most DRM drivers automatically support 'nomodeset' via DRM's module
helper macros. In xe, which uses regular module_init(), manually call
drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
the driver if set.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xe/xe_module.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 923460119cec..60fb7dd26903 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -8,6 +8,8 @@
 #include <linux/init.h>
 #include <linux/module.h>
 
+#include <drm/drm_module.h>
+
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
@@ -92,6 +94,9 @@ static int __init xe_init(void)
 {
 	int err, i;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = init_funcs[i].init();
 		if (err) {
-- 
2.46.0

