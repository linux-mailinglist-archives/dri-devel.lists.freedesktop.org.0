Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DD1E9027
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4A76E9C7;
	Sat, 30 May 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A56E939;
 Fri, 29 May 2020 15:38:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j16so4151743wrb.7;
 Fri, 29 May 2020 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7mFn64vcDA4yR7/3XrbCcCK+2+2Q16IjG6/+8kzLe8=;
 b=e5duYSTgCRksoWxW+rxuU+5dbQmX4eZyXKV+RKAkgYUfPMyqdXaESO1EGCd8U2XrYS
 TYgyhCrb6vswgSOMiounz5WMMBS/gOBqz3zj+HOjSHJ4GcsXCbO7CNGoFSb2W3Xd+65L
 aC/0jd94yQm1fMA+IKp/6p32Nb79XacL2mIKnNpfUfxBzcD9QmKFRqfd7omxatajd2TN
 UY2VSTQmQx6CbJDbaWVG1DwWASqSzelKeD+If+do144cwGlNvGC3n0gaD5ymkZHaiUnJ
 i3bdrbCBKMCGrdQIrdtYmzMc3Qin+3KaCvdhu73g8JniL3xRWj5aCxp0DiRzoMOJE/eZ
 dnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7mFn64vcDA4yR7/3XrbCcCK+2+2Q16IjG6/+8kzLe8=;
 b=Vi3bcMnJYbTBI5x2lMAUh//6WFVgWrawGbeM2wKtuLIsK98/gePfVj97+dYfKVs4Vx
 LYABpcz/LorjOQoE/BIt81FJT8rSl95Y06rrG6Aeh/RINlAc7/nJCLBYVTVf5A0/jJ0n
 co2wwvTCWLFsGDRBUZFtp/CRjCWYK/AoYi5KVeuDMgbeB9pDbRlDN4LRLzK6VNewEKEu
 2w8ZraaT3BGCtO696uUHsfHLTJ3X92zJa3VfodArZo8pgPLVGbEhgzhhpvjsPADflJya
 A2HuSZfEPRmPOCJhu7wLFIQMQoHw6+ckb02QgGN4Q9VJDWLWTZN/NsyfprKTSSoV7qek
 u3wQ==
X-Gm-Message-State: AOAM532y/pK3RaVIH6w6XLgy6QSpoTFwaDf+Ji6xe84TrjeNIWcF5ioD
 7UITClfI4B98hC557/Vd8rj8NCEueiQ=
X-Google-Smtp-Source: ABdhPJzSdwhASLoqlO2D7DxFrcqEYb0mCHfF+ANtbfeLzoWCkMmM2QUOzi25BsUJ8CXq1MoTbbIwmg==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr10220926wrt.158.1590766680022; 
 Fri, 29 May 2020 08:38:00 -0700 (PDT)
Received: from localhost.localdomain (pd9567fb4.dip0.t-ipconnect.de.
 [217.86.127.180])
 by smtp.gmail.com with ESMTPSA id o10sm10412346wrq.40.2020.05.29.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:37:59 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/1] drm/mm: add ig_frag selftest
Date: Fri, 29 May 2020 18:33:51 +0200
Message-Id: <20200529163351.5228-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces fragmentation in the address range
and measures time taken by 10k and 20k insertions. ig_frag()
will fail if time taken by 20k insertions takes more than 4 times
of 10k insertions as we know that insertions scale quadratically.
Also tolerate 10% error because of kernel scheduler's jitters.

Output:
<snip>
[ 8092.653518] drm_mm: Testing DRM range manger (struct drm_mm), with random_seed=0x9bfb4117 max_iterations=8192 max_prime=128
[ 8092.653520] drm_mm: igt_sanitycheck - ok!
[ 8092.653525] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
[ 8092.653526] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
[ 8092.653527] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
[ 8092.653528] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
[ 8092.653529] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
[ 8092.653529] igt_debug total: 4096, used 2048 free 2048
[ 8112.569813] drm_mm: best fragmented insert of 10000 and 20000 insertions took 504 and 1996 msecs
[ 8112.723254] drm_mm: bottom-up fragmented insert of 10000 and 20000 insertions took 44 and 108 msecs
[ 8112.813212] drm_mm: top-down fragmented insert of 10000 and 20000 insertions took 40 and 44 msecs
[ 8112.847733] drm_mm: evict fragmented insert of 10000 and 20000 insertions took 8 and 20 msecs
<snip>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
 drivers/gpu/drm/selftests/test-drm_mm.c      | 73 ++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
index 6b943ea1c57d..8c87c964176b 100644
--- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
@@ -14,6 +14,7 @@ selftest(insert, igt_insert)
 selftest(replace, igt_replace)
 selftest(insert_range, igt_insert_range)
 selftest(align, igt_align)
+selftest(frag, igt_frag)
 selftest(align32, igt_align32)
 selftest(align64, igt_align64)
 selftest(evict, igt_evict)
diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 9aabe82dcd3a..05d8f3659b4d 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1033,6 +1033,79 @@ static int igt_insert_range(void *ignored)
 	return 0;
 }
 
+static int get_insert_time(unsigned int num_insert,
+			   const struct insert_mode *mode)
+{
+	struct drm_mm mm;
+	struct drm_mm_node *nodes, *node, *next;
+	unsigned int size = 4096, align = 8192;
+	unsigned long start;
+	unsigned int i;
+	int ret = -EINVAL;
+
+	drm_mm_init(&mm, 1, U64_MAX - 2);
+	nodes = vzalloc(array_size(num_insert, sizeof(*nodes)));
+	if (!nodes)
+		goto err;
+
+	start = jiffies;
+	for (i = 0; i < num_insert; i++) {
+		if (!expect_insert(&mm, &nodes[i], size, align, i, mode)) {
+			pr_err("%s insert failed\n", mode->name);
+			goto out;
+		}
+	}
+
+	ret = jiffies_to_msecs(jiffies - start);
+out:
+	drm_mm_for_each_node_safe(node, next, &mm)
+		drm_mm_remove_node(node);
+	drm_mm_takedown(&mm);
+	vfree(nodes);
+err:
+	return ret;
+
+}
+
+static int igt_frag(void *ignored)
+{
+	const struct insert_mode *mode;
+	unsigned int insert_time1, insert_time2;
+	unsigned int insert_size = 10000;
+	unsigned int scale_factor = 4;
+	/* tolerate 10% excess insertion duration */
+	unsigned int error_factor = 110;
+	int ret = -EINVAL;
+
+	for (mode = insert_modes; mode->name; mode++) {
+		unsigned int expected_time;
+
+		insert_time1 = get_insert_time(insert_size, mode);
+		if (insert_time1 < 0)
+			goto err;
+
+		insert_time2 = get_insert_time((insert_size * 2), mode);
+		if (insert_time2 < 0)
+			goto err;
+
+		expected_time = (scale_factor * insert_time1 *
+				 error_factor)/100;
+		if (insert_time2 > expected_time) {
+			pr_err("%s fragmented insert took more %u msecs\n",
+			       mode->name, insert_time2 - expected_time);
+			goto err;
+		}
+
+		pr_info("%s fragmented insert of %u and %u insertions took %u and %u msecs\n",
+			mode->name, insert_size, insert_size * 2, insert_time1,
+			insert_time2);
+	}
+
+	ret = 0;
+err:
+	return ret;
+}
+
 static int igt_align(void *ignored)
 {
 	const struct insert_mode *mode;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
