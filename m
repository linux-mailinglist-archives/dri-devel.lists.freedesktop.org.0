Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDA7BD189
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51C10E20D;
	Mon,  9 Oct 2023 00:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1810E212
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 00:52:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CBE4C660708F;
 Mon,  9 Oct 2023 01:51:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696812719;
 bh=Y+j9Xsw46AsG5JPdCV09TevV027ik56XBQjQ+3I3yBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hhdpLJboVDPCZmaEkV+qeAUD1OVyuyyn0Pls27DDegt2Fa78QUEKlSEpDht8ZgFSN
 J2bMWY8m3uKCyuUwKjF4FTHlzbjYoKv6BVZ9snhHsvISgSB4uVfBPMhyWs3IOUlLdO
 q4DD0SjfI5dETgUmyKY1bcITTtZQ0xBMtUy1rm9/+XMkqe84KDPvUTGTD31v7VLpy2
 jW1nijf3K72aXf2KpJWJBawqSow0YKqUYyACm1ciCDzvoq9d+xLOlElo2tE0lcZLdW
 eySkHf9lJzE69PZkg1rB8beO833l/B4L3YfQNvcxU+fU7edDnmWQzpdseKO238rycg
 M7xhPFkmVHgMg==
From: Helen Koike <helen.koike@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 8/9] drm/ci: do not automatically retry on error
Date: Sun,  8 Oct 2023 21:49:53 -0300
Message-Id: <20231009004953.203576-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009004953.203576-1-helen.koike@collabora.com>
References: <20231009004953.203576-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the kernel doesn't use a bot like Mesa that requires tests to pass
in order to merge the patches, leave it to developers and/or maintainers
to manually retry.

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9326522823bb..6c5bf6fac697 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -55,20 +55,6 @@ default:
       export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
       rm "${CI_JOB_JWT_FILE}"
 
-  # Retry when job fails.
-  retry:
-    max: 1
-    # Ignore runner_unsupported, stale_schedule, archived_failure, or
-    # unmet_prerequisites
-    when:
-      - api_failure
-      - runner_system_failure
-      - script_failure
-      - job_execution_timeout
-      - scheduler_failure
-      - data_integrity_failure
-      - unknown_failure
-
 include:
   - project: 'freedesktop/ci-templates'
     ref: 16bc29078de5e0a067ff84a1a199a3760d3b3811
-- 
2.34.1

