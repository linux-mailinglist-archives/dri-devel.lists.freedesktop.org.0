Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90801204BA9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D557C6E971;
	Tue, 23 Jun 2020 07:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A8C6E172;
 Mon, 22 Jun 2020 20:31:34 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q19so20916069lji.2;
 Mon, 22 Jun 2020 13:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8HniiSVoKsGZ/ERECfPVj/nc7IWNw6qhcYKMolA91Q=;
 b=cDfecMW3tebFBqR18eMoifsZCGh7ewmXwwt/0eZSXledHbudNWtONwD4S2457wrW/G
 P795i+WjTLCskYVTqLZCFaHLInib00p/RLubp5eW1qen0PgGBvh0jNNn/hdWTgfJjxmb
 BvAA+Bg9iyEHKvcL0yHhzOqocRJsEEMMTMvfaPVKW7FZHnlFmRtQ4uDynYFHO9bURdHP
 wgLARxWiyIhZs7vmAAWGvF8A2Rf0A3OLbmiJCWpDlak/635f8FiE3uFd5MCTuYtLW2In
 o3svn4VxAXnJy5Fh80SsG/I2qzraddXf6BWwqHMv0Z1Hgi//1Px1XZLW8u+oXtaCGbQm
 cZTA==
X-Gm-Message-State: AOAM530IeAAOvO2qYKXaVRn6AXVRbkiE7rHvppbKIiaNLrzsB2kvnBPv
 chaVV53WxY8UktsCowjuP54=
X-Google-Smtp-Source: ABdhPJz37T3KcEtin9mmO3jL3SyxSsPs1OmE+fOB967YPMpslsKyG6O5PxGgCQv2SwoUzBV2/HHFfg==
X-Received: by 2002:a2e:9a08:: with SMTP id o8mr9066001lji.126.1592857892366; 
 Mon, 22 Jun 2020 13:31:32 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id y143sm2577314lff.88.2020.06.22.13.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 13:31:31 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/radeon: fix fb_div check in ni_init_smc_spll_table()
Date: Mon, 22 Jun 2020 23:31:22 +0300
Message-Id: <20200622203122.25749-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Denis Efremov <efremov@linux.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clk_s is checked twice in a row in ni_init_smc_spll_table().
fb_div should be checked instead.

Fixes: 69e0b57a91ad ("drm/radeon/kms: add dpm support for cayman (v5)")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/gpu/drm/radeon/ni_dpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index b57c37ddd164..c7fbb7932f37 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -2127,7 +2127,7 @@ static int ni_init_smc_spll_table(struct radeon_device *rdev)
 		if (clk_s & ~(SMC_NISLANDS_SPLL_DIV_TABLE_CLKS_MASK >> SMC_NISLANDS_SPLL_DIV_TABLE_CLKS_SHIFT))
 			ret = -EINVAL;
 
-		if (clk_s & ~(SMC_NISLANDS_SPLL_DIV_TABLE_CLKS_MASK >> SMC_NISLANDS_SPLL_DIV_TABLE_CLKS_SHIFT))
+		if (fb_div & ~(SMC_NISLANDS_SPLL_DIV_TABLE_FBDIV_MASK >> SMC_NISLANDS_SPLL_DIV_TABLE_FBDIV_SHIFT))
 			ret = -EINVAL;
 
 		if (clk_v & ~(SMC_NISLANDS_SPLL_DIV_TABLE_CLKV_MASK >> SMC_NISLANDS_SPLL_DIV_TABLE_CLKV_SHIFT))
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
