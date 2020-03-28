Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591919674A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 17:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E096E126;
	Sat, 28 Mar 2020 16:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53A6E126
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 16:24:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h9so15447622wrc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pL8uWfiJYF1YmqwTh3ivt6YoZqoi/X1HSEs84exYYpg=;
 b=C3ccucXrAI/AxJWgheTxIMOhmAwC36qnObynEJ2ZE4TK1TCXUcikL1JOTxn0vhSp4z
 y6GmYp1Cm8p3NYxetLVJYCHtzXFdTx377T5zVrpR5GKfizqinVtAm9vmmMcJUIdkSA6E
 vJmZB61x1NL/QuF78X5IVcJDiDcQYoxNCn0OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pL8uWfiJYF1YmqwTh3ivt6YoZqoi/X1HSEs84exYYpg=;
 b=MyC2DNBrwhJSrBiC+CGdxWGmmYYk+MqNHhi/0lyZl2HnAKZmVtBw3MqzfdaOHoC4Tx
 xToVPoIQo75IKeEQejtOmJmn/uxYX1KsGblUFCq5wcA0kppAa22sEf2VibaZECM73Q6A
 tDdnO0LqwUBHndsYJGN7XUa1q7Z2BD7xKnP/oNRAg2V64LuQhNlhrTA9w4FwT2QccP2o
 TIvOemNaTDkFkPdYkNZaX+INOEnKE03k1kjgAHqQQXXCIyNRx/F8OzOrTpQTcTwfUZuX
 3cWzeRy4mzKM2+vpOu0SrTfA3nPXPodY0J7+0awaIxCKsRO8kxAYEIfRl1bcIeN8sMfk
 Nm+A==
X-Gm-Message-State: ANhLgQ0Ib6dUrCsKYlBp+6F6jDRKHaPislxcp9F3XsoZBXREfGeMf6R9
 Co2NhdB/NDDJIeXJv+KyHC70aS/Z0p/Bpg==
X-Google-Smtp-Source: ADFU+vsHV/onbw1iAE7Qii36fICcu6vwX3zZkPy1MbkVDum1GX8N0+Z0ENoT+fd7fp20e1GRJPcmoQ==
X-Received: by 2002:adf:f8ce:: with SMTP id f14mr2296258wrq.348.1585412644539; 
 Sat, 28 Mar 2020 09:24:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x1sm6439223wmj.24.2020.03.28.09.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 09:24:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/managed: Fix off-by-one in warning
Date: Sat, 28 Mar 2020 17:23:58 +0100
Message-Id: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm thinking this is the warning that fired in the 0day report, but I
can't double-check yet since 0day didn't upload its source tree
anywhere I can check. And all the drivers I can easily test don't use
drm_dev_alloc anymore ...

Also if I'm correct supreme amounts of bad luck because usually kslap
(for bigger structures) gives us something quite a bit bigger than
what we asked for.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_managed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4955241ceb4c..9cebfe370a65 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -139,8 +139,7 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
 {
 	WARN_ON(dev->managed.final_kfree);
 	WARN_ON(dev < (struct drm_device *) container);
-	WARN_ON(dev + 1 >=
-		(struct drm_device *) (container + ksize(container)));
+	WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
 	dev->managed.final_kfree = container;
 }
 EXPORT_SYMBOL(drmm_add_final_kfree);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
