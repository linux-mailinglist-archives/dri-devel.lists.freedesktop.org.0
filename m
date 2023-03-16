Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C726BC8E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B283110EC75;
	Thu, 16 Mar 2023 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C16D10EA57;
 Thu, 16 Mar 2023 08:20:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id fd5so4271368edb.7;
 Thu, 16 Mar 2023 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678954840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DlrKU6rn07geT4orfWdVqlLTnDffT91o3x/NRA6aKEA=;
 b=grkOBJ4PMpUfKDOH/B54W3YNOiSv+U7IG/JtfNxIeJGwTeWrqhBPf7kSOvyYkxQGij
 98TC3DOqOgb8fZQ/Y8cyZee/mR1xEA6rPcaToYACtLlYbNOosaxyR5azFpt8PkZjzrjY
 vlccoB2U/Blrl77wb+XTODoX1A2Zui+tScOl5koDons5l/liL6Gdac8KcE4kA++Aqy3h
 8LUU0Izg6xxHcnlE5locs9dqGe77GV36uExYiqhbE5/ehY/cef4stUUacw8XGV10eYHB
 NxsLQma2c/Qguk0jc+Jptq7LlFbgkpvwtZMQ8APd0TwsgYTnz/wMXTPg++5qzzZsK5gu
 TvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlrKU6rn07geT4orfWdVqlLTnDffT91o3x/NRA6aKEA=;
 b=GiYoNF3o1/3yTuqT8j1Oy2nOhLEZTYahJ4T8kR1KahlS0stDDqFP5PhxRCeWeOz/YN
 hVwugjZGiSZKjpDMr/nrRsZGVyMc+sBGYZjowqHaecbmQq7rGs3yqTEb/g4vClrCKEda
 c3cLEruKTheJylX3eHshroMNoLpaFWqQChBkx2t17TlIrhdA1mXSi9GZ8mgu/OoPqsqN
 2F0vWIgFIob3xZTXeRcmhdCx6i4XGXc5sJcRS5Dwklre4OBvTvMBE7CsGL1bF+MgFBfj
 y6yfsbTv5TiFYqOsRvRNqxG64u6H8oNCfpfkGAEDjF8jegb4YKRLjlSYgmapC75EFQAG
 0FtQ==
X-Gm-Message-State: AO0yUKWCNwl0/zZboaQzwO1FXrVO6gdi19jQKJ0knHrLOrqUzxphsVZa
 QJ4c1tXeVJYFBiNXEZpYttE=
X-Google-Smtp-Source: AK7set/+dtb74NWwE+PbivcsPY7msFhZNtQAagoHQFczib0+AKjLgfFgjCJYK9Bi70VMpofsyXpyPA==
X-Received: by 2002:a17:906:8298:b0:8af:2b57:b80f with SMTP id
 h24-20020a170906829800b008af2b57b80fmr9090556ejx.55.1678954840655; 
 Thu, 16 Mar 2023 01:20:40 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm3519895ejc.83.2023.03.16.01.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:20:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/tegra: allow compile test on !ARM
Date: Thu, 16 Mar 2023 09:20:30 +0100
Message-Id: <20230316082035.567520-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316082035.567520-1-christian.koenig@amd.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
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

This compile tests on x86 just perfectly fine.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/Kconfig | 2 +-
 drivers/gpu/host1x/Kconfig    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index c36323f1c7e6..56453ca277c2 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 1861a8180d3f..e6c78ae2003a 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -5,7 +5,7 @@ config TEGRA_HOST1X_CONTEXT_BUS
 
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
 	select TEGRA_HOST1X_CONTEXT_BUS
 	select IOMMU_IOVA
-- 
2.34.1

