Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D4BDED7D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA41710E7F5;
	Wed, 15 Oct 2025 13:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="09pUS0WC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NpJUV8sL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="09pUS0WC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NpJUV8sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCFE10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:50:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8ABDA21036;
 Wed, 15 Oct 2025 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760536245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m55Z1MpiPA9kFipYDGRqhKKsAgHyNh0/e6FGRD9sxiI=;
 b=09pUS0WCGuHzHKwAQv3KtiKyjXJkm2oXe5cSkHX7Tv+xr1Gb13r1WZWx5kUrpW9HwanM+U
 NO9TJsiDj6E26YtQw52EHARzClvo+PzIK2CPRjmhZyrb+0rRsn8CDgnpMiZw8meoGmbGPA
 +cGpQ7fKWdlhS5BbwRwB4Rizvd6SGT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760536245;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m55Z1MpiPA9kFipYDGRqhKKsAgHyNh0/e6FGRD9sxiI=;
 b=NpJUV8sLm4zOQkt7UpjEtKjS8XXFRC9tQ7Qlgp0WwGaYYH05foDB6gNbAWHmh24ew6vczh
 AW+u/qF7q7bWfyBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760536245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m55Z1MpiPA9kFipYDGRqhKKsAgHyNh0/e6FGRD9sxiI=;
 b=09pUS0WCGuHzHKwAQv3KtiKyjXJkm2oXe5cSkHX7Tv+xr1Gb13r1WZWx5kUrpW9HwanM+U
 NO9TJsiDj6E26YtQw52EHARzClvo+PzIK2CPRjmhZyrb+0rRsn8CDgnpMiZw8meoGmbGPA
 +cGpQ7fKWdlhS5BbwRwB4Rizvd6SGT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760536245;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m55Z1MpiPA9kFipYDGRqhKKsAgHyNh0/e6FGRD9sxiI=;
 b=NpJUV8sLm4zOQkt7UpjEtKjS8XXFRC9tQ7Qlgp0WwGaYYH05foDB6gNbAWHmh24ew6vczh
 AW+u/qF7q7bWfyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F67013A42;
 Wed, 15 Oct 2025 13:50:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZHsJDrWm72jBYQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 15 Oct 2025 13:50:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: intel-gfx@lists.freedesktop.org
Cc: Petr Vorel <pvorel@suse.cz>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/dmc: Use drm_WARN_ONCE()
Date: Wed, 15 Oct 2025 15:50:42 +0200
Message-ID: <20251015135042.16744-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

assert_dmc_loaded() removed in 43175c92d4038 used drm_WARN_ONCE(),
but new assert_dmc_loaded() use drm_WARN().

Log is already noise quite a lot due loop over dmc->dmc_info[dmc_id]
array (76 logs on my machine), therefore use drm_WARN_ONCE().

Fixes: 43175c92d4038 ("drm/i915/dmc: Assert DMC is loaded harder")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Ville, am I wrong and it's really needed to see all the oops for the
threads?

Kind regards,
Petr

 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 517bebb0b4aac..53db7279c7c99 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -626,7 +626,7 @@ static void assert_dmc_loaded(struct intel_display *display,
 	found = intel_de_read(display, DMC_PROGRAM(dmc->dmc_info[dmc_id].start_mmioaddr, 0));
 	expected = dmc->dmc_info[dmc_id].payload[0];
 
-	drm_WARN(display->drm, found != expected,
+	drm_WARN_ONCE(display->drm, found != expected,
 		 "DMC %d program storage start incorrect (expected 0x%x, current 0x%x)\n",
 		 dmc_id, expected, found);
 
@@ -642,7 +642,7 @@ static void assert_dmc_loaded(struct intel_display *display,
 			expected &= ~DMC_EVT_CTL_ENABLE;
 		}
 
-		drm_WARN(display->drm, found != expected,
+		drm_WARN_ONCE(display->drm, found != expected,
 			 "DMC %d mmio[%d]/0x%x incorrect (expected 0x%x, current 0x%x)\n",
 			 dmc_id, i, i915_mmio_reg_offset(reg), expected, found);
 	}
-- 
2.51.0

