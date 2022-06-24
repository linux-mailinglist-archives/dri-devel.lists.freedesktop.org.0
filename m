Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2A55A0E8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C910E04C;
	Fri, 24 Jun 2022 18:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186DB10E04C;
 Fri, 24 Jun 2022 18:45:17 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id h192so3189386pgc.4;
 Fri, 24 Jun 2022 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PJf9ZqRPQG5hDGmci7MSLL4PtNxINmMcqph4ZWlr04=;
 b=jXC2+LI0A2PyLqhkgdZINUMyFwAOJeqF4mFW2PL3mHngL8oxti+0LA2nwoV+XGBY7U
 P9s6b9HcySIZ2AD7j2bNedeADazLvFNVoClgcFPHfoRfsFRohhSsnTd6QL0c12VFDlXJ
 9BEszLvKhHZCQXyR717cbQ7OCpa81vAkyFSQ6uolQMgvpaHmzSQ0pNhlCooNGpf2S43s
 XrxaWgS8NjXRYeuP0D+osvjmk2ThPimDmZH6p49iZk2fRchwr5MuwtqsVvCDQMClNqU1
 bTIZn9E/TTVTZxSUnqouCCoLIoWwxXsPIkV9lqboA+leXFrXXBzbzjBAGTUgNSSmFblI
 4zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PJf9ZqRPQG5hDGmci7MSLL4PtNxINmMcqph4ZWlr04=;
 b=m8VgOzzLdWYYbtt83fhfoQ9DyNPOggMn4W6JtLrWgLRWPZcjq40O6JKm7ZAaWpJQbQ
 6OPdwWlIXiX/mIckAsGSVGdwZ3IRQ0YfLbF33jBmJqLsaiTH5ZVtfHArrjd8wtykJ8Ss
 i00tuNYAy6R6mqgvZaHuhJGIQlyxdXO3m2QtBO/umgLkoc5QPGQ1mqZlrMmEW1k62dDN
 vjrglj02ztKImSD6FzSuASReCrtFTNWDsD+Kds94QDXezZ0iQlRsSL5wFCR2V075Js6b
 Vd0x8q/jboRUE3HEcJt+fXyzjKFUaVct11OUaPtMZwwKcR4MgErUVIGHw8Hg409ATWIG
 zCaQ==
X-Gm-Message-State: AJIora/O+PHknTvbmMI5GEkkAi6VIBjak1QaggjzPtJsHk3pPRwaLGOS
 cP2e5+EcK6XBCC+egCfErod4XAjikzE=
X-Google-Smtp-Source: AGRyM1tkOLhGf4SvybcPUuKUjF3i9l9HXNkyA6Q7ggGzOp7H0Rifvhib5L2DGPqO1fC+16R/pvEpDA==
X-Received: by 2002:a05:6a00:1ac7:b0:525:4ef2:175 with SMTP id
 f7-20020a056a001ac700b005254ef20175mr548025pfv.50.1656096315791; 
 Fri, 24 Jun 2022 11:45:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902650800b00168a651316csm2130525plk.270.2022.06.24.11.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 11:45:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Fix error return on fence id alloc fail
Date: Fri, 24 Jun 2022 11:45:28 -0700
Message-Id: <20220624184528.4036837-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was a typo, we didn't actually want to return zero.

Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3c3a0cfade36..c9e4aeb14f4a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -928,7 +928,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 						    INT_MAX, GFP_KERNEL);
 	}
 	if (submit->fence_id < 0) {
-		ret = submit->fence_id = 0;
+		ret = submit->fence_id;
 		submit->fence_id = 0;
 	}
 
-- 
2.36.1

