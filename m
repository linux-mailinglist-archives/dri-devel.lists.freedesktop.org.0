Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDD1FD66A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 22:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3EB6E1B2;
	Wed, 17 Jun 2020 20:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B7A6E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:53:26 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id m2so1645257pjv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rkwd2ka8Z7iO2pJxHXIRpwXonoZgh2tKHVmhTEheWDo=;
 b=ankX+yV3pTmnsA/EifSsAOqJzVbig1w1EwLxdujI9nqFQz069s7Fk775dKVyb77dZz
 lsPW2YGgbcyA3+CjH4idHRgLZ94mALQ2IjTUKoioyiNO8+//px24k4CRWfcNgZThRtrV
 SrVLqkHIkdcIAG+Ajf9KeNtMOuZC+3HGLZ/nRTDRer73f/76QobJZP52SyTCPDWBrtOP
 M7nvex6ZuDmGWg8hUvoB+co44d9rgwp6dVbl3WtsAK5Oz/bvPtC+dxGri4nOmSMHWZVV
 ciZ+p0m+yFcsotHidWlmJg1FcX0M3/PgJG2tzDLv0qYXaNrqFbr4RREJ9ZjJPMJlaxmO
 QEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rkwd2ka8Z7iO2pJxHXIRpwXonoZgh2tKHVmhTEheWDo=;
 b=ZGMlDxu1OsYhoaO+HyqoefSJMtuO4oQz/i6FdONA00PVMhU0BQ5MheXr3EBmdjm6K8
 1Y1D5kX49UyPwo9Yve9gJmGcEktftU738Skm4PlJOoOkdFAqNRq0JnL3om5nPt4e+9Ew
 wG9zwHRiPO/w85Ueeb5cGnLxWTUEe2N3xwFbSKLXiz51lqC/Dx/ShdtLgw/hkRzxkv2a
 kYjiRb1RItt8DQlIzetnutUm6/vtgzyoZqk1WJSOWR9vBuQ/68UaRfk94WbmMUb5PPsO
 CO9Madn3A7mRRLnxbzrcL0TtBDYIPh5rEqnm3Io/aJNGUJjSlG/rcmjgn4kdN2Z+kiJI
 kZHQ==
X-Gm-Message-State: AOAM531zqkMDbA4dW9KGGrx54mIo+UiyRB1tYZlTGK8K+TjctZ0QWhMH
 c8jjv17wi5AeX0aoFhB/XqPJqE9yQ8j+2A==
X-Google-Smtp-Source: ABdhPJwJ2UTlCE2dQ2laBUA/pxpoSp23Y3LfsK2W24qN8hJszwXs3PuSNGnOaofSqf1abQraw6x8yg==
X-Received: by 2002:a17:90a:2683:: with SMTP id
 m3mr859532pje.196.1592427206091; 
 Wed, 17 Jun 2020 13:53:26 -0700 (PDT)
Received: from miranda.anholt.net (c-73-11-63-120.hsd1.or.comcast.net.
 [73.11.63.120])
 by smtp.gmail.com with ESMTPSA id ca6sm392454pjb.46.2020.06.17.13.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 13:53:25 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 2/2] drm/msm: Fix setup of a6xx create_address_space.
Date: Wed, 17 Jun 2020 13:53:10 -0700
Message-Id: <20200617205310.2183722-2-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200617205310.2183722-1-eric@anholt.net>
References: <20200617205310.2183722-1-eric@anholt.net>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want it under CONFIG_DRM_MSM_GPU_STATE, we need it all the
time (like the other GPUs do).

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a1589e040c57..7768557cdfb2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -893,8 +893,8 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DRM_MSM_GPU_STATE)
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
 #endif
+		.create_address_space = adreno_iommu_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
