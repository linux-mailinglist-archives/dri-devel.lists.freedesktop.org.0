Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A4A49A80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF9610ECB1;
	Fri, 28 Feb 2025 13:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dCaAeNoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760D310E2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740749191;
 bh=kGFidxujuu/5E6/w43jD7cIkQM+gr//1Z9nzVC3249w=;
 h=From:To:Cc:Subject:Date:From;
 b=dCaAeNoZeU54zDefZlcSRbx/qgWHWaR8ZjNOK4VSPFUWCMKacfX5AWbpoYe4ZPzgQ
 yJZl7kTFzok4PNFV6fxZut36Vc3ALn/tZFqao1ln37ZyJ+QhFekZQBKFEiS7ElzkuI
 c1dWqWlQ8eVKTZH+sV1hb4TbLR74ujLJLupczbqnKUH7NebkONedaqPBluTFvTsczj
 Fhl2yk9sGxTA0vIU506ZTQpc0O8cswh0FghgtXpqc2jNCGFR3fLteVEYbByhAE2EkR
 1dQSoWrxJdAb+SRsz4l2gbQVV9u6DmmO6blVgCDvZZzox62XcWeu6z+QJikLRBShWH
 Qk9CJq9JwY3Zg==
Received: from localhost.localdomain (unknown [171.76.85.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 445A517E07F8;
 Fri, 28 Feb 2025 14:26:29 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/ci: fix merge request rules
Date: Fri, 28 Feb 2025 18:56:18 +0530
Message-ID: <20250228132620.556079-1-vignesh.raman@collabora.com>
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
were made to drivers/gpu/drm/ci/, causing MRs that
didn't touch this path to break. Fix MR pipeline rules
to trigger jobs for all changes.

Run jobs automatically for marge-bot and scheduled
pipelines, but in all other cases run manually. Also
remove CI_PROJECT_NAMESPACE checks specific to mesa.

Fixes: df54f04f2020 ("drm/ci: update gitlab rules")
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Run jobs automatically for marge-bot and scheduled
    pipelines, but in all other cases run manually. Also
    remove CI_PROJECT_NAMESPACE checks specific to mesa.

v3:
  - Fix yaml syntax

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index f04aabe8327c..b06b9e7d3d09 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -143,11 +143,11 @@ stages:
     # Pre-merge pipeline
     - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
     # Push to a branch on a fork
-    - if: &is-fork-push $CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"
+    - if: &is-fork-push $CI_PIPELINE_SOURCE == "push"
     # nightly pipeline
     - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
     # pipeline for direct pushes that bypassed the CI
-    - if: &is-direct-push $CI_PROJECT_NAMESPACE == "mesa" && $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
+    - if: &is-direct-push $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
 
 
 # Rules applied to every job in the pipeline
@@ -170,26 +170,15 @@ stages:
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
       when: manual
-    # Skip everything for pre-merge and merge pipelines which don't change
-    # anything in the build
-    - if: *is-merge-attempt
-      when: never
-    - if: *is-pre-merge
-      when: never
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
-      when: on_success
+      when: manual
     # Build everything in scheduled pipelines
     - if: *is-scheduled-pipeline
       when: on_success
-- 
2.47.2

