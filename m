Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8831AD6B41
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0010E7B8;
	Thu, 12 Jun 2025 08:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i2rDWLqA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2yOgKzon";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i2rDWLqA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2yOgKzon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14C310E7C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:46:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3D3C219BF;
 Thu, 12 Jun 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749717986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p7L2tue2Dz2utaWsLzAo8fKHB6GYt0JKN+f4d477JJU=;
 b=i2rDWLqAWU5KTrU0rnraEoBdCBvb5MacZmCbTzmSaQCWQ0eLBkxR5C7eCzRx4FVQhACqig
 MFukJrVv9Pxx9XYyCzrTLABVSckeTYjPdcI3h46LgRr7H/O6S8T7RJ48OCzHsm/rHcqB3F
 zpqXTK+a+5wpx3rKIYGKqj6YtuAA+sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749717986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p7L2tue2Dz2utaWsLzAo8fKHB6GYt0JKN+f4d477JJU=;
 b=2yOgKzonCojeOYS0KYFzfCDHtcewRLzLBPm8TVrCMzXkgxaL73LRXSxGESP/4q3irbfdjA
 V5MH4880Y6AsBeDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749717986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p7L2tue2Dz2utaWsLzAo8fKHB6GYt0JKN+f4d477JJU=;
 b=i2rDWLqAWU5KTrU0rnraEoBdCBvb5MacZmCbTzmSaQCWQ0eLBkxR5C7eCzRx4FVQhACqig
 MFukJrVv9Pxx9XYyCzrTLABVSckeTYjPdcI3h46LgRr7H/O6S8T7RJ48OCzHsm/rHcqB3F
 zpqXTK+a+5wpx3rKIYGKqj6YtuAA+sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749717986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p7L2tue2Dz2utaWsLzAo8fKHB6GYt0JKN+f4d477JJU=;
 b=2yOgKzonCojeOYS0KYFzfCDHtcewRLzLBPm8TVrCMzXkgxaL73LRXSxGESP/4q3irbfdjA
 V5MH4880Y6AsBeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8547D139E2;
 Thu, 12 Jun 2025 08:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id djQ+H+KTSmiEMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:46:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Do not include <linux/export.h>
Date: Thu, 12 Jun 2025 10:42:55 +0200
Message-ID: <20250612084257.200907-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
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

Fix the compile-time warning

  drivers/gpu/drm/ast/ast_mode.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 7908087bcb5a..b4e8edc7c767 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -29,7 +29,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
-- 
2.49.0

