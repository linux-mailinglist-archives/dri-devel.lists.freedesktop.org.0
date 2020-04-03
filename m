Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A419D84F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE26EBBF;
	Fri,  3 Apr 2020 13:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9BB6EBC5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m17so8610366wrw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q6O+kjQ3udNFhJbNxAw6opLN9TwD5mD7rrI6toXXqiU=;
 b=UO9WOXJarUk8sJ1xedXYC/Sz8nmjEvyTKvMP1MR9cxztUUOJr510dDIB4Tx5/U6iRe
 k9/wR7ckcsV5TIOxhc/50Wqex/Fye+by8vOgtZ/Z1oRLL1QfEc4pxMdAiZoREeM+eAJ0
 y16CgF5l16UhXgWGeKJkJ7JbT2tYbq8EPsANA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6O+kjQ3udNFhJbNxAw6opLN9TwD5mD7rrI6toXXqiU=;
 b=ZNH9AsTXqcBsBdy7XWR2SjIse34UbOIqsHOo8Wmw4O8HtgSKuMlAVxGy5vt2PsrmK/
 JHBQYKY9wkfDHFA5Bbr9zhKqwHFfcczQhTxXjtpqHT+NBgve28KyH/YM2GMUKHlBtKGA
 QcjLghoHJrm1VN7ezzt6nTQaxRX1rnTogZSGtCOuz8bAU+GHi8gZw7YTkEnNKzRfTMTj
 olyaBj9OjTK5ooBFlg7X9agPzQfFdBMb7obef8xN0XhFPB37pDP47qkLhUbz1NAys/SD
 4viYISvP+EEtn4TZ0Y5JGIxou/7X3xbhuN7iIrNqt/EQm4AxZJJvDizYR3nkVCHiywRn
 Z/zw==
X-Gm-Message-State: AGi0PuYI21xCDlWGR2k4LRI8xTBfZRgxyqqbzW+L4nZxYIDhLG0AMGYM
 CJL1Kw3yF+DVtKGSRKxHSvqKCrQaxEEFWw==
X-Google-Smtp-Source: APiQypIxXuy68LYVb5b9LIuiWWUYoYLIelQKkw1HVSjTQMDBlZ9WO7Kejr5q99TJd0HkfiBoPq29uQ==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr9434546wrs.191.1585922341212; 
 Fri, 03 Apr 2020 06:59:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/44] drm/ili9225: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:07 +0200
Message-Id: <20200403135828.2542770-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 David Lechner <david@lechnology.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

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
