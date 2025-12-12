Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD027CB9367
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D5D10E8FA;
	Fri, 12 Dec 2025 16:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125AD10E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:03:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 40D525BD06;
 Fri, 12 Dec 2025 16:03:22 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 016233EA63;
 Fri, 12 Dec 2025 16:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kEiIOsk8PGlnGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Dec 2025 16:03:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH 2/5] drm/tests: shmem: Add clean-up action to unpin pages
Date: Fri, 12 Dec 2025 17:00:33 +0100
Message-ID: <20251212160317.287409-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212160317.287409-1-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 40D525BD06
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Rspamd-Action: no action
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

Automatically unpin pages on cleanup. The test currently fails with
the error

[   58.246263] drm-kunit-mock-device drm_gem_shmem_test_get_sg_table.drm-kunit-mock-device: [drm] drm_WARN_ON(refcount_read(&shmem->pages_pin_count))

while cleaning up the GEM object. The pin count has to be zero at this
point.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d586b535f144 ("drm/shmem-helper: Add and use pages_pin_count")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 872881ec9c30..1d50bab51ef3 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -34,6 +34,9 @@ KUNIT_DEFINE_ACTION_WRAPPER(sg_free_table_wrapper, sg_free_table,
 KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_free_wrapper, drm_gem_shmem_free,
 			    struct drm_gem_shmem_object *);
 
+KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_unpin_wrapper, drm_gem_shmem_unpin,
+			    struct drm_gem_shmem_object *);
+
 /*
  * Test creating a shmem GEM object backed by shmem buffer. The test
  * case succeeds if the GEM object is successfully allocated with the
@@ -212,6 +215,9 @@ static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
 	ret = drm_gem_shmem_pin(shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_unpin_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	sgt = drm_gem_shmem_get_sg_table(shmem);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
 	KUNIT_EXPECT_NULL(test, shmem->sgt);
-- 
2.52.0

