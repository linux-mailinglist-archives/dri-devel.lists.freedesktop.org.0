Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC594A834
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F8110E4F9;
	Wed,  7 Aug 2024 13:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRFtfY06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEDE10E4F8;
 Wed,  7 Aug 2024 13:05:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-368584f9e36so935881f8f.2; 
 Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723035911; x=1723640711; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IqzvCh1XrIPWdHgulG/aaHvZSSlW8im3s5TS73eXDAc=;
 b=jRFtfY06lPOH/k4rcDvFB/47BIraRmzVffXMzP79obEbVrwr3na0/DEy3RhMbnETSM
 vRADNMo8ojqNxPc9Ldub7dustnzQrHwie6icfcRtluNdvwGBxxxkBnBZ5okzE9kSGPS2
 y+pJvmnVx5dleM6k60KmaezWGro7dEjxS/komhb2FeIg6f+oJ8RiYGpiTD86ahm2Z5RA
 S0xNYRkQLP7ItKN9SW5N9KFiLXD4LVAwnAoF7/gr2oqRc29yREOwGxn47YhehnF55Bnd
 u220S0w/u4G59g9N7WRx+ItLh5pefdEP6A0vMn/UXLACcCHru0suabHfQpsyMPlxKCrH
 p/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723035911; x=1723640711;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqzvCh1XrIPWdHgulG/aaHvZSSlW8im3s5TS73eXDAc=;
 b=XzRomlulM+DrW4sMmlBpONkVzz7oajCVkcXJSyK8MKC6O2HCcsNcG9Ut21Ro9amG7Q
 CqMZ1RCzBbTsMyI6wHc6N7Ojv0tivm89GCcvwQJqMlUXjYxMJn/Nq9ri/vOH7uq7JCju
 ezidPpmv15FEvJRUZvUteAlU986RFIgk5WAUNN1qc4OdAT7AUgVRqK9RZWXP1BNRMNs2
 mY/4F0hsV2DbNb9MRELnnrz+cFevDgdppq+1Z6ibNOZuKFAP3dodg1yFcpt7zDcQBiAX
 D8q0fz1HZCVfoGnxAWUzaKyykXB+Eac9IQRNdTF+SiLEOibXalM0vlNJ7McD3NbdebTQ
 wZ/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaSOPqKatNpQD0rpmmWVYrfgj23wAZwalaaVUdaEna08WXx8fN12N6mH6eRcQsXxsH9Ylf1vzHBVQH8qEo++IW/YWuxOwugh9MFWUv3QTOdwjMNfxzAa3gbDH54e0osnnQMFkcpVsRPH1JDAAfhwLt
X-Gm-Message-State: AOJu0YwbngJt42lwxeMzMD0rH6WTzB6ZHRi3RNew+U4YOFqZ2xjIESkk
 YFRrUTLUyFQk+y6t5ukt2vEs/EINFUJ3ltPJz8aQdLQn0wHgwhtb16kHbevf
X-Google-Smtp-Source: AGHT+IFYSC+cb71ngcmTWiNxJCqmthJpZV5JtFOp2Ui1y1hZbBNtHEl4XtnzNoGAv7ECInm65fWhKw==
X-Received: by 2002:a05:6000:d91:b0:368:504d:c3a4 with SMTP id
 ffacd0b85a97d-36bbc0cc232mr10754879f8f.17.1723035910421; 
 Wed, 07 Aug 2024 06:05:10 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:05:10 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/4] drm/msm: Further expose UBWC tiling parameters
Date: Wed, 07 Aug 2024 14:04:55 +0100
Message-Id: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdws2YC/23NSwqDMBCA4auUrJuSjJrWrnqP0kXMQwdMUhIJL
 eLdG4WCC1fDPzDfzCSZiCaR+2km0WRMGHyJ6nwiapC+NxR1aQIManZlnLrk6IQj+p6q4C2W0Vg
 AsI3uuCLl7h2Nxc9mPl+lB0xTiN/tRebr9q/BgZY5ZVRqKYUUpm6gevRO4nhRwZFVy7AXqiMBi
 tC1WkIrOyHYbS8sy/IDmM2nLvQAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=3177;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=j3XI8vHD2Wr1YAg+a1G4G9KW1tFsuqeJR4WD3H+3iqo=;
 b=M4TJ8UIw2w8UbkglWKbOfAL+PSSfkCGIXoLftowPNu5e7YJzMA7finOj7ZEgNsfvEnCy3z3Bu
 LlcggUJqHGxBo8tnoqCpWd//K8Y53RA2kJ6T3firpUVnX0eEnRZgY8D
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
Changes in v3:
- Further update register XML.
- Add commit to fix macrotile_mode on a680.
- Link to v2: https://lore.kernel.org/r/20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com

Changes in v2:
- Move ubwc_config field descriptions to kerneldoc comments on the struct
- Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com

---
Connor Abbott (4):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi
      drm/msm: Fix UBWC macrotile_mode for a680

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   37 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1118 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1161 insertions(+), 38 deletions(-)
---
base-commit: 269b88cb92e62e52718cd44c07b7517265193157
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

