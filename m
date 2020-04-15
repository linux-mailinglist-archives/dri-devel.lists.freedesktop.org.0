Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880041A9489
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AA96E892;
	Wed, 15 Apr 2020 07:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DAD6E88E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k1so10648362wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=is398M7pfTI5HBFMZ1hnnfJjoeHfBowpX8LBT4kA194=;
 b=cWSZDDir+f/3eXvr5Pd/gURcwbJXgPY8lnlo5+XyLnGMZv4wIavKneKT9tq3Fwsn3T
 HYYE8IoXXtO7xmdTZOKDOWLUNk/wbVjuYhPAaOGMslRKg9KDq7lFPWxLl7sYFnQGrRj5
 idEJ2hTwdi0RaE1B2yD5gX56btt8AWmtTn0t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=is398M7pfTI5HBFMZ1hnnfJjoeHfBowpX8LBT4kA194=;
 b=s0MEeJ9oCdpi9sx59kfvuRmKyjl/nHhx2ykvclARopiN3uFmzaNytNBLyw1BrgFm6i
 YT/eYC92bJEs1vQBFqPhhECxgO0C5cfLloNjkUw6iej0HCldQc4cpalOtkeQrkK+oDPg
 3IYlzpXHX5eU11gh+oxmJQrifzwHMs39FaKdZP9Xv06nTUEvzaNH7biT30HJAtTatjFD
 byMV61BIFwJoELaLuKmjqxD9LbDwNdIM6ZSkYHNURY1dg00GZJKstNfyvvqiOpwwEFE6
 ti7I+XE3aRZZBL1usFLsl2Wjb4RSHniCrbFiTGe+dS+V65SdUX2FMangWdJtxrwj5CXR
 AVbQ==
X-Gm-Message-State: AGi0PuahSsTeczd/LAk1YrKiF3oVZUjCfHfjRfiB0msBu6+38Gqb8egd
 0jMkJjOPN5v2bDy7V8iVODmOVw==
X-Google-Smtp-Source: APiQypI3nHMGFM6Xx24cSavG41vgo4+44a5y2RxIXJcT0tuTvcuS6lYHGQclu5HscvFN4nF0e5OLog==
X-Received: by 2002:adf:e742:: with SMTP id c2mr27574793wrn.293.1586936455521; 
 Wed, 15 Apr 2020 00:40:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 14/59] drm/st7586: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:49 +0200
Message-Id: <20200415074034.175360-15-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 David Lechner <david@lechnology.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Acked-by: David Lechner <david@lechnology.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/tiny/st7586.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index c3295c717ba6..2a1fae422f7a 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -317,18 +317,13 @@ static int st7586_probe(struct spi_device *spi)
 	size_t bufsize;
 	int ret;
 
-	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
-	if (!dbidev)
-		return -ENOMEM;
+	dbidev = devm_drm_dev_alloc(dev, &st7586_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
 
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
-	ret = devm_drm_dev_init(dev, drm, &st7586_driver);
-	if (ret) {
-		kfree(dbidev);
-		return ret;
-	}
-	drmm_add_final_kfree(drm, dbidev);
 
 	bufsize = (st7586_mode.vdisplay + 2) / 3 * st7586_mode.hdisplay;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
