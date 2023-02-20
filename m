Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650EF69C3E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 02:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870710E09A;
	Mon, 20 Feb 2023 01:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EDF10E09A;
 Mon, 20 Feb 2023 01:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ovqZtYKPJQ6/2tewzPzR4aQLjzsj+HmREsk7V7Fv1eg=; b=AW2niDUyFd6c5SQTpM3F2Y5Dpg
 XyPzZ8fu5vCzkd6PVQKw3lKwEPKHk9wvNfvCmv3LUmu7dFMaS2PJkzQEAK9MNllHuYkAdEMjp5pGs
 PjX5cKk9gSIYEaRPJbjt8CiKlTCw3+hONrdrZ+txskDBa4luXWk8vBJxWLn8eXkUnYh0Df7fFPWqR
 ms93hxgrx/JYa2gd1Eu/522kgI6XqJC6zoYSyrt1FN/+KH5Wbt0NCLUUY+hw2V6bcnXV9Ro7/VaR7
 rmCKlWUss1NhzfJ6nEr/DFMY0LaVzDf6qWUFD/ok0NhDc1xyVSnFTYOCvk0FTzU/yDc/VmJvWZ6/f
 PFQa+eAQ==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pTubX-002eJA-2B; Mon, 20 Feb 2023 01:04:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed
Date: Sun, 19 Feb 2023 17:04:28 -0800
Message-Id: <20230220010428.16910-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Randy Dunlap <rdunlap@infradead.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_MSM no longer needs DEVFREQ_GOV_SIMPLE_ONDEMAND (since dbd7a2a941b8
in linux-next: PM / devfreq: Fix build issues with devfreq disabled),
so remove that select from the DRM_MSM Kconfig file.

Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
v2: since <linux/devfreq.h> has been patched, this select is no longer
    needed (Rob Clark)

 drivers/gpu/drm/msm/Kconfig |    1 -
 1 file changed, 1 deletion(-)

diff -- a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -23,7 +23,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
