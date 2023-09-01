Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F9790423
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4D110E80A;
	Fri,  1 Sep 2023 23:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1510E7FC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:27 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68bed8de5b9so2141167b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611747; x=1694216547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTyJ24tKFqLRbG9l9nWJNLGooQV8nSVkH6ez/jxbol4=;
 b=Qtt9S98Krg44gbPHSH3gHusLnvHS1tnTjdu/LtQkixlOWGhL+NDN2qkn0lbZYlNrna
 brhKAud6XtvstJ8R1+BahiNXmqKyHi+EBTCKWx8txzZdKMTqDO3XtoGiZnueNyb14DHY
 ebKwEujkD5EgxYvvqvIbm8TOCsE7oX6SNjF8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611747; x=1694216547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTyJ24tKFqLRbG9l9nWJNLGooQV8nSVkH6ez/jxbol4=;
 b=mHJCvt+7hLhpP7H7oHP+kWK9qB7ztt9Qsp/e6AtjYM+x6iiIMcAuosAE/1KdLOckcA
 rzTRp9Nu2hQ6xnlAFI5o7rZz0ubs56S+BNgieq9KvC3nq5wNkitAsrHpNWNnQokLtXCW
 53u+C4fYYQILdfKauaMsgh6GJucD/AYVRqGxLUHCSIMEomh7ByFt4L8xCiD2JLZ+pLWl
 19pX7xmfNsuaegIEkiNjgFyugfKQHhthVO0VXQmxEg0qQfAQwOpAyiZfmFxPnl3BOs86
 GIiWpQO/VzlcoXTwSLVblM4lvyEEikVyEp+diimhPdpaTufIxKpq53uNTC2ssIkkg38H
 n0SQ==
X-Gm-Message-State: AOJu0Yxua22Ec/lf1utxmzBx5WNVNe7oH+j92Q8CsbtkNkMqflGwvqBL
 wvusx7nIp5HUxERY8GlMz1fLFcHXKczDG3UclakbrHCA
X-Google-Smtp-Source: AGHT+IEdOoLZSYVgu/HM3/52v8vTtHyToRKvwsbcU9nHFrr/BHqKpV2ahyit9WDnLfZWVQbJOzkyGg==
X-Received: by 2002:a05:6a20:191:b0:149:73f9:332f with SMTP id
 17-20020a056a20019100b0014973f9332fmr3881021pzy.61.1693611746996; 
 Fri, 01 Sep 2023 16:42:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:12 -0700
Message-ID: <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
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
Cc: linux@armlinux.org.uk, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

This driver was fairly easy to update. The drm_device is stored in the
drvdata so we just have to make sure the drvdata is NULL whenever the
device is not bound. To make things simpler,
drm_atomic_helper_shutdown() has been modified to consider a NULL
drm_device as a noop in the patch ("drm/atomic-helper:
drm_atomic_helper_shutdown(NULL) should be a noop").

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/armada/armada_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index e8d2fe955909..fa1c67598706 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -148,6 +148,7 @@ static int armada_drm_bind(struct device *dev)
  err_kms:
 	drm_mode_config_cleanup(&priv->drm);
 	drm_mm_takedown(&priv->linear);
+	dev_set_drvdata(dev, NULL);
 	return ret;
 }
 
@@ -166,6 +167,7 @@ static void armada_drm_unbind(struct device *dev)
 
 	drm_mode_config_cleanup(&priv->drm);
 	drm_mm_takedown(&priv->linear);
+	dev_set_drvdata(dev, NULL);
 }
 
 static void armada_add_endpoints(struct device *dev,
@@ -230,6 +232,11 @@ static int armada_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void armada_drm_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct platform_device_id armada_drm_platform_ids[] = {
 	{
 		.name		= "armada-drm",
@@ -243,6 +250,7 @@ MODULE_DEVICE_TABLE(platform, armada_drm_platform_ids);
 static struct platform_driver armada_drm_platform_driver = {
 	.probe	= armada_drm_probe,
 	.remove	= armada_drm_remove,
+	.shutdown = armada_drm_shutdown,
 	.driver	= {
 		.name	= "armada-drm",
 	},
-- 
2.42.0.283.g2d96d420d3-goog

