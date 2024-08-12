Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4C94EBAF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 13:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B113810E090;
	Mon, 12 Aug 2024 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="FVuGh4N6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E64710E090
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:21:25 +0000 (UTC)
Delivered-To: daniels@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723461682; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hSDBnQ7E3G2NfCheKXcumPD8j3KEvI0z7Zig8vXA8xyc2mt8vGFgeesuSrNPMKTAq6fiE2LsTbopcIqiu+J64R8d7s2y41U8SJqB5fCyeQSsxRjVZTXrPgQTE8uHpiWLwwQMsbUui2Bx8c/W4HICoIKK9bcZ+AhXGEWyOvdk2GA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723461682;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ElgfAUgp1A3HJ9rIBV/vS6smXyAx/v9/DJS44pjWjJ0=; 
 b=eF/904qFd6gKf0NPmk05DL8dfamJzkQ0xQ1HfLfyFqRZQmuFBf9dEJCO1i3drE4hs2EqEWcZ22VSRQNXOfeik3u3tAz6bXB3qb+BWvP3boWjaoXn4XSCkeFjnaQHt4sBX1SHdD8AF710xLytHI+zd/1a0oGbMbXVGWl/OnxPdD4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723461682; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ElgfAUgp1A3HJ9rIBV/vS6smXyAx/v9/DJS44pjWjJ0=;
 b=FVuGh4N65uQ51d1NKzefCpdRMhvdoj6WUr/918dEYvuQwvQNWVzFhBs4iwyqMcDE
 pLZrkMpsWWAFIIiHeVmjBL8V8QcArYiUsg3TI7kXmrRA4V+AWxtns+z+8O+6ur7vEyI
 R/auJfYpGE25kTkoasxaFy6qaH6UNQNn/QeIKO+A=
Received: by mx.zohomail.com with SMTPS id 1723461681031721.9508608249985;
 Mon, 12 Aug 2024 04:21:21 -0700 (PDT)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: enable lockdep detection
Date: Mon, 12 Aug 2024 16:50:28 +0530
Message-ID: <20240812112030.81774-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci.
This will output warnings when kernel locking errors are encountered
and will continue executing tests. To detect if lockdep has been
triggered, check the debug_locks value in /proc/lockdep_stats after
the tests have run. When debug_locks is 0, it indicates that lockdep
has detected issues and turned itself off. So check this value and
exit with an error if lockdep is detected.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - Pipeline link to show lockdep_stats before and after tests,
    https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721
  
---
 drivers/gpu/drm/ci/igt_runner.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f38836ec837c..d2c043cd8c6a 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -85,6 +85,17 @@ deqp-runner junit \
    --limit 50 \
    --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.freedesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testcase}}.xml"
 
+# Check if /proc/lockdep_stats exists
+if [ -f /proc/lockdep_stats ]; then
+    # If debug_locks is 0, it indicates lockdep is detected and it turns itself off.
+    debug_locks=$(grep 'debug_locks:' /proc/lockdep_stats | awk '{print $2}')
+    if [ "$debug_locks" -eq 0 ]; then
+        echo "LOCKDEP issue detected. Please check dmesg logs for more information."
+        cat /proc/lockdep_stats
+        ret=1
+    fi
+fi
+
 # Store the results also in the simpler format used by the runner in ChromeOS CI
 #sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt > /results/results_simple.txt
 
-- 
2.43.0

