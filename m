Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C94F9E9F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 23:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88B510E683;
	Fri,  8 Apr 2022 21:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EAA10E68A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 21:05:55 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso6921883otd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6bF252QqnY12H7PjXHxtHVXzmjhuS4IY4ywpEiT3F4=;
 b=bX3q3cffPSL7HX15VA0/7vcodNKzm9GcJLAGtQNZRrY/jo2zHyo67+eaqjF0TZuH9O
 UJs47CoLQXfKzFmbPYXlgUIQCeaixSBKNKxng6izLWyH5UXqPjSh5AfIq63mYDGW9ITF
 QdxLQnhX09H/zcdLRTK8kByv5nsZFMrOYPz0YvTg09r69NMRQq5ZfM7M5STkxl+VgHp1
 lCKElw75Tn3au3nk1577813tB9U6jNKrH8T7/zpHn8Ku698P0kl8qOWNH6CHOKjIs2EP
 sALiAz/v/AkLsOcSBwh7AiIfkT6X3rtmsTfo1iJlHOn31PvJITVuFIkvKtoO09ysM97d
 klwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6bF252QqnY12H7PjXHxtHVXzmjhuS4IY4ywpEiT3F4=;
 b=GoCvIvfibg7I3gl5yqxDF/VFn274UQBDsAUSji5q8sc+E4K4TgWoFxIGOp9Fy3/NQl
 6MM9xd84X1Hu9akHocPxzeWY6UnuDaWKA6TsvMuK2KPhDm6Cb0e8ZW1vgheG5NUH1YIV
 gsStRj1EExeqxOpbO2st5Kc2HCrDCLFP/LHjGeLb2fCe8mleFthCKQrjXkFjuVs3DKUn
 Tw3wxwAgvxznE6TKQESiFd0+D/P/xmoI5cyoQUwqzOmWG4Ry8iWTXKFXfoOVM+zU+GDI
 AE1ei5ev/nGe5oOnYMKqUXCFvGteE0fZJsjUX+WeF4PE0qf9myTdkrVkH8b7t36kXWgl
 Wmcg==
X-Gm-Message-State: AOAM533kTqFLiUOoGW81s/NGPsUD3ESCfRNilp2M1v47F5LeIM/h7j4S
 Te/PiLB/GEyeMFCS7jUSsrbuXw==
X-Google-Smtp-Source: ABdhPJzyHOxnC2y32CYITmSfyBZzFVbKrQ+pRvockWV4jxLwEx0YqRBgTITQPSRrQgGmtquEJ4txBQ==
X-Received: by 2002:a05:6830:1605:b0:5c9:4fde:ba63 with SMTP id
 g5-20020a056830160500b005c94fdeba63mr7352822otr.84.1649451954926; 
 Fri, 08 Apr 2022 14:05:54 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056871011200b000e1f5910d45sm6560356oab.7.2022.04.08.14.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:05:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 2/2] drm/msm/dpu: Issue MDSS reset during initialization
Date: Fri,  8 Apr 2022 14:08:13 -0700
Message-Id: <20220408210813.581391-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408210813.581391-1-bjorn.andersson@linaro.org>
References: <20220408210813.581391-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's typical for the bootloader to bring up the display for showing a
boot splash or efi framebuffer. But in some cases the kernel driver ends
up only partially configuring (in particular) the DPU, which might
result in e.g. that two different data paths attempts to push data to
the interface - with resulting graphical artifacts.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch free handover from the
boot configuration to a running DPU.

But as implementing seamless transition from the bootloader
configuration to the running OS will be a considerable effort, start by
simply resetting the entire MDSS to its power-on state, to avoid the
partial configuration.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Move the reset before the probing of the children, to avoid issues if child
  drivers touched hardware at probe time.
- Extend reset assert time as the previous 1us showed reliability issues on
  Lenovo Flex 5G.

 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b10ca505f9ac..6f921910d0e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -3,10 +3,12 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/reset.h>
 #include "dpu_kms.h"
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
@@ -197,6 +199,32 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
 	dpu_mdss->mmio = NULL;
 }
 
+static int dpu_mdss_reset(struct device *dev)
+{
+	struct reset_control *reset;
+
+	reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (!reset) {
+		/* Optional reset not specified */
+		return 0;
+	} else if (IS_ERR(reset)) {
+		DPU_ERROR("failed to acquire mdss reset, ret=%ld", PTR_ERR(reset));
+		return PTR_ERR(reset);
+	}
+
+	reset_control_assert(reset);
+	/*
+	 * Tests indicate that reset has to be held for some period of time,
+	 * make it one frame in a typical system
+	 */
+	msleep(20);
+	reset_control_deassert(reset);
+
+	reset_control_put(reset);
+
+	return 0;
+}
+
 static const struct msm_mdss_funcs mdss_funcs = {
 	.enable	= dpu_mdss_enable,
 	.disable = dpu_mdss_disable,
@@ -210,6 +238,10 @@ int dpu_mdss_init(struct platform_device *pdev)
 	int ret;
 	int irq;
 
+	ret = dpu_mdss_reset(&pdev->dev);
+	if (ret)
+		return ret;
+
 	dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
 	if (!dpu_mdss)
 		return -ENOMEM;
-- 
2.35.1

