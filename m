Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C033A424729
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8433F6EE45;
	Wed,  6 Oct 2021 19:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63FA6EE49
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:44 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 75so3418685pga.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Xg9zrUyKFMa3ddbem3zPmmRQ2IkXwWBatRdclbFjwA=;
 b=kvwXt6r49WGoKov+1kI1YQK6kLMveUPCoAiuryNLL6xUFBMjdpH1ukw3oV2k5sLg6I
 dHeQY2F+HemCVFPE3sVuz6U0zd+8VMt9aRLOKI0S7NmYBQQMlsfJxyNxP7XJ2wmmDZEW
 7MSIJ5B0mlWDqqFeK+H26hmoLDYHLgkSf6Ne8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Xg9zrUyKFMa3ddbem3zPmmRQ2IkXwWBatRdclbFjwA=;
 b=X1oWcbTAV9g8t6rOLmxxHaWWBOCb2E9sNKgaC1TeasKvLOs2RpI9CBh/Qh0WgKYi8o
 99utVxnBbLqlki8cGt0bmyQJry89kuMY9e6qCzFv9pmIesv3EK8Bj7TUY/ugX16pYbMc
 T+OQOJZ1+c8Dh5D3jFWaWair4esLqvlPNXga0RVXBv2Qy/xbI4GodWI4OjBZn3HRs/dR
 vnST9XwaNx0dpUD9ed0TeBcGYBxV6SottBMBbxDMs44DtL21bxK/k6NxdA+Bk6oPCRJJ
 GcJMnscarDXi5hhv0hPOseJI0eLPVQMRVG4d+2yXutzOXIxPw3Z1l4oA/EBB18/+R5rN
 EBGA==
X-Gm-Message-State: AOAM530a/Xs91/x+76ctZ1r9Gwv0TrCOOAfn0XlrW0sdnS8XGpYyc/pG
 VECzvpDxYy9DRLKyN9N5uuJ4Kg==
X-Google-Smtp-Source: ABdhPJzVkIe0DAPOcORreiyVWMRdY6kKLr2qmge4E5lIHIpmMVTq5jsGVxJU0ygld5tw2RtEtmUK1g==
X-Received: by 2002:a05:6a00:216f:b0:44b:6212:4967 with SMTP id
 r15-20020a056a00216f00b0044b62124967mr39153114pff.23.1633549123847; 
 Wed, 06 Oct 2021 12:38:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:43 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 18/34] drm/meson: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:38:03 -0700
Message-Id: <20211006193819.2654854-19-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bc0d60df04ae..109fb9d057e3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -357,13 +357,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int meson_drv_bind(struct device *dev)
+static int meson_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return meson_drv_bind_master(dev, true);
 }
 
-static void meson_drv_unbind(struct device *dev)
+static void meson_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct meson_drm *priv = dev_get_drvdata(dev);
 	struct drm_device *drm = priv->drm;
 
@@ -387,9 +390,13 @@ static void meson_drv_unbind(struct device *dev)
 	}
 }
 
-static const struct component_master_ops meson_drv_master_ops = {
-	.bind	= meson_drv_bind,
-	.unbind	= meson_drv_unbind,
+static struct aggregate_driver meson_aggregate_drv = {
+	.probe	= meson_drv_bind,
+	.remove	= meson_drv_unbind,
+	.driver = {
+		.name = "meson_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
@@ -503,9 +510,7 @@ static int meson_drv_probe(struct platform_device *pdev)
 	if (count) {
 		dev_info(&pdev->dev, "Queued %d outputs on vpu\n", count);
 
-		return component_master_add_with_match(&pdev->dev,
-						       &meson_drv_master_ops,
-						       match);
+		return component_aggregate_register(&pdev->dev, &meson_aggregate_drv, match);
 	}
 
 	/* If no output endpoints were available, simply bail out */
-- 
https://chromeos.dev

