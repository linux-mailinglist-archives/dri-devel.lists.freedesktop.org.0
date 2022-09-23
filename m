Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA85E80C2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 19:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3738D10E2C5;
	Fri, 23 Sep 2022 17:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6431B10E2C5;
 Fri, 23 Sep 2022 17:33:10 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id y11so676702pjv.4;
 Fri, 23 Sep 2022 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RcmsQzRl+ihF1VVNpRmBrhOSsh2l+7OEJ3HKlIa4qQU=;
 b=chP6WJAGr2PPuIsrNecBqcLaY0+SHmMWrrckXnnYy9FfJxkzwls0F972JKhiawx7qh
 RuOSd5JO80tfXxiRwltW+g/uMDmdkwbXkwL3uNXwo5XeakTaAuBz4DdpPqm4RulfTsN7
 6hXrT8grt3WPqGTgzp8pd6QDxegMtIhOLygNKPzszr9lPWbjtfT7m9Zde6o/QpOaXyyT
 CcW1cW0NNSFgxWEpjGevZ1MIog+sKnCfjR6qY1W+QtAh12P0Mn6fQUCi2VsVys+ezhQa
 4/vT9fQLx9Whxbl7c3neAVkTiKVGflERZRbuDciOJNdN8l80YKLMTwAkL+WA8T79ABDH
 BToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RcmsQzRl+ihF1VVNpRmBrhOSsh2l+7OEJ3HKlIa4qQU=;
 b=5Q5WCgFyAglaiWp8RIgt2K2x5WETROg4qCWEfDNKDoqBqcjWcHKkPY4DstZOd0Wvze
 Yc3FdTlCk9Rc6a7RkmIlZlDK1CTTa++dzOHCepSTPE1O6ZgVc0skUfBzq2/GoxUBoeyO
 UdQTa+D7C7xufGsqLAIYKPI7YQ83Vp/xlTc6+8vlN6cU2qmFDAhqtae128+Czk5IkB49
 mdmXk7QeEXfDjwsfMwcRO6Wz8J6ew+kbZBXR1AEVZdOJrS8QkXdWAJnXecaHjXzzSmPW
 UFGW4ZkhteRtmriUlgconq6LGX+xjskvUtzu3IKCfOco4v766/+ZoWqMwdtlhvo3WpN6
 IQdg==
X-Gm-Message-State: ACrzQf1UCZFx5D20lb9p/KTW5TamOyH4kiA1XCv+wIMyUw0gWNWGvEeq
 IFtjXQsN+JvXmXUUdtezXtGIAjtMLx8=
X-Google-Smtp-Source: AMsMyM7rLu4btpweWbZ0rMM4U+K1DoebEMuwVCjkXK7sGacJsmBu4vTipbG5Rl0LSDp8gBJh/lV5+A==
X-Received: by 2002:a17:902:7d97:b0:178:6505:10f6 with SMTP id
 a23-20020a1709027d9700b00178650510f6mr9462087plm.155.1663954389602; 
 Fri, 23 Sep 2022 10:33:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa79ac7000000b00540d75197e5sm6547525pfp.47.2022.09.23.10.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 10:33:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add MSM_INFO_GET_FLAGS
Date: Fri, 23 Sep 2022 10:33:07 -0700
Message-Id: <20220923173307.2429872-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In some cases crosvm needs a way to query the cache flags to communicate
them to the guest kernel for guest userspace mapping.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
 include/uapi/drm/msm_drm.h    |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 07f66412533b..66b515a956c1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -818,6 +818,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	case MSM_INFO_GET_OFFSET:
 	case MSM_INFO_GET_IOVA:
 	case MSM_INFO_SET_IOVA:
+	case MSM_INFO_GET_FLAGS:
 		/* value returned as immediate, not pointer, so len==0: */
 		if (args->len)
 			return -EINVAL;
@@ -845,6 +846,15 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	case MSM_INFO_SET_IOVA:
 		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
 		break;
+	case MSM_INFO_GET_FLAGS:
+		if (obj->import_attach) {
+			ret = -EINVAL;
+			break;
+		}
+		/* Hide internal kernel-only flags: */
+		args->value = to_msm_bo(obj)->flags & MSM_BO_FLAGS;
+		ret = 0;
+		break;
 	case MSM_INFO_SET_NAME:
 		/* length check should leave room for terminating null: */
 		if (args->len >= sizeof(msm_obj->name)) {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3c7b097c4e3d..f54b48ef6a2d 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -138,6 +138,7 @@ struct drm_msm_gem_new {
 #define MSM_INFO_SET_NAME	0x02   /* set the debug name (by pointer) */
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
 #define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
+#define MSM_INFO_GET_FLAGS	0x05   /* get the MSM_BO_x flags */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-- 
2.37.2

