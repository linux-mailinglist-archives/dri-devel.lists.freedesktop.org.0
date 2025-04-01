Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA0A78029
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4011F10E610;
	Tue,  1 Apr 2025 16:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yKGPLyTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KTK27RnJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yKGPLyTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KTK27RnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD44610E610
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C433921171;
 Tue,  1 Apr 2025 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r64HPMd3PgWFeKM2ZjAfZ3PR/7nPjv0vwnZgbRsy7X0=;
 b=yKGPLyTvRnE9ytXnh7nVzrtbH4AySBa+833Ct0/VTT6mP0rHOTA6uK51QU84fNMWGcKGIg
 FW4NJoUkSpTQsnKIMtdXTKtiYnX/Sf6nkfzI0TgxvriKKSVGpgyfYSVApjYtKWfkinLLoC
 xDQ4+ErQ18qiwpUQ9MZENrUn8sibtlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r64HPMd3PgWFeKM2ZjAfZ3PR/7nPjv0vwnZgbRsy7X0=;
 b=KTK27RnJWwXYjIrHB2TZ4Xm8t3wZtf+1nPWLqmDK6UF8G0nO1edQ21BiJZRMpK/TVZKt+3
 ayQoD6idf8dB6FAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r64HPMd3PgWFeKM2ZjAfZ3PR/7nPjv0vwnZgbRsy7X0=;
 b=yKGPLyTvRnE9ytXnh7nVzrtbH4AySBa+833Ct0/VTT6mP0rHOTA6uK51QU84fNMWGcKGIg
 FW4NJoUkSpTQsnKIMtdXTKtiYnX/Sf6nkfzI0TgxvriKKSVGpgyfYSVApjYtKWfkinLLoC
 xDQ4+ErQ18qiwpUQ9MZENrUn8sibtlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r64HPMd3PgWFeKM2ZjAfZ3PR/7nPjv0vwnZgbRsy7X0=;
 b=KTK27RnJWwXYjIrHB2TZ4Xm8t3wZtf+1nPWLqmDK6UF8G0nO1edQ21BiJZRMpK/TVZKt+3
 ayQoD6idf8dB6FAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D2B3138A5;
 Tue,  1 Apr 2025 16:23:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EEQsJekS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] drm/udl: Remove unused field gem_lock from struct
 udl_device
Date: Tue,  1 Apr 2025 18:12:12 +0200
Message-ID: <20250401161929.283244-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161929.283244-1-tzimmermann@suse.de>
References: <20250401161929.283244-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_FIVE(0.00)[5]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -5.30
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

Reduce the size of struct udl_device by removing the unused
field gem_lock.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h  | 2 --
 drivers/gpu/drm/udl/udl_main.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 7bae28885f923..1204319fc8e33 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -56,8 +56,6 @@ struct udl_device {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 
-	struct mutex gem_lock;
-
 	int sku_pixel_limit;
 
 	struct urb_list urbs;
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 48260a821b8d1..f1ffa928d5d9e 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -320,8 +320,6 @@ int udl_init(struct udl_device *udl)
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
 	}
 
-	mutex_init(&udl->gem_lock);
-
 	if (!udl_parse_vendor_descriptor(udl)) {
 		ret = -ENODEV;
 		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
-- 
2.49.0

