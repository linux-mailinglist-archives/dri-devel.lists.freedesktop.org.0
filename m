Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D91641CD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1126EB8B;
	Wed, 19 Feb 2020 10:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2185A6EB67
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e8so5032307wrm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Bml+TgDz4wJQmY4Y0AO2RIjQQM/6g6ZVi6uO1lLgNg=;
 b=ir3v3wajtlCr4ILbn3QkFY7+TQrLgFx5ZRWnKzIRCOzBcBy0cWrnSuvsyR7UMSzfNo
 WPyiyRY5rHw3+mA5WrhwF0SB3GFy8c38ZVz9qVfe3bIB6ir1dk//KmkDAjMJGJ79MmiU
 UnymP+61UPdw9TisDpey+V6p+jNzbxRVfP4P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Bml+TgDz4wJQmY4Y0AO2RIjQQM/6g6ZVi6uO1lLgNg=;
 b=R7lbxTk+haUXgQ2rRZE7AWG72A3C9myfknsvtAmU+gUG48aZfiP6efK2E/o/Fi4DGH
 Y0RqsjqaYcbQzdiQ7+FilAaS71lYD39HYROIinp3P+ajsGJB3QXX1ChIW+oUtnEddtY0
 3mByaE14Vk3nEE2ZTf6HWXSCbkiyiETf0r3udAyQTNNjJywzrbfByQRFzYBc7G075apz
 PTU6CFbCCoF5+5BjuI/5ArPDaQunRCK3GqP+elBnywcra04Ivhpt8ZpuNC4/1W8AC0uo
 o+ESepXyWJ7d0fgmSgmbtWup2TdJTRJekLzohCNS5LarhNITkwTdKsPp/ARGSPTlyzgb
 LwNA==
X-Gm-Message-State: APjAAAXz0AHH3pTbgHoq+m43LQ/NJ4ou/H8xypGLpO3xs5CkujnN4lQO
 TmYKc/bh0rNNLu8xLZjasrox0deMYwA=
X-Google-Smtp-Source: APXvYqyFLn/iv1hus4X3HQJntx7j4Ea6eI8toIqgHSqju1nZFaJhtuHG7/Wo/6j5JXhJDOzdm+HWfg==
X-Received: by 2002:adf:eec3:: with SMTP id a3mr33086987wrp.337.1582107735503; 
 Wed, 19 Feb 2020 02:22:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:14 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:07 +0100
Message-Id: <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 654e2dd08146..3e67cf70f040 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_dev_unregister(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fcfd916227d1..dcdc1580b511 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	unsigned int i;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
