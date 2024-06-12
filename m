Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6243C905E66
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332A710E930;
	Wed, 12 Jun 2024 22:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fzaSwGOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D356E10E92C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:46 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2c3050f4c50so268347a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231085; x=1718835885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoxHQFAxTEKhFcdkzLVS9yQebfe3JVmywDzGyzZKvTc=;
 b=fzaSwGOGlkozl+Ld+4V9RyVoCs4QZvhYEB6lC0KPbRND4CUPW8627crr5aw0QzvzvO
 ohrDlYqKXDXwTTeiIC07K8jP6OP/mULkyYp2j5KYq0JDjvmPI1WGB09DnMzliQO5pSFj
 M/QZ6/osePnKf8NiRMiz1GyWUsgjTrRJu5MAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231085; x=1718835885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoxHQFAxTEKhFcdkzLVS9yQebfe3JVmywDzGyzZKvTc=;
 b=cD8o19BSWaj8osIqP3UZ3xEzEayDZkXmbgtTbpV4AGDbGFEq6T2Yxeesp04baUYevx
 hfs0YG5F5iVymk6b3aNDdimOKFlll5lA1gqDDbF264MwQgUiFnGtrutBQ7XA+CF9JKbW
 5Ig6P30N8M6Xua39SWoxv1D2zxMOGOU2y1Ch7oNDdfXuPnc1e2Ak9NXeDrMl3IxNdj2b
 jytKLsnPQT+kc+fhjikIiX+htPPJ2R7J7YiS1ylV9zqVXWzoovR8fEvUGgkBwd74YOMW
 fAdBOwqXbkXt1k8IpMzsHnR5gn7klV4l/LXcvBV07V1vz0yn/2szV7IAkQoV5AjQz0E6
 bTzA==
X-Gm-Message-State: AOJu0Yx+n10uhH7rTSuT3l7UDfqBEcfEppzOdJIxG3pUDPHf1l/CeE3f
 t0k7VUL05XCrbVNE6StQwcWeyjko4LH2TojmjKyytaBD5ev7ZACa7CI3ozqLbyvbxrnRXbgweEs
 =
X-Google-Smtp-Source: AGHT+IGoKR+i8ngPgUDnHIH0M19hh39IIq/3uUrBXIU2bl3u/ZzKf7epk3yumtBMdDz0FOKiHNHMNA==
X-Received: by 2002:a17:90b:17ce:b0:2c4:aa69:c4bc with SMTP id
 98e67ed59e1d1-2c4aa69c57bmr2820224a91.19.1718231085222; 
 Wed, 12 Jun 2024 15:24:45 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Edmund Dea <edmund.j.dea@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] drm/kmb: Call drm_atomic_helper_shutdown() at shutdown
 time
Date: Wed, 12 Jun 2024 15:23:41 -0700
Message-ID: <20240612152336.v2.1.I20cb02bafa7c2368e4bd579df0716eb62a3a21bf@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
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
index 169b83987ce2..73d82b4d33e7 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -475,6 +475,11 @@ static void kmb_remove(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 }
 
+static void kmb_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static int kmb_probe(struct platform_device *pdev)
 {
 	struct device *dev = get_device(&pdev->dev);
@@ -621,6 +626,7 @@ static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 static struct platform_driver kmb_platform_driver = {
 	.probe = kmb_probe,
 	.remove_new = kmb_remove,
+	.shutdown = kmb_shutdown,
 	.driver = {
 		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
-- 
2.45.2.505.gda0bf45e8d-goog

