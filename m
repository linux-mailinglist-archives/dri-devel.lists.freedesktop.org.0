Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B690A4CB4A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55E910E1E3;
	Mon,  3 Mar 2025 18:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M4uknBN6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+lZ+h5H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yBPrUOlu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FGtEzzNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04B610E1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 18:52:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7899321194;
 Mon,  3 Mar 2025 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741027925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mT0cERLDTrLS/bDCn8a/BC29Z3aaavWOT85xSsOafsE=;
 b=M4uknBN6hstU5GDISBDeMh623Q9Y+kmz8fc9IKoBi+P4MItgCTTSYiVSS97TwmZA6k5kVr
 OrAPIisdJJSvfCItUFi/2ymBBGIlo0CMt1JeZRp3u/Gbwg8gnvtkSh5oX58ObWyzGYQMEU
 SudeYeaSuxwY6H2NksHtfOmWDZ/i4pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741027925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mT0cERLDTrLS/bDCn8a/BC29Z3aaavWOT85xSsOafsE=;
 b=9+lZ+h5H/icLb0IYdfkQSU39+BphgRoa0UagzNPuyk+up3gcM84hKnJkBaPg7KSZgqvyDr
 Qw5HGQt7JFbs44Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741027924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mT0cERLDTrLS/bDCn8a/BC29Z3aaavWOT85xSsOafsE=;
 b=yBPrUOluSwRpDaA7KC+P1Y3cvVd9nwqpJk4/GH4eA7P2OSLv5R/emW6NAMOCPISW22L/u3
 s8h9+xLyxX1NUsDXsHPDLjvqnD1jhW7gVEDaHLBnHMn3dNEA4I8JG0Gj0RptVkf0cWfszj
 QS+0NxoFaid0ejbmXdogk+rJVcds0no=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741027924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mT0cERLDTrLS/bDCn8a/BC29Z3aaavWOT85xSsOafsE=;
 b=FGtEzzNIv0ZYF50HjzrJSAnoIRoaGWUYHGtZbRYEXX3HkwPEmL22QegRgmiKRltw2rxLCT
 uJjdVF5hfV1FihAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 256D313939;
 Mon,  3 Mar 2025 18:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZjCSBlT6xWfSTwAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Mon, 03 Mar 2025 18:52:04 +0000
Date: Mon, 3 Mar 2025 19:52:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/logicvc: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20250303195201.5f4069bb@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; HAS_ORG_HEADER(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.80
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
Changes since v1:
 * Rebase on top of v6.13.
 * Extend the description to better explain the rationale behind the
   change.
 * Stop listing the Cc in the description.

 drivers/gpu/drm/logicvc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.13.orig/drivers/gpu/drm/logicvc/Kconfig
+++ linux-6.13/drivers/gpu/drm/logicvc/Kconfig
@@ -1,7 +1,7 @@
 config DRM_LOGICVC
 	tristate "LogiCVC DRM"
 	depends on DRM
-	depends on OF || COMPILE_TEST
+	depends on OF
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_KMS_DMA_HELPER


-- 
Jean Delvare
SUSE L3 Support
