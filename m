Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA8A748E2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7E10EA24;
	Fri, 28 Mar 2025 11:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cdqhQpjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978F10EA09
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743159778;
 bh=U4GjcafDlm3dAsQF9NeUgAupHC3MbjsBzZynIBGQLGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cdqhQpjSDpndSv2hbMFQa0gPlkgKhUrFZIGtOZC+e24/qBkK7v5Iwm6JAdJ22Wvag
 MLZJoHtR4hGjxfu7HI8q4Efv/1Is3wBH5I7yiX9NstHcHTo1WADF/8pku7K8jgI1+9
 wDowpAivh01sE0Z6OANLat0wxIZ9At5LaSOuNNe423Ix+T7L04pQ7Rw9KTvGr+MPFg
 0O++7eljfj+w6/biSyVyWsuAnkljNXk8S/X/dqP1zPgRkiuDbGNG8x+B60YTlZbHkX
 kSE4sdJsYM3GF5W/DWzu28x2Ihjgv6sHFzOGvD8YswwQwe8OrAwluCvC/v/gYfietR
 g/huYvu6JsR5g==
Received: from debian.. (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E42717E0EA4;
 Fri, 28 Mar 2025 12:02:55 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
Date: Fri, 28 Mar 2025 16:32:32 +0530
Message-ID: <20250328110239.993685-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328110239.993685-1-vignesh.raman@collabora.com>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
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

Ensure the repository is not shallow before fetching branches in
check-patch job. This prevents issues where git merge-base fails
due to incomplete history. Set the timeout of check-patch job to 1h.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/check-patch.py    | 16 ++++++++++++----
 drivers/gpu/drm/ci/static-checks.yml |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/check-patch.py b/drivers/gpu/drm/ci/check-patch.py
index a5f399a20e25..b206f12feb64 100755
--- a/drivers/gpu/drm/ci/check-patch.py
+++ b/drivers/gpu/drm/ci/check-patch.py
@@ -18,12 +18,20 @@ repourl = "https://gitlab.freedesktop.org/%s.git" % os.environ["CI_MERGE_REQUEST
 # GitLab CI environment does not give us any direct info about the
 # base for the user's branch. We thus need to figure out a common
 # ancestor between the user's branch and current git master.
-os.environ["GIT_DEPTH"] = "1000"
 subprocess.call(["git", "remote", "remove", "check-patch"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
-subprocess.check_call(["git", "fetch", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+
+# Check if the repository is shallow
+shallow = subprocess.run(["git", "rev-parse", "--is-shallow-repository"],
+                         stdout=subprocess.PIPE, universal_newlines=True).stdout.strip()
+
+if shallow == "true":
+    print("Repository is shallow, unshallow git history")
+    subprocess.check_call(["git", "fetch", "--unshallow", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
+                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+else:
+    subprocess.check_call(["git", "fetch", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
+                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-patch/%s" % os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"], "HEAD"],
diff --git a/drivers/gpu/drm/ci/static-checks.yml b/drivers/gpu/drm/ci/static-checks.yml
index 13ffa827b7fa..734d6055fa65 100644
--- a/drivers/gpu/drm/ci/static-checks.yml
+++ b/drivers/gpu/drm/ci/static-checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  timeout: "1h"
   extends:
     - .build
     - .use-debian/x86_64_build
-- 
2.47.2

