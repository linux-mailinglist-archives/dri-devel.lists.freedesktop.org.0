Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A537A0B9B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD410E29A;
	Thu, 14 Sep 2023 17:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B77F10E29A;
 Thu, 14 Sep 2023 17:25:01 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so1135255b3a.1; 
 Thu, 14 Sep 2023 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694712300; x=1695317100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+79uOjNcwbPpa9/kVCOKluSz7c5JO5jNMvatVqMKNmk=;
 b=iXXqICIOQGAON7BvxrFUDnRo+xwA7hD5mgb5Ig7KnWbjyzgbhtjW4ekEBJuHb1Liv9
 nC32o7DfKzQmwyoKnJj3HChxArBWYi2GKSoXjHWqJdbAvO/kr0GOMxjJ3wEr9BFxDSCB
 YxfANIHhIRzkHvBt69xR09hw09Vp7BHf+VkZqgNqR+/APPcuTS7kOB2X0NMxKvYhwc3r
 vmE6/rPg54kJ6Ka1ieMsFHjkmLk8lyglss3r4F4A6SetbVVwU92Hm52NdYW7rWLns/bq
 LEKDWQDoLdnozatq+Mj2cEQAQhtW6ZxU/z8AYrxkZ9t8JSD26FDR7LnJmvq+qWL0TvOl
 1Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694712300; x=1695317100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+79uOjNcwbPpa9/kVCOKluSz7c5JO5jNMvatVqMKNmk=;
 b=tq5ojRW5NBdW+MEUp68dk99N52E6efRmM9o+GtyeNHn7WliIvGNVxMtFcQvgIQRX5t
 l8HZnkvnzPJWZFDFYjuWLeVYcsrze2rKy0JRrvPZTB9ZketzqtDXb3K8izV53jZRTqFD
 n53vBfAurH/8NxTgCuNk+IQAlusn6Bs7JkSXJABq/MwN580XNx+tktofZMUfQgDLW0sF
 xIukNH0sIQwA4hlXDlax0zbvOzo9gO23Vh2AzxVvZzZ1uJBW7zOd81ZnwjN1t8+lIa+f
 mJ5ULOqOit/1szuV3MscUhO9M6Kp62wMkmlNwSavhWRaFi9vRExQuZfCDlsqj5aWtl6G
 Q5Yw==
X-Gm-Message-State: AOJu0YyA2z9GS640rjXHgctrwcPQVLM8icu5pXeJTA0S1yQmr37lJBx/
 hqAO6Y4rYlhKNq3B2zO4HnvrqYT0j9oh+g==
X-Google-Smtp-Source: AGHT+IE4WagPU98qTyEPXPYSna4/oDNmZGqhDL/qk1IPm23B19BR2S/R2kqj0qHwqaw0dp9Ogt9YEw==
X-Received: by 2002:a05:6a21:998b:b0:13d:df16:cf29 with SMTP id
 ve11-20020a056a21998b00b0013ddf16cf29mr6980311pzb.15.1694712300117; 
 Thu, 14 Sep 2023 10:25:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 p22-20020aa78616000000b0068aca503b9fsm1587905pfn.114.2023.09.14.10.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 10:24:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/msm/rd: Check PT_PTRACED for cmdstream dumping
Date: Thu, 14 Sep 2023 10:24:53 -0700
Message-ID: <20230914172453.9707-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

So, when you want to get a cmdstream trace of some deqp or piglit test,
but you happen to be running it on the same laptop with full desktop
env, the current dump-everything firehose of `cat $debugfs/dri/n/rd` is
quite a bit too much.  Ptrace seemed kind of a natural way to control
it, ie. either run what you want to trace under gdb or hack in a
ptrace(PTRACE_TRACEME) call.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a908373cf34b..a105ca1f2102 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -979,7 +979,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
-	msm_rd_dump_submit(priv->rd, submit, NULL);
+	if (current->ptrace & PT_PTRACED)
+		msm_rd_dump_submit(priv->rd, submit, NULL);
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-- 
2.41.0

