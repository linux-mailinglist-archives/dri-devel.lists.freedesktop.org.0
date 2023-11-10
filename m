Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39067E7DD9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E708510E11D;
	Fri, 10 Nov 2023 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4110E11D;
 Fri, 10 Nov 2023 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XNrTAWwc3p+LxEGusL9OjFmt6XNAp7xfhN8QIDU3hkc=; b=GTH3GmUOal7EN1uUDz9n1yMo/4
 f05GC8n11bouvQF1WdycWtNODjSbVXUc8dad9brxpnhyb2+a7Y1lqpo2DV6nU5JFJ5raqI5XAS6fz
 QfN8csOqqPwF+H9XSJrfNplKAuUHNp4FSDngBxliiGv9ShLpU3bYFlJHZ2awzsFSBaPHsKsCRKkP4
 9U9uxTxaxySjWybcY0bFVSIVTcelGE0YixzAxuJZDFrQXlo0ITxqaB9KJUc8pWnrnWm6vofeKH+Q9
 U4ZZNagxKdXVK6OOQIZZ7QMd7RrUrUFZ2FAXtB2MvaO9YDhPiNbElaboQVB4nwdIPjB06HfWrn4Kn
 gMu3oK0A==;
Received: from pool-96-246-156-208.nycmny.fios.verizon.net ([96.246.156.208]
 helo=X1.myfiosgateway.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r1UWR-001hxO-1e; Fri, 10 Nov 2023 17:38:19 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/kms_async_flips: Add test for atomic prop
 changes
Date: Fri, 10 Nov 2023 11:38:11 -0500
Message-ID: <20231110163811.24158-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231110163811.24158-1-andrealmeid@igalia.com>
References: <20231110163811.24158-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM atomic API should reject modesetting during an async flip, so
test if the kernel properly rejects to flip with prop changes.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 tests/kms_async_flips.c | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6bfcca474..edc19b5ef 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -305,6 +305,9 @@ static void test_async_flip_atomic(data_t *data)
 
 	test_init(data);
 
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
 	gettimeofday(&start, NULL);
 	frame = 1;
 	do {
@@ -326,6 +329,55 @@ static void test_async_flip_atomic(data_t *data)
 		     "FPS should be significantly higher than the refresh rate\n");
 }
 
+static void test_invalid_atomic(data_t *data)
+{
+	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+	int ret;
+
+	test_init(data);
+
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
+	/* Trying to change plane position  */
+	igt_plane_set_position(data->plane, 15, 15);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_position(data->plane, 0, 0);
+
+	/* Trying to change plane rotation  */
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_180);
+	igt_plane_set_fb(data->plane, &data->bufs[1]);
+	ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	igt_assert(ret == -EINVAL);
+	igt_plane_set_rotation(data->plane, IGT_ROTATION_0);
+}
+
+static void test_atomic_modeset(data_t *data)
+{
+	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+	igt_output_t *output = data->output;
+	int ret;
+
+	test_init(data);
+
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
+	/*
+	 * Modesetting is forbidden during atomic async flips. Mode changes that
+	 * require modeset are rejected.
+	 */
+	for_each_connector_mode(output) {
+		drmModeModeInfo *m = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, m);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+		igt_assert(ret == -EINVAL);
+	}
+	igt_output_override_mode(output, NULL);
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
@@ -757,6 +809,22 @@ igt_main
 		run_test(&data, test_async_flip_atomic);
 	}
 
+	igt_describe("Negative case to verify if any atomic changes are rejected from kernel as expected");
+	igt_subtest_with_dynamic("invalid-atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_invalid_atomic);
+	}
+
+	igt_describe("Verify mode changes during atomic async flips");
+	igt_subtest_with_dynamic("modeset-atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_atomic_modeset);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.42.1

