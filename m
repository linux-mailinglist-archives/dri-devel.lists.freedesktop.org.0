Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA2D038BF
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1B210E789;
	Thu,  8 Jan 2026 14:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Lxm2xQv6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lcGaH30D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lxm2xQv6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lcGaH30D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BB710E78B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DF603430B;
 Thu,  8 Jan 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767883864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtWuYnCgoXawm8oOJ8vQ3oljrjDp+noC1pUoDivs/Hs=;
 b=Lxm2xQv61wkLDdZOsORv2qraVdoxrLeJK0wuom7FOlivmp/+VD7ENjb3imF6IP8GyTTMOQ
 4YdhnjJNfzHNcDH+Fh2JOySKD7q0sKmpZ9FYWTUDCfkS9Qkd0IYRcgJ7KUkEeqo6jBQ01r
 ZYvPgMA4ItFQGWfqqQCdrS7XeRnEFb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767883864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtWuYnCgoXawm8oOJ8vQ3oljrjDp+noC1pUoDivs/Hs=;
 b=lcGaH30D0QJggYrzchMKnO+eqMDLzh/m12RULWO1eHA0FPcooUV+2Q1sKN8tGeNlQzREPn
 et/3uSJTs5dP8kAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767883864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtWuYnCgoXawm8oOJ8vQ3oljrjDp+noC1pUoDivs/Hs=;
 b=Lxm2xQv61wkLDdZOsORv2qraVdoxrLeJK0wuom7FOlivmp/+VD7ENjb3imF6IP8GyTTMOQ
 4YdhnjJNfzHNcDH+Fh2JOySKD7q0sKmpZ9FYWTUDCfkS9Qkd0IYRcgJ7KUkEeqo6jBQ01r
 ZYvPgMA4ItFQGWfqqQCdrS7XeRnEFb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767883864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtWuYnCgoXawm8oOJ8vQ3oljrjDp+noC1pUoDivs/Hs=;
 b=lcGaH30D0QJggYrzchMKnO+eqMDLzh/m12RULWO1eHA0FPcooUV+2Q1sKN8tGeNlQzREPn
 et/3uSJTs5dP8kAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C28C73EA63;
 Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0BRMLlfEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: [PATCH 6/8] drm/sysfb: Remove duplicate declarations
Date: Thu,  8 Jan 2026 15:19:46 +0100
Message-ID: <20260108145058.56943-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLf8s8spogujn9h9roxabhn3pd)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Commit 6046b49bafff ("drm/sysfb: Share helpers for integer validation")
and commit e8c086880b2b ("drm/sysfb: Share helpers for screen_info
validation") added duplicate function declarations. Remove the latter
ones.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: e8c086880b2b ("drm/sysfb: Share helpers for screen_info validation")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index da670d7eeb2e..de96bfe7562c 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -54,15 +54,6 @@ const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
 						      const struct screen_info *si);
 #endif
 
-/*
- * Input parsing
- */
-
-int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
-				u64 value, u32 max);
-int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
-				 u64 value, u32 max);
-
 /*
  * Display modes
  */
-- 
2.52.0

