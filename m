Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1A5B6A1D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0393510E667;
	Tue, 13 Sep 2022 08:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278710E66B;
 Tue, 13 Sep 2022 08:58:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DF216136D;
 Tue, 13 Sep 2022 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930BFC43141;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059499;
 bh=CRJa+aCnTW2lozDHsj71EhQscca1SBgRhruw2lgMFWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JNWJLiFDM491qo/jWE0+OfQgwmdEsHA654+Ahbe0Hpt4JDpkKFzg9BpM20cNIk/wh
 JMLXgvuy3RkZqFUJAKvHj9uO8LYAOTphp9tGRgadmum8AsjsO/E3xyLZqRP98cLFZQ
 IQaa0TtmqibuemIgk71NmwMpouZBvkfiod6XXqHPwLT2IWB5xC1eT+DTvTnSTuEWk7
 EfjSi76ew3+Z4xsE/U3W602lF3L75Udomq9RbjoFWEF8IavnFHIzR0FgpJvo5Y3i+j
 jAX/KBDlRhdI+5qqv0YaJKxqAMAAEwCxf2k5hPoRcCCQrESEfKjqgrJKmqNl+1VrSJ
 JkC/5FEhoKbeg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kI-0002HA-OD; Tue, 13 Sep 2022 10:58:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 05/10] drm/msm/dp: fix IRQ lifetime
Date: Tue, 13 Sep 2022 10:53:15 +0200
Message-Id: <20220913085320.8577-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913085320.8577-1-johan+linaro@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device-managed resources allocated post component bind must be tied to
the lifetime of the aggregate DRM device or they will not necessarily be
released when binding of the aggregate device is deferred.

This is specifically true for the DP IRQ, which will otherwise remain
requested so that the next bind attempt fails when requesting the IRQ a
second time.

Since commit c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
this can happen when the aux-bus panel driver has not yet been loaded so
that probe is deferred.

Fix this by tying the device-managed lifetime of the DP IRQ to the DRM
device so that it is released when bind fails.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Cc: stable@vger.kernel.org      # 5.10
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe950edaefe..ba557328710a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1258,7 +1258,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 		return -EINVAL;
 	}
 
-	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
+	rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
 			dp_display_irq_handler,
 			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
 	if (rc < 0) {
-- 
2.35.1

