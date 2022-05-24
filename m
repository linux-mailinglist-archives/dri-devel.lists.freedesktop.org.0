Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8F5327D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67DB10F0E0;
	Tue, 24 May 2022 10:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8AF10EF81;
 Tue, 24 May 2022 10:35:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D714761204;
 Tue, 24 May 2022 10:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1BBC385AA;
 Tue, 24 May 2022 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653388545;
 bh=gwBQJB78CCphDTIy50bjriGtJcPqoXOiI/qgg5bZ34M=;
 h=From:To:Cc:Subject:Date:From;
 b=WAaa2wtSlhxP+AHfoFOc7dz4elSiiUuzyEy1vVdV+SwfuFrdYunPJskyJPChaiIxC
 BTyqcwwyxlDOCdGAbnn3uICkHK8zjZzXNd1eCEOX8dBQOst+aEYkMJjh8DTsDS3ANj
 L0iMjphD/gyDwZQX18/+J7Lj+OXSsBcU0IipLFNONzZvRVJ1oXEYkD7+0ryzxHKFSt
 +o8pgUM9j1hAxWopwkURSx7V9YAYGi0L1fz11uKuV2Vuvo1RXD9v6AdPXrusjFsYUe
 F3as93AT0Kdb2i5/8N4SRkQhidQ13dhB8SI1gTUv+gJO4faL/ooWLnUvugDuGj9h7/
 75Cd6qtQPPKmA==
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
Date: Tue, 24 May 2022 16:05:34 +0530
Message-Id: <20220524103534.2520439-1-vkoul@kernel.org>
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
again programmed, so drop the supoerflous init.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
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

