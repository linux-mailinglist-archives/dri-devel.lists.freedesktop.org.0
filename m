Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E602875DC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 16:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7442D6EA64;
	Thu,  8 Oct 2020 14:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528C6EA67
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 14:17:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f21so6632697wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zJluAbiLYKXPtNojcpa58wSPE+smR+xHU3IRj+ib1Us=;
 b=UrL9DY8cY2lFuaXOufBSi5ViWUeBe5S6uSGJAnAp2WdUeOoKaPy2qaS+rANexdnV9K
 lYZ/Px77JgA5SG+qvaIim88I+J9flXuyZdXrqZFEC5Cd7kkFqMD+P9MUYejn2sBjqr+j
 JK2yyQTsTM1xSHH2ha8OWEbcXsuHHPJ9rFBT75vwDQw+gkcsaPUn82cIAZFYDFLKE1Ye
 xJM8Slmp1x2rJQtlsdcGzPPxMD5Nkjyk5EEFFKyi3AdypLEYV7ZqKlyMeP5yTUg3H7Af
 ESXMsRjSpPoCBjKieiaJd+2r4tQy+AB7gT6bdKxJZzewPRSrM98TRz3af4UGw/yMAyMK
 vsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zJluAbiLYKXPtNojcpa58wSPE+smR+xHU3IRj+ib1Us=;
 b=mqZWvx+8SlJ4qkB6xXJibp0Ew/bHICOxd4Oob2DWiWFKqg6EAKErwlbWLGdoaJW7Ci
 pz46/ljEq4yc530HCESU4IXH+sacpw//31VdhyEtHjzwT3mWiW4jvx0hAs5mc5vZWOSS
 QoRo60FLQE+iQvioDvtaiB+41knyvo9DapkkG33XNbQ/jmjVWAMv4+Vd/20Kco4BeXN2
 Cnl3+KpsWl8MKHSzi3XOaChEl6frdjuggLB5wX1FpB6miSGnSvVULXuM88lPaln0OuWD
 AbYJevgxrSISAVnsC0P0b10hErGqsGJ8M8jSLIXqTlJ76rrvs4NVT6kTsd4qKf4YmocY
 z7CA==
X-Gm-Message-State: AOAM530LljIwXSr/mWiHMM62KF2qSbZyfO+bNS+inOFcz9oEvxng2TY7
 JqdjDLZ5F05XE3/sC1ia0AU=
X-Google-Smtp-Source: ABdhPJxGaBAS7vhNVhl+YJzxwfGh3//smoQmnJlWI+XeaKkDm79BSomvewfKz4GXArhthgaSSFLcIQ==
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr9215680wmj.150.1602166663999; 
 Thu, 08 Oct 2020 07:17:43 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 4sm7985982wrn.48.2020.10.08.07.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:17:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: increase readl_relaxed_poll_timeout values
Date: Thu,  8 Oct 2020 14:17:38 +0000
Message-Id: <20201008141738.13560-1-christianshewitt@gmail.com>
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amlogic SoC devices report the following errors frequently causing excessive
dmesg log spam and early log rotataion, although the errors appear to be
harmless as everything works fine:

[    7.202702] panfrost ffe40000.gpu: error powering up gpu L2
[    7.203760] panfrost ffe40000.gpu: error powering up gpu shader

ARM staff have advised increasing the timeout values to eliminate the errors
in most normal scenarios, and testing with several different G31/G52 devices
shows 20000 to be a reliable value.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Suggested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index e1b2a3376624..2aae636f1cf5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -325,13 +325,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	/* Just turn on everything for now */
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
-		val, val == pfdev->features.l2_present, 100, 1000);
+		val, val == pfdev->features.l2_present, 100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu L2");
 
 	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
-		val, val == pfdev->features.shader_present, 100, 1000);
+		val, val == pfdev->features.shader_present, 100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu shader");
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
