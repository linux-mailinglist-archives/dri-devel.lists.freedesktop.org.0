Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D398A41E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85F10E485;
	Mon, 30 Sep 2024 13:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bTNbuUm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LyQJfHuA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bTNbuUm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LyQJfHuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A078E10E46B;
 Mon, 30 Sep 2024 13:09:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22C151FBA4;
 Mon, 30 Sep 2024 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMpkYqfpwe/psGfRta7/3orVWagMJVdd5QNNZFqS+6E=;
 b=bTNbuUm/bHF6F+ocQANWQ3I4fGcb1tpQJYlFGgMgdSg4dkTjMRiuouuqOKBx1CjukNf1Jz
 Ok9Q677KUl0g3KKCZdQw0BFJ42L21+ikmjVr59IfrpqWG1glfpKG+VLfJVjaftV4gwUoPP
 03n3KyBWyim1MRhorL/m2o6OBpJ/0Ks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMpkYqfpwe/psGfRta7/3orVWagMJVdd5QNNZFqS+6E=;
 b=LyQJfHuA3XS/0hnjejNJB2XAW+b7FCc1HC06jVMxxAmMJRSt/KvwerJJPwlSbOT8KFCSak
 RF7UrVkPlscd5GBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMpkYqfpwe/psGfRta7/3orVWagMJVdd5QNNZFqS+6E=;
 b=bTNbuUm/bHF6F+ocQANWQ3I4fGcb1tpQJYlFGgMgdSg4dkTjMRiuouuqOKBx1CjukNf1Jz
 Ok9Q677KUl0g3KKCZdQw0BFJ42L21+ikmjVr59IfrpqWG1glfpKG+VLfJVjaftV4gwUoPP
 03n3KyBWyim1MRhorL/m2o6OBpJ/0Ks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMpkYqfpwe/psGfRta7/3orVWagMJVdd5QNNZFqS+6E=;
 b=LyQJfHuA3XS/0hnjejNJB2XAW+b7FCc1HC06jVMxxAmMJRSt/KvwerJJPwlSbOT8KFCSak
 RF7UrVkPlscd5GBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6E3413AAA;
 Mon, 30 Sep 2024 13:09:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0IVgKwaj+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 07/28] drm/i915: Use video aperture helpers
Date: Mon, 30 Sep 2024 15:03:05 +0200
Message-ID: <20240930130921.689876-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

DRM's aperture functions have long been implemented as helpers
under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
calling the video functions directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/i915/i915_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index b3eb35fa5ff8..365329ff8a07 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -27,6 +27,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -39,7 +40,6 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/vt.h>
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
@@ -485,7 +485,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_perf;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, dev_priv->drm.driver);
+	ret = aperture_remove_conflicting_pci_devices(pdev, dev_priv->drm.driver->name);
 	if (ret)
 		goto err_ggtt;
 
-- 
2.46.0

