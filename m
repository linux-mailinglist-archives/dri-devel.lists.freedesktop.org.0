Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D2F6ABB19
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38E610E215;
	Mon,  6 Mar 2023 10:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347C10E1EB;
 Mon,  6 Mar 2023 10:09:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CA3EB80D7B;
 Mon,  6 Mar 2023 10:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97427C433A0;
 Mon,  6 Mar 2023 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678097358;
 bh=4+aatQXI0SCxRlCzdLvMFS4VkyXlIErsdSaIxooTjLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPL2f+tKt/HlM/ila+Orez2fDpuyMV0hIP4O874wDP4+xCQEchxA603rlXWnrkk6c
 kIEhbFdGw3uBtjiSVawaRUDsNzbaqqs2epRR19PgUyvgIIJSKvHc64VeqzFcc2s70N
 m+lcsfh5V86J88FjoMXYhgYwnqBf4RjYRYrTpsvy3YcZHelZJeE1MgiAbHVFdbBf07
 pIO9ZEEo7VWv7jmcZfrGckJPQXErTytebZr3qfBgChPdP59WuZ9qEe7/Rrr2dbavO5
 ZKgOMx1LSAWdzux+8TYBELjRKvLtaTIWj+k6h/te4YBGOz5AzKPvyJZ7n7XFYQ1g9w
 20iTjSh2bjAAw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ7n5-0007Qi-9X; Mon, 06 Mar 2023 11:09:59 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 04/10] drm/msm: fix NULL-deref on irq uninstall
Date: Mon,  6 Mar 2023 11:07:16 +0100
Message-Id: <20230306100722.28485-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of early initialisation errors and on platforms that do not use
the DPU controller, the deinitilisation code can be called with the kms
pointer set to NULL.

Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")
Cc: stable@vger.kernel.org	# 5.14
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 17a59d73fe01..2f2bcdb671d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -251,9 +251,11 @@ static int msm_drm_uninit(struct device *dev)
 		drm_bridge_remove(priv->bridges[i]);
 	priv->num_bridges = 0;
 
-	pm_runtime_get_sync(dev);
-	msm_irq_uninstall(ddev);
-	pm_runtime_put_sync(dev);
+	if (kms) {
+		pm_runtime_get_sync(dev);
+		msm_irq_uninstall(ddev);
+		pm_runtime_put_sync(dev);
+	}
 
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
-- 
2.39.2

