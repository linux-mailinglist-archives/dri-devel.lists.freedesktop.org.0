Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51E59C545
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1111A12A;
	Mon, 22 Aug 2022 17:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A713A10EAB7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:44:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bt10so3334113lfb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pPgFBD7q3E3eicH1Pv3awZm8nZwSgddbX6vYO9NgS5s=;
 b=tKiS5nRGw+aixKb+4e2oD8qwOCfiuLqBi6o0G0b5aXjKruh3Wk+aVld6woWNtrkcoA
 FVXQbgyR/r+arZ5Qro+NmeaAeUm1J/BXKtkgtxX5Fkn3vnSrKw/Dtfr3a+jrZj1O9G2i
 mODLBzcL9eyDtvnVphp05DjRwPFFkBjkAaAHUN7rgybymq8O9egjysKQifVSqt7oMfGD
 lkFyQvrrZV0sdydZLd00P+qqRxKblnvLYtoPXn4F89CdSPis7tdHz2RlkFSZRYYyJqbR
 WLHb7Usvg6UDZuF2aDrVL3T1leXrFNMbtz36x1WXYPzc718DT8/bE6wue7GgEBn304ek
 ncFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pPgFBD7q3E3eicH1Pv3awZm8nZwSgddbX6vYO9NgS5s=;
 b=iEkjBXmJFx7bMFqxhxw748BhIoyXf6LJOdmZsbFGlHECUlxXSvITIi9J2GrBOFQDB4
 33gMgNsjSLYRn09xMvh9DKsABoTTwdwoPHoAfcFcPhQMOxOiu15Fi/l00IzrZ75ed8WB
 Pdoh2/Q7KBGEXw13LpuTAl/gfhodi+48Es2DpZO2kLmvxMk+b7njXB0FoDDLHdQmZf0Q
 j/yoVx2LFwi2fDFNuwQpj5kbs3XHtZqPVOISBx0EB8sZMsM1YKLpBbn8Etja1r+J/R1Y
 fC4IwGk5Im/p6xGYzleG6Wk5Ieyai+lDhjppyfgWl6Des80KmqmIz/dkknOtkDMrJ65y
 4mXw==
X-Gm-Message-State: ACgBeo3sLE2YCB4Bhd1JDg175fJZc0wtgpS5PXiA7w1GnkkKmO4qIbej
 uaimXGpRiic1Ck07rdKqlwR9lg==
X-Google-Smtp-Source: AA6agR7TmR9HnV5ntDFtZKkSVFvPlc09+DbRAW4QsmCohy13NJfdZ/NlptxVK9QM16q7uQVJB8vl2g==
X-Received: by 2002:a05:6512:3a94:b0:492:b321:8f75 with SMTP id
 q20-20020a0565123a9400b00492b3218f75mr7393314lfu.366.1661190258966; 
 Mon, 22 Aug 2022 10:44:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05651203e800b0048b13d0b896sm327180lfq.141.2022.08.22.10.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:44:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: drop the hpd worker
Date: Mon, 22 Aug 2022 20:44:17 +0300
Message-Id: <20220822174417.292926-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It makes no sense to have the HPD worker in the MSM DSI driver anymore.
It is only queued from the dsi_host_attach/detach() callbacks, where
it plays no useful role. Either way the panel or next bridge will be
present and will report it's status directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a34078497af1..43bf84e92a7c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -144,7 +144,6 @@ struct msm_dsi_host {
 
 	u32 err_work_state;
 	struct work_struct err_work;
-	struct work_struct hpd_work;
 	struct workqueue_struct *workqueue;
 
 	/* DSI 6G TX buffer*/
@@ -1500,14 +1499,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 	return len;
 }
 
-static void dsi_hpd_worker(struct work_struct *work)
-{
-	struct msm_dsi_host *msm_host =
-		container_of(work, struct msm_dsi_host, hpd_work);
-
-	drm_helper_hpd_irq_event(msm_host->dev);
-}
-
 static void dsi_err_worker(struct work_struct *work)
 {
 	struct msm_dsi_host *msm_host =
@@ -1697,8 +1688,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 		return ret;
 
 	DBG("id=%d", msm_host->id);
-	if (msm_host->dev)
-		queue_work(msm_host->workqueue, &msm_host->hpd_work);
 
 	return 0;
 }
@@ -1713,8 +1702,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
 	msm_host->device_node = NULL;
 
 	DBG("id=%d", msm_host->id);
-	if (msm_host->dev)
-		queue_work(msm_host->workqueue, &msm_host->hpd_work);
 
 	return 0;
 }
@@ -2126,7 +2113,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
-	INIT_WORK(&msm_host->hpd_work, dsi_hpd_worker);
 
 	msm_dsi->id = msm_host->id;
 
-- 
2.35.1

