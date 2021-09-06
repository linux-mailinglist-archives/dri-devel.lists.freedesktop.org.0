Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1E84016F1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5B08977A;
	Mon,  6 Sep 2021 07:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933EE89993;
 Mon,  6 Sep 2021 06:43:23 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e7so5802222pgk.2;
 Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXyxpFHBcEv4sS2t76pl1COPJ/sZoBUbznBcP7dl+HA=;
 b=MkDdoGqMO1Z/0vDuONb4VGQmsvo0dCFjgiEDcr1th+volaeMLn8sxOtZ4vT+W6VOlY
 CffRWTbYj0HVPbt+Ln3ZmYL76xand44xgy14yGo4WF2eJ1tePbv4Gl0/JKYBdP8JfzDR
 YP5gqO3TqRXhYN1EF8MZMA9MPCFng77f2vsAlsGJx8VyLNUWrkLAvj1iGAc4IJEKLpUU
 SF8Ci+J7/7K7YBNNGmyM5EDdnKSX7u7CfWws9HxkTqynULxhN76vgCz1Vm5QeVaHWYZe
 SOjgvW79VGAeKixTDof1cllWD2SfZ7uMkQsKiERvybuRaCt7MAk4RDhP16R1WlZ7mUcS
 mh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXyxpFHBcEv4sS2t76pl1COPJ/sZoBUbznBcP7dl+HA=;
 b=hdks+PtCY04yVhWPF90b3YQc3DXeHBnAWqKjmLXvfmySLuTHbQ9Y5rqKC/3iNpMgcZ
 ry3ipfVhv2sDmijTa6YVf11AFfaRnJGOHXx7GxSsfgL2L9iGREUV8ZyUoyZEVGeIOSvp
 aEF+AWKO7R/8pdGKdC1BUVoBW7V0ev18bKaJfkvWh/pqbrmmhAmHY6Z/oCBGtVfi34Fd
 pbWdKvRyZHCFwEoponhdGLtljxR98s8uXYJvXLo96ADrQrGZnvauKm+EXZWrsddkmS2L
 vz2qbJp8KIU9Br1eMLGiCUo8rhTxLMTLXBwO6WkF/vasPzvEC4nSHkXBc+eKGJ3bep4Y
 3kqA==
X-Gm-Message-State: AOAM533s2Z779gmUqSPZjDzoyzSynC0FBCejZuIiV0XwI0hw+vuUPuAI
 YMPnPkjMPdv2Fa8JEzuhK54=
X-Google-Smtp-Source: ABdhPJxhCgJQRi7jSe3tZ+uGXk2bms0XFN7UVu1YTeUOVP5h85afqBqXr6ZvBi2mT4wI1Cx6T4vkVw==
X-Received: by 2002:a63:da49:: with SMTP id l9mr10791109pgj.277.1630910603266; 
 Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
 by smtp.gmail.com with ESMTPSA id c124sm6615033pfc.216.2021.09.05.23.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
From: zhaoxiao <long870912@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhaoxiao <long870912@gmail.com>
Subject: [PATCH] drm/msm: Remove initialization of static variables
Date: Mon,  6 Sep 2021 14:43:15 +0800
Message-Id: <20210906064315.4975-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Sep 2021 07:26:40 +0000
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

Address the following checkpatch errors:
ERROR: do not initialise statics to false

FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
-static bool reglog = false;

FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
-bool dumpstate = false;

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..d9ca4bc9620b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 };
 
 #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog = false;
+static bool reglog;
 MODULE_PARM_DESC(reglog, "Enable register read/write logging");
 module_param(reglog, bool, 0600);
 #else
@@ -76,7 +76,7 @@ static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
 
-bool dumpstate = false;
+bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
 
-- 
2.20.1

