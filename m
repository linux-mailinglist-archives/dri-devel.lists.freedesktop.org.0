Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2B3952CC
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 21:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F96E3D6;
	Sun, 30 May 2021 19:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C096E3D6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:56:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a4so5473577ljq.9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D81tkCGvXzSWAObvwaaOuSmUSpOoTX5y4oeB4l92ReY=;
 b=BLEX8CY4gexNiThfWiILWu6TCNAv3Ps/RTYWT3Z6aPpGd7b5PndGFEU3bnMJCOOKQV
 /u16Pep+mpJdLq8JuKwkTFMuMIcUI4KSDv6B8VF2pHIQFY19ySlbvPxGD77KevNURFvd
 xgl4NZtvcn+HCIOJKpDdiBylUrxhKw+z9GaGtf2ThE5Mh7RtA9AtBH14lbcjpSaKnwbK
 lB9aWQhpL4K5OlTT+Mrhp5smRvc7GHpXUxJDA/3Mk9pgnwrrjWV0Hpex6GCwxilL8etu
 yDH9X3CHhdFJptWTUOwzNtW9P2v1vTE4KV7vEPOlSW+/dTAApr7QqKKGRM48OMSMcOSS
 7+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D81tkCGvXzSWAObvwaaOuSmUSpOoTX5y4oeB4l92ReY=;
 b=Q3ocO1bMDcaMdaZ5BgWUZ6moperAnIzurjvDJ4WslADzOnnwCpbzSx+ScjP9DxTh6O
 hPZ6YCegko22bz7CXQBg11xfk31L+g1AI3UyD/RAJc4vasUm2P66pMscHC/ZNc6zlj3i
 aAxcgJpcwh5Ad99+r8zEKlgmnDljHv+w0CLR0Cg2PvPbjMDBU4ozz3s5jAhT1F2v2Pbg
 piscXdbinTAdbsD9du5GyaPyNyahMQImqtKRcaEGb7QbP+LdRKwQvBRrj7Zqi7tXCnIC
 bDr/jv3IwCOzxR9JAJiF0rnlrb2XpyPtsZpM6GTqlfs5T1pm8w2Z6f2ij3Ph1w4MEf82
 HpPA==
X-Gm-Message-State: AOAM532sYBtYugMjAgKEzhp1Qw/0XUV/F79NDPmmu0r+16FTj/rZ+Xag
 tGrWU9h5kjErJn1+yzEJDupSJ0BGo+0=
X-Google-Smtp-Source: ABdhPJwfr39KewKZkvjI8u/JePNezVfJTcOSzxX02pjxKhqCnMhaT+T4nfJ5zOmjtn00KBp2QEne1A==
X-Received: by 2002:a2e:8797:: with SMTP id n23mr14210761lji.248.1622404601004; 
 Sun, 30 May 2021 12:56:41 -0700 (PDT)
Received: from localhost.localdomain (79-139-170-222.dynamic.spd-mgts.ru.
 [79.139.170.222])
 by smtp.gmail.com with ESMTPSA id z20sm1332398ljz.33.2021.05.30.12.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:56:40 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
Date: Sun, 30 May 2021 22:55:06 +0300
Message-Id: <20210530195506.19124-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The format modifier is 64bit, while DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
uses BIT() macro that is 32bit on ARM32.

The (modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) doesn't work as
expected on ARM32 and tegra_fb_get_tiling() fails for the tiled formats
on 32bit Tegra because modifier mask isn't applied properly. Use the
BIT_ULL() macro to fix this trouble.

Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 87df251c1fcf..0cb868065348 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -25,7 +25,7 @@
 #include "trace.h"
 
 /* XXX move to include/uapi/drm/drm_fourcc.h? */
-#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT(22)
+#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT_ULL(22)
 
 struct reset_control;
 
-- 
2.30.2

