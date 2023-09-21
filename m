Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434607A9D15
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7B10E5F0;
	Thu, 21 Sep 2023 19:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC110E5F3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so11209995ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324500; x=1695929300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhxODKU/1KHUMb12P9tKCTdkzqsk+8BNlEjNG+/jd3Y=;
 b=EWohkUNdUOCnAEBo3vWGpbWQ7/o4zLYvSaC+5vwuql7qE5jhtUqzrnrszdsaKxkwYa
 6m/dbXIe7L/7/Csg9r4QI3dV2++o/fjgoMArIUb7YPnviX78bUCCd3cadT2f5O/5jwU2
 LJhkuajAiqdQLRWILftqCnzPdGMq2R/M/xoJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324500; x=1695929300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhxODKU/1KHUMb12P9tKCTdkzqsk+8BNlEjNG+/jd3Y=;
 b=F4EyA4DfjOBfh0JCNAhszDdfoRC4cHhHqZKTLH5O8U4C05A7RvZne/riK3On52b9/j
 iuNbc2bXVUT5BtObuj2aQXN0RzcxHaDR0wjZ055suA54gL+A/w/UxIfidJvbeBCxkJs7
 7WmyDOvPPMpcB4YZY8b2q/tOBBjH2ptm05i0n9xIffGbjHYckvDvBsaZ118o5O43b9Sw
 vFQ1GF1dmeO+F//trikLSFENH5Geue52+tqqGPe6kmrNHpZQXn37scOL4BFZV2gJmMfw
 v3Js5phGBujOCOW/2VNd7XboiFvdRkURbq07L6dC4VWyWiUSwJUquftYArBw1psMa9hT
 9bvw==
X-Gm-Message-State: AOJu0YzIdlNvKBEW0VVHy4lsFKzmibTaWtGoy+NOI0azYX5V+IOQrZK8
 P2L0ytYfr0h8o5ENl4DsAtVHABVbBq/REjWVOQ7/SNjg
X-Google-Smtp-Source: AGHT+IHUQlNIbJeLrvAj7jWESgKPAFex7wB5VnwlWGMQsi3fiVSh6nFpJjIAzbg6QtOMH1SG8wCkdQ==
X-Received: by 2002:a17:902:6ac8:b0:1bb:1523:b311 with SMTP id
 i8-20020a1709026ac800b001bb1523b311mr5075598plt.41.1695324500459; 
 Thu, 21 Sep 2023 12:28:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 02/12] drm/kmb: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Thu, 21 Sep 2023 12:26:45 -0700
Message-ID: <20230921122641.RFT.v2.2.I20cb02bafa7c2368e4bd579df0716eb62a3a21bf@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: edmund.j.dea@intel.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, anitha.chrisanthus@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

 drivers/gpu/drm/kmb/kmb_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 24035b53441c..af9bd34fefc0 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -476,6 +476,11 @@ static int kmb_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void kmb_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static int kmb_probe(struct platform_device *pdev)
 {
 	struct device *dev = get_device(&pdev->dev);
@@ -622,6 +627,7 @@ static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 static struct platform_driver kmb_platform_driver = {
 	.probe = kmb_probe,
 	.remove = kmb_remove,
+	.shutdown = kmb_shutdown,
 	.driver = {
 		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
-- 
2.42.0.515.g380fc7ccd1-goog

