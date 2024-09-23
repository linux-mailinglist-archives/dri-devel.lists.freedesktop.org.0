Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0197EDFD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902B110E271;
	Mon, 23 Sep 2024 15:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FymLBSFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CD310E271
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:20:35 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so548463966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727104833; x=1727709633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VAoybQCw+SSRlMGkzjtBvNGKOwn68kaOmQ5Cr4iAn7E=;
 b=FymLBSFIiuu/0eIwtnj0GbONwm8ceKqolelpA5udGD8a9v8/Gl+afN8UWFuYq+wf2a
 uTwe24kKJTzsXr6bV5aRRtFSmvpPxZlewyyQ4yo/ffLOAcoPWVuMZ3b3lv1GPPiWB10/
 fMC/Y65xxFD+uCTQULs42wLWOh3LYuNUIftO3moeJBPoF6oPeGMeoV09n0JmIHqp5MMP
 w7CuGmgOOjOkGU218F0GSCnQfw8U1T91HlWsemRBtVIqWfMppg4P1C0eXSTebuZP1g+B
 VfOVPzingt4MwMMqUEu7Js+t7U1ob96OF6Oy/25O2VuP/CvOdP5nBPBlTFGflkT+YeqE
 q/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727104833; x=1727709633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAoybQCw+SSRlMGkzjtBvNGKOwn68kaOmQ5Cr4iAn7E=;
 b=dKc45SPoGoX0Ru7WJWK7F5f0varw4rxq7M4CnBtLEqVoXu6K12yO6pQ+E+xESXdEfQ
 BcxnW8JS6ouyW1ckDpFDkDCGc2F9iT9LExDNWy+UzGDa9Y9/aWJBzyNtGOytgrOr6Zly
 naQwNiiAGNCTRQsuYmCBZqq6b0tN/JybygtYb8g5IOO5qtBv9GwD+rbdlXbyAbiAxjCg
 qRNsv8EeM22/qjs7WgwlfYs3/ihafob+sYic7wwBUBRI6x/opMDqQpjiPRLJW+xKWlqX
 YJM3FcptH0a+tKhE2Dbw+S3qzRHovBewsdJy3pxOHFtzFFW8DKW+90g5sc2jFD8gLyvv
 ZMFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmc/8gmdpNIcqKmU/Bdfu6U6QkFCCYTvOkJR4RhjItKcFEHD208ljKGd7oxC1L/QQudReQvR3N+JM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzis6VHSEjCM3f5Zvin9QhZFLMUTCQ0BS1ByZY+/sbh1u5RhtKr
 w4NvAtneTRF1whj2bZHySpJJHzl36MgRJuE+DAHhQT5i6zfQ1Rmu
X-Google-Smtp-Source: AGHT+IEKHyP7+CWpuJe3pV9TPfqpvuYPi0TJx5uONwNak/pvlUj2NWuHdDJxFuhb1UuOhDoqj9ImYQ==
X-Received: by 2002:a17:907:2ce6:b0:a7a:9ca6:527 with SMTP id
 a640c23a62f3a-a90d5671b3cmr1377721866b.8.1727104833258; 
 Mon, 23 Sep 2024 08:20:33 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f151esm1242929866b.48.2024.09.23.08.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 08:20:32 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Christian Gmeiner <cgmeiner@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: Use v3d_perfmon_find(..)
Date: Mon, 23 Sep 2024 17:19:59 +0200
Message-ID: <20240923152000.185980-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.46.1
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

From: Christian Gmeiner <cgmeiner@igalia.com>

Replace the open coded v3d_perfmon_find(..) with the real
thing.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index cd7f1eedf17f..54a486a9b74c 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -402,11 +402,7 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 	if (req->pad != 0)
 		return -EINVAL;
 
-	mutex_lock(&v3d_priv->perfmon.lock);
-	perfmon = idr_find(&v3d_priv->perfmon.idr, req->id);
-	v3d_perfmon_get(perfmon);
-	mutex_unlock(&v3d_priv->perfmon.lock);
-
+	perfmon = v3d_perfmon_find(v3d_priv, req->id);
 	if (!perfmon)
 		return -EINVAL;
 
-- 
2.46.1

