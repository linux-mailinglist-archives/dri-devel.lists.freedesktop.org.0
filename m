Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1072533788
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E4310EFF0;
	Wed, 25 May 2022 07:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FE10EFF0;
 Wed, 25 May 2022 07:39:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A688F6178E;
 Wed, 25 May 2022 07:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D9C385B8;
 Wed, 25 May 2022 07:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653464368;
 bh=3lBmglmHAxoDZ44iJuSmettyMYwVV1Evj7p3iUZ9x0U=;
 h=From:To:Cc:Subject:Date:From;
 b=E5BoMBSZ9bkAtH4L0sTwMHzAC3HVVRPC7HsmJEV474UQAHqdFoLhNRTHZXLnziYk0
 ivHTCc0/BRnIydyZYHbfh61kDz1exEt4JVncabJrVidwT6IB2YBCIjTVr+19xTEA3T
 aLCtoJdXRP+LvPLYwr/9KflAosw1M7VbG/MXUC5J069Z8+5RisrYIRju5biAAPBQuc
 dAkWCgU1sbQfBNrP3s/PBZPYhSmKiGjxfnuWwkigUQ5/ncTj210oZDByPzfyMohFYv
 5Xjef8YDTbvJ2nVG/Qx5o7zazeC5epGa0OOiKUij1UXZxy9wu2tSAhvC2lqHJNuTqy
 T2jXM45uI2v5Q==
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/msm/disp/dpu1: remove superfluous init
Date: Wed, 25 May 2022 13:09:12 +0530
Message-Id: <20220525073912.2706505-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: kernel test robot <yujie.liu@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
encoder") added dsc_common_mode variable which was set to zero but then
again programmed, so drop the superfluous init.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Reported-by: kernel test robot <yujie.liu@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
changes in v2:
 - add r-b from Dmitry & Abhinav
 - fix typo for superfluous

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 51f24ba68375..388125c8bda1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 		}
 	}
 
-	dsc_common_mode = 0;
 	pic_width = dsc->drm->pic_width;
 
 	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
-- 
2.34.1

