Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4174A46814
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167B110E98C;
	Wed, 26 Feb 2025 17:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gmmUZamG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WQGjRoZZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vKLsKDwG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ByxcVi7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AEE10E985
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:28:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDA02211D7;
 Wed, 26 Feb 2025 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJCPK4BDGC+K0K2d+w8dsuMd+7nWqVXuFBvfeV+Dvng=;
 b=gmmUZamG/CmYEpf+ebAs17cWwe6NTWNIKywUAohJxmIljRGonyRco1G6OsB4jIoTbDN8RU
 mSrvCBGQUtkJI76s8BjkN6Jxh8h+iJL68JC4bSBQ7V1JeSDrrPJwC79ASIhfqhZ4mZWvDh
 qF3JFJqbGbN0LrDVydYDuPRE1m+cOrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJCPK4BDGC+K0K2d+w8dsuMd+7nWqVXuFBvfeV+Dvng=;
 b=WQGjRoZZqlMcvzFa4G/xEG49frk9rMvDYdyTctWLXk+LUtD/pYK5bjjQw//99I/IO0hE+c
 cVKnhiCJP9uHjDAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJCPK4BDGC+K0K2d+w8dsuMd+7nWqVXuFBvfeV+Dvng=;
 b=vKLsKDwGUgkQpJL1s0JmcKwimbK+jWVZDVOqkghfv8+7Ga3/yiUz5dHAP6PU1ZxzWDmydB
 KSNB68FOHkX+ySOfDtyOlVZDwtiS8OMTlaqCKb/lO6sHZB2NKABz5LL+oU7iZv063zjc+U
 RUUth+MI128mPZBdBKv8tbTTUB+Q5p0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJCPK4BDGC+K0K2d+w8dsuMd+7nWqVXuFBvfeV+Dvng=;
 b=ByxcVi7lyqMCiDoFlhlq3YZrloBwoV+ppx+F7I5wjVPmsYnBL/dt6ebfHA0wSFCnr8UHVQ
 HbmLM2zZzG2gnFDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD64B13A53;
 Wed, 26 Feb 2025 17:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4IcKKS9Pv2cWBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 17:28:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] drm/prime: Use dma_buf from GEM object instance
Date: Wed, 26 Feb 2025 18:03:13 +0100
Message-ID: <20250226172457.217725-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226172457.217725-1-tzimmermann@suse.de>
References: <20250226172457.217725-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.945];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_prime.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..bdb51c8f262e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -453,13 +453,7 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
 	}
 
 	mutex_lock(&dev->object_name_lock);
-	/* re-export the original imported object */
-	if (obj->import_attach) {
-		dmabuf = obj->import_attach->dmabuf;
-		get_dma_buf(dmabuf);
-		goto out_have_obj;
-	}
-
+	/* re-export the original imported/exported object */
 	if (obj->dma_buf) {
 		get_dma_buf(obj->dma_buf);
 		dmabuf = obj->dma_buf;
-- 
2.48.1

