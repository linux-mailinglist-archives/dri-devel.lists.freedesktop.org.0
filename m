Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37870695673
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 03:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D2A10E7DB;
	Tue, 14 Feb 2023 02:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAD10E7C7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x29so16931995ljq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
 b=GXJrXEqNRD1mVB/HSZOcdpX+RH6803clEiJVhlmWpeODDuRt5paX0sitpBcn9QRxaB
 BqwlEu+LCHuD8w2zEyLpbpaTSt50acsBW9rWOXIk7p+KgTZepLzLUJ+APqbgyZ/+Lqms
 FvlET0dgS24fIC8BU1xbv8rC9zFNIefN9IU//IKYcIKlPVO81E5t097UjGGtb4KTC/6l
 nmXO92fBNxi4NyGqYE2ZQXyBFKaaekXjVPWaYijTXxpwnEhoR4zPY/Oi218infdOOpcx
 Uep8iDffbXxvCNIJ79cJAHwkWRVYS/SldkLCunrSRwheIZ5AxehP3cfhZLVdzbbqMc7q
 uPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
 b=2EAqLSMUP9qU9lk17/WI+Cl2JoqCFiEaReI1d5LhkoiJar6w6LRxxnD0qpuMlXnbx7
 oSbelIJJQsyr5B2oFti2iO485KU0JvUoKp8/phUnrnL1vxxYLLWOn4AjnJLkbSCgmLP/
 HUVTBf7OurS6zTK5r6YdznYVMbWqVMWH1uuEI9ODSOgOQzBQm0dkwjenWq61lAbR8Gko
 sKsdS301CfnZIeQLi2Qu6/uPAvDaQ4XiDD4/bURTZGDl4ErVRbr7gOp/oSSHquL7tWSz
 Wm8mV6aFbrXFmgt5nXJ/7Z8DxCr7UdrGsP0mMNJSTmzpgSA16PLG+cv0/fPwvwuKOYAn
 1NZg==
X-Gm-Message-State: AO0yUKXRGCb+wYpp4BJVZuunwJXvG6TyxuEpWZ+m1Xi/7B/yjI9I9uK7
 A1M8tpdfOxTELyllYb+J96GXHQ==
X-Google-Smtp-Source: AK7set/INJUhsu9dINYFmoXc80j9iZnt4BbCJb6ebVarThokQgjPgR6cbE8l2ONMPwLmrHUW7Y2IHg==
X-Received: by 2002:a2e:9813:0:b0:28b:5621:7be with SMTP id
 a19-20020a2e9813000000b0028b562107bemr218378ljj.35.1676340602613; 
 Mon, 13 Feb 2023 18:10:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:10:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 4/4] drm/msm/a5xx: fix context faults during ring switch
Date: Tue, 14 Feb 2023 05:09:56 +0300
Message-Id: <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rptr_addr is set in the preempt_init_ring(), which is called from
a5xx_gpu_init(). It uses shadowptr() to set the address, however the
shadow_iova is not yet initialized at that time. Move the rptr_addr
setting to the a5xx_preempt_hw_init() which is called after setting the
shadow_iova, getting the correct value for the address.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7e0affd60993..f58dd564d122 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -207,6 +207,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
+		a5xx_gpu->preempt[i]->rptr_addr = shadowptr(a5xx_gpu, gpu->rb[i]);
 	}
 
 	/* Write a 0 to signal that we aren't switching pagetables */
@@ -257,7 +258,6 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 	ptr->data = 0;
 	ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
 
-	ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
 	ptr->counter = counters_iova;
 
 	return 0;
-- 
2.30.2

