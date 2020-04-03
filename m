Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3819D82F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4FA6EBAE;
	Fri,  3 Apr 2020 13:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57376EBA8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h15so8633437wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4msz3tKkrDEGqLybdy93lzBjlopw8+NKPSPfgZ8Zsk=;
 b=EfpAbqIu66MPO4j1xOXnHVNU6XFABR3EuijobKLUbSn4n/pOyaUDguxqq5DXjP9L9T
 ojI5ssJMfk79sumVSsQJqUO07UVn2GAMpFsk4pOXmVNnxk8n3mcYMw9Gd9HvieI/WBwl
 7Vu0eAK40NG/Mpeii+eGaQKOlQGcRNJCOHmMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4msz3tKkrDEGqLybdy93lzBjlopw8+NKPSPfgZ8Zsk=;
 b=P8HIA3zosN2mruEm2IwZgZkV7r/CYqhGXBF1rfOTaMEoutgMYGc3DxIxUP26RnTy81
 GG7QJ/gbf4uwWhU0UpR0ZcaTSl+6fqJsh/mikfvXfvakmCaLXWcNK3sth4cBeoi1zMc5
 Vy1obMFRaT2qOry+WdE0W+5UJ6pBbsH21D3+FY1ZrC5visQLJE7utmR+7ru0NHH38lJN
 /4xNkZEXk8s/+e7lP4Sg46w1ov+5XrD71FtZ1NDkREYp/nuyqNaT0GaSj1kgEHDffh2i
 1mwwgOstEWl55FcINYBMklKxnXnd8ARJfZ2ZprxZOqf6T1yXhgBlbxT7IAQNCRM1ztUI
 q/rQ==
X-Gm-Message-State: AGi0PuYnJ2ZylRVktSpIe5g1bP9tikMSOJUj15JDu39xXhcQI0hPui3I
 LPvccjdOhkqZ45/f4a/7srx1nQANiWPJtg==
X-Google-Smtp-Source: APiQypJ2MYihOCbMHowO8ncB6RqV0zBxufqfJr2ir3uWsasB14/dYTBTGv/nPBCCAs/HwpWwSUt0PA==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr9816601wrb.38.1585922328249; 
 Fri, 03 Apr 2020 06:58:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/44] drm/v3d: Don't set drm_device->dev_private
Date: Fri,  3 Apr 2020 15:57:55 +0200
Message-Id: <20200403135828.2542770-12-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And switch the helper over to container_of, which is a bunch faster
than chasing a pointer. Plus allows gcc to see through this maze.

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
