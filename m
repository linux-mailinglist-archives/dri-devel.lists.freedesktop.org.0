Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F905B16D5B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 10:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF6210E729;
	Thu, 31 Jul 2025 08:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V3dZjb2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3A310E38B;
 Thu, 31 Jul 2025 08:19:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so800895e9.0; 
 Thu, 31 Jul 2025 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753949972; x=1754554772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcoomw/1hAL3KvzlKNuykH0cI7TxLyZBhhHk2RTTvDM=;
 b=V3dZjb2Pa7pL/+i7A94yKSZeegblw/TFmdWlikMhQjRepCG7eBOyU+gzq6fJELshM9
 fqK6vteenuYB1i62pQF4UxI4vbZA28HK4G1I7rdkez/1W+ceL+EbOKd6Vs2u/mzVig1g
 2EtlDN3UT+sB7IoD9n2P8KoY4pNiMPuwUN/9YYRfHB6GHgCSONMwVFsCHwYxSwHMOfUc
 7nO9V5PRIpOrDcA8sHGBw1BJhYNNzpn1T16lKTwNFzAq8cyAGVEKiwKYgYqzduarqZKH
 ImLW3DCEvdCzEgL6PfSxpP5Weh4x7hhsItSWkKE/YuFz/JlaoR0JjRMVfIDsITlD0g0K
 PiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753949972; x=1754554772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcoomw/1hAL3KvzlKNuykH0cI7TxLyZBhhHk2RTTvDM=;
 b=sK0famQjl38XPcq66fysmUqSfzztIS6rOfYvgSPhIuDIrldBqbmP7Z1WrXpPy7ncoR
 QSa4yXgihFOiDpuIhB3gm6GkwkYdUTTq1ChP4SqJt+KOZMV0bFWmXuL1yHPjH9ma7KfS
 1mfpqscgj1b+K3fIRAsShwLMMnqmNJ1cfmwN1HwPmiY/kUt+tc9+6xZ/Xw9mutUqqdUF
 jalK6/h9xj5F8jNGCimWqYmORmpl4HrLhQXu7bvTEpkkpn7gC/gnIwL0tnZNI8brE1LY
 robbJ23TdrYLjUfQR2Z9Kuu8lsyh4OH8ldeRLHuFcXd+Hp0YEjC7GWVQOGM37Gw9ou0l
 vSyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhF8ZApHNUbsGOimCWaatSAA6iqe+yX2TrYTKw62eYHZkUW4oZv75wkV/YmlQMwRO/udqsoHKUmqw=@lists.freedesktop.org,
 AJvYcCXNECju9Bretav25LpAkA8OG9rjdkaO8OKfnqwhWDZahab9o/7spsRDLFLifBym0dBHLHJlQGoggTYN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3hb2ji3SbC1jE6lEqs1eA6+3hf6qE2eszVUF2iWs3TkPE3+EB
 0S4aQrJ4WQce5etNQilqN0OKLnYq/s7cbVYpOYwAc5Ml14nWd0+c3bal
X-Gm-Gg: ASbGncvdIoVEZV/DtzQL48ryVBt5Hz4sqZPzGj/gvTTftWjS2Km59BjmNjeHU2/VaUt
 88cXkjusNBw2RvEcxVbYwXCwVBU/QaLwFE0RmIF3ub1jqNQXhL63HB265Av7zAnoRuKXPgelVBb
 QXxzDhDFCT5Wh7LYgUm03IgtGkCBgvcFOHXciQVHpfpJLArVn3tZMx2omtoYispUHBsuGzd79vq
 1nSGP/6WRFHBt9c9Lz/Q7jXQ588z0EG/HD+topvwL8PYDcmkgoBB3PXzIEHUiivNj297Dgqtc8F
 JkeirjDX/nmtn/HiA7aoMlN2qI+7PxEXtZhazDg25AR/kl0eorudPhIvmImn216hVndlHM6Reud
 /b0o+OS53IM/tfvn0HRqDNTLy//jt6i8=
X-Google-Smtp-Source: AGHT+IHNFINuB2qnm+mYjJQTsDwzlFYJuyZc8VGKOrPRokvjoYXrZDyXCOjo94KVV+XJTnQmPhaYqw==
X-Received: by 2002:a05:600c:6308:b0:456:1121:3ad8 with SMTP id
 5b1f17b1804b1-45892b9cfacmr65956625e9.10.1753949971926; 
 Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b9074sm1516092f8f.17.2025.07.31.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
Date: Thu, 31 Jul 2025 09:18:54 +0100
Message-ID: <20250731081854.2120404-3-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731081854.2120404-1-colin.i.king@gmail.com>
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
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

The pointer dev has been set to minor->dev, so replace minor->dev->dev
with dev->dev in the DRM_DEV_ERROR messages.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index da618720cf8a..97dc70876442 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -340,13 +340,13 @@ static int late_init_minor(struct drm_minor *minor)
 
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

