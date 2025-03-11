Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E0A5C98B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C27310E5E3;
	Tue, 11 Mar 2025 15:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B0jvFv7S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVVQSTm+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B0jvFv7S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lVVQSTm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795EC10E638
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:55:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 898702118A;
 Tue, 11 Mar 2025 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShM7QkYxOUzYuiM1Xi5REKpzUXaj1yvUsfwZ2Eb5boc=;
 b=B0jvFv7SeS7UCsM1iOswc5xTzBNoHtlLeuVtgU6fEbQt/UPX917FEITX069krd9irivNA8
 YwnpsS6HRTu0oXpFG/C9Dy7vjk4/FvfW/agVckY6UIukcbwmMdOmmQcVeyVaLDyqSm3Xcp
 usPBnz2+grKLPgNbU0IuxeBWp+b/2ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShM7QkYxOUzYuiM1Xi5REKpzUXaj1yvUsfwZ2Eb5boc=;
 b=lVVQSTm+Eln78u7D7xyM5Xcu1GeHre8Gr1VQRGSz/ramC7ySCZbO6sm2E9ySKEqMJ//0Sl
 Et56mXkKfm7BA2AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShM7QkYxOUzYuiM1Xi5REKpzUXaj1yvUsfwZ2Eb5boc=;
 b=B0jvFv7SeS7UCsM1iOswc5xTzBNoHtlLeuVtgU6fEbQt/UPX917FEITX069krd9irivNA8
 YwnpsS6HRTu0oXpFG/C9Dy7vjk4/FvfW/agVckY6UIukcbwmMdOmmQcVeyVaLDyqSm3Xcp
 usPBnz2+grKLPgNbU0IuxeBWp+b/2ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShM7QkYxOUzYuiM1Xi5REKpzUXaj1yvUsfwZ2Eb5boc=;
 b=lVVQSTm+Eln78u7D7xyM5Xcu1GeHre8Gr1VQRGSz/ramC7ySCZbO6sm2E9ySKEqMJ//0Sl
 Et56mXkKfm7BA2AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC3C0134A0;
 Tue, 11 Mar 2025 15:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iGpXONVc0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:55:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 24/25] drm/xen: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:28 +0100
Message-ID: <20250311155120.442633-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[22]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1bda7ef606cc..fd2f250fbc33 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_file.h>
@@ -414,8 +415,10 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	 * object without pages etc.
 	 * For details also see drm_gem_handle_create
 	 */
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
 	if (IS_ERR(obj)) {
-- 
2.48.1

