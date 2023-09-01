Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12879042E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB1510E838;
	Fri,  1 Sep 2023 23:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF1310E838
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:48 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68bedc0c268so2192389b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611767; x=1694216567;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84GRgyYKdpTNARq0AeOvL2Otr8e52pcbhFdnubGKvgE=;
 b=JmUOq+4yh4WQ1c60CA1DJYAP6SQMYBTW4I5EE4pt/2I6oXzN22157l2NwKJmWAs4Sq
 abGTQiDISMIO8pCZA8CICbPxs7RsEVHDr06dwT2noBPzkKyXoa9ucrmcJKfV9Mix+4nq
 YdQgOUwQG9aLaH+x19xwqz+U94xNGh1Lj0S20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611767; x=1694216567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84GRgyYKdpTNARq0AeOvL2Otr8e52pcbhFdnubGKvgE=;
 b=d7zEHQLLYQfs5DE2FBkK4WnMtq7X76InRC2SA9kiwjll46FAIJg67dEDuYnry9L7zl
 bcnX24pmgBXXZrYGO5lzqed0NqL0Q2ehcx8Ytzq9IXMvW6McBiVEAG7jV9O6lLYXNloU
 eY61q5gl9jpcD0DMrRHKLqr5nVu4zO8M5mx7tuid1vnKFmeEMrCrn+FP5ioTH9ave+OW
 y2VHN8IGtA1eoCMwgmnshwBLbEj+HZE+/PH9r5IGpIMW8HJiZAqfOH/iXg/02Kis33J4
 q50EFOcAF984p19qO7BNeoXA+RXxIVhIER3yDAFS9786nVrlnBMSNjwSE/PkBaN7Tsgg
 mc/g==
X-Gm-Message-State: AOJu0YyBmrPFxJJ6+OAcE8192QuUQsoycSwcNXb7GEHhRmDDcn8unPCQ
 8E/6CQHLm0T2AL4s3fDTTaCQfzNyEjQsG1ISn83RXIXH
X-Google-Smtp-Source: AGHT+IHMnRRZU1AoK52w/ETGomJDYboa0sUaaYzUFQVRras778aL93jg/RTp1bID3QpRqIrdbXtX8Q==
X-Received: by 2002:a05:6a20:54a7:b0:127:72c3:6427 with SMTP id
 i39-20020a056a2054a700b0012772c36427mr5163175pzk.2.1693611767663; 
 Fri, 01 Sep 2023 16:42:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 10/15] drm/sprd: Call drm_atomic_helper_shutdown() at
 remove time
Date: Fri,  1 Sep 2023 16:41:21 -0700
Message-ID: <20230901164111.RFT.10.I7a2dd349cb52bae53280d0a49e22cc27b923274b@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: rfoss@kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 tzimmermann@suse.de, sam@ravnborg.org, liviu.dudau@arm.com,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com, orsonzhai@gmail.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at remove time. Let's
add it.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS driver remove comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

While at it, let's also fix it so that if the driver's bind fails or
if a driver gets unbound that the drvdata gets set to NULL. This will
make sure we can't get confused during a later shutdown().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

While making this patch, I noticed that the bind() function of this
driver is using "devm". That's actually a bug. As per kernel docs [1]
"the lifetime of the aggregate driver does not align with any of the
underlying struct device instances. Therefore devm cannot be used and
all resources acquired or allocated in this callback must be
explicitly released in the unbind callback". Fixing that is outside
the scope of this commit.

[1] https://docs.kernel.org/driver-api/component.html

 drivers/gpu/drm/sprd/sprd_drm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index 0aa39156f2fa..86a175116140 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -114,6 +114,7 @@ static int sprd_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -122,10 +123,11 @@ static void sprd_drm_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
-
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops drm_component_ops = {
-- 
2.42.0.283.g2d96d420d3-goog

