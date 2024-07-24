Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48E93B186
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2B10E63E;
	Wed, 24 Jul 2024 13:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKutBPSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF910E63E;
 Wed, 24 Jul 2024 13:24:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so50885815e9.2; 
 Wed, 24 Jul 2024 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721827471; x=1722432271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=56EW1ghreVxrFRUF8L89H7cqgKAc3/kmAPxfhIquFsg=;
 b=GKutBPStzEPGDjV2Zp1W/e0B4pEnh/GlB/1JPL8VwmWamsSYsQWfH0lD88cpaqSxXy
 PHupkIP26diPSxKmxgx5Cj6OM56yDg6qNFAhdzob1CNFXiVY8/ApsWb4+D/lh7VBT126
 Hz880uuSfOiqKP/MtIW/7PvEUpUu9zEJzwhStuxX0rERiXCA8FmPeaCYitj2wI2QDSLj
 MunLszbpbewdlPrHuMiml2OVmgli+eueqOIIjDMqe0uPbdkLMSB7HXypiYTy/LtkR9/r
 PigyTpIqSb/wh4u6ly/OOj+Dzz4AGA8OWyQqLoTEKhXySfjeDsB09rkz1wMEjrPocRZM
 5a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721827471; x=1722432271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56EW1ghreVxrFRUF8L89H7cqgKAc3/kmAPxfhIquFsg=;
 b=WcIuvCLRMk1ajvyG2Xk9TFC4hNA0sX9lzy3+Ni5zMpb2vSmYQXwmU+rgogedOdRjz/
 XsjfH0weaHEBmzDs2CXgRMzFBHUo1Vcx4ZYu78RQjjANybpMHzdJeqypLYMgMGBuEbFw
 fwMpRlFSKDdQyS9xSbsDO0WNSc8umRWq0lFxeb0SIbD8bYEFybxNoBbWa18kpF+BZ5zN
 BYGzgeibaBFhppdGS3vhK+CwRujbqWTg+ufla8ZilJ7zi8fpd2NgziD4POubMpJd5DR8
 KWdTo/eySY2K+6cQB4SKbPENbm/nOxl2Rj/sglPqZqERnG3Ijk6Qg8ZZ4sHH1wKI7HPU
 kGIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIfdfIuF/A7jpNMIFj6/OgZvHeJ7rtC1M1IFRwPqpzaxAiFnIvBDW/qB3rtCXn5gSNCIPKOx667D2YEm64JFrrEYtMWSVtI11J1hhbNeGc65kdVDQtdQ5ZZckJPwjT07B2ecv09lwEJSqly8NfLw==
X-Gm-Message-State: AOJu0YxsMufMKBqgCsCyMufPu+fPq/WiorUqVV9K07JFVdO9h310hrL2
 eNGQvkyoXsORXzznKv6BY+wrSnVciv1D+hANvgnqXahcm1N+HKAo
X-Google-Smtp-Source: AGHT+IHQ/85EhTrpuufNo5wWg0jwh8u7SIp1MIxenQ7z0d+vfqpSBcNI9sqN2s1gmw4N+9HuBR2EIA==
X-Received: by 2002:a05:600c:1e1f:b0:426:629f:1556 with SMTP id
 5b1f17b1804b1-427f95b2bb6mr15003705e9.31.1721827469893; 
 Wed, 24 Jul 2024 06:24:29 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868bc91sm14351050f8f.45.2024.07.24.06.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 06:24:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "tolarance" ->
 "tolerance"
Date: Wed, 24 Jul 2024 14:24:28 +0100
Message-Id: <20240724132428.2468883-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a dml2_printf message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 0b671c665373..5ba38d51382f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -8267,7 +8267,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
-- 
2.39.2

