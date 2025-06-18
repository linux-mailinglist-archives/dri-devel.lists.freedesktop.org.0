Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A883ADEC1E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 14:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7610E814;
	Wed, 18 Jun 2025 12:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sD/pSipU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ETZmOLA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sD/pSipU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ETZmOLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738C610E812
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 12:28:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A6102124B;
 Wed, 18 Jun 2025 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750249663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
 b=sD/pSipURoAjfZDtD17C/cE7Y/2Dop4p7+Db79McXuVWx/LA5MfAUwdjhrFeRzEGgvdtXp
 0HXfebGNiVaElP/B++qsty22iiuNuNXZWxYNdQaPevXlgoSgIUpGAXGxRoNgwfYXIc2csX
 udDIhGvrVvTN6ajjBIJmjuVnHHbGMmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750249663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
 b=0ETZmOLA1urJICvFcAmLaeAr3Lh14MSgG6vJ83mcoP9sZWA0E5poFxgAQJC3DflKnpUryp
 VQaED3Lv+LR2k/DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750249663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
 b=sD/pSipURoAjfZDtD17C/cE7Y/2Dop4p7+Db79McXuVWx/LA5MfAUwdjhrFeRzEGgvdtXp
 0HXfebGNiVaElP/B++qsty22iiuNuNXZWxYNdQaPevXlgoSgIUpGAXGxRoNgwfYXIc2csX
 udDIhGvrVvTN6ajjBIJmjuVnHHbGMmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750249663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
 b=0ETZmOLA1urJICvFcAmLaeAr3Lh14MSgG6vJ83mcoP9sZWA0E5poFxgAQJC3DflKnpUryp
 VQaED3Lv+LR2k/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EA6513721;
 Wed, 18 Jun 2025 12:27:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SOPmFb6wUmg4UgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header file
Date: Wed, 18 Jun 2025 14:16:44 +0200
Message-ID: <20250618122436.379013-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[25];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.30
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

The backlight interfaces don't require anything from <linux/fb.h>, so
don't include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/backlight.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10e626db7eee..f29a9ef1052e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -10,7 +10,6 @@
 #define _LINUX_BACKLIGHT_H
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.49.0

