Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AD7713A40
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BB410E09F;
	Sun, 28 May 2023 14:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DE310E21B;
 Sat, 27 May 2023 07:54:44 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64f1f133c37so343486b3a.0; 
 Sat, 27 May 2023 00:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685174084; x=1687766084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ps1IF/L3y0LuIXv1kuyXMXVV1V92IKkA4nkdR1TZzsU=;
 b=J1k3fPaQZMPaMfdKrnm1zm7gzhHU3qdmAEgC4wn/zWlP5HZ6JqC5OlOYRpBy+aPcQg
 yUhoygdEbaP/d6l50zsX+P2x/nCpG+WCQ3vo2jEYDG6kXl3wiY3GZCZeW+KK7JfJUpXb
 vglxbKZsZSapWDZ6FUSrA82OzrEKw49uNha6r3OrW2h+wK+WUgqPh8mybzRX0ER05svx
 YYA6tu4labf09OfctbtGzSUoFMvh+n05rb5TndVmhR89vfRWC7USJ3BZBiHfKfvK5I6A
 uDJ1Kg6CpMzxNxSyjL2LyjV+88Akn+4O1hOLrEvQDDmCoLXemg9Gg6AS8g50KFwbTkEl
 6+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685174084; x=1687766084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ps1IF/L3y0LuIXv1kuyXMXVV1V92IKkA4nkdR1TZzsU=;
 b=fd+MtRHS5bqPsRDPtczwHU25kW/kxUqex+eerqrwjMtBglShw+J8XKdpzJUVwcLbhZ
 ndR6cFMNcV0KnO5XDEmfdOhc884/PWRKJU0rzw3hNprFgbq9xBTX7x3u6pLjYz9gpw8S
 WS9AgfBAIXtWMNhOQ8V4PXcF8eWVbWRzcTOnvi3h1jogdrUNmkonByvt52UTBvfiFdOr
 q12sYMlLZ3UrabLQKnDOK0umVs97MITVrdhvJNhJPrIimkmQ6ZgmAHJQDKo/L6JV6NI2
 W05ZErvozUeDNoq6Ig3MNWTbiUQ6xOU/AdiJavLE1OM2JQ2aufKi4T/ldWqMRzV+HouE
 LQyg==
X-Gm-Message-State: AC+VfDyJKLzQhOV+HD5TRRn3Oa3Ui6HsGlmDpXhbCyii1Jj6jXbf0xc7
 RPG917uEso12Ixw9HkDtNw9jdXgD0wRFYD3M
X-Google-Smtp-Source: ACHHUZ5Wl/x2AX2Bqkt5RQGo8lzJHVe2CTWpN35HVupnCmsS+crSB8FjThb8CWMDAlUiyAzTHgUY6Q==
X-Received: by 2002:a05:6a00:349b:b0:64d:41f1:7c87 with SMTP id
 cp27-20020a056a00349b00b0064d41f17c87mr5793226pfb.2.1685174083809; 
 Sat, 27 May 2023 00:54:43 -0700 (PDT)
Received: from ubuntu.localdomain ([103.114.158.1])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a63d547000000b0053f22b76cdcsm3770567pgi.82.2023.05.27.00.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 00:54:43 -0700 (PDT)
From: Min Li <lm0963hack@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
Date: Fri, 26 May 2023 20:37:53 +0800
Message-Id: <20230526123753.16160-1-lm0963hack@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 May 2023 14:59:32 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can race to free the gobj(robj converted from), robj should not
be accessed again after drm_gem_object_put, otherwith it will result in
use-after-free.

Signed-off-by: Min Li <lm0963hack@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index bdc5af23f005..450c7cbdd28a 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -478,7 +478,7 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 
 	drm_gem_object_put(gobj);
 	up_read(&rdev->exclusive_lock);
-	r = radeon_gem_handle_lockup(robj->rdev, r);
+	r = radeon_gem_handle_lockup(rdev, r);
 	return r;
 }
 
-- 
2.34.1

