Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F70466C78
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88536FC5C;
	Thu,  2 Dec 2021 22:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E36FC55
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:52 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so3646246pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0P0B2t7jpcQb6RReBEhUJcwiQBX6wggU1M1usRBo/kI=;
 b=MJAsiBHpO2q/hsdSciuVFwOT83PxpG9KpLTTD6y0Jx+32jDfUTd5R+reXnN94kI7HS
 GgGdo4Mh4lZoXjrW/jAhRMOM4ufPOdIVKUiioIwtOhV78I9fsMuFVoRq2DG3CtFH2zh0
 FkzOE9NnxFQxGfNLVwIhT2jCD7yS3hFy2CGxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0P0B2t7jpcQb6RReBEhUJcwiQBX6wggU1M1usRBo/kI=;
 b=euuRIqnoYhjBY6V98RCGxJYV4L/3TMfrjUMnCFGi/hk69Nj5YuUzEwAY4V5Jx4WyPZ
 I1Wiop9UZ5TkTaASptNudKkdPUqX21fhUrABng6B6eUex21w/SFTeCykhctVSxM2Wvpb
 N9ZBJJHxaBFmYhLPLcTHx4EiO9SS+iqGv+Y0L9vGRHy28NCQ5KVXmjLFeT+xkz0Ej4yZ
 BzYgnLAZe9AAi0VqWoI3VpMLdfHtKMXlaxEsyttVB2/xzdNfiMeeU0Va29+j2OFceoIm
 A4owR7llE7+DA93STzZx6MPl5tVI1a2/thx5CbOCDn8IP8LWu3faB755bGkXRcq2mQTK
 cXHg==
X-Gm-Message-State: AOAM533FzbqBz3826fPJdYEoFeUqoFCep/HL0FRyZFqoi5dNGDEZEkxg
 j2Du1rpDJi2lG1RRzq1joLifeQ==
X-Google-Smtp-Source: ABdhPJzRLHHfwflAzf8KYyKYQgwlkeL0VlCcI9nc3Zp0HIXLhrAJVU/FYievGfLqo9GNTzZdkvDo5Q==
X-Received: by 2002:a17:902:c7c2:b0:143:bdf7:1670 with SMTP id
 r2-20020a170902c7c200b00143bdf71670mr18130203pla.61.1638484072251; 
 Thu, 02 Dec 2021 14:27:52 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:51 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 19/34] drm/meson: Migrate to aggregate driver
Date: Thu,  2 Dec 2021 14:27:17 -0800
Message-Id: <20211202222732.2453851-20-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
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
index 7f41a33592c8..3028f2a45f66 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -356,13 +356,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
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
 
@@ -386,9 +389,13 @@ static void meson_drv_unbind(struct device *dev)
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
@@ -502,9 +509,7 @@ static int meson_drv_probe(struct platform_device *pdev)
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

