Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9901A49CEB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC510ECCE;
	Fri, 28 Feb 2025 15:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FClhitgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4CD10ECCE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740755552;
 bh=IdxijL2MKs5ZKc3W56BJQd2rktqrB8w0eK8g/S1abHs=;
 h=From:To:Cc:Subject:Date:From;
 b=FClhitgEXxiiyxS1uGMDRJEzbKKwnNPFp+y2W+t/PIbI3XEpO85OW7o0yfxWWY/B3
 hXGWCDuXwVF/jypCMQJ4zEvk+6yf/Vmr3u5FRZEUxYTTjbw2aooaif90OT43++AgFK
 KdTOhw4ftcLIklUIa7U7tQI83kCB6sNn9OgTADm5lhSQa1XjKd0mo3KvidUszYwTKQ
 zVWWt5NF0IuPa2j5YgewkQK7IE/fUcOmo/NwFFuuUXqCBG3/1zTWmWxhqTZBZZtuhY
 JJsRzrZeV+veLOKZcKJIihT5wKBWMauhyIpOJdsksUk5oGKtSYH9gkx6W2av6NR2ZS
 ouWSkFZ4XU3qQ==
Received: from localhost.localdomain (unknown [171.76.85.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 78B2117E066F;
 Fri, 28 Feb 2025 16:12:29 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ci: use shallow clone to avoid timeouts
Date: Fri, 28 Feb 2025 20:42:12 +0530
Message-ID: <20250228151217.563807-1-vignesh.raman@collabora.com>
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

The python-artifacts job has a timeout of 10 minutes, which causes
build failures as it was unable to clone the repository within the
specified limits. Set GIT_DEPTH to 50 to speed up cloning and avoid
build failures due to timeouts when fetching the full repository.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set GIT_DEPTH to 50 to allow the check-patch job to pass

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index f4e324e156db..3ba50fcd6f15 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -40,6 +40,8 @@ variables:
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
+  # Set to 0 to disable shallow cloning
+  GIT_DEPTH: 50
 
 
 default:
-- 
2.47.2

