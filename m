Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04352CB9374
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644AA10E8F6;
	Fri, 12 Dec 2025 16:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FDkhG08i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WBB9/0i6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FDkhG08i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WBB9/0i6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024AE10E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:03:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B6225BEF2;
 Fri, 12 Dec 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765555403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebCr+xKPFF6rrikhA7bRNgLHI24kb/JRFADX2M+0bPM=;
 b=FDkhG08ixQEeqGtK6ZhT9sRZ/hiFk0ImE5deyN8o6TiIWOKtw+XgGo/SOZ9+PoKlCNWoTQ
 u4KvptxApfkNzMBXTKeLd/ihPBKALsVNoIxenbweAf6NST9CO+kkp4b3bDacm1i0NF/p8C
 CjVUnqRqcN2uf1GjLl6lvSuB0BINhXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765555403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebCr+xKPFF6rrikhA7bRNgLHI24kb/JRFADX2M+0bPM=;
 b=WBB9/0i6NUxlF1k6aKrLNwlNqYsAbAuIpAB7P82dp/vtsXVAJTfgySALze609dR06TsKnv
 i7bzSpizzVRWjpCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765555403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebCr+xKPFF6rrikhA7bRNgLHI24kb/JRFADX2M+0bPM=;
 b=FDkhG08ixQEeqGtK6ZhT9sRZ/hiFk0ImE5deyN8o6TiIWOKtw+XgGo/SOZ9+PoKlCNWoTQ
 u4KvptxApfkNzMBXTKeLd/ihPBKALsVNoIxenbweAf6NST9CO+kkp4b3bDacm1i0NF/p8C
 CjVUnqRqcN2uf1GjLl6lvSuB0BINhXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765555403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebCr+xKPFF6rrikhA7bRNgLHI24kb/JRFADX2M+0bPM=;
 b=WBB9/0i6NUxlF1k6aKrLNwlNqYsAbAuIpAB7P82dp/vtsXVAJTfgySALze609dR06TsKnv
 i7bzSpizzVRWjpCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0B833EA63;
 Fri, 12 Dec 2025 16:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8FhfOco8PGlnGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Dec 2025 16:03:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH 4/5] drm/tests: shmem: Hold reservation lock around madvise
Date: Fri, 12 Dec 2025 17:00:35 +0100
Message-ID: <20251212160317.287409-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212160317.287409-1-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwtd9qf4a971hssh5godp6qbx)];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
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

Acquire and release the GEM object's reservation lock around calls
to the object's madvide operation. The tests use
drm_gem_shmem_madvise_locked(), which led to errors such as show below.

[   58.339389] WARNING: CPU: 1 PID: 1352 at drivers/gpu/drm/drm_gem_shmem_helper.c:499 drm_gem_shmem_madvise_locked+0xde/0x140

Only export the new helper drm_gem_shmem_madvise() for Kunit tests.
This is not an interface for regular drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  8 ++++----
 include/drm/drm_gem_shmem_helper.h         |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 06ef4e5adb7d..4ffcf6ed46f5 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -924,6 +924,21 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *
 	dma_resv_unlock(obj->resv);
 }
 EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_vunmap);
+
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret;
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_madvise_locked(shmem, madv);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_madvise);
 #endif
 
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 3e7c6f20fbcc..d639848e3c8e 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -292,17 +292,17 @@ static void drm_gem_shmem_test_madvise(struct kunit *test)
 	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ret = drm_gem_shmem_madvise_locked(shmem, 1);
+	ret = drm_gem_shmem_madvise(shmem, 1);
 	KUNIT_EXPECT_TRUE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
 
 	/* Set madv to a negative value */
-	ret = drm_gem_shmem_madvise_locked(shmem, -1);
+	ret = drm_gem_shmem_madvise(shmem, -1);
 	KUNIT_EXPECT_FALSE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
 
 	/* Check that madv cannot be set back to a positive value */
-	ret = drm_gem_shmem_madvise_locked(shmem, 0);
+	ret = drm_gem_shmem_madvise(shmem, 0);
 	KUNIT_EXPECT_FALSE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
 }
@@ -330,7 +330,7 @@ static void drm_gem_shmem_test_purge(struct kunit *test)
 	ret = drm_gem_shmem_is_purgeable(shmem);
 	KUNIT_EXPECT_FALSE(test, ret);
 
-	ret = drm_gem_shmem_madvise_locked(shmem, 1);
+	ret = drm_gem_shmem_madvise(shmem, 1);
 	KUNIT_EXPECT_TRUE(test, ret);
 
 	/* The scatter/gather table will be freed by drm_gem_shmem_free */
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6924ee226655..3dd93e2df709 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -310,6 +310,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 #if IS_ENABLED(CONFIG_KUNIT)
 int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
 void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 #endif
 
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
-- 
2.52.0

