Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5E487447
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15811AE8E;
	Fri,  7 Jan 2022 08:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837CC11AE8C;
 Fri,  7 Jan 2022 08:50:33 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 200so4943041pgg.3;
 Fri, 07 Jan 2022 00:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=IQS4J/qtHwJGGOnAQs0o0rtK4NFNyvH92Ln82XpYq1E=;
 b=BR9uftG+cCtV8P36GOU+YlObjfqGNjV8mIZYTwYw5+DCzL+BOwdPwVbM3W2Gruavzu
 32qKXVL3Pm05dggOZeyGMYvmCVPqcnm644blBcdbV+bKenZmugHuv991x8t0KfqfwIQV
 72D0fgW9hmUTsgWjbgKZS4YCyBQ6kgfjpKzcwJtq1bvHQx4X4zTIOnNbJAxtClRLGJZi
 1zSj3Oy67PRKgvBwhkJl8UPb6juw9oepXa+8aF6xLEm5RXNB/y3goROq2NB66Nv9KWMr
 AfoSW1ItYV32P/T0irVa6Bw4SK9lVifs8P2m69RBE0IXafbaxoNuzUp8px1kY9ZYE5wB
 Mxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IQS4J/qtHwJGGOnAQs0o0rtK4NFNyvH92Ln82XpYq1E=;
 b=wf5CI8VPM6bHoHRtBEPOx0AQIf0XhosqVc3BNma0qxRRoDEkyq568gIbLY+TVsfPX+
 VnwgyJV7LH9WxNO2iXDprMhyMj49G5cRuE4XMwCuQ3mo1+G0g0+c5xP+94D+QDUHE0ML
 DTb1IzQGcF1XquRIkcej7IsaIPx7PsLmj1q3Vy15YxrlispkD6m4uC/3zPXC73r7JiWr
 9kFNZwSgWjv0mIkmzNrGPRFrHHJ/gXBiVCvRxVYuSAe/Gk22ZephOj8xGQlEMAxAhLjm
 2C8JbnHRxwvgRovDf0f5Ottg04g3e+XUY2XmpBuEaA/NrbvCixBRpEqfiCJ9FDl7KPr5
 fOMw==
X-Gm-Message-State: AOAM5314XTJzVeCNOlIDkrUaBI0qwlvbOcfbD5Ov2dsnRnvSj7EUSv7k
 SSuJVsIIzrO1r86M4t99h0g=
X-Google-Smtp-Source: ABdhPJzrezcJmoyT8I5bb9IzMr0GwT31Qhm2NI7Dx6C7H3w2cx5/PuMuN/+otYHv28cEYnq5kQUd5w==
X-Received: by 2002:a63:8149:: with SMTP id t70mr55367147pgd.71.1641545433164; 
 Fri, 07 Jan 2022 00:50:33 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id f20sm5167583pfe.166.2022.01.07.00.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 00:50:32 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/msm/hdmi: Fix missing put_device() call in
 msm_hdmi_get_phy
Date: Fri,  7 Jan 2022 08:50:22 +0000
Message-Id: <20220107085026.23831-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: freedreno@lists.freedesktop.org, linmq006@gmail.com,
 David Airlie <airlied@linux.ie>, Jyri Sarha <jyri.sarha@iki.fi>,
 Archit Taneja <architt@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.
Add the corresponding 'put_device()' in the error handling path.

Fixes: e00012b256d4 ("drm/msm/hdmi: Make HDMI core get its PHY")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 75b64e6ae035..a439794a32e8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -95,10 +95,15 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 
 	of_node_put(phy_node);
 
-	if (!phy_pdev || !hdmi->phy) {
+	if (!phy_pdev) {
 		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
 		return -EPROBE_DEFER;
 	}
+	if (!hdmi->phy) {
+		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
+		put_device(&phy_pdev->dev);
+		return -EPROBE_DEFER;
+	}
 
 	hdmi->phy_dev = get_device(&phy_pdev->dev);
 
-- 
2.17.1

