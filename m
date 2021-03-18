Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57B340111
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 09:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A376E28A;
	Thu, 18 Mar 2021 08:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511DD6E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 08:34:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a7so2592165ejs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGI8HIQlc4uaCPugxl2JDwGzxpy1JYs+5hYiFdwZIn4=;
 b=JHznz+RlAzfthyHdm4DXDxFzqBAGb+To7jbFrFPGg1J8RBHYexcZoqiGSSofvrjX2t
 nPHfdm613VsfXavQiZJYsxJkK9fzmAA2q9SwR/vJY9U3QGOXUiuFWtlsu5ySOonOrY9f
 vYg8B32bjUhCxH9JpXr/IfmJUUzZWXTRjEzyhgkE10BmFMVRvgdeFwysSJEzyMcEzVsx
 hiBzus8RSHx/T/7f+Mo/cY1cWKd+3MrMJzJaA1xJzc7ynrhLb50g1zE7NJkp+pF3EGQp
 785qiDE5otl8YdCjWvspELG7FamIPz1KwFQOPz+ADm6w6yHFrjFV+jnn+wJXzuAbn+hl
 f6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGI8HIQlc4uaCPugxl2JDwGzxpy1JYs+5hYiFdwZIn4=;
 b=iwCFnSGnxj8ZpGHzLG4IokDh/jiaL1ydeiwz185/sKPvAX7DyzW/doYVU+aMdhk8ze
 0QoTJnKa3EgWnL7H8ib8J6XkJFA/stW89rxNQzUWk0wG9fjuKncwF20DvMMeyhy7t18Z
 5JRDAG0+0C5mr4yciamj7jYPTqJ5QGELZmD2icBeag9lMND469qp42GVGD2yI9S+ZrvN
 pG/fJZSztK5GBF+sxXmT/TTDjh9OVwU8/L4HGrKIUAQKIV435NIT49wICPOmk+QWBTI7
 YcPyIjB3l7LHLbeHx/GQsv8xTJxO9VmsgwnjFbU40jl/Ktrbx/LlWXSM8EBetMA9/STv
 OrnQ==
X-Gm-Message-State: AOAM530QxuPCmx449cHLzNC6Gzsx+e8TD72SnOJ0iaSuoLRGz+b5sdHA
 yin8ZqJ4XwHeDPA8Qm5zF7PU/w==
X-Google-Smtp-Source: ABdhPJybE5Kdxq92QLKVUG8Nhp0he0ishzyEmigHj7338liUP4XJbTsowAkqIM8U1qmXN+OPvVRe4Q==
X-Received: by 2002:a17:906:d71:: with SMTP id
 s17mr40870466ejh.126.1616056490945; 
 Thu, 18 Mar 2021 01:34:50 -0700 (PDT)
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
 by smtp.gmail.com with ESMTPSA id bt14sm1316462edb.92.2021.03.18.01.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 01:34:50 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: 
Subject: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
Date: Thu, 18 Mar 2021 09:32:36 +0100
Message-Id: <20210318083236.43578-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dagmcr@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If userptr pages have been pinned but not bounded,
they remain uncleared.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e8c66d10478f..bbcc6264d48f 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -485,13 +485,14 @@ static void radeon_ttm_backend_unbind(struct ttm_bo_device *bdev, struct ttm_tt
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
+	if (gtt->userptr)
+		radeon_ttm_tt_unpin_userptr(bdev, ttm);
+
 	if (!gtt->bound)
 		return;
 
 	radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages);
 
-	if (gtt->userptr)
-		radeon_ttm_tt_unpin_userptr(bdev, ttm);
 	gtt->bound = false;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
