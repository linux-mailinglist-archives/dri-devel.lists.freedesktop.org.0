Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80611932D8D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 18:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E460210E7B9;
	Tue, 16 Jul 2024 16:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XBQd67L4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EAC10E7A3;
 Tue, 16 Jul 2024 16:06:36 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc2a194750so23467185ad.1; 
 Tue, 16 Jul 2024 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721145995; x=1721750795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u6pCZR4wcgR/cYxgBLBcUrNbMm1B/HCdSgGHK6zUJlk=;
 b=XBQd67L49XdhWnO35XH3rl1FTeRuUKybPAHDn0zTpG0nz3+j/cztA8IztZpzBcwrpK
 2BeDHrWQtegNUvQkcTFNdVx64ikc2hyxX4/UStoiIrrLLGGmEC/NRkS1nAy9rxN0r2My
 jAXOGubg9luealfvt7oA5bHWVrJXbqPbwqhgY0dMSXHtdUhDGoj1zXdZ/fflTeH/Kkm6
 fe2DYK3xRtvskKAA7oNd3XT/HpNXxF+iFkvlqvdLYVlJAK0RW16Ecn7Mfbw3UsHSyJeH
 zFSK9ydvC6X8X0hVO8lgLiTgo2R+SXADQi6pfMCRAmb105gfa04OxN5D2aC9YJ2wQsGq
 32Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721145995; x=1721750795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u6pCZR4wcgR/cYxgBLBcUrNbMm1B/HCdSgGHK6zUJlk=;
 b=nB1+5po3NXJZ/iZEUwNTZKOefoAsDg4IO4ZawsBupCEujHtwFjUmO+ghly/GRhb0q1
 b0rfU4vcIlgdFUrvio1OCK+/HHFhSUVb7+XINRSJbEap5Wr2vB80kK2L2ixZlSIQHk8f
 Ex8W/0sSycmQb8zTrM8VQRkOYmuS4hIW/7m6bPVd+93RQelPLva6T3liuLeUTIIKUuBL
 /oOCO5PTG6oZh/ZWjjYYxn9qa8JU6Kzr8mkFpSWhmbUFWUJdwgUQcNwmVzCFMK5utzRj
 1ClJd0b+GI7iv2tiBBFjWUkN8AVyZH4irUfwN0VSKVV/RFD3DASnNdJlncvYPEGAhk4R
 Frdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWuabOX2zM4yadH5BQ5DkTjqUkbNgIa6dlZ5KGGw4xY/NWyOyHP31YQ4ryqDRmm9MBLv0gcPVQ6nBrLhp/IA64LYbySGCy35HdiaN4IcWV
X-Gm-Message-State: AOJu0Yy//hMLzWjCPC32tPtMAmd+KRNZAslALlaYDoe3iQab793OVVbs
 bU2XoBAXYK73Z+BdM9UBbusnorkJVOopS3EMHIUKUwrLezxWp1WZqhetRQ==
X-Google-Smtp-Source: AGHT+IFkwji5x3Oqvss0h58aBnzkmVskzoPH352Fb2wsLQBiGDCGTRDaXtszAo6wJdGsjuwge9gzbg==
X-Received: by 2002:a17:902:ea12:b0:1fb:6473:e933 with SMTP id
 d9443c01a7336-1fc3d989ff7mr21155395ad.41.1721145994814; 
 Tue, 16 Jul 2024 09:06:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb9befbsm60481865ad.74.2024.07.16.09.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 09:06:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Fix error return if missing firmware-name
Date: Tue, 16 Jul 2024 09:06:30 -0700
Message-ID: <20240716160631.386713-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

-ENODEV is used to signify that there is no zap shader for the platform,
and the CPU can directly take the GPU out of secure mode.  We want to
use this return code when there is no zap-shader node.  But not when
there is, but without a firmware-name property.  This case we want to
treat as-if the needed fw is not found.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b46e7e93b3ed..0d84be3be0b7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -99,7 +99,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		 * was a bad idea, and is only provided for backwards
 		 * compatibility for older targets.
 		 */
-		return -ENODEV;
+		return -ENOENT;
 	}
 
 	if (IS_ERR(fw)) {
-- 
2.45.2

