Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F327E7DD8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA610E118;
	Fri, 10 Nov 2023 16:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890E910E0CD;
 Fri, 10 Nov 2023 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l1ZxwQIsYUenmJM0uLreSFLC5RLAnpb3IAB6tNjq9Wc=; b=JOoS2iqTtRqDwINCMnJjRNiRiV
 YLuMcI0b/YGDCJUVzoTHWwMSACdfo9hD/Ssnoo6jZtefZ4/YUtDDHWY2F6C4Nkqk04uSqKE7v2b9C
 rQ9FBC0uP7luYiQXQFfHGzZTnVt6uRGMmmS+AcWs+O+k0P3CqBFnuZGA8p4XM91xaLrVrd1yynx5g
 aTlQdvCrFU9H2xg7nNv+6XdIMEOOJ0hAULJoGYuAPcykB0dcN+1PMIFrKbRJiFKVwq9+AUBh6f4u+
 yUmgV5mXplLkM1KoEgAswYW6LHYMR7bxENO0i1G3PXnAbdPwMJe6tXopBsuIMXJoKoD8zUhSNs9Vw
 wt6Mupyg==;
Received: from pool-96-246-156-208.nycmny.fios.verizon.net ([96.246.156.208]
 helo=X1.myfiosgateway.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r1UWP-001hxO-Dd; Fri, 10 Nov 2023 17:38:17 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/kms_async_flips: add atomic test
Date: Fri, 10 Nov 2023 11:38:10 -0500
Message-ID: <20231110163811.24158-2-andrealmeid@igalia.com>
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

From: Simon Ser <contact@emersion.fr>

This adds a simple test for DRM_MODE_PAGE_FLIP_ASYNC with the
atomic uAPI.

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 include/drm-uapi/drm.h  |  8 ++++++++
 tests/kms_async_flips.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248d..500019ce0 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -768,6 +768,14 @@ struct drm_gem_open {
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6c97558be..6bfcca474 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -297,6 +297,35 @@ static void test_async_flip(data_t *data)
 	}
 }
 
+static void test_async_flip_atomic(data_t *data)
+{
+	int frame;
+	long long int fps;
+	struct timeval start, end, diff;
+
+	test_init(data);
+
+	gettimeofday(&start, NULL);
+	frame = 1;
+	do {
+		uint32_t flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
+		igt_plane_set_fb(data->plane, &data->bufs[frame % 4]);
+		igt_display_commit_atomic(&data->display, flags, data);
+
+		wait_flip_event(data);
+
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+
+		frame++;
+	} while (diff.tv_sec < RUN_TIME);
+
+	fps = frame * 1000 / RUN_TIME;
+	igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		     "FPS should be significantly higher than the refresh rate\n");
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
@@ -720,6 +749,14 @@ igt_main
 		run_test(&data, test_crc);
 	}
 
+	igt_describe("Verify the async flip functionality and the fps during atomic async flips");
+	igt_subtest_with_dynamic("atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_async_flip_atomic);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.42.1

