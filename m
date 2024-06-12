Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55500905E6D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129F210E935;
	Wed, 12 Jun 2024 22:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ocwlUoYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1916910E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:53 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f44b594deeso3822095ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231092; x=1718835892;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zpmQn9g7cRN67S7SSaIwDQvRoODph3OOMStNp4IKliA=;
 b=ocwlUoYB6WdUqlX7qyvq1Im0h8Z3wYQ07vg5CuHn/NQ0AfHE6/1rcwcIJbtahWjJzH
 mHmKJYz71slINXbJU8XDvVjBZ5989PR4IzIBi3NmziqCxb2xzlJ04fw2r0PHkvzdlvdo
 kpanVBXA3A3lIzX7A3w4lEbsO98iSWNO3EZIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231092; x=1718835892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpmQn9g7cRN67S7SSaIwDQvRoODph3OOMStNp4IKliA=;
 b=lqc32YCAPZK5udWk32dd9+9148sgeF1i163DWlSv+lHL8HXMP9/0axmPEgBedlsIdd
 /qkF1+z7zuo6tJVXJU52eSXvTTCYBKc87O7DpLAFEhOpf4jiJDaMwE5NTBLqTZ4uylFY
 MLni17fPfSeFQmV5YhIvxUM64Kgz+zk9+iqvb4fOolt2yfteglxGCy+MQvaXql/Sbj9Y
 7RSIowctUMMwOwZURXx2Zn6SXxDlJdy98jzWJw0S9emu1iN+M1jfUH6EncKJglz4IDJo
 Jhg5l2O6f++Lu2Ca6cHbq24qR8nD77x6+mWoutB2HQayuKblm4dS/GDtES524Cwi2sbj
 iZEw==
X-Gm-Message-State: AOJu0YxmuFzIaKq+3HwR6nTKx+eMc9M94PfNOnuKVS38JaZ7e5Xh8ejM
 F1UdzpOwBXUpbZ40jt6xpLcHUIuO5fj4RXmolaa6fwl3cVTlvgc4jvEoOuqn9Omnj/5NDkgSwAU
 =
X-Google-Smtp-Source: AGHT+IEw5ujOqNAyOIoLP8KuspnMOnAtd7Hh5dDQKTX8TBm9/CzqJoj2TsY6aejmqFawCaR9pN4o7w==
X-Received: by 2002:a17:902:e750:b0:1f7:2a95:f2f8 with SMTP id
 d9443c01a7336-1f83b55e32cmr41999395ad.14.1718231091823; 
 Wed, 12 Jun 2024 15:24:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Wed, 12 Jun 2024 15:23:43 -0700
Message-ID: <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
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

 drivers/gpu/drm/tegra/drm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..d9f0728c3afd 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1330,6 +1330,11 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	return 0;
 }
 
+static void host1x_drm_shutdown(struct host1x_device *dev)
+{
+	drm_atomic_helper_shutdown(dev_get_drvdata(&dev->dev));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int host1x_drm_suspend(struct device *dev)
 {
@@ -1398,6 +1403,7 @@ static struct host1x_driver host1x_drm_driver = {
 	},
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
+	.shutdown = host1x_drm_shutdown,
 	.subdevs = host1x_drm_subdevs,
 };
 
-- 
2.45.2.505.gda0bf45e8d-goog

