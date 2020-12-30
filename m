Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE32E7F6D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B0389B3B;
	Thu, 31 Dec 2020 10:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321489056;
 Wed, 30 Dec 2020 15:30:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cw27so15742423edb.5;
 Wed, 30 Dec 2020 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34sdCTMrNUObLPeLZuPMjVUhdN1zCiYujY6a/wW1ipc=;
 b=bt3oJcCNtOW3cWrm50FMG+rjfDl+IXCXWBtd5YDNz+/SbYjQYkue7+pUezRIOa0hTW
 HhcYTecp87p8ebxL7RLEOQ8bp9vtbe+L/TInVLvKKx7G77cG/ZHA4IP4wQB3pwnTsRj4
 KDkEkNH8gwFXCJoqhLcTD1KhHYoRW9VJ9avTV/mg1B9d4lwacnrJly4NyIbhDV2i8Eoq
 0oM+DR9ZHpVy1yRH+7rYrt5o47uSe8m3Rb4Snn0kY0fp5y+zUC6pDBWi0zL5PFtOFVe5
 tJhoPsmlPYZkY+QchldNivTAAvAp7ODD+tiUG35Wtol/D4mr+3244lX8TeMHm+yMUG4L
 AJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34sdCTMrNUObLPeLZuPMjVUhdN1zCiYujY6a/wW1ipc=;
 b=VbuANEAnWp2gWz6aqzXqV21Bu2H26bdLHBEa/tDCBsfYIvfQf4Vm2ND7UKK86lq/pK
 /rP+TFQST4xnIfIIPrLgq4ki2sKikOqmo4EKVhZSdFsjWnU9+BN8I44BaLurMblV0Kkf
 yiFdIxjBYTspy+4nfupatYnriKceNn2TV9kKphwU2LgCjv1YlovS0AMoF7PIAX2Hng0R
 JzT+F0S9EN2tjFJdmWCzIMcdPlrBbVSnaOFf2ESGT9ih4J38FJa0uWYPiiasMQPChl/i
 AHSj3rb+XZTCzx0E5//4dCY6o3GV8zeUaj3EmlpmPlJfYyIVoJNtkHlx5IRLXIFPA3g9
 vDCA==
X-Gm-Message-State: AOAM533S5K5dyX3XoRDCJaUx+HP0EJ/1OiaUwoZLQaGlEEm2tml7AUUa
 3VjFC2A5KmRemhlgQ2rHtqCm+EBZheegnimM
X-Google-Smtp-Source: ABdhPJwK7Gav6N/d5gKjfxc10ZINhRcsguTBCZmmG/0yuTe6suMA2Y19hrEBCWuQP4axLFc51DDVCg==
X-Received: by 2002:a50:c315:: with SMTP id a21mr51111550edb.50.1609342203425; 
 Wed, 30 Dec 2020 07:30:03 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id r7sm31630588edh.86.2020.12.30.07.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 07:30:02 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
Date: Wed, 30 Dec 2020 17:29:42 +0200
Message-Id: <20201230152944.3635488-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>,
 Craig Tatlor <ctatlor97@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Craig Tatlor <ctatlor97@gmail.com>

vram.size is needed when binding a gpu without an iommu and is defined
in msm_init_vram(), so run that before binding it.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 535a0263ceeb4..108c405e03dd9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -457,14 +457,14 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_init(ddev);
 
-	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	ret = msm_init_vram(ddev);
 	if (ret)
 		goto err_destroy_mdss;
 
-	ret = msm_init_vram(ddev);
+	/* Bind all our sub-components: */
+	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_destroy_mdss;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 

base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
prerequisite-patch-id: aba6f684932cab35d98457c21e4ff7a5ac75c753
prerequisite-patch-id: 4884d57df1bd197896b69e115d9002d6c26ae2e2
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
