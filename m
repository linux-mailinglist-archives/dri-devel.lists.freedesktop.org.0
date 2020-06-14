Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7682A1F8F94
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEBD89FED;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BF76E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:23:45 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m81so14512744ioa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YKS8gM347vC6eBkm4Z/mHFPXutm1BnydR4TUyYY4ZoQ=;
 b=ngmPHhrWqQ3IcGsjjFder735SJJuYeAncWRBp/l/geamiltraOXzmr5I2ygABHqPaw
 FCx/qRrWsG8kJ+wAS60YzXYnZPLpwUWX5YL3ZSb7Xb8AkTNNPJtjzEffwD/PmNusCi6j
 NvKOGSNetOYvZUUZzTIZCP9wthuanXxWPbsqSLqKpa8yI8YuyUWdMA6YQxLNxoD1aasJ
 tmJSG7WRPfu1EyA61NMn+ShfVLfEmDZedCidaN+UkVW7FfpVsnlW3jT/iiROzEvUVItY
 lPGs+TPmmsRCzYnIebL8WJOTdw3pD+0CKoNBdmmInli3cU+s7x5vQnq9bMYla/TgW/Wt
 xadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YKS8gM347vC6eBkm4Z/mHFPXutm1BnydR4TUyYY4ZoQ=;
 b=F+PQNd7BIoBoxNzKicGs5PIq4KfWzyiEokPab9QEkPrnpc+mdGg225C9LNTFMNLYmW
 QDyUfP7iVoLQ1AjfeIfQBsz7wV4GRvZzrwlGr0+lwYn28UVkZNS1khqznrjK/K4tGADn
 vq+IoaRUryCJ0JAMibCYxZIIQzwYh1RVWez7Ss8AIiOHRTtb7gP5IJ4oClw6XVSpvxgF
 KXmZWeeLAmQs96ayFutfLb+AWU0uJIlj4cSDsJdiL+kvsrVzPInrIaxv5gMSFPnB9bkp
 AvyHJEFrv40XyJWEejpJRZM6PN6ixXC1bf4JXR1ULBNWjTu0DnoVe5dIQFUxmDjlJewF
 P3dw==
X-Gm-Message-State: AOAM532+FLXQdZIt8lFXookRDkc/+/Ryt2pVv7td5o4ENbLC8HSStY8Q
 CZ5oRMs6vIo30vThNyq9ry4=
X-Google-Smtp-Source: ABdhPJx5u7CZ+5KI8e9/YmR10s/Tdybn2EupE69+Yp3Ek+4luj4xENHKzjVMeL78OQ0UrI1sFa0k8w==
X-Received: by 2002:a05:6602:2583:: with SMTP id
 p3mr9781842ioo.179.1592115825136; 
 Sat, 13 Jun 2020 23:23:45 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id r17sm5944048ilc.33.2020.06.13.23.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:23:44 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fix ref count leak in mic_pre_enable
Date: Sun, 14 Jun 2020 01:23:39 -0500
Message-Id: <20200614062339.87374-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in mic_pre_enable, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index a86abc173605..69ff74c2ceb5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -270,7 +270,7 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 
 	ret = pm_runtime_get_sync(mic->dev);
 	if (ret < 0)
-		goto unlock;
+		goto turn_off;
 
 	mic_set_path(mic, 1);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
