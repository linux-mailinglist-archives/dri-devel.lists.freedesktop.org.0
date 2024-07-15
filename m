Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C55593116E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E3389135;
	Mon, 15 Jul 2024 09:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mvKgSRVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x7mE5QqL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvKgSRVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x7mE5QqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A5F10E312
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC4AC1F80D;
 Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Am5Ekga1bImPkPKvN3YcdNbk5KeYbZq2OdSo4xPYPXE=;
 b=mvKgSRVsu4QuTGfRObO6/tqovN+cFI6A4FzQgmvmrOsgoQ2lOEsUuyEOZgefw+OY/T1vTK
 sLIFi2kssuDNxPDxGLuyy2O7gSh1Q9dqR9UNR0hNlalcn8ckxNYEQfecI8ELOuLtQWhdvq
 IS/GC6SXGuoMWOptq07UPRgpdN29SEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Am5Ekga1bImPkPKvN3YcdNbk5KeYbZq2OdSo4xPYPXE=;
 b=x7mE5QqL7pKshF0zsgC+rgwpLLB6QDO8BvtoSRrVgCSD6yNOFu6J5ldSjbqqPVTwUoCFce
 xMLwtuSzCGeuINAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mvKgSRVs;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x7mE5QqL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Am5Ekga1bImPkPKvN3YcdNbk5KeYbZq2OdSo4xPYPXE=;
 b=mvKgSRVsu4QuTGfRObO6/tqovN+cFI6A4FzQgmvmrOsgoQ2lOEsUuyEOZgefw+OY/T1vTK
 sLIFi2kssuDNxPDxGLuyy2O7gSh1Q9dqR9UNR0hNlalcn8ckxNYEQfecI8ELOuLtQWhdvq
 IS/GC6SXGuoMWOptq07UPRgpdN29SEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Am5Ekga1bImPkPKvN3YcdNbk5KeYbZq2OdSo4xPYPXE=;
 b=x7mE5QqL7pKshF0zsgC+rgwpLLB6QDO8BvtoSRrVgCSD6yNOFu6J5ldSjbqqPVTwUoCFce
 xMLwtuSzCGeuINAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82A8C134AB;
 Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eAWqHmPulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/7] drm/mgag200: Set connector priorities
Date: Mon, 15 Jul 2024 11:39:02 +0200
Message-ID: <20240715093936.793552-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC4AC1F80D
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /
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

Call drm_probe_helper_prioritize_connectors() to set connector
priorities. Guarantees that only a single output is connected at a
time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 52bf49ead5c5..c8204e8a1daf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -222,6 +222,8 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index e7f89b2a59fd..749baefb0a7e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -126,6 +126,8 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 737a48aa9160..e8c84d3258aa 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -262,6 +262,8 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 8d1ccc2ad94a..e2b13a90b405 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -263,6 +263,8 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 265f3e95830a..384041e7b839 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -135,6 +135,8 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index cf7f6897838f..95514dcb8c53 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -394,6 +394,8 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index e25477347c3e..0100b4d03b89 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -269,6 +269,8 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	return 0;
 }
 
-- 
2.45.2

