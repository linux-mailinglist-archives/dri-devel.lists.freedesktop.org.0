Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A4923E32
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8063C10E0C1;
	Tue,  2 Jul 2024 12:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CjkJnx9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F4510E035;
 Tue,  2 Jul 2024 12:56:55 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so6796911e87.3; 
 Tue, 02 Jul 2024 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719925013; x=1720529813; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xgnbq3jUTcy/6MNLj2tPlk01abBu0Jq+t0cyqJTz5OU=;
 b=CjkJnx9yQM630EZ5hDyDFmvWvFHv7WnhXPHxVff4V0W/griNxhuBFb2irEBXdvO04t
 gM2EB9UI1FTRY8/1Z+dt8lX8zkc/R7k8s8L8691z07zJVSKuoN9y+K7It84gggF+Iug/
 cWzeMejuQ0yUFVqLWim0JZR5swTDu3WmF8O7dzD7y7qFbzep+5p1OEJVG8QYER3qeAcA
 77WKbvqARHcxa2Xzpbb9xVt36A+k4+Ti6t3X2oZmcEMhff8l5psMseFIgen/yiSgIBvy
 jYTwtBWQUhovZyqiTTvzIdan6zRx36mDwAFHsOy+LWCOmmE430bsLeWQ5Pvd/9EzLj2N
 lmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925013; x=1720529813;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgnbq3jUTcy/6MNLj2tPlk01abBu0Jq+t0cyqJTz5OU=;
 b=Iv6q6+58muA0zQF6XPBUgrCXuanP9lRcR/BtZ03Bi0TSpy6ZGXAEqdCxSWlmwkU4FA
 wN+PeHed3H3kc4RDSI3/2ougwoPNuoIfwgOLhnQKLw/l8uOfMumpt6qXYK5aL04+X9gN
 HJajo4v3glVVzHhhdlG3zoOHbCspjShMePOZ+CwJtcffQ3NJVxGOt8v5vQtFpFIpNVJY
 mF2ITHbTVt5ZleLbrcGabh5M0ui8htMDk84i57TYAvT/HWfKt2kkCQjlUJEyYPI9XCRM
 UZluKptkzb9u1HnjBd8RDH9ZA2r8SdzAkBiE9T2TVZM9cxcPCSV3w7pc6+g4SE4RRh5A
 YEow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCGRrwDWUfzqyLVibw0JJdzpsjD3KFpnh9b1q3s0tocshV3Ab7cxK3nU4iOSeyeDk5E/QCDDmYbE8Rg9DKla8xu9ghxplaIROQMWqFOyE2QEPedDcYoEbEizD8xL1pVO57vb9QEo6g5BmKNbayjxA6
X-Gm-Message-State: AOJu0Yy6112wyNRckS/IoM9eGlOMR9ZuoYOCspRj3AsovS392vv7ISZJ
 CP2u4QrP5U9LW76wFp33Jbx9nOa9fGJA7Aa+yRBeNSulqTUIktsDOaAaSpss
X-Google-Smtp-Source: AGHT+IFdw2lJuMZsppZJcnSV+suq85WDLiqyPtRbsT6xf4mXjvpIyGLJEBiRIJAm5Ydwnpu6qubveg==
X-Received: by 2002:a05:6512:39d4:b0:52c:df99:6c62 with SMTP id
 2adb3069b0e04-52e8266ede5mr6504980e87.28.1719925012920; 
 Tue, 02 Jul 2024 05:56:52 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 05:56:52 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/3] drm/msm: Further expose UBWC tiling parameters
Date: Tue, 02 Jul 2024 13:56:29 +0100
Message-Id: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP74g2YC/x2MQQqAIBAAvyJ7TtClCPpKdChdayE1NCIQ/550G
 uYwUyBTYsowiQKJHs4cQxPdCTDHGnaSbJsDKuzVqLT02cubTw67NDE4bhgcIrrBbtpA665Ejt/
 /OS+1fl1YRfljAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925011; l=2743;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=EoHtW0NOXouEkZEr4A06pqVHdFXl2lYVE5XaTb4In2w=;
 b=hnsHTrc3i9/sGvm8IY1LIito3FiH4X3hjeHgzGPZrpCwnCKLAfC+OE7gD/IbqtxtJEZreHsJL
 ia4TLii52J6BtFIq0MSD9R4+Dsq8eiP1sQs/G36j7ZFkbiVCXTz/bPt
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
Connor Abbott (3):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   36 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    3 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1644 insertions(+), 24 deletions(-)
---
base-commit: c39e6f4f08c40710c15a372f5a29de7b84f47fd9
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

