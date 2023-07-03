Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DA745358
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F1910E1A0;
	Mon,  3 Jul 2023 00:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35910E166
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b699284ff4so61761621fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344673; x=1690936673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
 b=GNUJ5dx3XGOSECmjT1DMYoW8QGVRluZHuI+0QWBakn+TWkbdgOu+rpcAfxF8NdhplA
 DTBuOcGYSNhynFV+Tt6n6jW1lqrHvrLCK9AwzacU9fjSgfHRLT2XfRaFd2WeMyVnq9TQ
 4a+JAqrHd4xFLhqQ1OazJ1tx/JlyaOuMaHjZ3eJfBWVzx+sLgXpdVvm+hczRgcQQDsBN
 q3Z2u9vjdv2wPsP8WyNWIx4SNwniXKQnfh+1pIN3bwCNJb8slf7d+o3zdZduCI5TMApy
 DlMOLAruegYEbhu5LRY9Js4rRXuj979oQ1juzuiySOF9x9n3L95LqKa9aUBJPEc/xeoz
 GWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344673; x=1690936673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
 b=LUy234I8whBlAFBnQsAMjrCbBF3AKytc3SuqEaOGKxruIKozEe6L8TGb9CedxJ73Hv
 z8tAElbt45oeDXNtwVgT1+LuSpjygxGeady07iLioKxwPbZyLO6iwVIjUzMPvdIiq8cS
 kb+jJ+ycpoaDv4dJ1QegdbEkHw11PqUnH8Cdq8GJ3AzBfL8uDlNywPk4PxOdyhGlt851
 EZr3CqDYauF6wA9wm5OsVT6cMOilPNTAcC1r0ToBCTTjOkaKvPEprce9og5DEiC9Vd7j
 om+2Nd0F+FfzXL3w9G0Vp7XnpM/c77Zv4mRLXVhOQiBcLcxTT2larKWpBSAltqxv99nN
 QuNw==
X-Gm-Message-State: ABy/qLbC5m42KhxOBmDQBLBCeJsgik5aIPkLxSe9SOzv0ov6nT1lq8I5
 vjez4nD7UmHndB/UOcRLNc/Itw==
X-Google-Smtp-Source: APBJJlFvEw8xaJIG4fjGk0k2vy5tuEF7kntjvRGGs5H0vS/etieC0ZXXWlXFPd2CefZs9E4mdiYfSg==
X-Received: by 2002:a2e:9844:0:b0:2b5:86e4:558e with SMTP id
 e4-20020a2e9844000000b002b586e4558emr5513769ljj.38.1688344673460; 
 Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 08/13] drm/msm: remove shutdown callback from
 msm_platform_driver
Date: Mon,  3 Jul 2023 03:37:40 +0300
Message-Id: <20230703003745.34239-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_drv_shutdown only makes sense for the KMS-enabled devices, while
msm_platform_driver is only used in the headless case. Remove the
shutdown callback from the driver structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ee27837516fc..971c008e82cb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1300,7 +1300,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

