Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAF896A98
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086BA11292E;
	Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zxhQ8tUV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Ea87Wo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B44112927
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E90CD3518E;
 Wed,  3 Apr 2024 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nc8kKFIwm60i9fWBLQfsNIbDiRmW5rPP51P8L7o4AMs=;
 b=zxhQ8tUVYz3vuRmQncPvfoE9C7jLrwVYCxrwOt/N488ABEsLnIBT/8psUG/yRqPTiLfkMY
 S1R+ericbOiHRabGHYMtLOxettMKfqyVU9OKCJKwGp1CKKoJF3tuUJEBJIfoIdbVcLq61I
 /RIGwtyQrE7uWSTLEEASrhb9SRsMVQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nc8kKFIwm60i9fWBLQfsNIbDiRmW5rPP51P8L7o4AMs=;
 b=4Ea87Wo52GI82q3YyNYnX3NRLS4OseukikxXIB39cYWe1g30Aq00bFZPR6QfoUKL4qh56+
 MGZUZ8Asqm5OmHAw==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EB9013A8B;
 Wed,  3 Apr 2024 09:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cCtsJeUhDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH 01/11] drm/mgag200: Set DDC timeout in milliseconds
Date: Wed,  3 Apr 2024 11:24:38 +0200
Message-ID: <20240403093114.22163-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-0.00)[21.15%];
 RCPT_COUNT_SEVEN(0.00)[10]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: 1.20
X-Spam-Level: *
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

Compute the i2c timeout in jiffies from a value in milliseconds. The
original values of 2 jiffies equals 2 milliseconds if HZ has been
configured to a value of 1000. This corresponds to 2.2 milliseconds
used by most other DRM drivers. Update mgag200 accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Cc: Dave Airlie <airlied@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.5+
---
 drivers/gpu/drm/mgag200/mgag200_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 423eb302be7eb..1029fef590f9b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -114,7 +114,7 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->adapter.algo_data = &i2c->bit;
 
 	i2c->bit.udelay = 10;
-	i2c->bit.timeout = 2;
+	i2c->bit.timeout = usecs_to_jiffies(2200);
 	i2c->bit.data = i2c;
 	i2c->bit.setsda		= mga_gpio_setsda;
 	i2c->bit.setscl		= mga_gpio_setscl;
-- 
2.44.0

