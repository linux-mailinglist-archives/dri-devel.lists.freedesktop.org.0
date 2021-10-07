Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B23424FD4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 11:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21A6F3CB;
	Thu,  7 Oct 2021 09:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C36F3CB;
 Thu,  7 Oct 2021 09:13:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o20so16895592wro.3;
 Thu, 07 Oct 2021 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lAfZHPm4jtOkGy2SMku+H15JbOWOOnI/vRzw8Q2Wn8w=;
 b=nnu+flYw6KehjA0AnrB+6Upq2Mvk9WN1rjgEIqJoZRHJ5ZKCoWBeSntOGMGekMaYoA
 UxYk1Qnbdx7T3t58WLz8OfX5k2eevwl5Vr90XJ0Uiw4W2Gz1pWNOOxtunpFA4scGqFIq
 Iei7uiYMLhg6J/+AlMsDpFppR4LaIk26SM6yaGkEt/PvsakusnoQaF/ZXP4pyOMHsdRg
 l7gtzK/4hz15DP/d8wZKhUj0/hCLBG9o/00+/z7ygwFT7Q5LIk1gtKYka8eBpJP0mizf
 yjfTq14E5tjGcUviOsOSk1pLP3FXEd6CUC+/TsMHpS0mJkGfe3qHB2jeKoa9QPAhddGu
 NHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lAfZHPm4jtOkGy2SMku+H15JbOWOOnI/vRzw8Q2Wn8w=;
 b=Ku+MxCNZ4xiGUVHw1ZhU2lq4h8ZZKPjWmwV+vEuE1PesGGXhB1rjtiWetlH690B/Mp
 8qfnZWLKZvIkCinkk0kzm4ulTZDOOSL+XehaxODnOd8c7XYCCRjQ0BGoFyzufp7pgjz9
 9OI0mNiq8thaA9POqhJG6RbNgwdHubRal1Pi6cojajDGqtL6OMgXdvQr5UrQR2xFqFWH
 d+miztFM0NV+7TpBToSqetRoqMD0lKZ+pFk5u5EfHKQ7OG24xxT2pqPSb8H3f9R1basH
 UXWZmJdgEGxK4mvpSA1lrQZuqH2nalNo/0C7tbjvuO8sC4NAAG+ffzEugwNZRy+jn9li
 ueSg==
X-Gm-Message-State: AOAM533QsF4nW05h8xwPurWBIQKFFMNgY5bH2uqbdbvBVA++XrhaBZzT
 Vu3i56z7CwqR+ClROzg5Ra0q7D2iXMQ=
X-Google-Smtp-Source: ABdhPJyl6MnbMHRfR2/58vL6aCUTq4C+yLB/jIZX9v72Zhg1CL8ze8lGdTWex/DSlKat8IrPyYznag==
X-Received: by 2002:a5d:5250:: with SMTP id k16mr3983312wrc.82.1633598014331; 
 Thu, 07 Oct 2021 02:13:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm8737226wmk.2.2021.10.07.02.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 02:13:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: rdunlap@infradead.org,
	sfr@canb.auug.org.au
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 robdclark@gmail.com
Subject: [PATCH] drm/msm: fix compilation when COMMON_CLK is disabled
Date: Thu,  7 Oct 2021 11:13:32 +0200
Message-Id: <20211007091332.22099-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We can't even compile test without this

Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 5879f67bc88c..d9879b011fb0 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -5,7 +5,7 @@ config DRM_MSM
 	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on IOMMU_SUPPORT
-	depends on (OF && COMMON_CLK) || COMPILE_TEST
+	depends on (OF || COMPILE_TEST) && COMMON_CLK
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
-- 
2.25.1

