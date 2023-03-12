Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F86B6B3F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDC910E40F;
	Sun, 12 Mar 2023 20:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62010E288;
 Sun, 12 Mar 2023 20:42:38 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id u5so10834500plq.7;
 Sun, 12 Mar 2023 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRudoYKJ/9RBEgJ+2j3GsDNIAjaLf24fOR0Git+DXzM=;
 b=jQHWp50cIbgFsYptQZpllmJz454EJw91wUkU36Mtn+BFjJ1KkKFlXKHQE4CD2k3fqt
 R9w6zD1Ur0ZYjqP/HCptWfNuORhvp3bVnDdWgVPsSOsdkGEpFTTekL5GIBo8YkcCThxw
 KJmK2CNRlazKs/TjnabSUDXQm196ZmaPE6stbW8BjE8IDd9fpZoIqdjlZRCFMJYGlHEF
 ds7/zOB4Vodj7eVo7sWY8eezHGBmQy0Qc9g6l536lL4gHdSZl1itSm7OrpLutDqq5vac
 fHHRZ8xfjqfsomr0xZPrKu3bg6VFI83riSU4X6El/VahepCHA59roZlre8XRJzmdseIc
 wfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRudoYKJ/9RBEgJ+2j3GsDNIAjaLf24fOR0Git+DXzM=;
 b=rWkGcAsXmxc4JmzGiUNObfw0LNLoyiRNY5BhZilQxAa3dt89guYAjOtUsvfJEwvJsL
 fGzl1rPHxA/12fZkp6W8p7AcyusIV5ir8E+lroBLG7YqXE703Vh/hT6RFeznWe8e69BJ
 hSTqeAVjVmLFOm5Ge5oWxtQNvCaUVeGWyjlFaqMLxHS8DQNV95e4ajm99xkdIgZSZOm4
 htIRZo8fdm9lBNf0vUUMzIQ9hPGFjs7bu3W/1l+4n4BzBEK0+iO/eIGV0Ac7SnkShHiD
 E9sBESBQwAnlO5Ot/10Cn8/LlXvLGEeBqxdmvZz4OCT5UEaCijjR9WNF0qRb+2/MWxtx
 Ra5Q==
X-Gm-Message-State: AO0yUKXXPse+5TA20PjOMtYR0teyd80Gd1wmkIzbPjsr9zGJH+mazp8i
 NmGsYW0lwHYfGFNvSizGBh1ofDSop+M=
X-Google-Smtp-Source: AK7set8yV2BoZ9JJxlsH9b0dOMTtNPJpLetrWEzDudK0gwZElbsqmXNI+JUw9daPKMtYln8cw4MD0g==
X-Received: by 2002:a05:6a20:4930:b0:d4:78f7:c4e8 with SMTP id
 ft48-20020a056a20493000b000d478f7c4e8mr550004pzb.25.1678653757748; 
 Sun, 12 Mar 2023 13:42:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a63ba5c000000b00502fdc69b97sm3177777pgu.67.2023.03.12.13.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] drm/msm/a6xx: Move ioremap out of hw_init path
Date: Sun, 12 Mar 2023 13:41:33 -0700
Message-Id: <20230312204150.1353517-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move the one-time RPMh setup to a6xx_gmu_init().  To get rid of the hack
for one-time init vs start, add in an extra a6xx_rpmh_stop() at the end
of the init sequence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..30a1bf39ea83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -621,6 +621,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
+	a6xx_rpmh_stop(gmu);
+
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -753,7 +755,6 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
-	static bool rpmh_init;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int ret;
@@ -776,15 +777,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		/* Turn on register retention */
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-		/* We only need to load the RPMh microcode once */
-		if (!rpmh_init) {
-			a6xx_gmu_rpmh_init(gmu);
-			rpmh_init = true;
-		} else {
-			ret = a6xx_rpmh_start(gmu);
-			if (ret)
-				return ret;
-		}
+		ret = a6xx_rpmh_start(gmu);
+		if (ret)
+			return ret;
 
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
@@ -1633,6 +1628,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Set up the HFI queues */
 	a6xx_hfi_init(gmu);
 
+	/* Initialize RPMh */
+	a6xx_gmu_rpmh_init(gmu);
+
 	gmu->initialized = true;
 
 	return 0;
-- 
2.39.2

