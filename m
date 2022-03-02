Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180584CAB92
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4FC10EEDF;
	Wed,  2 Mar 2022 17:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83A10EEDE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:27:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1646242072; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Qa4oeOoMQCNOhiFhjfjB7NxSM+9SxKiZPhTh4vJHGJU=;
 b=N4jsx5vGC18Jj0wf2KRV3mTExv/q13FTgWr2wdEBQxCd7AG1+Xyw1dGyh4PF+mYYuywk1hN2
 EanxGMjL1KS653b7s6UE3qnVAt0GLc67Ef66xFd9gejV8FY2TN5GARsSLa2JA3TP9gFbXa6o
 h2z5Idj/Ei0DN5ebVF7xTJIZEuo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 621fa91718892df15f8b849b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Mar 2022 17:27:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8EDCBC4361C; Wed,  2 Mar 2022 17:27:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C826C4338F;
 Wed,  2 Mar 2022 17:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8C826C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v1 00/10] Support for GMU coredump and some related
 improvements
Date: Wed,  2 Mar 2022 22:57:26 +0530
Message-Id: <1646242056-2456-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Major enhancement in this series is the support for a minimal gmu coredump
which can be captured inline instead of through our usual recover worker. It
is helpful in the case of gmu errors during gpu wake-up/suspend path and
helps to capture a snapshot of gmu before we do a suspend. I had to introduce
a lock to synchronize the crashstate because the runtime-suspend can happen
from an asynchronous RPM thread.

Apart from this, there are some improvements to gracefully handle the
gmu errors by propagating the error back to parent or by retrying. Also, a
few patches to fix some trivial bugs in the related code.


Akhil P Oommen (10):
  drm/msm/a6xx: Add helper to check smmu is stalled
  drm/msm/a6xx: Send NMI to gmu when it is hung
  drm/msm/a6xx: Avoid gmu lock in pm ops
  drm/msm/a6xx: Enhance debugging of gmu faults
  drm/msm: Do recovery on hw_init failure
  drm/msm/a6xx: Propagate OOB set error
  drm/msm/adreno: Retry on gpu resume failure
  drm/msm/a6xx: Remove clk votes on failure
  drm/msm: Remove pm_runtime_get() from msm_job_run()
  drm/msm/a6xx: Free gmu_debug crashstate bo

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 89 +++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 31 +++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 79 +++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 10 +++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 10 +++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 +
 drivers/gpu/drm/msm/msm_gpu.c               | 28 ++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 11 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  4 --
 11 files changed, 218 insertions(+), 51 deletions(-)

-- 
2.7.4

