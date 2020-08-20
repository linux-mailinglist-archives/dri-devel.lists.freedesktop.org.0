Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9124CE92
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F67C6EA9F;
	Fri, 21 Aug 2020 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6E6E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:36:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 185so1331941ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
 b=MLkiiqpTIK0T8bIG8a7cw3MlTUto09mHqhVzUWPfnkk4OxAgoe4yk5RS+KzyPkc0rV
 fSzxXaaHo2Ohq+lyWw4WVH93TRgv0UhPZUicHg09AtCULq+HW79090fk/I68wSIlGQG2
 2YPoUJB+09rDM1BounEJ/4DbnRsg71ly86n0zyynHqByO23KsJ1MgRQ/VchwqV4iuXtR
 EPP+1nsst3H0kTK7jgtwccEi40dav3czNwj4Djj7S330dhKMPaA5ZW7WUY6bzUnGclve
 uVQdReKKsIlH6FcLOEOc27TBBv89loXlhqZcWAYQOMFu+5mX+RGolF/sT/kU6WzuEh1Z
 mtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
 b=HVz/tis4JkLrLbgdaROd5CA8LCMDZXEphhebMXr/4IzwfwiBnoPPpwouTyb/z3v/cn
 t0n8hxSEGJKv38FWfCqaZreGsM9QGA35bnwoIqCMclITZ8fXROPjto2lxTWgDTCvd/mP
 h0Sbfev52TfI3weZGTOvpTH/WwOvIGM1bvm6h6uk1EoaF9TfFeH4uaKK7K20OME2+b3E
 6kga90WEetlROxA31wibb9d7XLC7+1KEcAUelhLkcSvwJWKz2aizUMT6z9EupSjQBWc5
 WtVqfhHtzGZ85b5B/65d6lE9benYINcPM/N/FKtxFIzvsq2lqr6vbYoW2fV9uZ2QQjQo
 h3Ew==
X-Gm-Message-State: AOAM531O5POPiMnKnGNx9RXOlvK9L5l/Klyh3pmwtnkQTIkrMVMYZQNM
 t9FpRhf49emNzFEQ48/m7zJWQg==
X-Google-Smtp-Source: ABdhPJzkrJAsNCFVlqgWwzF85xdP8TGCbYUj+sMOPyxm2W8leLqPgVkA3ZiRvIiKvXe8klbPf8wjPA==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr1262048ljh.198.1597916184580;
 Thu, 20 Aug 2020 02:36:24 -0700 (PDT)
Received: from eriador.lan ([188.162.65.245])
 by smtp.gmail.com with ESMTPSA id o1sm341811ljc.3.2020.08.20.02.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 02:36:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: fix gmu start on newer firmware
Date: Thu, 20 Aug 2020 12:36:22 +0300
Message-Id: <20200820093622.3801751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New Qualcomm firmware has changed a way it reports back the 'started'
event. Support new register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..0df56292e227 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -204,6 +204,16 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
+	u32 mask, reset_val;
+
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_DTCM_START + 0xff8);
+	if (val <= 0x20010004) {
+		mask = 0xffffffff;
+		reset_val = 0xbabeface;
+	} else {
+		mask = 0x1ff;
+		reset_val = 0x100;
+	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
@@ -215,7 +225,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		val == 0xbabeface, 100, 10000);
+		(val & mask) == reset_val, 100, 10000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
