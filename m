Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE351A9488
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6D46E88F;
	Wed, 15 Apr 2020 07:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CE46E87A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a201so17305539wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgX7+JzAzrMLxzBna+OEb05iI4HbBQeG4jLLn6dDjgg=;
 b=a67CzmCUX/ANWlQb5rd0+RZD/Ta5MecS+Ldu7gJm92Q/KF4sCYbr26jikOyStVvM0W
 GjGWPqyl8nl4RhJeZouuUiN0qgQkUtToqAxfJq/1SuD6rsNS0N5nDBHUYHMK1IsDQeP/
 yIM3LBuBZ276VuG7brkw0JMyC69/iN00bNawI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgX7+JzAzrMLxzBna+OEb05iI4HbBQeG4jLLn6dDjgg=;
 b=j8Z0OQ/g068UEUEc83TostZKn4e/36KeJUQhbRezoO8pra5MlKLeCqvJMqillL3agz
 70qDJblgbnDMMgn1S5s7y8hBankUaIGoz07TJY7O9KYwXpgngpc8f2p2AXZmBB+yJoR8
 LLY6FanWWnyDCYZcfU0IeTWSAq0UV3HE15RRbhYa9sXD5VwGmnFgLhflZ3vU9llzxUDz
 x7v/st8vzfeoQokpgKvR4WOBjQACrdIRURV3/agwhxWVo9lq63SQjDertSAGgxcrzmYO
 TU1trU6YzQrgfoS+i5qvLR52W+ag0uYXqQzMsFCmg3yAKupyjoEcE5ihnuDK3eEwvgD+
 7E9w==
X-Gm-Message-State: AGi0PuYpMCvptnqAb7TwFVYyt8+ReO6WElu1NRShAnLsol/MXD4ayfps
 9kT4bBLRXJ2dOFhEX9vrEqp6HWkelJk=
X-Google-Smtp-Source: APiQypKyXFavdPvml466ygFUU7M7XTGYvvh01BZeNaQLjrSWVYyV2OUaUzdwCHY0vgmK3CX18aWGMQ==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr4034496wml.105.1586936448020; 
 Wed, 15 Apr 2020 00:40:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 07/59] drm/v3d: Don't set drm_device->dev_private
Date: Wed, 15 Apr 2020 09:39:42 +0200
Message-Id: <20200415074034.175360-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And switch the helper over to container_of, which is a bunch faster
than chasing a pointer. Plus allows gcc to see through this maze.

Acked-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 1 -
 drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8d0c0daaac81..ead62a15d48f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -265,7 +265,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, drm);
-	drm->dev_private = v3d;
 	drmm_add_final_kfree(drm, v3d);
 
 	ret = map_regs(v3d, &v3d->hub_regs, "hub");
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index e0775c884553..112d80aed5f6 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -121,7 +121,7 @@ struct v3d_dev {
 static inline struct v3d_dev *
 to_v3d_dev(struct drm_device *dev)
 {
-	return (struct v3d_dev *)dev->dev_private;
+	return container_of(dev, struct v3d_dev, drm);
 }
 
 static inline bool
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
