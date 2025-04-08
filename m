Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53BA7F23E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 03:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5B10E074;
	Tue,  8 Apr 2025 01:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07210E074
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 01:32:30 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso6730777b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 18:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744075950; x=1744680750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IT6EO3uXq7W/DtEevmI6X3jGcRw4tHqVpMI32qli+6k=;
 b=kDvU+ir7M97aqNNOvZGR5uMgeg6SL/fgn+PRAGksc3kz42XgiP1wqKBo6sRXji4ME3
 bE9t70Bkp9XxTpg4370JW0X7jKiRprsmULvL0KohcIPqr0a8lp9Lp1JC+MOnnfhwaObf
 J9Xq5VU1J/cQzsNG3X1BbxBw2m3Hs1cKT+e+9fLDPM7Q2Y57qcnriw/xaYbGZJD5D//b
 2C0GrDgnkkKVvLRakW/iJvYYotnRbdL/LehdkcusldF6ROvT/5rgDkXOartAd2UDJBjR
 aHfmVGRjP1BqX/CGRTJkOF2TWPK/yx1/bxmgTWZGwTxiC/2qRZiPjPM0+W7g2Bmnvkwh
 YiEg==
X-Gm-Message-State: AOJu0YwC00opLujogIkTyEZ+A8b46ZnqBdTfJPtFFciL6EMP8ZGfC84V
 pU9JidRIYA0rJ3dZoYkZX4/QQwW9L4813qzxU2EOmeZWhrf1YRpbJLfQCwW1Ze9vvw==
X-Gm-Gg: ASbGncsIdJ7znX0nBXVCYlKHXRdlyyWr727VrwyxpYwRsuNOGP51bwoGqPqaErD78WI
 Z4gtePUeklHl6E7DK4VlhaBnMZp00M3GoLFimRIiEKc9yTOHYXU2jrqneCGHdBW+MZ9CaIaLILF
 /Aok+NOe77iA7w67rtyXQ8BEdisb74VbiFgpbDsVILhODHyqiDaSdISy9FLjPGdKm2J7LygmtaJ
 3oa3uKjJdYE05Bm811mt+sbf9Vw+vGd/cJkhaN1A5yZxMMuXGcMfRuW1hV5EYbe9QxNaFGXe0lu
 /UEtnVYliNBLXDy9PEehICAMmgzanG0HKOkRs30Tz91Y241jOmcFNU5JjKri
X-Google-Smtp-Source: AGHT+IEzl0nskbxsR96eaqQW/1gJQJ8+1JpvRWHmYANqFKElkG6cxZpJBqxLTJ5cU0yAVVNeQ20Pfw==
X-Received: by 2002:a05:6a00:2186:b0:736:5545:5b84 with SMTP id
 d2e1a72fcca58-739e48cefd7mr22131846b3a.3.1744075949719; 
 Mon, 07 Apr 2025 18:32:29 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d9ea089csm9243885b3a.111.2025.04.07.18.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 18:32:29 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, rodrigo.vivi@intel.com,
 andrealmeid@igalia.com, christian.koenig@amd.com, raag.jadav@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH] drm: Fix the length of event_string in drm_dev_wedged_event()
Date: Tue,  8 Apr 2025 09:32:19 +0800
Message-Id: <20250408013219.26006-1-jiangfeng@kylinos.cn>
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

The format of the event_string value is `WEDGED=<method1>[,..,<methodN>]`,
so method should be appended after 'WEDGED=' rather than overwriting it.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 drivers/gpu/drm/drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..58babdab9e66 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,8 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len,
+				sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

