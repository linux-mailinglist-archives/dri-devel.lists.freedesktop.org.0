Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216D79042A
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20F710E827;
	Fri,  1 Sep 2023 23:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1410E827
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:42 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68c576d35feso2161350b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611761; x=1694216561;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQWyzi0Qz9s7AgC5vmSBsF4S5izX7bpWF4dQoTwwlFk=;
 b=AUyrjEs6TDzOEUOlzoige4WYt6Iy+oboVRvzEprSvTyzu+275E8gxrHbw/vuHqDihI
 nhO4SJ1RctODFQLud9rjIj9UZK8cLvAmF4fefTv+haFgRWec+ss5l425jP1Hu4uSBHSo
 R1GQkLebU6VCKkt+Gtwv7wL/60jxr95BhB7GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611761; x=1694216561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQWyzi0Qz9s7AgC5vmSBsF4S5izX7bpWF4dQoTwwlFk=;
 b=Z5Cl4zNt29pg+3+5HuX+28GGhaGlXGcqqb3E112VDsZv+JqRJ4AoMsimjoNtAzjw+J
 TMPfyNpRDtXPIx29+XSzxsXyUkhMCe2Uc0IdCEZoXMRQCw3c8Zks7V05xB07G2olv56f
 2Pe5yW3lUVBCLOAnIqkoxatpp2bNH/6eeSd6VPYmmdkEFpPjxVFLCOfbbeWMFcHH9Vft
 QDlAlgDl500XR0a02iIxREnPyQap/1255XxgaM84YUvJFkWXyr2N91yq44kG36e/Cw2Y
 QlJi0XYne6wURyKa1LzuAlp7+LrFS51fbPo3Da2D/yLiMjQiJRCjRLl+WaV4JQoebdQq
 hB/g==
X-Gm-Message-State: AOJu0YxlnHY9AQtLsSKqdnr+LFjwQoUarVULuo/MZGf/pZvBTy9qe6z8
 r+buk3RCdpQudlS438GqBbD1+GI+E22KTXd+b3Km/U2Y
X-Google-Smtp-Source: AGHT+IF5BMwzbAVcMICDe8gM+PDdxCL3nr7AkrZf9oUjU4217SZ+nxlT0MJiiAfrSttf6dGmLwxm3Q==
X-Received: by 2002:a05:6a20:9144:b0:135:110c:c6de with SMTP id
 x4-20020a056a20914400b00135110cc6demr5402182pzc.6.1693611761326; 
 Fri, 01 Sep 2023 16:42:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 07/15] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:18 -0700
Message-ID: <20230901164111.RFT.7.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

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
2.42.0.283.g2d96d420d3-goog

