Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E8A4615E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2510E2D4;
	Wed, 26 Feb 2025 13:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FsGVDgOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF9B10E2D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740578095;
 bh=LtFuR081QOM86nBX0UXcuDbM695SSowbkwTzuFTdC6M=;
 h=From:To:Cc:Subject:Date:From;
 b=FsGVDgOpDsLoa0MQISghg6u5ZF9DRvCIezUabZLV+779mH56R0cPZUe0jl/2H0xkD
 3QoEV1+J6fvSdvEL/1oFuY1Rs/uz03D1jlIuNMP++ahpdKXrIJeeABZBkt0Clo0MUp
 iELJA9NBEOIhB8eKw7KWwQGKJHwbqZoBnb3tUZOjYS8PgWYg3rRve157WwYlb+24XX
 WpSUTDmolDO1AZ9iHKRlck3cqVPNiml8t4sqxsVabuKvlk2veWpJUMYU8psIMAqCBX
 GarS1SlibuOqZ4Rc74Kz7lwIpeqIS6iH1bxngOyEc7pQ0NoMK8ezDmV0o+azbpufCb
 G95d3EU4TQF9A==
Received: from localhost.localdomain (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A4F4A17E0657;
 Wed, 26 Feb 2025 14:54:51 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: fix merge request rules
Date: Wed, 26 Feb 2025 19:23:58 +0530
Message-ID: <20250226135415.363605-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Merge request pipelines were only created when changes
were made to drivers/gpu/drm/ci/, causing MRs that didn't
touch this path to break. Fix MR pipeline rules to trigger
jobs for all changes.

Fixes: df54f04f2020 ("drm/ci: update gitlab rules")
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index f04aabe8327c..3991cd36af5f 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -170,23 +170,12 @@ stages:
     - !reference [.disable-farm-mr-rules, rules]
     # Never run immediately after merging, as we just ran everything
     - !reference [.never-post-merge-rules, rules]
-    # Build everything in merge pipelines, if any files affecting the pipeline
-    # were changed
+    # Build everything in merge pipelines
     - if: *is-merge-attempt
-      changes: &all_paths
-      - drivers/gpu/drm/ci/**/*
       when: on_success
     # Same as above, but for pre-merge pipelines
     - if: *is-pre-merge
-      changes:
-        *all_paths
-      when: manual
-    # Skip everything for pre-merge and merge pipelines which don't change
-    # anything in the build
-    - if: *is-merge-attempt
-      when: never
-    - if: *is-pre-merge
-      when: never
+      when: on_success
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
       when: on_success
-- 
2.47.2

