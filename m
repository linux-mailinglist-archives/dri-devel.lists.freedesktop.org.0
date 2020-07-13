Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F521E973
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8A96E93A;
	Tue, 14 Jul 2020 07:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76F6E82B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:15 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id z63so13913331qkb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=New9UmLqwAEZ7YVR5w884jDB8P12ia0wbeaOMNqWR50=;
 b=NpuYUeVRDRTXdO3EHACL8xTWzqkqyTLGgKUmKInSBZrQyCqqJxUjcm46yIpObgFD8w
 1olATxpFlcAKhNuAPT1AHSDrCKmwE+Su5hN0RxTEZi4t4B071EJ8SmzUh0MWWMs5Qeah
 LWTPs9g/luhs3MFYiGywu8ulMJ3YwLmvRjaNOg7LZcaKWlGWI0vc8V/zNlEN5azBTuKf
 uOUzltcAp8/mjJJRH+GZJwVbWQX/aiezLPb2crOxf3XUJHkeEKiOfuQbF80SRs2xZAgV
 Kw98JuN6XjH8izK2N/qpTN8/y7PsaDEyfmZnx2y9g2dsPZ6WT+DLZo8LDwaAtIbOvDVq
 mg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=New9UmLqwAEZ7YVR5w884jDB8P12ia0wbeaOMNqWR50=;
 b=ro7BO7/c4AFlVVB0kbLe5Hid32WVbk0WEd11+oTtxezj3iGonEy7AS5g263voybuK2
 p7ziD5TPBWTsFpOtrfz9eAK8OsjOJNpVoXJD4cSYiaVzgY46jb5peJXog4a+whYqKee2
 9pmTcGQ2n+BKKoj1PT1L8pyvJsz+f3Hly9qXVp5Aid5xkLx30Y9sZYs+f2lXknmWH1e1
 ch/mtmiTVhHQJhLwk5gvgHI+F6wd83lwlrCGN42ZTW6sDHgkS8l9yGb0eAhJT8yn8fTQ
 TbjOR40fw+qsnDCkpPPlPOZUW0y95H/R+kuV7qo5eI9OVoSQ5ZJU+LQUXz5Drv/QPvBR
 NH1A==
X-Gm-Message-State: AOAM530DDpsQDip8+jfhbhov5PBelxqx9BlvraSW3eWIb2yCRgJZc+0s
 sxbNyKFSBdKRDg0Ue9fRp8NVuqTEzMhCcA==
X-Google-Smtp-Source: ABdhPJwPhMQAQGKtHB2AxxPSDzaZIttG7vUs6x4x2pNtdoh23c7sQy9Cmx61GQ6sVuYVowXuaGif5A==
X-Received: by 2002:a05:620a:1649:: with SMTP id
 c9mr1886192qko.330.1594680914570; 
 Mon, 13 Jul 2020 15:55:14 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:14 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/msm: fix unbalanced pm_runtime_enable in
 adreno_gpu_{init, cleanup}
Date: Mon, 13 Jul 2020 18:53:40 -0400
Message-Id: <20200713225345.20556-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adreno_gpu_init calls pm_runtime_enable, so adreno_gpu_cleanup needs to
call pm_runtime_disable.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..ad64d4b7e8d7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1021,11 +1021,14 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
+	pm_runtime_disable(&priv->gpu_pdev->dev);
+
 	icc_put(gpu->icc_path);
 	icc_put(gpu->ocmem_icc_path);
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
