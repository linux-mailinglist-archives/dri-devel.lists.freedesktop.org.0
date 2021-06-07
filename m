Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124539D9E5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261B46E40A;
	Mon,  7 Jun 2021 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10F36E8A6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:40:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1581881wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/eGUHufc4QuNlUJ/IW1FBJqs8nniN+2MJCPR9IueSg=;
 b=tzvWLVp6D5oukkVtaiT3tZrQL2Ohz+82XyN4CG7Hrxz5VpvoVNqGYsYSuuQtyCqEba
 pPBORT1Ox9tjmGsCX+BY9/bbwiYZJCJE4Ylyy02kzJRfA77DOXXHxSzmmqUz18IEgn61
 OM3YsPpRAiKkDHJil7X85s6NatF65RKhasaB1VpOSp9EUoJ5W48tdHuw7gmaTwcDTu+4
 fDC/rCd1CsETzRKF0cGWf9bZu5u0Sy3VSgqhlkrGlIbkrFtdF64JF5HBfT/6Emxbw4tG
 3cIxcM0a5GEINptNBkuq6FDUedp8W8yPogfDCDZz7a+iearqJ/XCp8k1rLj9CoQLfKhZ
 tVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/eGUHufc4QuNlUJ/IW1FBJqs8nniN+2MJCPR9IueSg=;
 b=TuN00Fo4F7MuD163d+ZH/NSbQJUho7NN0rDw6kEyxqtszSd/c03Zsx4EYtYoHy8+qT
 zEpRKqXduoItZ3K+bliwCuWj8oS9U9A/6CyQxhbqssVngyNIARdAzbTAJNq3INS1JDhO
 oLFWG4tTTPepKXI2jqPOnz8aLoggQb3BP27L5uYiQ2ZE1JrmtbTlPfjnTGiiM841tRoF
 MEh4hoUToezlclAM4mfezBFnljJGXqnK8llO71pDJvAJMgcsrCkXUzM3py/6YhCQ/e3E
 TLjv68pJcSVqtZzGE38xfiGTP1qg+LsNcvbg+mnFV2em9VDAkFJJ4xa+GqLxks2hysnL
 U5nQ==
X-Gm-Message-State: AOAM533qCU05nue+DRAGLBhzsUw1EfHD6DOKX3PdLLRDir+WIR2ySfCV
 KJvpswkHARsEQZEjZhsquzqRck2tbMA=
X-Google-Smtp-Source: ABdhPJz+D5yJeOxNhKqBINYOhZjyIpC+MS2i9R1lUa9Pt9xIeG8jWP9rvSfy30Iy3LbnoudEr6o44w==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr16512123wmj.128.1623062441340; 
 Mon, 07 Jun 2021 03:40:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:281b:1208:a095:f965])
 by smtp.gmail.com with ESMTPSA id t9sm8874737wmq.14.2021.06.07.03.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:40:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix missing res assignment in ttm_range_man_alloc
Date: Mon,  7 Jun 2021 12:40:40 +0200
Message-Id: <20210607104040.22017-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas_os@shipmail.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That somehow got missing.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index c32e1aee2481..03395386e8a7 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -88,12 +88,14 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
 
-	if (unlikely(ret))
+	if (unlikely(ret)) {
 		kfree(node);
-	else
-		node->base.start = node->mm_nodes[0].start;
+		return ret;
+	}
 
-	return ret;
+	node->base.start = node->mm_nodes[0].start;
+	*res = &node->base;
+	return 0;
 }
 
 static void ttm_range_man_free(struct ttm_resource_manager *man,
-- 
2.25.1

