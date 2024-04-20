Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA98AB953
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7288510F346;
	Sat, 20 Apr 2024 04:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wYeHY4ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6738410F341
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516f2e0edb7so3822476e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585674; x=1714190474; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7zMmX875gSAYfPxrt2gup6kdyziGB5KH+g5wBsmz5o=;
 b=wYeHY4ba5s7V2yAEvJNZN+g4Fb29mRyOzyGEL1DMelBtYXEGMWfm7GLWeI42APdn/N
 b24OXTqXjQkKXb64gUkQjTGH35Uy++BBhofgUFr6uq8sWeSPOSmbtCnnS1i0tq6ZKdet
 LL790JmeehHEEJ/x8cNGd44reNRbzpvvVpLAnVUsjM1xSOkAZef65TeN9SAXXk6vfjQd
 quKT2x9hsEp990sgCHl3jRPzIa8k4T5eZlJPU7UWkSbkQJSLRLncLNBgIO03vVhSm9RX
 22NFOCtie1LjT9PgaH5OqTfgmHdqbRMro4lVJwwHVWFE/xBajslnW/fpKP4uzAaheL7v
 u+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585674; x=1714190474;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7zMmX875gSAYfPxrt2gup6kdyziGB5KH+g5wBsmz5o=;
 b=nFee6VzPHEei+7tVvRW7ElcckUww5aSRGC0EuQjm8qS5ME9exp9AieiNMn7kNvKtXw
 4X0AxKjwKlXcosCwHzR5LnMqHs/+UVz0XfeG088xxA0kDQkEg91dmBDMxfPscvB26RaX
 uvzc233imk6JosbE7L7jGqSOzXUthXpFyknC7Ds8lOVYyQajWop4Ln91RNb1vCWpAmeN
 5GUJdvH4ZSxnCRBHCDOh8wRXdbhs7pj8FcQ885R+DeqKFARHyV2CFAsSrvXCPPFnt7qn
 CCmHSMubgcAVfA+Ah5AMblc3A/z6kwEqtrxDPhtoLuUFaAww7g1cO8tEZbPlzv5t4ZbD
 K5wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUucHRsUhiEvqmhumfOg8aQvYoT/FSyUihhgqzg4lOj5UtDv4JuEAQsON7hvvDO62Kq/EO00XCuJmfiqw9BaAcWTpyNm+QXL0wCsqONobBl
X-Gm-Message-State: AOJu0Yy76yT1BkruHKDJ4aXEfS7jvrh6Vi1DFi5k6AENXD6xuhkB7O5+
 zF3P9KuBhxfjdR6BPks1ey7HSl9ecj3yiXQtdR0nrXS2Jfgjhu009DHCDDr+P8s=
X-Google-Smtp-Source: AGHT+IExMBZwNO2q828JEytFfTTwoyASRHe4cwU14b4d6yyMpKBkYpHI10gdQdohpz86O1ZDestIzQ==
X-Received: by 2002:a05:6512:548:b0:518:d08c:b44e with SMTP id
 h8-20020a056512054800b00518d08cb44emr2476060lfl.10.1713585674258; 
 Fri, 19 Apr 2024 21:01:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/9] drm/msm: fold dpu_format into mdp_formats database
Date: Sat, 20 Apr 2024 07:00:57 +0300
Message-Id: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPk9I2YC/zXMQQ6CMBCF4auYWTukHWkxrryHcVFpCxOFkikSC
 eHuNiZuXvIt3r9BDsIhw+WwgYSFM6exgI4HaHs3dgHZFwMpqlVNCv30xphkcDN6a0xr1bkxPkI
 5TBIif36x2704Shpw7iW4f+Kky5CulbaVJtNY0qjRDzzLWj2crLl/puX64tFJqpJ0sO9f12Z6Q
 6MAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rKaZDNh5kxx7GJ2yJxrftfiGZtSLdTIFtoRuKDDePD4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4Hz64i1wyEy1v1J+UXyvu6pBnDRO6iv2sSL
 aousQ/DgKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+BwAKCRCLPIo+Aiko
 1SQ+CAChq6lq2Ix9i1eeXVe4bbp6TIys8qnGZIcV7rulyB9NcmA3geYQzcEmjMDPS838uViykRX
 y8c9SZaJzTIrmjjIK/xGLQetzGHO0wcETBZQtSbC96Gy0KfELQR+7Zm72p537roFxD4qFq7ISrJ
 6UHv3M5v2ileMnRxFPW4AGb/g1ST5nuynRWfLa/LuhbGsCFwQBRH6GqM5rmlbr2CeALPLs7vCjj
 FObrvTzRvWUDJ7ih3zq5BHpLW+2+cQDzpAd2KG8ts+a3WcgPBZWjyzVvEIKMt3q+wiUdccK9UgX
 eJGoTcI/iKft/16s46OeDfQ7+vRAU/Eq9109CwV8c9hx3F25
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

During the review of [1] Abhinav pointed out that mdp_rgb_formats and
mdp_rgb_yuv_formats arrays from patch 1 are directly based on the struct
mdp_format formats array. This was true, because MDP4 / MDP5 drivers
used their own (small) list of supported formats. The DPU driver,
supporting more formats, had larger database of the formats and their
properties. While we don't have plans to expand MDP5 formats support, it
make sense to merge these two databases into a common dataset.

[1] https://patchwork.freedesktop.org/series/120377/
--
Changes in v2:
- Rebased on top of msm-next
- Moved all formats data to the new header mdp_formats.h (Abhinav)
- Dropped the alpha_enable flag changes (Abhinav)
- Link to v1: https://lore.kernel.org/r/20231202214016.1257621-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: use format-related definitions from mdp_common.xml.h
      drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
      drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
      drm/msm/dpu: pull format flag definitions to mdp_format.h
      drm/msm: merge dpu_format and mdp_format in struct msm_format
      drm/msm: convert msm_format::unpack_tight to the flag
      drm/msm: convert msm_format::unpack_align_msb to the flag
      drm/msm: merge dpu format database to MDP formats
      drm/msm: drop msm_kms_funcs::get_format() callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 658 +--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 124 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  75 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  86 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  95 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |   2 +-
 drivers/gpu/drm/msm/disp/mdp_format.c              | 630 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/mdp_format.h              |  77 +++
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |  18 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   2 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   4 -
 34 files changed, 913 insertions(+), 1075 deletions(-)
---
base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
change-id: 20240420-dpu-format-d655c60875df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

