Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA664B2E67
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D10010EB84;
	Fri, 11 Feb 2022 20:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297A110EB84
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 66E3F1F46D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611266;
 bh=gYibqNB1+itBfny9gOexMyMgTnphxGX3BqownR/09FY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iof5gWhj6h2dYdrbdRuO3q0wPZ0y7jueb/rGmcNcJcVTvBJhUtiqv+9fAZlgya3Ye
 tM4pfJ9DaHN21vD1PLvgzFHq8xglnjcI5fa5Z1EUX2iNcIy1hvAG37+iQKAwAkSnxz
 IBtimq1VDPihuyxEiWCy6/acpLCNo0AZ3CHNZst6v+2ECEZ19D72ZxhJbavTOh19+o
 VzW1uoKKj8JwoQD7aNzDy1UoN3OcFeFYj3hO2/7o9Wtcg67ph1qG78bT9gQdBFPdn9
 q0WUcO5JlP4+fQsfORPS2BGHpSEeG9OkbrLOOkzkEqiZgU/J4uSgZKb4tQLDoLJDbp
 sokl5BtzMZqig==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/panfrost: Handle HW_ISSUE_TTRX_3076
Date: Fri, 11 Feb 2022 15:27:23 -0500
Message-Id: <20220211202728.6146-5-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Some Valhall GPUs require resets when encountering bus faults due to
occlusion query writes. Add the issue bit for this and handle it.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 9 +++++++--
 drivers/gpu/drm/panfrost/panfrost_issues.h | 4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 7f51a4682ccb..ee612303f076 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -11,6 +11,7 @@
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
 #include "panfrost_features.h"
+#include "panfrost_issues.h"
 #include "panfrost_gpu.h"
 #include "panfrost_job.h"
 #include "panfrost_mmu.h"
@@ -380,9 +381,13 @@ const char *panfrost_exception_name(u32 exception_code)
 bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 				    u32 exception_code)
 {
-	/* Right now, none of the GPU we support need a reset, but this
-	 * might change.
+	/* If an occlusion query write causes a bus fault on affected GPUs,
+	 * future fragment jobs may hang. Reset to workaround.
 	 */
+	if (exception_code == DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT)
+		return panfrost_has_hw_issue(pfdev, HW_ISSUE_TTRX_3076);
+
+	/* No other GPUs we support need a reset */
 	return false;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index a66692663833..058f6a4c8435 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -128,6 +128,10 @@ enum panfrost_hw_issue {
 	/* Must set SC_VAR_ALGORITHM */
 	HW_ISSUE_TTRX_2968_TTRX_3162,
 
+	/* Bus fault from occlusion query write may cause future fragment jobs
+	 * to hang */
+	HW_ISSUE_TTRX_3076,
+
 	HW_ISSUE_END
 };
 
-- 
2.34.1

