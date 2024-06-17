Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC990A880
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7210E2BB;
	Mon, 17 Jun 2024 08:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aokhwUhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XMFY7XP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aokhwUhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XMFY7XP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C7B10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:33:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B63445FD1C;
 Mon, 17 Jun 2024 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718613219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfUHy7jvC6C04xNMpt9q7GAc0YI8QU0L6ePoL2dWjTI=;
 b=aokhwUhPRMn/0hex1uFpquaVKQxdv+23yq3Shf2fml80DzSdgmTDYnOmz5ojhj6sKvVODD
 l7KwWrpkC3aL323zbF42adrPb4M6J/KhJg0BdzETMiU2AWY0GKfzcgTlHlDeKvMd8/Nz+5
 3o1h360my+RizUAsRTjozCJjU8OJnc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718613219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfUHy7jvC6C04xNMpt9q7GAc0YI8QU0L6ePoL2dWjTI=;
 b=1XMFY7XPvQByI7XhBa0t0Fm7yRelaTQBW9elotikT3qrLkhAV4dqlIJOJ2hck64N3vDgzy
 wG1Ns0vWLs3h9EAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718613219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfUHy7jvC6C04xNMpt9q7GAc0YI8QU0L6ePoL2dWjTI=;
 b=aokhwUhPRMn/0hex1uFpquaVKQxdv+23yq3Shf2fml80DzSdgmTDYnOmz5ojhj6sKvVODD
 l7KwWrpkC3aL323zbF42adrPb4M6J/KhJg0BdzETMiU2AWY0GKfzcgTlHlDeKvMd8/Nz+5
 3o1h360my+RizUAsRTjozCJjU8OJnc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718613219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfUHy7jvC6C04xNMpt9q7GAc0YI8QU0L6ePoL2dWjTI=;
 b=1XMFY7XPvQByI7XhBa0t0Fm7yRelaTQBW9elotikT3qrLkhAV4dqlIJOJ2hck64N3vDgzy
 wG1Ns0vWLs3h9EAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F81B139AB;
 Mon, 17 Jun 2024 08:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gtdCHOL0b2abYwAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Mon, 17 Jun 2024 08:33:38 +0000
Date: Mon, 17 Jun 2024 10:33:36 +0200
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND] drm/logicvc: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20240617103336.7fddb08d@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.20
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.20 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 BAYES_HAM(-0.90)[86.06%]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_TLS_ALL(0.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, imap1.dmz-prg2.suse.org:helo,
 bootlin.com:email]
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
Already sent on: 2022-11-21, 2023-01-27, 2023-12-02

This is one of the only 3 remaining occurrences of this deprecated
construct.

Who can pick this patch and get it upstream?

 drivers/gpu/drm/logicvc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.6.orig/drivers/gpu/drm/logicvc/Kconfig
+++ linux-6.6/drivers/gpu/drm/logicvc/Kconfig
@@ -1,7 +1,7 @@
 config DRM_LOGICVC
 	tristate "LogiCVC DRM"
 	depends on DRM
-	depends on OF || COMPILE_TEST
+	depends on OF
 	select DRM_KMS_HELPER
 	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER


-- 
Jean Delvare
SUSE L3 Support
