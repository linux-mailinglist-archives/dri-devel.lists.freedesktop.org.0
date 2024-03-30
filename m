Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C4892D0E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2910E59A;
	Sat, 30 Mar 2024 20:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cfqg2uMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50B10E584
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:38 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so1314833f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830817; x=1712435617; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hu49pY3Aels4UnjurH0jvHxhGoMk5vz5ZNjCI7/eIj4=;
 b=cfqg2uMRYbY9gC5NOhUBYmL3X1/9surXkzgB7o6D117zWZzBddaEEy/bAI4AD8DpfF
 P6eRcpluOhhof5xJpv/iN4jqwUnNEX2G095mLjmuU2GFSsG8STMWdLopqu+APDqFnBWN
 otdelOOX3OKG0hoq8PJQPqrFdK+agN5as7unEym+v4A04rJwVsskm+UXp6pQQOeSjgMq
 BOHNnzY53lIXtGWbBB9StkvaUD1JjtxxOicKKOMClueLu8cEdRMZCShCpAmQSaEnXJvw
 qc8mxClfiZ5ZtzbQLeVpyG+CQnVJDGT1fg6Er0xz3vE/ded+1uveALcoUiz63FltafXH
 yvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830817; x=1712435617;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hu49pY3Aels4UnjurH0jvHxhGoMk5vz5ZNjCI7/eIj4=;
 b=mTRHiv8XF43RZ9g7+tvLLyeKvbjFy6MctItm7k5c8k+ybMf9gcVVeznSaKbv1CjuaF
 PXMmBoyf6WpFWXYsMpro8P5mL2pPxk32+fTAL6KDFjOOztoRLjrnUPm9Nem9RW28SnFq
 viiEdAjdDTuVGw8HXad2cHF9JmIBN/XmmIYMpI36UNZ/irc90QAHKGwmrszFlwTMPQ22
 c0QE4MexkDmWiNBk64lpoUkUJSuYR9rt75Z0Ys/Y02127BxBA2lVDycfigggPdmI8Tfz
 8uLWuzC4EHCBsJY47a/JU/DbkKidFIzun5rf3Q8Y670j1trfcHUtvKszW3jhDPq1Y1eF
 O2gg==
X-Gm-Message-State: AOJu0YyzT8CO6/ijaYNCLCCUem1nG38XCJqRbwcq/zbouNXCTBn4IRy/
 i1woS0uBceGSKbXwdikI27cBQoYXvCHxVXa3n+D0cmLpuMYCc7Hsi7UTwhEBCG0=
X-Google-Smtp-Source: AGHT+IE9rECqol/JHoBja75sISL7EwdTrwlxgWuq+Lw/21YRJ06u1rzu9Pk0WA9Fli2/BEJ+D+t1Jw==
X-Received: by 2002:a05:6000:188a:b0:341:bf1e:45a5 with SMTP id
 a10-20020a056000188a00b00341bf1e45a5mr4126691wri.46.1711830816802; 
 Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:15 +0100
Subject: [PATCH 11/11] drm/exynos: mixer: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-11-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HQ87N2g+njEbJxhRoLJs9BnoTb4aNANgi6MNopwNwKM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcNDMWmrpKmNr486z5EGVste9lYNNRpzO3wp
 HBQmSyImWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3DQAKCRDBN2bmhouD
 1xjiD/9XOlK5ROkZIz3QuqQjP9yXe0fi4Z8Bt0uuVEKlQbVQE+o68EOjwD/EgfF2YyhA0klD/sq
 raE9q0YOpkj6NBrl/0RnDf9uKoYGIeQq9aXI2LPXyuLoNq/zBQ7hzFZdpLhXGTP2RjaBqJ1A7wp
 p7attUaAZDnnHMD8ddDHiMytrfrcVtAi09tf7XCC5xD1Ksx+ovcu0zKae2VnhCSUXzZZEkxyeJy
 3/tyMB1FjbaBfIaEJOHgJN9egHchSQJV8i9QEO8U2gO+SxMC5w4Ouxu3kdpDvnTnZ41xYkeJrAO
 9cFbUa4WPbkzHb8OiqtIbSD2GkkXeTZ7oNbhs65wbGZCONFNMCY+5ZQ+BamEbJKJp/coG6NfQzR
 J0JAnvwJpahiIa5tAG1gT9+qX88NMk2AvKs6t+4c9c5zQOcfXrXgf0vJH18g20jgmtHRFF0OucZ
 rxRSaESwCWFUgHdTT3YVknwuw4o6VdjKoPc1l0K7jf0XWT/DCC+2DtFAI2tjPOu3CW1Y3mALBUI
 s0vq+jjunsANsAXIuftDoLB864WCNT6S1Tl+s+qKG8Wb1UaLnKkpkGExQQYR/Nudm+h4rZ8uxCI
 tY+wSu6se4fGzQmcHtTxLYwpEbFEidCsPUUsTu8O992i3te1o/oXM28TMKjQvr6AZAuEEGUYkR8
 jIDNMgV3AKn9H7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6822333fd0e6..1db955f00044 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1331,7 +1331,6 @@ static const struct dev_pm_ops exynos_mixer_pm_ops = {
 struct platform_driver mixer_driver = {
 	.driver = {
 		.name = "exynos-mixer",
-		.owner = THIS_MODULE,
 		.pm = &exynos_mixer_pm_ops,
 		.of_match_table = mixer_match_types,
 	},

-- 
2.34.1

