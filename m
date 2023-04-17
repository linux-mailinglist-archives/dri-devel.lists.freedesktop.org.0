Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1336E5177
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA610E5CD;
	Mon, 17 Apr 2023 20:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48410E5CC;
 Mon, 17 Apr 2023 20:12:26 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 cm18-20020a17090afa1200b0024713adf69dso15176867pjb.3; 
 Mon, 17 Apr 2023 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681762345; x=1684354345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGGeQ34qFmH3qFSmAUdD5AsG5Jqn1gFFjidxM1csPmQ=;
 b=WP1cGmhDXEaM2XoZQjksyWZjyjJ8/dPdSZFCLLz/R19MHv4d8SYoajJ3n7KJGGRP2d
 QfL8ZCHeiRUBptfALCwXRF34t1z07YYlkovBk2/hsT8PJckcxJI+ZsBCXsg2pi9LvC1d
 rggmvYF4ju/BUSXm2VA+2JY6fVH8vgjnf0fz97JefdsnlbPsqu6gE2y7kSOZ9r2ZtnIy
 ygjwVBziEtNITmZ5gllCzuvyKpWojJLQwxnRhV3/072eKrNSg/4TfPqqi8S3Wpt3IGlm
 aGZiitnwhALRhD1nKBOWbwppjuXsprBAvS5mBlN4oYjef76qBN+AMd4pN7SrTzRzxWlF
 oqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762345; x=1684354345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGGeQ34qFmH3qFSmAUdD5AsG5Jqn1gFFjidxM1csPmQ=;
 b=FQ/Q+QysJ3FOVOjvhTccIBovTNxerOvRdvkKcyx1W7oAzZ+iFlXgMkxdtAYypXbAJM
 EV5sBbPRTAUhub/aUNMB1pBm44/SCdbqaDDZ0GFc3dpp+WzxCjL2buQtgEKlhWIOv/A5
 hdDAxOjhLufaQi9nuHvbSuY079F5dKs7Z+BDzFP2WcNVNcsvj0J8FZDllwiEzw1cd9NC
 X+ik9lW8LcO2Dftb/bF8jef2W8MMUtrRTTCCK5fSo6JigenYFjPl6gm+V4jWOn6FTPZG
 T36cDsLKsimCNLu/9lDKmwIz1VymJFJyVNUwJWwDi4SNY5CnA++o+f7dghrfVmqjpFLI
 1KCw==
X-Gm-Message-State: AAQBX9cMxDqDv4/37CBvns67bCdYFJ+m0BO4NjgmWEGUaZff1hBRgrgp
 /G6Cu93dSpPbV74vNrajAK0GjpUOMcE=
X-Google-Smtp-Source: AKy350apR+UW6/r809TtL7zmvsClieP2I6EjDtF1IFJX/9UC+3g2jKbrC6+C4/pk1uCM3wzNBU0ZUQ==
X-Received: by 2002:a17:902:bc4b:b0:1a6:6a7c:9fde with SMTP id
 t11-20020a170902bc4b00b001a66a7c9fdemr140605plz.14.1681762345291; 
 Mon, 17 Apr 2023 13:12:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a17090aaf9800b0023d0c2f39f2sm9118078pjq.19.2023.04.17.13.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:12:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 3/3] drm/msm: Add comm/cmdline fields
Date: Mon, 17 Apr 2023 13:12:12 -0700
Message-Id: <20230417201215.448099-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417201215.448099-1-robdclark@gmail.com>
References: <20230417201215.448099-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Sean Paul <sean@poorly.run>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Normally this would be the same information that can be obtained in
other ways.  But in some cases the process opening the drm fd is merely
a sort of proxy for the actual process using the GPU.  This is the case
for guest VM processes using the GPU via virglrenderer, in which case
the msm native-context renderer in virglrenderer overrides the comm/
cmdline to be the guest process's values.

Exposing this via fdinfo allows tools like gputop to show something more
meaningful than just a bunch of "pcivirtio-gpu" users.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst |  8 ++++++++
 drivers/gpu/drm/msm/msm_gpu.c         | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 8e00d53231e0..bc90bed455e3 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -148,6 +148,14 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
+- drm-comm: <valstr>
+
+Returns the clients executable path.
+
+- drm-cmdline: <valstr>
+
+Returns the clients cmdline.
+
 Implementation Details
 ======================
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index f0f4f845c32d..1150dcbf28aa 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -148,12 +148,26 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
+static void get_comm_cmdline(struct msm_file_private *ctx, char **comm, char **cmd);
+
 void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p)
 {
+	char *comm, *cmdline;
+
+	get_comm_cmdline(ctx, &comm, &cmdline);
+
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
 	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
 	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
+
+	if (comm)
+		drm_printf(p, "drm-comm:\t%s\n", comm);
+	if (cmdline)
+		drm_printf(p, "drm-cmdline:\t%s\n", cmdline);
+
+	kfree(comm);
+	kfree(cmdline);
 }
 
 int msm_gpu_hw_init(struct msm_gpu *gpu)
-- 
2.39.2

