Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A65A37AF5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 06:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA110E309;
	Mon, 17 Feb 2025 05:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ikI0hylY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898A510E309
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 05:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739770671;
 bh=aohlNE3sp+EZSse6h0vdAdyitlo7jWoQr65EYPkC03Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ikI0hylYANVUoJGaDr7ylRKbTO2sR3u9EfO1DIzp+evkXAP8BXSvIdJ9OUd38dCrE
 JEcV36YIjh6/A3rH5GsPdB7z+lbRmYCwLUg/5/BblohEJiezD5Iyj43x9cHpTlvZQO
 H0DPvkr2/yskH0LzrfAhQ5s9U5daYu1nLaG4Qr5WQlU87VONU0Z5DPxnP6CxXW3T01
 M1Qc45Zm8QftkfH5KuhTdr843cAtmiWGD+uyVJK8AHyL1FAmwMUSV1U7BEJQJ9Pg2l
 qeqb+6OrdkQMQoxvb/GVXrxjqyRij/jT2tE/6f4oMMLFMKMM0tsxDCCuoB24f/746H
 N6v+PRhcmYoAA==
Received: from localhost.localdomain (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8B6517E154F;
 Mon, 17 Feb 2025 06:37:45 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, boqun.feng@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
Date: Mon, 17 Feb 2025 11:07:11 +0530
Message-ID: <20250217053719.442644-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217053719.442644-1-vignesh.raman@collabora.com>
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
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

Enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex
slowpath debugging.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - New patch in the series.

v3:
  - No changes.

---
 drivers/gpu/drm/ci/build.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 274f118533a7..6c0dc10b547c 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -67,7 +67,7 @@ testing:arm32:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: arm.config
 
@@ -79,7 +79,7 @@ testing:arm64:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: arm64.config
 
@@ -91,7 +91,7 @@ testing:x86_64:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: x86_64.config
 
-- 
2.43.0

