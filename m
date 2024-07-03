Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF8925A10
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276C10E69E;
	Wed,  3 Jul 2024 10:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3lbF5fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F9810E3A5;
 Wed,  3 Jul 2024 10:54:02 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52e96d4986bso661572e87.3; 
 Wed, 03 Jul 2024 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720004040; x=1720608840; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5gdBDjQ20XQ7SVw3EzrpDlQunPS7byq4AhzdM2NXok4=;
 b=N3lbF5fkcvaLHntb5uksBpoQ0p7Fm8CkZE6U8SSTR5WaibCw41TeOmvzVTT3le//Zy
 6H1cJmPVtBrjWq7BEqPWcJPr2VW1RiLhSdX42b/2rWDztvleJrq4pWts5XNRCrFek+Eq
 JwBJM3MzkzrlZjiHK92Hk48jxuzV4FCg9i5jDkKK+RQyOb5cUVCkh1pjEtpl9F12ZSEG
 wD5oQyT42cG57CgzUxqDuP3fa9DDiNHvvxeqK4WHk1Arl6VBVu/WMTfRlvU6zyrAqcCA
 MQRIqYxUvYeAwvXy08WkGovWNBbz+t8ZI3YUYZk8KJSaLJOdrmZgbU+RdFZCjXo6kC9T
 u0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720004040; x=1720608840;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5gdBDjQ20XQ7SVw3EzrpDlQunPS7byq4AhzdM2NXok4=;
 b=AeH30bWQTo1RPz5nMXX1sFrRFXLCWBQlXK3W0NTqSOO1M/j4GVwSl0HV+K0TXiuaqh
 9oxqcS0km8PGUiKmYf+LjtaMH4j0xL4axX2apl08D9F1OFv/Zx0ufJSkiQdV4jWweF85
 92kCk6k042S4W++dLkOdq4AMauwxI9K2HSjeFxc3Hjzc7JYREPMO8QgOk3JpaH84cSGv
 xPSTiwOb52aGPZ7beiGeN7buDiSz95vZ8tfPrPQlyf1dfIuloJw7Jp4BRnO/c2Lhi5XD
 eO2Sh9bdJPCFoPEUlC3YKESH/SZz/5Yu+CqbiU63XoVTtjCImUSgErGlxAghuRwlP5S3
 fNtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2tDZadXwpaS4Pm45b40NsnpmeRWR1DM08Rd9En+OsW8hBlwf7oj4wBpMhhbuoAS0aKC+qBBaP2fX/0vlw9vOPJnOCt6MFdbH2Z0+u1xpDUTa0IXf/cBaAi6uC5NzQ/cpsmy6IE1ikbZcUhjdTeoRf
X-Gm-Message-State: AOJu0YzHVwa+71QHJlMDmhvq3wrh3kPiL2/V5tqhSaJbE3mxJZ2cZzcQ
 TToeOZCmCg+nmoSLtZwxeWWLy7PpypCmkHuk2hyfiqetuHrMOnB8kUhHJDNH
X-Google-Smtp-Source: AGHT+IFGiNlyeKKdQUBUTifB2xNrGH9KZSWcWmEdTHbBn4ETRzKvqI6oL3Qj7y8wytAAyZ0Ucq21Zg==
X-Received: by 2002:a05:6512:3ba0:b0:52c:cb77:2b8 with SMTP id
 2adb3069b0e04-52e8264e638mr7269721e87.5.1720004039874; 
 Wed, 03 Jul 2024 03:53:59 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:53:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] drm/msm: Further expose UBWC tiling parameters
Date: Wed, 03 Jul 2024 11:53:46 +0100
Message-Id: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALothWYC/22NywrCMBREf6XctZHk2lRw5X+ULmIe7YUmkaQEp
 eTfjQV3roYzMGd2yDaRzXDrdki2UKYYGuCpA72oMFtGpjEgx55fuWA+e7bRSmFmOgZHLaRDRCf
 NQ2hou2eyjl6Hc5waL5S3mN7HRRHf9mfDP7YiGGfKKDWowfYSL/fZK1rPOnqYaq0fd0Xh9rIAA
 AA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=2937;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=91WqejSHR/XydRSh41id9TxMAoPMOEROcJqEHJtCL5g=;
 b=XgIv/Bcd54kvT1aMJXwmAcyJTxMtum9ggy0m6tOwyV94Tp+5hgPWdCk/1CBGDLCRvWrm+q57P
 2Rwni/4A+5FAQfwmI0+8kDtvTVkdQ+QkP2hZdkpL1wxjYbqr8bdwrCE
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

After testing, there are more parameters that we're programming which
affect how UBWC tiles are laid out in memory and therefore affect
the Mesa implementation of VK_EXT_host_image_copy [1], which includes a
CPU implementation of tiling and detiling images. In particular we have:

1. ubwc_mode, which is used to enable level 1 bank swizzling to go back
   to UBWC 1.0 when the implementation supports UBWC 2.0. a610 sets
   this.
2. macrotile_mode, which we previously left as default but according to
   downstream we shouldn't for a680.
3. level2_swizzling_dis, which according to downstream has to be set
   differently for a663.

I want as much as possible to avoid problems from people trying to
upstream Mesa/kernel support not knowing what they're doing and blindly
copying things, so let's make this very explicit that you must set the
correct parameters in the kernel and then make sure that Mesa always
gets the right parameters from the "source of truth" in the kernel by
adding two new UAPI parameters. The Mesa MR has already been updated to
use this if available.

A secondary goal is to make the adreno settings look more like the MDSS
settings, by combining ubwc_mode and level2_swizzling_dis into a single
ubwc_swizzle parameter that matches the MDSS one. This will help with
creating a single source of truth for all drivers later. The UAPI also
matches this, and it makes the Mesa tiling and detiling implementation
simpler/more straightforward.

For more information on what all these parameters mean, see the comments
I've added in the first commit and the giant comment in
src/freedreno/fdl/fd6_tiled_memcpy.c I've added in [1].

Testing of the Mesa MR both with and without this series is appreciated,
there are many different SoCs out there with different UBWC
configurations and I cannot test them all.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Move ubwc_config field descriptions to kerneldoc comments on the struct
- Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com

---
Connor Abbott (3):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1664 insertions(+), 31 deletions(-)
---
base-commit: 269b88cb92e62e52718cd44c07b7517265193157
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

