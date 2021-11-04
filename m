Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E3445C1C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 23:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F867738AD;
	Thu,  4 Nov 2021 22:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B4738AC;
 Thu,  4 Nov 2021 22:23:48 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id p18so9589492plf.13;
 Thu, 04 Nov 2021 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SAjJe0L8rahemkypYUehC21SFtz7mEZThWWLPiWL/ro=;
 b=NzCVs6lNdX69wDrb2nMBBzD34Y/tsJPVI6tZWsiJCOxvoDvtDSENn/huD6z7kv+08l
 G9iOj0TeqIBrea+YwDGMeZ6jbbr6sTnh9mgSUQMWl+dW/IdmeFiNEmCgQ8Pqt1R0hQpq
 3O7JgIBvUhfdd1u1H5GDMGH2lCWjEGfPO5IJ/juwztKXa1cTmKsq9t2Xi3PsbeTpQn7G
 PBFafU3TixWAtSjq2EPHFSGH+7VcbMguCFwyUrOqDSYKOWOBKq1+Vby130DqEsBYIQZ2
 BpFco6dKebNmDvklIAwbsYFRHGbf+QtFcJ0aNpdIKY1WTAgxy2h73o3bAx2X5ZgjbPuL
 SZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SAjJe0L8rahemkypYUehC21SFtz7mEZThWWLPiWL/ro=;
 b=mYSdJOU2qiiYO70gsI2VM6De+eYKG655AWXi1Wlao+/Gp03CGLbRSTEW9/Kz2zZmQ9
 rMIGan+Doo/iP/OCPOfyL2uwKdJFo6MDcNN3krHYWuQ8w2119GSvalOi5pLb0gwwLpdE
 C469vzKgEahKW3B+T2N1GK4UKH0zrcpzbxC4dNOr4bdZ2/YHpc87CK4GITQORwGon793
 aT8zznG2SBbE46KLNMsoRrkftN31YCwww8mrmFTJ081EsUu7e5XcAaKMxTbXqUVX2QXk
 chnwhMjILePJPrRNSExQTx4Y66qI7mMAC9tJds57wP2lun99ttBJ9pIp3v8jNYhChCth
 Ixkw==
X-Gm-Message-State: AOAM532U9lq1hfH0QktSWxXGAYLRuFCu+1wHoX0rpe4qSkGoLOKjT6Sp
 Ub0870Gurde84iuOQv/JVeq2MB7gIUM=
X-Google-Smtp-Source: ABdhPJywWwxxya+abTTKcjBAKn/zhPdhspjq0C6veBnXpocuNuoJ+miPacjiMb70eXIDSP4U7I+1qA==
X-Received: by 2002:a17:902:db01:b0:141:ea12:2176 with SMTP id
 m1-20020a170902db0100b00141ea122176mr28246520plx.44.1636064627091; 
 Thu, 04 Nov 2021 15:23:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id hg4sm8148128pjb.1.2021.11.04.15.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 15:23:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
Date: Thu,  4 Nov 2021 15:28:40 -0700
Message-Id: <20211104222840.781314-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729b4616..9bf8600b6eea 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
-	opp = devfreq_recommended_opp(dev, freq, flags);
-
 	/*
 	 * If the GPU is idle, devfreq is not aware, so just ignore
 	 * it's requests
@@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		return 0;
 	}
 
+	opp = devfreq_recommended_opp(dev, freq, flags);
+
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-- 
2.31.1

