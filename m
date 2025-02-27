Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB4A4748C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3135910EA25;
	Thu, 27 Feb 2025 04:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h+bvhONl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F62B10EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740631020;
 bh=dTLiIcGg+7VcR4Jututcykw9L0J9eF3fh+IAUJFRshM=;
 h=From:To:Cc:Subject:Date:From;
 b=h+bvhONlg44ykMXqLn8yZyAIVVSkPrQt17gJjPJmzwSNanNZFJctyA3acfNgBZs6I
 ZWD5OFhI/IrHedTsnjbApva0AMUIG8G9LNjyPV+jsLy8B7w411fAtRpfbry33AzK1l
 63jexskqMMhRYoWKORpnIlIRC/suVay+RKlBxPVncrqn/AE3M2fvkhZC+mLrD6s70O
 KwRLWiWiU10R9He+vpgWNX0lYTD6MnUssS8hwjMDiEIuTmA0ounve/ISeVG0kJURpQ
 WWMHHJDGYqHj8LDn7nkcSN4QU5BiYLDzuhGMF6p4mCB4Brqxmu6k5pD8My6KZJMKQF
 m7vIpWzGtfvzA==
Received: from localhost.localdomain (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A4BE17E068B;
 Thu, 27 Feb 2025 05:36:55 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: remove CI_PRE_CLONE_SCRIPT
Date: Thu, 27 Feb 2025 10:06:24 +0530
Message-ID: <20250227043640.411696-1-vignesh.raman@collabora.com>
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

If we are not caching the git archive, do not
set CI_PRE_CLONE_SCRIPT. Setting it makes CI
try to download the cache first, and if it is
missing, it tries to clone the repo within a
time limit, which can cause build failures.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index f4e324e156db..0bc4ac344757 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -13,12 +13,6 @@ variables:
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
   MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
   DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
-  CI_PRE_CLONE_SCRIPT: |-
-          set -o xtrace
-          curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${DRM_CI_PROJECT_URL}/-/raw/${DRM_CI_COMMIT_SHA}/.gitlab-ci/download-git-cache.sh -o download-git-cache.sh
-          bash download-git-cache.sh
-          rm download-git-cache.sh
-          set +o xtrace
   S3_JWT_FILE: /s3_jwt
   S3_JWT_FILE_SCRIPT: |-
       echo -n '${S3_JWT}' > '${S3_JWT_FILE}' &&
-- 
2.47.2

