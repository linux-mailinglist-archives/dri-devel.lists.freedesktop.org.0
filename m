Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11774CEF5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26C710E215;
	Mon, 10 Jul 2023 07:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157710E213
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:48:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E614760EBC;
 Mon, 10 Jul 2023 07:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F130EC433C8;
 Mon, 10 Jul 2023 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688975293;
 bh=16TekcNJuTfVyllw7nW85RcUQBjN4RlFG7QvXpxKfus=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aPZ/SRybsonfjxn87sVXsQVAfm8/hSViEfIkh2um+Bu/KDfax48CyrSZgSh9NB+gp
 QLyUg2fsUPjEUwIZkiBuZHgsAKUHhVGdeYeilhiCH4e29ZizFPYcc+B1SH8k+EaSVz
 HIvjRTVca/pGZ2F9ulezJVqBti6JkxQKRBTd0wzr7jBcyJ62EK08B3qbJ4m4UloL2f
 p5AjMfOJbpGPdDCLMUiaJyY5YqZCHvb2l/9y5Ncd4/ht0A1k2lxAHCTzCPk5uG4q+N
 MdzGp3efocrXoBis6u0dIIDqBOccwJN+PLxwcD2ysVIEW3veHml8BG50wCUjRG+61Z
 PC0YCMDOPe54g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Jul 2023 09:47:42 +0200
Subject: [PATCH 11/11] drm/vc4: tests: pv-muxing: Document test scenario
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230710-kms-kunit-actions-rework-v1-11-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=mripard@kernel.org;
 h=from:subject:message-id; bh=16TekcNJuTfVyllw7nW85RcUQBjN4RlFG7QvXpxKfus=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmrt8/Yo2+y5cu1UPXXup3+aVuktpco688961VxVGVn1f3q
 JxslO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRCGNGhoXMwuy3I97lPVRwyNRNar
 14/8GelZnuk5je5E5+d8ju2gJGhg7damVj7auJfyVOvd39vHFfQn53ycu4uHqV24/zXT4wcAAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a couple of tests that weren't really obvious, nor did they
document what they were supposed to test. Document that to make it
hopefully more obvious.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 5f9f5626329d..61622e951031 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -845,6 +845,13 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
 	KUNIT_EXPECT_NE(test, hdmi0_channel, hdmi1_channel);
 }
 
+/*
+ * This test makes sure that we never change the FIFO of an active HVS
+ * channel if we disable a FIFO with a lower index.
+ *
+ * Doing so would result in a FIFO stall and would disrupt an output
+ * supposed to be unaffected by the commit.
+ */
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 {
 	struct drm_modeset_acquire_ctx *ctx;
@@ -924,6 +931,21 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
 	}
 }
 
+/*
+ * Test that if we affect a single output, only the CRTC state of that
+ * output will be pulled in the global atomic state.
+ *
+ * This is relevant for two things:
+ *
+ *   - If we don't have that state at all, we are unlikely to affect the
+ *     FIFO muxing. This is somewhat redundant with
+ *     drm_test_vc5_pv_muxing_bugs_stable_fifo()
+ *
+ *   - KMS waits for page flips to occur on all the CRTC found in the
+ *     CRTC state. Since the CRTC is unaffected, we would over-wait, but
+ *     most importantly run into corner cases like waiting on an
+ *     inactive CRTC that never completes.
+ */
 static void
 drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct kunit *test)
 {

-- 
2.41.0

