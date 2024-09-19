Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7797CDD8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D27610E76B;
	Thu, 19 Sep 2024 18:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WQdzGQiF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x/4MEYwn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IXzCKMSa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hx4BZ8of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27A10E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:54:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD35F339D6;
 Thu, 19 Sep 2024 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726772082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VRtEerd65O+8qqUgGkzfmjnMizZ4pDVe1Xx17HHZ8AA=;
 b=WQdzGQiFRW6Ro8ZT0J+XLo1T5Qh97eHkpuvJVB+77CAZNq3R8mhpoMt/i/4vlNj7i+zz8h
 M7L9BjuIJpm7q+HCljXErYo3NStCiJLCXnoqihH1w2FRcfiiwPy5F4FKU2vtH5BhEe//FD
 A/eOl9MViNCJtenY23suBcjy1irkJTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726772082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VRtEerd65O+8qqUgGkzfmjnMizZ4pDVe1Xx17HHZ8AA=;
 b=x/4MEYwnteYapytH9Gqv4AG1wBP+HvjC6ZKeLLgPmNihAZh+Rvi98g83Q3VAjBqS6SXZlJ
 i2kAfGOB6zmCKcDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IXzCKMSa;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hx4BZ8of
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726772081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VRtEerd65O+8qqUgGkzfmjnMizZ4pDVe1Xx17HHZ8AA=;
 b=IXzCKMSaprSh4otygIiKn8MusfiD8DvvgrDgcQJMr9PhxOeMmfOVJjrBDePxRtLBOfGpxN
 e/LQ41d3vgB/6RV21gnyvnY9QUhrsh1CrW65YBTn8cl4PIkvA+aWC6/G9O4mC2+3JEpslI
 ZKsVhqBUqiIIp7CfL8sHAKnCx+6g38I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726772081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VRtEerd65O+8qqUgGkzfmjnMizZ4pDVe1Xx17HHZ8AA=;
 b=Hx4BZ8offRg3F5kHe10KC20JdwDUg+Ge0WfaE16WsqVW2+F4FbtjWvwjnBX4j6wfyoSMXm
 IJDdftPyhUqQNvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC82B13A1E;
 Thu, 19 Sep 2024 18:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M/hXLXFz7Ga4GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Sep 2024 18:54:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: Link drm_rect.o into DRM core module
Date: Thu, 19 Sep 2024 20:53:43 +0200
Message-ID: <20240919185436.86790-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD35F339D6
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

Several places in drm.ko use struct drm_rect and its helpers. This
only works as the called interfaces are declared as static inline in
the header file. Fix the issue by linking drm_rect.o into drm.ko.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 784229d4504d..fc061fd424ed 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -68,6 +68,7 @@ drm-y := \
 	drm_prime.o \
 	drm_print.o \
 	drm_property.o \
+	drm_rect.o \
 	drm_syncobj.o \
 	drm_sysfs.o \
 	drm_trace_points.o \
@@ -140,7 +141,6 @@ drm_kms_helper-y := \
 	drm_modeset_helper.o \
 	drm_plane_helper.o \
 	drm_probe_helper.o \
-	drm_rect.o \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-- 
2.46.0

