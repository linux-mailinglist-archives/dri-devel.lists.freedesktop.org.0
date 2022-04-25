Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9150DAC5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F7C10E069;
	Mon, 25 Apr 2022 07:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944C910E069
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:59:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B8AE1F37D;
 Mon, 25 Apr 2022 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650873583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vWGUUrjESqmxAvpE8g0sn+bVxmcnFHAgSSE2PN9/jg=;
 b=U+MIJrrlR1ERuSinKpzNGeZ2OXl4UaxVC6SAi4HtAWr+cc7Z+wDJyx2+ED7ism4Z9yjgrx
 rwBTL/Ai6XD3X7qXEna8myoWWnxa2DeB6tU53NystOU3bsx9ER/RBV+EC0MFWTJCxMR3SN
 y9W4+hY7bx5wtg9vfLgSYqfwLbklhKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650873583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vWGUUrjESqmxAvpE8g0sn+bVxmcnFHAgSSE2PN9/jg=;
 b=tdMuTQdfeTinsbgxJgYCWyhd9GzXq556Ehn7IXq84xVL4pN/ZvuD2ZU7vD16BCvEBuGj7a
 JgPMuuzf2xq4r9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D815613AF3;
 Mon, 25 Apr 2022 07:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDevM+5UZmIWbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 07:59:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tiwai@suse.com, tamara.schmitz@suse.com
Subject: [PATCH v2 1/3] drm/format-helper: Print warning on missing format
 conversion
Date: Mon, 25 Apr 2022 09:59:37 +0200
Message-Id: <20220425075939.30450-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425075939.30450-1-tzimmermann@suse.de>
References: <20220425075939.30450-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all possible format conversions are supported yet. Print a
warning on unsupported combinations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0e7135114728..b648f29b21b6 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -590,6 +590,9 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		}
 	}
 
+	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
+		      &fb_format, &dst_format);
+
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
-- 
2.36.0

