Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FBB162CD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8A810E361;
	Wed, 30 Jul 2025 14:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eujHvOtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406A510E361;
 Wed, 30 Jul 2025 14:29:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso66812695e9.3; 
 Wed, 30 Jul 2025 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753885781; x=1754490581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7AlJVmOGzAKicB8PmUMEgldR0Po2jcqiFiRrgkUSQyY=;
 b=eujHvOtBmW6pTxoFJtpieVociVCgo+kVn21YUTcCZipnQQoWN4hK7vmUBrMyzuweN/
 bHDmSwSYpthmPq9Oneu/Bi8VmEUGkHeUoSxUlofHHXEXpax1cxgfJd6cVIdf7azafwqp
 kVM9Kvi3hieNXFl+qsUCn1siAStC1i1MCqYVHihG7Z7wgUKme4IUzMzWoyujq6kejmo0
 Ql9ceZiWOyWcC91aBrYXraI1/HW7LnbBF9m88HNIxG97rcEaOTBoSPGtNmco2N2zZGLi
 1Q1vFjvvebv7G0XyDpM/0p3Z7WiaT3cO2qJHjBP2HBOeYM0YldbAqH162Ds3t1asx+FN
 18ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753885781; x=1754490581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7AlJVmOGzAKicB8PmUMEgldR0Po2jcqiFiRrgkUSQyY=;
 b=HKsNUARnsUWPIko9iieuDRQXJWRgzQ1EExt3ACoyzJHQsPP8UW2pNjvStOgh/ZWk8+
 p61rPO7SSRjg0RAsKEE7z5jgKgwjX+KAywD3yI+P+2g1pcoJ7wBfr9nyt48J4ebwsfEc
 uNL3JrNI03b+9pQd4fjQ8s43MovAGe3cTJxR5H7kOy2CgU5JYhVx+W4FKcB00OI2xPUh
 A2XEr1fQwFfGoHYbNqRQ3Ddp49X8nUw9xFgZBfoL/OkCzCoj/VRqfx/FB72PVOk16ou+
 R234jOK/bur5ts1vzx58UqL475Au1efHyWl7rpEuGHtDEgRGIk3WdYHOdOJH/++7ZxLI
 6caQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV0fE6vR7q7lU8nleSPmHgH3qkCK6511j85thpMuAQ5jTwUvwbEygu3M9ZaAMBF0wTk5yyjKEyHKo=@lists.freedesktop.org,
 AJvYcCXtybGuvV/fBnYF6HHIlQeTgGHNaX9PCSoJXP6OV2hKaoOEl79InxouBSrOjXL0kkj+Iw5Qb1jRuSAX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZL5eavbT9tsVHWHHEGTDusqpL380IfbDr6c1sFOSRMNoA6bBk
 ikISyHqFxQc/Q0JMg5ONFVOgQRQ8jaXjXTV3HcwZg6oAqgAVRcFRwjMd
X-Gm-Gg: ASbGncvRg97QLWX7zxPPnsiIb/mqSsF+2p41+bm43N5OSAQixFew1gDams/D/NRsqF0
 85o0LcL5Zgr+5v9rTQE7E/Rntvp32MrSoRSXRQqcQkTObBCN/WrbKWCKhQwDyGZe4n0Uwc4+zEC
 VoSWj9/tvuIIZGswxdHklwLuwAd3Zn0SYysMctEwhHISzpDtgFv+kdDMtpULD2UZAOkOrw21Ncw
 W1pV3GjN8Ur3CUrEC8Gqcc9UzbccQ0hfviAH0cYKim3LVC4Q1StckGI0VKGMa8Snz87PF54viLP
 fOHzOJ8LxxCUloC3vHyMMc4n0hDh/vUyO//stV3gNIf1NsB0TeW8hUj3CefBgtmia0zRTvtzf8V
 Oq0iqHjOzB4tLml2HjXAO
X-Google-Smtp-Source: AGHT+IF5QJ37jWg7fCnJbb/VaKNBhipzgn5fvN5Soc3F0FylcMx9EfIgS05bdT263onDGTvzEzsZGA==
X-Received: by 2002:a05:600c:5391:b0:456:58:1114 with SMTP id
 5b1f17b1804b1-45892b9d05cmr33734855e9.9.1753885780632; 
 Wed, 30 Jul 2025 07:29:40 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4588dda59cfsm38833425e9.3.2025.07.30.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 07:29:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: Fix dereference of pointer minor before null
 check
Date: Wed, 30 Jul 2025 15:29:05 +0100
Message-ID: <20250730142905.2080035-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Currently the pointer minor is being dereferenced before it is null
checked, leading to a potential null pointer dereference issue. Fix this
by dereferencing the pointer only after it has been null checked. Also
Replace minor->dev with dev.

Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index bbda865addae..97dc70876442 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,25 +325,28 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	dev = minor->dev;
+	priv = dev->dev_private;
+
 	if (!priv->gpu_pdev)
 		return 0;
 
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install rd debugfs\n");
 		return ret;
 	}
 
 	ret = msm_perf_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install perf debugfs\n");
 		return ret;
 	}
 
-- 
2.50.0

