Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E45A80010
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E70E10E667;
	Tue,  8 Apr 2025 11:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825A10E667
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:27:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22928d629faso53781495ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 04:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744111666; x=1744716466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sWNuU4PXGcFFUxJOOD6+vUejwIulJeOU2+PZK360UKs=;
 b=bFBEJhNeBvWIHlNkQsYvNCakx0l/6LzZiO6yZ9V1t0zVJ0LivcTtukIuIQ1BgD/qc5
 YQuYG2ziK7ZdsCgrih408m0g6bU5BpRPC25u7SpClfsX4o7oOC7Vs3YgEiEdkf8AF1LY
 TofLbOAOdQ7wQ511roSnZo9ctZueOje00omhvOZ3z4dhCVY1ktzLBhTb2xVjDhlJwDf7
 zrbdJiXHvB5oVVI2fnpUHHgo+vO6nQjMzbiZLn/wqgB22wjfFV/pB7DhG9TwUoXck3eU
 v3S/b+Y+/KNJ1HhdcdrJjGuSa+vXbp1UcyXwkpphdJZxLoTtTacTH0QjdHIoqagT5z7k
 UuHg==
X-Gm-Message-State: AOJu0Yxk5tP0MtPBsBrbQKux243WDVbBHZrN4AxIioodjGHT6TtpV1nT
 e1vh23zavenq6nU0A3qbF8pYLg8tIvgTg/R4haGi6iEmtldDXBSS
X-Gm-Gg: ASbGncuO1S++1zEveeOneQ/wFEToMqw3ytoIDqaGZQn0VmUjOaiD2fS+10EC5DCRht+
 cQFkwPoBWlFZt6atd+wn+SklaLDOkHUY5QHoVvCOpCqKfF7EIAW1v+eb2BHtA63/avvTOcc0YE4
 MYUqm39jDTFmEFIPiaMbl6AVJp1iXy7WPFl3ZhWbYdIfbHXb0e7UjJo7pMTyPqC46i9bvytLSnv
 LDoLI/kynAihu7uBkNkYtqT6X6BtwQks4xGa3acAAir4ZxymXvjMc482B82vF0leTYbRhvuPkir
 wx+Dt6cEx+Hr3U1JUoEdANvpkRaNb66KvXM/3HQobGX2bIKuwYUBxBMU0J0a
X-Google-Smtp-Source: AGHT+IHq28UvQIqWAknFOlE8tIbb/hwfHmeUHFw2eZnKNEbxo/0KO+z2EsthClTeQucSfsOEE2tUVw==
X-Received: by 2002:a17:902:f684:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-22a8a8e44camr224245775ad.48.1744111665988; 
 Tue, 08 Apr 2025 04:27:45 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785c0127sm97708895ad.91.2025.04.08.04.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:27:45 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, rodrigo.vivi@intel.com,
 christian.koenig@amd.com, raag.jadav@intel.com, andrealmeid@igalia.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH v2] drm: Fix the length of event_string in
 drm_dev_wedged_event()
Date: Tue,  8 Apr 2025 19:27:28 +0800
Message-Id: <20250408112728.244146-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

From: Feng Jiang <jiangfeng@kylinos.cn>

When calling scnprintf() to append recovery method to event_string,
the second argument should be `sizeof(event_string) - len`, otherwise
there is a potential overflow problem.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
v2:
- update commit message
- keep scnprintf() as a single line
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..60e5ac179c15 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len, sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

