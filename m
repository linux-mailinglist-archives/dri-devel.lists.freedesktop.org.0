Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EF766838
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E172A10E6B3;
	Fri, 28 Jul 2023 09:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4C410E6B0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:06:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A39F262080;
 Fri, 28 Jul 2023 09:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DBC433C7;
 Fri, 28 Jul 2023 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690535214;
 bh=gKdr5wVwnd5iV/T89XpwfyfOVoDtad9S9jijN97ZC8k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NvZe7XxAeMFcwVssgJ6Po1uWqAX+sCgVKij7qFhyIci/SGs3vgp2Q/BBOKi3Z0ZPe
 NkgrnodZv5N0SBw8D7CAAzyPAHPP88HjYKeXBFavyf7p73bCBtOf7E7Ug9hvCB03DR
 09ogUjHXuauDqtkIDqVxy3o1vkhX+Fg8BWAlawzxbByn4BspGM3VeceaBf+JFmfJD6
 bQBmClPX88tkzD98Qw6jWrzTlQXV2p+N6NwnFujlwsliJGQ5Nb6pYzZymcIBR9ZPqx
 RB5trmT8o6wLu9h21Dx8XOp14gwDK0ZZx7EKbgu6NIzJXpkCrJVoeVAhGuhxsrbvLc
 qIBALymEZ1nsw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 28 Jul 2023 11:06:24 +0200
Subject: [PATCH v3 11/11] drm/vc4: tests: pv-muxing: Document test scenario
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230728-kms-kunit-actions-rework-v3-11-952565ccccfe@kernel.org>
References: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
In-Reply-To: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gKdr5wVwnd5iV/T89XpwfyfOVoDtad9S9jijN97ZC8k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmHW7k4XCezyX63vvt+s8yL0lWbVvzor5xkd3rR+y22+
 b9YIk3tO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRVV4M/xMMTAy0V6zyXh2u
 lv1N3fX8svR6Ye164d+s73TV2FW3vWBkOBb/NFzo31S1xf+vlFx9EODwu2Zio2P+vlalVS9OTPo
 qzAQA
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
Cc: linux-kselftest@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a couple of tests that weren't really obvious, nor did they
document what they were supposed to test. Document that to make it
hopefully more obvious.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
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

