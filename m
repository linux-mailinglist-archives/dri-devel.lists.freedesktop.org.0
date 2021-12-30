Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E81481A21
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 08:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4A710E13C;
	Thu, 30 Dec 2021 07:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8AA10E13C;
 Thu, 30 Dec 2021 07:09:50 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id w24so17631196ply.12;
 Wed, 29 Dec 2021 23:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=ZDP2T3kEdA2Z/HSfJU3quwQVcpsj6OKL669wXFyJOLM=;
 b=ewFBGrrBkM1b1Tm+9/Tfx0/jdnhhjHUmqN2gPCUfoaIQiudnZP/aHzudqr0wsCP8aQ
 rormtM95j8BEp56u+2L+GF4D3FjPjcn1CSbQzU9UcbEXBZ/Po2MLBtH8STz9EiTk6vmn
 ozXz9s1afuD1u/5C9jV+0eiG5+aqTim261vL0eh2HAdfDULaO5th6A6024sSxM6o97Aa
 LJbiRLmRMETO6TQMR7imF/w7tgASINZQOXVtJ2VMQHjHafd+HpGPLT93RdWgc04k1udX
 sL53h+kRamfZtJ9pSSKuzzzCa2P96TKD/393I4LXYaULqtE6RGMpE44hI8TGAmxNkuS+
 Kh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZDP2T3kEdA2Z/HSfJU3quwQVcpsj6OKL669wXFyJOLM=;
 b=J9uiLoxwld9Fxmor0WZEOgadKa3SlGwTuBa0G7Ngni/O5MeMLsc6DO5CdY+5XkGIxD
 d5epgWa35TpFvFPMnvrPByXNoOsW6Hoi1Ysry49f3oEKtPfB8yU5UsMYf29hcqOBNlP+
 mrIH+I4Y3mqnlh8QUkcFlv0SooAl/pvjviR38IQfuJ0QWuk8iqFJO0mJs31tXf78YWg3
 /LFFcMPo3uV20IstRoK1+Br52tmcQAtdJRraAih+2c1T0G+q4AFVJfEBUUnJZ0uztHbQ
 efjEzHlWvF1fEXYhhsOc9ejmIoDBEZ/tmRXGa/OHEQtGh4VIMCqoWoqiVg6IS5DtJnKB
 c9vg==
X-Gm-Message-State: AOAM531asI9NMg2uj0qW/i0BTg0tt7D2z3zqC/AlAtuFsS/JIOLm41YU
 jWTITzA1iNLwbBokxkgsTa4=
X-Google-Smtp-Source: ABdhPJx3W4rYV1Sq+P6R0r+0aSLlg1TI58NlfVsAeHyTkdba/dBdZqLjrK02fPkqUSdPeo9VzcuRNA==
X-Received: by 2002:a17:902:c94f:b0:148:d23a:c88e with SMTP id
 i15-20020a170902c94f00b00148d23ac88emr31023765pla.26.1640848190523; 
 Wed, 29 Dec 2021 23:09:50 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id x2sm21640486pgo.2.2021.12.29.23.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 23:09:50 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
Date: Thu, 30 Dec 2021 07:09:40 +0000
Message-Id: <20211230070943.18116-1-linmq006@gmail.com>
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
 David Airlie <airlied@linux.ie>, Hai Li <hali@codeaurora.org>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If of_find_device_by_node() succeeds, dsi_get_phy() doesn't
a corresponding put_device(). Thus add put_device() to fix the exception
handling.

Fixes: ec31abf ("drm/msm/dsi: Separate PHY to another platform device")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75ae3008b68f..35be526e907a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -40,7 +40,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 
 	of_node_put(phy_node);
 
-	if (!phy_pdev || !msm_dsi->phy) {
+	if (!phy_pdev) {
+		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
+		return -EPROBE_DEFER;
+	}
+	if (!msm_dsi->phy) {
+		put_device(&phy_pdev->dev);
 		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
 		return -EPROBE_DEFER;
 	}
-- 
2.17.1

