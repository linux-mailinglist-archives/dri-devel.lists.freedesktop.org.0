Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63E7D070D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 05:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87D10E57D;
	Fri, 20 Oct 2023 03:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331710E57D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 03:42:44 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C627660734A;
 Fri, 20 Oct 2023 04:42:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697773363;
 bh=mhg2KbWF8BJlc7qQFjaNRx17JH77qosO0a5TZgAgkEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aTa7+uHt5BgDjNusqoHoQaHeL2HGZs+WHcYRpN0peHsgF2/fjMzE8AxOxPlaS0uoS
 5ieH3b1KJTji1ZiPTquGTwCaiEWDB5xQ+salXTT90I5pjSUOo81RT0uZzR+PHJQktX
 CyYv7rKB2zPTiReL6S7cB9tfOhGi4GjxpdDq7/Mk0dgaJwmK7PJat7kor0dbw7Iq5C
 Q4TwvzZdq+cg2ko29/8sBHFxVw8f0petiTy1oGGYAL0z4bBl8ZmBe8hkU0SJ23wyOc
 iYu61qLT5uxWUM9rarTil9S6lYDgRbWFXMP5wXgovTZxkbaRRTRDzQkj3pr9dnQHHW
 /mIYNk560+rZg==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 8/9] drm/ci: do not automatically retry on error
Date: Fri, 20 Oct 2023 00:41:23 -0300
Message-Id: <20231020034124.136295-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the kernel doesn't use a bot like Mesa that requires tests to pass
in order to merge the patches, leave it to developers and/or maintainers
to manually retry.

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- no changes
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index b99015afd6a0..97b959b54c45 100644
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
2.39.2

