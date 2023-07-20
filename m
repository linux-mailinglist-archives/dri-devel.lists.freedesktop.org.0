Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B509675ACC6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB7110E5BF;
	Thu, 20 Jul 2023 11:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B082910E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:16:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF8061A3D;
 Thu, 20 Jul 2023 11:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9B7C433C8;
 Thu, 20 Jul 2023 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689851787;
 bh=1nrTAqbBZBRZUWDEE1a4SHpcULf4RL/1UmtaRjuNMUQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lz8IptbCLxR2awc9YH2yICNKvrOS1iLA0ys8CGXwD+1ZP9bB6leHWgjd9xk44hFt9
 z/HNJuRve2OSgiwQ6MVOAKkQFdcdXk3OwiWojddAcTNK6E39iNt3OEJ9gJVUBNodq9
 QgacqYyNYJAhsXxnfFnEGTNENiIpP6J0ySOPJYwgaCe3MvP7BhWydIqyZv8vbjq5Bd
 k1OvSsI9Zvm9WFZr6e1kMyZeTPl6aQkxGxMgjExGUeG9uHlGmcwRBt5RJwvXsz5wQ9
 lgsHMFe2vlINz41eBlt6b0oQWIDr8wbU0OrHUBg60Eupig6CA8MWV781ws9aEOLsDr
 acEnsjlp4qQJQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 20 Jul 2023 13:15:56 +0200
Subject: [PATCH v2 11/11] drm/vc4: tests: pv-muxing: Document test scenario
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230720-kms-kunit-actions-rework-v2-11-175017bd56ab@kernel.org>
References: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1nrTAqbBZBRZUWDEE1a4SHpcULf4RL/1UmtaRjuNMUQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCk7xTNaps5z1zfa0BmT7dNsLnmD7dCelUXi6zYKbuwRv
 cKss0+ko5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPh4WT4K7ki8gvLjBfx+RGv
 DcQ+Sq3e+7svemfO20LBAnG5xy4PYhkZtrCtZ1jtxlJ0pthq2knuaTuWNs3u8Z8yc1m56q0jQi9
 jWAE=
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

