Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEBHLPQro2mF+AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:55:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD71C534A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754610E085;
	Sat, 28 Feb 2026 17:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hhBzj6h1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CCC10E085
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:54:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79ED843EA7;
 Sat, 28 Feb 2026 17:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B140EC116D0;
 Sat, 28 Feb 2026 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772301283;
 bh=felfZVWaTMWH2Djom74FA5Dp7sfnSOwZg8jUAQkEqq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hhBzj6h1UIzEfRRi+qfS/E4zQDZDJuxzgg0ra5WZZv5QlDgt9fOyvZHrvcJdVy5NJ
 WjKfSXnnUBoYu238MBP6WiUxSY/P0c4vbUQwKJDYbk7asMpd+Ls3zqJmckKA/IK3br
 7bpfEgYDD+Dmlur4CkbENHxIw2f7Zir8gLxoGztkNNqMT7z09oItasByiIlCjl9d70
 WZVwIB6Xx8zeXE+CjgzsMh7ANZFL1/a50Ff5DuLiXiLKh+tZG4++z4npA3AUXQkbgR
 83n0Vhy+0B9dfS9/6OuCWjORqaFOUh2ssd+Q1sqxUF5oOr5mSyhs85cbmuVSpsVnjy
 h2lWGR8hs+bFQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.18 467/752] drm/tests: shmem: Add clean-up action to unpin
 pages
Date: Sat, 28 Feb 2026 12:42:58 -0500
Message-ID: <20260228174750.1542406-467-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260228174750.1542406-1-sashal@kernel.org>
References: <20260228174750.1542406-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:tzimmermann@suse.de,m:stable@vger.kernel.org,m:boris.brezillon@collabora.com,m:sashal@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,collabora.com:email,msgid.link:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 52FD71C534A
X-Rspamd-Action: no action

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit b47b9ecef309459278eb52f02b50eefdeaac4f6d ]

Automatically unpin pages on cleanup. The test currently fails with
the error

[   58.246263] drm-kunit-mock-device drm_gem_shmem_test_get_sg_table.drm-kunit-mock-device: [drm] drm_WARN_ON(refcount_read(&shmem->pages_pin_count))

while cleaning up the GEM object. The pin count has to be zero at this
point.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d586b535f144 ("drm/shmem-helper: Add and use pages_pin_count")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://patch.msgid.link/20251212160317.287409-3-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 872881ec9c30d..1d50bab51ef3f 100644
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
2.51.0

