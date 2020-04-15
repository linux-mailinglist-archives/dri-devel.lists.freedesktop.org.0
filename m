Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99641A948D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A826E88E;
	Wed, 15 Apr 2020 07:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311346E889
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e26so16184888wmk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gs8LnDSq08j9dfc0sQ0TJwO3UzvuOsvsN0kDO+xCPcY=;
 b=VtVpYKDxh/df0xXYnazsGGZ6aM2gBce1WM5PwPcdmcuedn4iXYiHpToZnVEnVD5O1q
 F3R/IS+p+7IjhmkRMcwqZv0xOQ2W5f2ZLqwMH1W6OhMtSXwB2ZXfmO/Hz35VES6ywTIe
 cqqcKZHOw3EZU0y3dQJXoCmSkn6CY71BwhZzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gs8LnDSq08j9dfc0sQ0TJwO3UzvuOsvsN0kDO+xCPcY=;
 b=SKTvic5x+rqgme0+OwjV/k+Bs3Zu2B0TTVk0/VSa9OKjNDuWUiUN4qTjeNmYj0h5cy
 7ZqfAsxO1/zanYXQDPKJmk05Xhc/3BTGloVmQbw7qAEW4kS2tRHoo5fKDNlBnmwqqtks
 E+sktdHzXKVgvvavSk08OrnbmGoQwnbAK+1gZTSLZtbCQEGNp9SpIJpn+01ZnbwnRFji
 VbcD4MI0KiwcwGQKJn5hcS6G3Cnu6+esq5r2iYxs8WUd011ct7g/t+/HUe6sfHBr67kg
 0309FkaTZvgREJaiofZcVcx/GT8RmrBgL5wgKddMUescU7JXapfSeJ6a3E/V17Yjlo0A
 OwhQ==
X-Gm-Message-State: AGi0PuaCPV7z+O8Wf5Dkm/KJLHcC5/ZT27xySfT71eTB3FdpUEoQ2Xu4
 UpYD5XedBOkXiiJEcQmYKv9Fcg==
X-Google-Smtp-Source: APiQypKfqLQqiIjGqWnrzwR7WvTYyyl8gqetZsqK5UpRAhNcIT8zAOvpauXylNgaMjPM9p/ZPpp5ww==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr4113297wmh.180.1586936460793; 
 Wed, 15 Apr 2020 00:41:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 19/59] drm/ili9225: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:54 +0200
Message-Id: <20200415074034.175360-20-daniel.vetter@ffwll.ch>
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
 drivers/gpu/drm/tiny/ili9225.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 118477af4491..d1a5ab6747d5 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -376,18 +376,13 @@ static int ili9225_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
-	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
-	if (!dbidev)
-		return -ENOMEM;
+	dbidev = devm_drm_dev_alloc(dev, &ili9225_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
 
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
-	ret = devm_drm_dev_init(dev, drm, &ili9225_driver);
-	if (ret) {
-		kfree(dbidev);
-		return ret;
-	}
-	drmm_add_final_kfree(drm, dbidev);
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
