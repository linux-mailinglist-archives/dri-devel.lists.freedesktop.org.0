Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA597A9D24
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F5B10E5FE;
	Thu, 21 Sep 2023 19:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD8610E5FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:40 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-578d0d94986so937956a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324519; x=1695929319;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLjLrmqx+liQMxms0HfuoarLoIvQ77Y5EZxHJFXGDMo=;
 b=ifiEcVYMaj/3OKh3nYyc1Ja61p89ozZ+gh44KwYfGj0fi6U/gi6zHyVl2qkfBteM8z
 sbPHFoTJ49T01UTyfDN1VLkGgXdRTKHBY92tNqqld8lWt6Bnd52szgb6HinH3p1eAA+z
 j3Te0dsOvw1kCa91baIutbWucOJ1YfEVtL8tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324519; x=1695929319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pLjLrmqx+liQMxms0HfuoarLoIvQ77Y5EZxHJFXGDMo=;
 b=jN63v/FffSDy1mtwFRM4/gA5z6YjPxStV0aVx+7dny8Lewit5jXqEon+llFflux3p+
 g65O3iaKldot/uS+M7uvrBYCHKwFX+ne7JuBkWg7dhPJdGtSfbU3+vjr29m3+1bE5pIa
 sOjSzk97CjxE+pkly0/9jlTlj7vDUrUo1nyr2nOOeEyva64AguX8PTZtbHzS8wH7Ym2q
 WgVwCpXtRBCuOxQaTjCQRpdgaIyniFI9TyabShrpgajGRcMrSdN5+JiU7LcezdIktg9l
 LpIEOBKJHffNcv61tAUhPB/jrLShK6y9beCyfpDO5dij4tLrPYTZm+5e6Zg/jAOc/mtd
 Nbgw==
X-Gm-Message-State: AOJu0Yw338dxyoBm5HMfL9+mR5uX3wUdPxTcqFs3mNhThGWUDd55+ubV
 FN9Gtjzw+ppv9/O1+LF6dzszbsu+PPEjP2FJvQhHfwAj
X-Google-Smtp-Source: AGHT+IEoRL+LQQb5QJ020x/RBTSHvfniX1vz+zMVAHt3qEaz0AKEABZX30JR3ZV4ZtsBNVQhvE+uKA==
X-Received: by 2002:a05:6a20:324c:b0:148:6063:3273 with SMTP id
 hm12-20020a056a20324c00b0014860633273mr5419552pzc.29.1695324518923; 
 Thu, 21 Sep 2023 12:28:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 08/12] drm/sprd: Call drm_atomic_helper_shutdown() at
 remove time
Date: Thu, 21 Sep 2023 12:26:51 -0700
Message-ID: <20230921122641.RFT.v2.8.I7a2dd349cb52bae53280d0a49e22cc27b923274b@changeid>
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
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, tzimmermann@suse.de,
 sam@ravnborg.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

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
2.42.0.515.g380fc7ccd1-goog

