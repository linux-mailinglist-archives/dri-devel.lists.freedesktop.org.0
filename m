Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2877A9D1E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB110E5F1;
	Thu, 21 Sep 2023 19:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9C210E5F9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:31 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-690bc3f82a7so1285151b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324510; x=1695929310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjE+v7+9YV8M91Wchnv2I6StT/F66BSqTQ0jlAjsGeo=;
 b=PxPtm23I2KXI8mTNMWlE8PxOyOl5b343WNWZQ/98T4tFTI1dlljrcs4cSNfFXCRabw
 16GCijb01FNsPu5PcLbB7ke1VdBJGqJZuarz2sR+UarDZl24IEGYOzYWDzAoOzSJz6qx
 Q4nrMCu8HTxFHLfxuB8JFnxV/zD1C+0dmuQoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324510; x=1695929310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjE+v7+9YV8M91Wchnv2I6StT/F66BSqTQ0jlAjsGeo=;
 b=ba0MGP6NBmYHJxjTTdJ9B2U02bRw2IBv6giBrGicPqax+B5q7/17quMUns6bkK7otp
 6ijv92J0HUPD01LJTFB8kRa+ZtaJgLECPcJvLeKBatRYeKDE9O3ahnFUFHvrIrWfsTBJ
 TMwjfLZxNZ61s29wxJO14bu4mbp7UVkchHWDoNVe+8gmgushk3mhPE/HLhfslU0s/o4U
 r8lRqIaVngZFQJ+kBodLvF/hPS0xKDm9LKNQe54ajtsZnZXDHqHqElkhDVljIzeWYjDO
 UsK5VMva31I9xF0W8WUD0HrqJ+Atw01LlqIml22SuYavg0SQLVb9N0A0kZZdgn+ihMz+
 4seQ==
X-Gm-Message-State: AOJu0YxppHZgBmsHzSnsK4qGGW9DLAPG4AWdS3t9lN/dalBPLTZaf6FK
 wR6uGc5qEIHJdgSN/MlJkkmH7k7WG9ydjWIcuyoE6Kwj
X-Google-Smtp-Source: AGHT+IE+we6oLujL1MkhnRpx7DOVM1KJZ/SsmSrAejYsuJZcNIFP8yRibQZNs1+sdIdQDwROK48mpw==
X-Received: by 2002:a05:6a20:840d:b0:154:6480:83b4 with SMTP id
 c13-20020a056a20840d00b00154648083b4mr7513077pzd.14.1695324509805; 
 Thu, 21 Sep 2023 12:28:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 05/12] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Thu, 21 Sep 2023 12:26:48 -0700
Message-ID: <20230921122641.RFT.v2.5.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
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
Cc: mperttunen@nvidia.com, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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
index ff36171c8fb7..ce2d4153f7bd 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1312,6 +1312,11 @@ static int host1x_drm_remove(struct host1x_device *dev)
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
@@ -1380,6 +1385,7 @@ static struct host1x_driver host1x_drm_driver = {
 	},
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
+	.shutdown = host1x_drm_shutdown,
 	.subdevs = host1x_drm_subdevs,
 };
 
-- 
2.42.0.515.g380fc7ccd1-goog

