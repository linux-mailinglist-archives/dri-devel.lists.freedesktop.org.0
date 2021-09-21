Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E041377F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 18:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72E6E9BA;
	Tue, 21 Sep 2021 16:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699F6E9BA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:23:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x27so83552263lfu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZxXiK/igoFZEqHLXFTBpMKSnJsFZcbyROjm+cR8HWM=;
 b=YmYjwO0jEb52u3Hn99lxS9rdHaIDmjXLWGx0oAW1T8SPbmWAlvkpd6GhP0JY7R/XLh
 yLVAXMKqeiRFTsoiMhKsbiUROl5bgalCYjrd/SU0+nn5bxKWS2xBoL8vk2wlEQ+WM53S
 zzLNJGHuXux45DBtlgioxB/37/g1Q1D1xrtlmUDzyDwha/vCSUB7oCTYPqM8g9iSFipL
 88gjDDN8ogIH5+mSR5DJ2YWWtwMHH40a72qypvB1cyXNPpnwJJHTgHEZn5kyXMFUExu9
 Mv7F7Ahl+7I6imf9d1RlZjkL7war+NxzPJJDep6ZSRgyUHioTg+pyr0ZwKgAjePwlPEi
 JhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZxXiK/igoFZEqHLXFTBpMKSnJsFZcbyROjm+cR8HWM=;
 b=keLfFUJfmq5jG4x4NVMqmSvP56Zd8Q4bEEdSpLwF6JYCDefaSpD41uT+KoZ5FELmrk
 GUFNz4qbzxMeR9/PR7yt/rOss5uWX3g92lqVGab7GStY1kACC1y/h7BvIHZxBqtJ9p/7
 SR+0/mvD6kiF89drg+29nc2s7cCeYHmwc/eaNZMcooGrcDDnuusC6Vah3ctlBI6vKMAY
 O9aLNuVZdmiAMkHXJoWddAPbMW+dPREnHg3vhW8wY9ez3WCHmPMvLzbeOxbZE5nMf72e
 lcS2DtRDCMtFTw5QUla2wKQvfwcefCzbqoxhFAj/J9Il9WFjLkD07r92zjAMOdRtbR32
 +EhQ==
X-Gm-Message-State: AOAM5312S3DRQ0uwRkMkd1+knL3gtsLda1NXPjnvsH+1Vz8a2Yi8yh81
 UbGXJCHtOAKpxFinxXCdzRk0qA==
X-Google-Smtp-Source: ABdhPJzTRtDkvxjwVw3Lwwct57gIcSM3sLoNOcbn4HI4ZvhAQagf467vxob+9Vsac/I1/i9H3+pPkg==
X-Received: by 2002:a2e:f01:: with SMTP id 1mr23190390ljp.204.1632241379786;
 Tue, 21 Sep 2021 09:22:59 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w5sm1558553lfu.48.2021.09.21.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:22:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] drm/msm/dsi: do not install irq handler before power up the
 host
Date: Tue, 21 Sep 2021 19:22:58 +0300
Message-Id: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI host might be left in some state by the bootloader. If this
state generates an IRQ, it might hang the system by holding the
interrupt line before the driver sets up the DSI host to the known
state.

Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
so that we can be sure that the interrupt is delivered when the host is
in the known state.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..cd842347a6b1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 		return ret;
 	}
 
-	ret = devm_request_irq(&pdev->dev, msm_host->irq,
-			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-			"dsi_isr", msm_host);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
-
 	msm_host->dev = dev;
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
@@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
 
+	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
+			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+			"dsi_isr", msm_host);
+	if (ret < 0) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
+				msm_host->irq, ret);
+		return ret;
+	}
+
+
 	msm_host->power_on = true;
 	mutex_unlock(&msm_host->dev_mutex);
 
@@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
+	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
+
 	dsi_ctrl_config(msm_host, false, NULL, NULL);
 
 	if (msm_host->disp_en_gpio)
-- 
2.30.2

