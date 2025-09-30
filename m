Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C6BAD019
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687610E572;
	Tue, 30 Sep 2025 13:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uf93xsvm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="motZ2xTq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwCN8Y6d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iiUPH0wo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC6D10E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:17:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AEC91F7D0;
 Tue, 30 Sep 2025 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759238238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=opvltwl7JenMSEgRjfBtCxRUKZPECN5iClt5HhkDpLg=;
 b=uf93xsvmDnw3fjc52LsA7U81nql68h6Gpip6WlYr1I7OT4VsfULrCtD90+jaqbgYBIVe2p
 /dhIHjz55IEzup6yIXQT/c0qHklG8nldXmaj5ANyM4I/NzqQ3gfYySv5omIzVQ4pgVicN7
 zOfeFzA4z5668by5MZFrLFzYBoBOixA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759238238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=opvltwl7JenMSEgRjfBtCxRUKZPECN5iClt5HhkDpLg=;
 b=motZ2xTqx6uX4i+Dn0RQmOt03CDlxC6AHVk65fDiP2N0FcKsgJc4tFAh+l5WK/8fMd9HP9
 1bNpKKcsfzmEPrDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759238237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=opvltwl7JenMSEgRjfBtCxRUKZPECN5iClt5HhkDpLg=;
 b=fwCN8Y6djUJ1xMrAMZaJqBFATpwIprwM/GwvsoEQcwQusR/ZPeZpuDjH40fTOKdt4d2pgz
 VkhNtlBOIFEMuqrvv5C/csi1aEI0fKMFrDXeZGhSmjmSCIX9/r45MITyFhU2Q/twp5+P8W
 VLeHs3LI9ZKzUNTOX7xOcDehZDrI7jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759238237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=opvltwl7JenMSEgRjfBtCxRUKZPECN5iClt5HhkDpLg=;
 b=iiUPH0woxJMa+EvKt4M9oq0rINR/r+LLL7k0TybCNMlvmsGyZ/X5mJDHPx86c80DYS5YZW
 aQKmENzQxE8TyVAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBFF01342D;
 Tue, 30 Sep 2025 13:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M6QfMFzY22htQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Sep 2025 13:17:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lyude@redhat.com,
	dakr@kernel.org,
	jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/nouveau: Do not include drm_fb_helper.h
Date: Tue, 30 Sep 2025 15:14:04 +0200
Message-ID: <20250930131428.111160-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

The driver doesn't need anything from <drm/drm_fb_helper.h>. Remove
the include directive.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..1d4d1bb63326 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -40,7 +40,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-- 
2.51.0

