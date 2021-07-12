Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2E3C66D1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902F89F45;
	Mon, 12 Jul 2021 23:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6D889F45
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:12:47 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id v7so19910566pgl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkzbM4toqBuy9BjR9h4atQc2L52M+eVAdOZMZpVFBDk=;
 b=tDRnyXqhVIUwlfOaVTpOEAikRPvjAXq64gKcuT8ZY0gnwmCnHTdn9eclV0/AwSxgl4
 rEWwXECbLSxknCRHvbCQxngpNDoXMZ2rpIehg7k7PLptDs9K5QtvH054+Fur/z2+U1BV
 eYZXPDSxccHY4s3d9OJyYC5UxW4Tx24yZ1eBwAxrkh6lHBmzM+2RaqQd/rkPe2HBinSb
 d9XJXQvhwHq7MmrLgm0NWstJexh9IUQb2VD6qCEpi5jwvQjPzZMUgPzdYRbx8qbmpdHC
 R958NToW8v8qP7OzR2+tAdiRirBRNd7nK1lMzAeugLHgKocbbdh/tUlxAJatoOQBV8K3
 7IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkzbM4toqBuy9BjR9h4atQc2L52M+eVAdOZMZpVFBDk=;
 b=Znu5JPu6cstCZ0x11nt7WZY2Kk3cSJkI40ooxkc96RDxKrU39jboQG09pW2Ef04WwP
 FTrwyk5LHEulwwI0/p/TiDdW62nboq0T1MzXGkiEnyg66e1Szco2xwYLLRrhRTwcmqgf
 BM3qajypK8wmIR9G/WPH7kzqUGxzl09arWD0oi6wyqqETtcDnFjqslwogsn1JyaY5OJc
 aFgogQQgQZ3h57sPjZZyXwyqKmhsfOK8QYUlFiC7IHIK7GMT8fkieXgUKSSUZQNRL35n
 M0n1nHioQ4qnJcz3Pk3qD2RKr9Qnt5EgLeyCsDStXK9pYUjprYU0UIopjglAW4w5CcIq
 1l/Q==
X-Gm-Message-State: AOAM532e/p6ad5G65FtWaHO9o578M/AFApDFn8d/aWzF2ep5kL7vHHkV
 zJ820xyDX8rfsWoNu6tLM4tuPoOe5PoDWg==
X-Google-Smtp-Source: ABdhPJyeMihlcnw5PjXFBnmOw3yjdc+aPvC5oVOJOvwZz3vXp7ZqDWXukz+PUNiKFM2IRwU8psxDjg==
X-Received: by 2002:a63:1263:: with SMTP id 35mr1367308pgs.221.1626131567000; 
 Mon, 12 Jul 2021 16:12:47 -0700 (PDT)
Received: from omlet.com ([134.134.139.80])
 by smtp.gmail.com with ESMTPSA id g123sm16980940pfb.187.2021.07.12.16.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 16:12:46 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/2] drm/i915/gem: Migrate to system at dma-buf attach time
 (v5)
Date: Mon, 12 Jul 2021 18:12:34 -0500
Message-Id: <20210712231234.1031975-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712231234.1031975-1-jason@jlekstrand.net>
References: <20210712231234.1031975-1-jason@jlekstrand.net>
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 kernel test robot <lkp@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf attach time if possible.

v2:
- Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
  selftest to migrate if we are LMEM capable.
v3:
- Migrate also in the pin() callback.
v4:
- Migrate in attach
v5: (jason)
- Lock around the migration

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 25 ++++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 ++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 9a655f69a0671..3163f00554476 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -170,8 +170,31 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 				  struct dma_buf_attachment *attach)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
+	struct i915_gem_ww_ctx ww;
+	int err;
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
+			err = -EOPNOTSUPP;
+			continue;
+		}
+
+		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
+		if (err)
+			continue;
 
-	return i915_gem_object_pin_pages_unlocked(obj);
+		err = i915_gem_object_wait_migration(obj, 0);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+	}
+
+	return err;
 }
 
 static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 3dc0f8b3cdab0..4f7e77b1c0152 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	int err;
 
 	force_different_devices = true;
-	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
+	if (IS_ERR(obj))
+		obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
 	if (IS_ERR(obj))
 		goto out_ret;
 
-- 
2.31.1

