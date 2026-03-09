Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIbKGdQVr2nJNQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:47:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC72523ECAE
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BCC10E58A;
	Mon,  9 Mar 2026 18:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W5yAFPS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA51210E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlSnCMD4Xxjv2dX11F6zt4k0iLjS+tHQvrhKf6bPuE0=; b=W5yAFPS2NBOoGm6JOw2XbYT6R/
 6by+dGRXHUOsNmLbSThgafj8FcjR3SqHW7WztWfAqqlFwBlbXE59OzVO/OyvuKFXCIXp7pvWvdgQk
 fEzXxaJJGyU+z1kSn4vODvYu0Pw29FmcE8O02ata7Qzlp1lZe6SXEGeQVtlOW+UtlIqdM0aBI6D0K
 kZAmbW58lb7jO1UzkCvPnsMFnbtcns+R6BGQM3MrpOcMjlgwMRIdHT4fNQLpHl2e1vN3RlSHVFGwB
 UR6mws2YkdaLQAkjMoZIWLwJQNfaiZYeg1rs2JTWjuaJPCw3NZeJV1zGXcA1TMt6yjgLajxJP3EJh
 1R8kfokA==;
Received: from 179-125-91-67-dinamico.pombonet.net.br ([179.125.91.67]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vzfdd-00CBn0-L9; Mon, 09 Mar 2026 19:47:33 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Mon, 09 Mar 2026 15:47:04 -0300
Subject: [PATCH v2] drm/ttm/tests: add a test to exercise ttm_bo_swapout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260309-ttm_bo_swapout_test-v2-1-219f64046cfe@igalia.com>
X-B4-Tracking: v=1; b=H4sIAKcVr2kC/32NQQqDMBBFryKzbsqMgtCueo8iYYyjDlQjSWpbx
 Ls39QBdvgf//Q2iBJUI12KDIKtG9XOG8lSAG3kexGiXGUosa6ywNilNtvU2vnjxz2STxGS4owq
 FHbauh7xcgvT6Pqr3JvOoMfnwOU5W+tn/vZUMGWZuifBCInjTgR/KZ+cnaPZ9/wKPWUYVtwAAA
 A==
X-Change-ID: 20260306-ttm_bo_swapout_test-ad130eac0bcf
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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
X-Rspamd-Queue-Id: CC72523ECAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.640];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

Currently, ttm_bo_swapout is not exercised by the TTM KUnit tests.

It used to be exercised until commit 76689eb52667 ("drm/ttm: remove
ttm_bo_validate_swapout test"), but that test was removed as it was
unreliable due to requiring to allocate half of the system memory.

Calling ttm_bo_swapout directly with a single allocated BO, however, does
not suffer from that problem, and was able to detect a UAF introduced by
commit c06da4b3573a ("drm/ttm: Tidy usage of local variables a little
bit"), when built with KASAN.

When applying a fix to that UAF, the test passed without any issues.

Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
Changes in v2:
- Removed extra asserts that are already internally used.
- Export ttm_bo_swapout with EXPORT_SYMBOL_FOR_TESTS_ONLY to build test as
  module.
- Request all pages of the BO to be swapped out.
- Link to v1: https://lore.kernel.org/r/20260306-ttm_bo_swapout_test-v1-1-aaab11091ee0@igalia.com
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 41 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c                     |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 6d95447a989d20d60227025be874265b2b491f59..4d458fa427da3e6272913d7836a860bc4956edb8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -759,6 +759,46 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
 
+static void ttm_bo_validate_swapout(struct kunit *test)
+{
+	u32 mem_type = TTM_PL_TT;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_operation_ctx ctx_init = { };
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_resource_manager *man;
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+	s64 swapped;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+	man = ttm_manager_type(priv->ttm_dev, mem_type);
+	KUNIT_ASSERT_NOT_NULL(test, man);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, MANAGER_SIZE);
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	dma_resv_unlock(bo->base.resv);
+
+	swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL,
+				 MANAGER_SIZE / PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, swapped, MANAGER_SIZE / PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, TTM_PL_SYSTEM);
+	KUNIT_EXPECT_TRUE(test, bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
+
+	ttm_bo_fini(bo);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+}
+
 static void ttm_bo_validate_happy_evict(struct kunit *test)
 {
 	u32 mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
@@ -1153,6 +1193,7 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
 	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
 			 ttm_bo_validate_wait_gen_params),
+	KUNIT_CASE(ttm_bo_validate_swapout),
 	KUNIT_CASE(ttm_bo_validate_happy_evict),
 	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
 	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0765d69423d2f4028bf2effd21af53e117ee7a29..89008e5eb1c7d5412fde7771409da04279414f6d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -32,6 +32,7 @@
 #define pr_fmt(fmt) "[TTM] " fmt
 
 #include <drm/drm_print.h>
+#include <drm/drm_util.h>
 #include <drm/ttm/ttm_allocation.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -1232,6 +1233,7 @@ s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_bo_swapout);
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 {

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260306-ttm_bo_swapout_test-ad130eac0bcf

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

