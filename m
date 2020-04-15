Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294191A94B2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA589762;
	Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682F6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f13so17850893wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owbNU0MxZXmqWZDP7JpaZzPb8BoatmD0pycGlfu/bt4=;
 b=SNbiWLNPSWUwD7pb8gguKog9DFTfe5Kl1HI5YMONfU/iR0NAe489VjSfeAhDdzRqlM
 /tbegf40n0m9D+jKhwDV+V6IGaYDugYKnrG7psagFjCqYwzeLKAFN2V6fVOmpak0jes0
 oOP18tVIgrdw0L0DUi7uH3cdQXh/CpXnCgg9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owbNU0MxZXmqWZDP7JpaZzPb8BoatmD0pycGlfu/bt4=;
 b=EJHfkf4JXnq2Ey6n0GNuyuXpaVWWxC8pQxicv7ZR9SCCFL8iCIM3zR445C1aNsubfS
 lLiZjM+pgDxFY+WbZhRzRgCa1geG8xLmr2MGYifx37t702qsXsqHQW3ZZ7YjFjFhCKRE
 ZFek7ISkMDhcGOVO5GJ76+ZyyQwc0a12mnzvJF619Xr+yDYRzOoizSDQOS22NVsxsgap
 iIOdRqElFKEjPK9dN/YQhU0yMxf274iqWKUocwCtLXm3YG6G1T7iHj3V3FWZjHY1TBSq
 994YyWDxbtHCi2l/zrTaEHiTGNIZC1SICHjvEvyB5k/izz+2Ucv8xcahhhLdm87kJ+6T
 gnkA==
X-Gm-Message-State: AGi0Pua8ufFANOagWztX5E7CxTuqL01cEgLTfKw7F9w7EyQD5KtqsLpr
 xGUxaiurlib0/W+w4NGk+V5mDQ==
X-Google-Smtp-Source: APiQypLAcYT6tXqZgGn2VIBl7LGuQCnmn1xbsxhJEkJHyPMNJcTEbfIMvxJBDbwcfS+RUfD2j4hKqw==
X-Received: by 2002:adf:b344:: with SMTP id k4mr17732939wrd.76.1586936464921; 
 Wed, 15 Apr 2020 00:41:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 23/59] drm/tidss: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:58 +0200
Message-Id: <20200415074034.175360-24-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Tested-by: Jyri Sarha <jsarha@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index ad449d104306..7d4465d58be8 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -135,20 +135,13 @@ static int tidss_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	/* Can't use devm_* since drm_device's lifetime may exceed dev's */
-	tidss = kzalloc(sizeof(*tidss), GFP_KERNEL);
-	if (!tidss)
-		return -ENOMEM;
+	tidss = devm_drm_dev_alloc(&pdev->dev, &tidss_driver,
+				   struct tidss_device, ddev);
+	if (IS_ERR(tidss))
+		return PTR_ERR(tidss);
 
 	ddev = &tidss->ddev;
 
-	ret = devm_drm_dev_init(&pdev->dev, ddev, &tidss_driver);
-	if (ret) {
-		kfree(ddev);
-		return ret;
-	}
-	drmm_add_final_kfree(ddev, tidss);
-
 	tidss->dev = dev;
 	tidss->feat = of_device_get_match_data(dev);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
