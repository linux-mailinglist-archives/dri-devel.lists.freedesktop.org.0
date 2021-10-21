Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2754358DA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BB96EA64;
	Thu, 21 Oct 2021 03:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A16EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:36 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id k26so4644128pfi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfwENsRJQFvw6YG/rstNPj2wimv2P8a7Qj183UL5rSc=;
 b=Em6XK05tPSv3xVQhFgdWCyxtQaykaElUtClkkvToYV+qPGkvoumcWLNV5bCL5JWjZh
 H+8HqChvHTlvBDJQ7RvZjf9Z09kIPwIQMedoRiqHW06Yb6nmRxgo4+QJ35TsP1tDvcZy
 wH9YaXh8CTM308yB+5JOiIMcoGahNHYXuWxhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfwENsRJQFvw6YG/rstNPj2wimv2P8a7Qj183UL5rSc=;
 b=uOVZdFBFlw8YqIdKGhRNc9uzBhYsIGVrTBI8O3jsHlETyRnkU7kj+ULsQJYN9Gkjma
 J3Nsez4GdHGE1MTwpWTkvo60gp7BzKA+S0Etf/pXKxze3FQMcORLG3Rkzvom3YqXzHl5
 c2uwdIX68HIHT6SWyRc9wr6WE+oSqceM4zkB/FJaGNMf/9g8bHnCP39d8Eq4PWx4HW0U
 e7zvLZToXrPK4Sw+N721KJgleghyb8l4E1OV8wRNKls6GmZHQWnd4jnvXBuVbpK+4USA
 JCYWyJ8khPmj0VwuXSNRmYrYyMt2Z/Vn1Gw/lX4xK8BFbzTT83fIxB6jQZEIOJhZHJUI
 7mMw==
X-Gm-Message-State: AOAM532b+eUh5SCd1ecp4sy5eD5ifB60ALuyPaK7po4uPO667pFzDeIj
 Q0hBDTBFt2819ceyk8rj8BhK9fHEuTAOrA==
X-Google-Smtp-Source: ABdhPJz6Emk/d9nzgz9HUo+zk5QFiC4hGj0Obh6mBOVRt7XHXH59y6O1cO9cn2d+xTHaqBmaw3VA3A==
X-Received: by 2002:a05:6a00:b95:b0:44c:7c8b:f762 with SMTP id
 g21-20020a056a000b9500b0044c7c8bf762mr2705822pfj.60.1634785836027; 
 Wed, 20 Oct 2021 20:10:36 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:35 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 7/8] drm: trace memory import per DRM file
Date: Wed, 20 Oct 2021 20:10:26 -0700
Message-Id: <20211021031027.537-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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

- drm_gem_prime_fd_to_handle increases the per-instance imported
  memory counter

- drm_gem_remove_prime_handles decreases the per-instance imported
  memory counter on non-fake imports.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_gem.c   | 3 +++
 drivers/gpu/drm/drm_prime.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7637be0ceb74..c07568ea8442 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -231,6 +231,9 @@ drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
 		drm_prime_remove_buf_handle_locked(&filp->prime,
 						   obj->dma_buf,
 						   &removed_real_import);
+		if (removed_real_import)
+			drm_gem_trace_gpu_mem_instance(dev, filp, -obj->size,
+						       true);
 	}
 	mutex_unlock(&filp->prime.lock);
 }
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 31f033ec8549..1afcae0c4038 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -349,6 +349,8 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 
 	dma_buf_put(dma_buf);
 
+	drm_gem_trace_gpu_mem_instance(dev, file_priv, obj->size, true);
+
 	return 0;
 
 fail:
-- 
2.25.1

