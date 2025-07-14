Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC9B04353
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064E10E4B8;
	Mon, 14 Jul 2025 15:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bo57XADt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r63eU/C8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bo57XADt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r63eU/C8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBD810E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DB4C21248;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxd0SFj25JXor9ZPjQO6JrBJUM2ccXKiPJbaWUCfKb0=;
 b=bo57XADtGCj5jJ5UMImAb3v1PN4x+8BYLswFPSOEZqPIhBKeSXQuy7l8rqTVGEFi7Mc8Cc
 BP8L2W8ZogMLnCl7VT1BpAwTtv+Ova38g1KI4wY/6f5tP7evRfxLq7IUAeAPKR5NENtSSj
 UAsqvF1lOSQigfgXA2Dd8RT0wQKt0gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxd0SFj25JXor9ZPjQO6JrBJUM2ccXKiPJbaWUCfKb0=;
 b=r63eU/C8ujvXraI+73lMVNw4IV6+o6LOGBaumJ7oVOzt6El82rb1mjXvve7Xw3J+A4tNqY
 sa+iEKl+Z7WKZWCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxd0SFj25JXor9ZPjQO6JrBJUM2ccXKiPJbaWUCfKb0=;
 b=bo57XADtGCj5jJ5UMImAb3v1PN4x+8BYLswFPSOEZqPIhBKeSXQuy7l8rqTVGEFi7Mc8Cc
 BP8L2W8ZogMLnCl7VT1BpAwTtv+Ova38g1KI4wY/6f5tP7evRfxLq7IUAeAPKR5NENtSSj
 UAsqvF1lOSQigfgXA2Dd8RT0wQKt0gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxd0SFj25JXor9ZPjQO6JrBJUM2ccXKiPJbaWUCfKb0=;
 b=r63eU/C8ujvXraI+73lMVNw4IV6+o6LOGBaumJ7oVOzt6El82rb1mjXvve7Xw3J+A4tNqY
 sa+iEKl+Z7WKZWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ABDF138A1;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKwNCcAfdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/9] drm/format-helper: Add XRGB8888-to-RGB332 to
 drm_fb_blit()
Date: Mon, 14 Jul 2025 17:13:06 +0200
Message-ID: <20250714151513.309475-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -6.80
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

List the conversion from XRGB8888-to-RGB332 in drm_fb_blit(), so that
drivers based on sysfb-helpers can use it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8f3daf38ca63..37d5e0a7eb46 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1243,6 +1243,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		} else if (dst_format == DRM_FORMAT_BGRX8888) {
 			drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
 			return 0;
+		} else if (dst_format == DRM_FORMAT_RGB332) {
+			drm_fb_xrgb8888_to_rgb332(dst, dst_pitch, src, fb, clip, state);
+			return 0;
 		}
 	}
 
-- 
2.50.0

