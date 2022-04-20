Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86F5089CD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D767F10E301;
	Wed, 20 Apr 2022 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255B10E301
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:50:13 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n18so1824865plg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hwpE4P0PAK++IoF87d4GxulRADSGpUtTFQUdjv5LNcw=;
 b=H45VCtXdf6GfWkzyk5L6TRFXA93Hkt+3Qy+nVISRnNytt384I4SE2Fa1cJNV6flsae
 5bScYbioWdXQKuRDQICsrEfAWOx7e4txX64dN9pS9F8QqrFiG2e+oVchSv5vEelq8011
 gIABJAVN6Udx4mJ7uUArgP3/6lP8Q5TXh2besSwyX5ngw2VyMaSiQE6vxGcr6HNAyW5c
 g9ap4MsFPYuKnMCL6spP2RSFcM0UueI9jc+5r+6USDigMexmWADzq0TaoKKfzCKnAfpp
 weelRWGALLBQTs+e3YWi7mTRS9IuB5POun0yDQp/SA4N/fqVqXFD1klEptXWJSs4RAdl
 cNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hwpE4P0PAK++IoF87d4GxulRADSGpUtTFQUdjv5LNcw=;
 b=Ia7gYUXHuMxvdjgMTtBZpQOaNFMHWzJgFQ8rX8GFj1P/yX+pzyl/xdViJOcsFmLtmW
 CxkaG1M5o8H4BczDaUppllzU83O2pNeaM9iab7Ih9DYDaZLcjefPcmC5CASvznhqwzSZ
 JNfXWdUiphBew+E0goLNOxI/xlnOZgqD99Rw+pSwsDY+Hf3GvpHuUa1DLjGXKlYND92b
 Q7vSAe51ZkQOleTbpKiKtAwtKkPnD7YVQQJYnx2XNiOW2ld892vjVfyyRPrsB0e5+w5h
 YFN3HiRFfEIO8YB528b23W0qfjpadOLSvd8BN6ZYLNLXd+UOAkJz+Y0G3lDLoDPUYrqr
 NIsw==
X-Gm-Message-State: AOAM532CvuKyQJkL+ggnEJDQWbjTFfteYoSm3ZTyYM+AY/S3c9h7AaVB
 mVMrBRq9ezkw/0XlKvppAjU=
X-Google-Smtp-Source: ABdhPJwzRIaufinLodvQbo05m+YRV47g8bGZU9n2OpavHyOuPdouIljKB/BGuDv28AzfQiqjzEaTMQ==
X-Received: by 2002:a17:90b:1e01:b0:1cf:573c:5625 with SMTP id
 pg1-20020a17090b1e0100b001cf573c5625mr4558482pjb.75.1650462613605; 
 Wed, 20 Apr 2022 06:50:13 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 c30-20020a631c1e000000b003aa66be569csm2487949pgc.32.2022.04.20.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:50:13 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/vc4: Use pm_runtime_resume_and_get to fix
 pm_runtime_get_sync() usage
Date: Wed, 20 Apr 2022 21:50:07 +0800
Message-Id: <20220420135008.2757-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420132814.3sy2ojw3dxnd5tcz@houat>
References: <20220420132814.3sy2ojw3dxnd5tcz@houat>
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the device is already in a runtime PM enabled state
pm_runtime_get_sync() will return 1.

Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync()
fails, so use pm_runtime_resume_and_get() instead. this function
will handle this.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- switch to pm_runtime_resume_and_get() to fix refcount leak.
changes in v3:
- keep the original checking way for retval.
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 752f921735c6..98308a17e4ed 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -846,7 +846,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	unsigned long phy_clock;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
 		return;
-- 
2.17.1

