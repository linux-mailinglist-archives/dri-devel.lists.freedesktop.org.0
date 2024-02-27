Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16F868F09
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B117210F2F6;
	Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sZNlKF4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDunXNTd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sZNlKF4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDunXNTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0436410E917;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A3B61FB97;
 Tue, 27 Feb 2024 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
 b=sZNlKF4LKg9R7fKgESviDYGJcgGQqAjASKpis9DK54YbuoRGmhla2/GR8hmALyJ9v1OCof
 81dfrHFeGl2JdvoTTWDsFAMV/mvtHELUPa+Oumva0gebAVhML76VElhJN28TEGCbHCkreA
 dMRVUuUJfyED4WUq9Rzwcpby0MBQohA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
 b=bDunXNTdfOjWSjmfO5ytcReQfZM6ntCvrakJeXh90TWjYxLLluQb1NgfzFPbOhlbBaX/7J
 pNe9dEtBOqMAGeDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
 b=sZNlKF4LKg9R7fKgESviDYGJcgGQqAjASKpis9DK54YbuoRGmhla2/GR8hmALyJ9v1OCof
 81dfrHFeGl2JdvoTTWDsFAMV/mvtHELUPa+Oumva0gebAVhML76VElhJN28TEGCbHCkreA
 dMRVUuUJfyED4WUq9Rzwcpby0MBQohA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErN/bOKhdh0jY//ty+7plhgl8OH6UHX57uMXJXKhk8o=;
 b=bDunXNTdfOjWSjmfO5ytcReQfZM6ntCvrakJeXh90TWjYxLLluQb1NgfzFPbOhlbBaX/7J
 pNe9dEtBOqMAGeDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E06613ABC;
 Tue, 27 Feb 2024 11:38:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id EHM5JdLJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/13] drm/msm: Acquire reservation lock in GEM pin/unpin
 callback
Date: Tue, 27 Feb 2024 11:14:51 +0100
Message-ID: <20240227113853.8464-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sZNlKF4L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bDunXNTd
X-Spamd-Result: default: False [-0.31 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 6A3B61FB97
X-Spam-Level: 
X-Spam-Flag: NO
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

Export msm_gem_pin_pages_locked() and acquire the reservation lock
directly in GEM pin callback. Same for unpin. Prepares for further
changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
msm accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem.c       | 12 ++++++------
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c | 24 +++++++++++++++++++-----
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bb729353d3a8d..a5c6498a43f06 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -257,24 +257,24 @@ static void pin_obj_locked(struct drm_gem_object *obj)
 	mutex_unlock(&priv->lru.lock);
 }
 
-struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
+struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
 	struct page **p;
 
-	msm_gem_lock(obj);
+	msm_gem_assert_locked(obj);
+
 	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
 	if (!IS_ERR(p))
 		pin_obj_locked(obj);
-	msm_gem_unlock(obj);
 
 	return p;
 }
 
-void msm_gem_unpin_pages(struct drm_gem_object *obj)
+void msm_gem_unpin_pages_locked(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	msm_gem_assert_locked(obj);
+
 	msm_gem_unpin_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8d414b072c29d..85f0257e83dab 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -140,8 +140,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
-struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
-void msm_gem_unpin_pages(struct drm_gem_object *obj);
+struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
+void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 0915f3b68752e..0d22df53ab98a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -47,13 +47,27 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach)
-		msm_gem_pin_pages(obj);
-	return 0;
+	struct page **pages;
+	int ret = 0;
+
+	if (obj->import_attach)
+		return 0;
+
+	msm_gem_lock(obj);
+	pages = msm_gem_pin_pages_locked(obj);
+	if (IS_ERR(pages))
+		ret = PTR_ERR(pages);
+	msm_gem_unlock(obj);
+
+	return ret;
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach)
-		msm_gem_unpin_pages(obj);
+	if (obj->import_attach)
+		return;
+
+	msm_gem_lock(obj);
+	msm_gem_unpin_pages_locked(obj);
+	msm_gem_unlock(obj);
 }
-- 
2.43.2

