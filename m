Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79D896A10
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CBE112905;
	Wed,  3 Apr 2024 09:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5H9vQQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F61112905
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:09 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e0025ef1efso42110165ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135469; x=1712740269; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7/O3Yye4pJUKSqqmi1ztO7+TuENg7PJXngjJtD8dhiA=;
 b=f5H9vQQeJI1XQA/9Ut5qxKUIkMzLgtUxztn3Nt2zoQSvwcI8R/5qHxo332G7UQ2Zr3
 aHrvF6bkN+EDsh2YQktxjaVvqCEbM5OG/eXVhETV5xwCR+XWHnHqKgvK9lWbxFsI9hUb
 +8w9h4m2j3PJtwW85mzFL6q0SOiFTB6F1C4JebAv8Z/qu8UsENWvosFQ/WaRnlOBAO3S
 sHhdWHbQHL1ZYM9Me8e2DlpcZkuih3bWvmj8BGbTmToK2ziZFNr5UFXF4SyPvP+1K8bN
 L6XB3CwDGUhCyKNDdVQxJz2bfkGPakgEAwZNmi3jbnDhvayW5C7+oh/V7jdHYuVzCo6g
 Snlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135469; x=1712740269;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7/O3Yye4pJUKSqqmi1ztO7+TuENg7PJXngjJtD8dhiA=;
 b=QEKwHuI8q80ewkCHRG9AhPcrN6hnyvVa33BLeX9Qd0dK7MhMgrJnbomK0qDmEyxAYg
 BC1f+orhewuXZg5A03PiiinLxUs1nXKqD7tfPsP8h6/LBKBi9sTHKKpoUDj6+ImxMgjw
 8bbMDlj9wwokGMuA+OQ5IToNROi5iWCVlGZAPtv9q1Xmst4uRurjagRGbFQ59Rhlo9XV
 AHD2uJ80EwjjNoFguhBC8mExiDUtC8Qe/iZ7F7KlBIDW3svWkuKK2GfNAYIige7O+Q8Z
 3GpqU7b1cVBsTz3f89G5f9eB07C9ZGAwvOjOLxCN2UMdyfLoRMekm5Ixge2aNnHMczca
 oDDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWog4iNB4arUcs3ywHOzSSd7oJtHyJVT5jNPDo4pzQ7CpGaIiaf8W7FDbY08DDOZ8e9svd1/CxCB49icQ7GTyD/VMxJcs/+MzZ/kBhn2abH
X-Gm-Message-State: AOJu0YwAvSa1HVwfDaHbdyrNujjIUIGar02lZiH10ITutGqjf/owhydK
 zFq2PXOm5aYsImAVH5ZQu2MhNM0sTZfO+C7uK6DBumhM8mEDS2jlSJiMlPW5guQ=
X-Google-Smtp-Source: AGHT+IF84q9hRu116oN3GLEOqf7CuYctkPWrAgQCygUpWta5lfkEIwl7OUv7gwt+uy43J5BmH7S/wA==
X-Received: by 2002:a17:903:32ce:b0:1e0:b629:b009 with SMTP id
 i14-20020a17090332ce00b001e0b629b009mr2303646plr.20.1712135469129; 
 Wed, 03 Apr 2024 02:11:09 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:08 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 0/6] Add DSC support to DSI video panel
Date: Wed, 03 Apr 2024 17:10:56 +0800
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAdDWYC/x2NMQ6DMAwAv4I811JMoEO/UnWIsKEeAshuIyTE3
 2t1uOGWuxNcTMXh0Z1g0tR1W0Po1sH0LusiqBwOfeqHNKSM1SuyBT4Fik1ZNvzu/jEpFYnGOxO
 lMmaGiOwmsx7/wRNahtd1/QAmFaGKdAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=1325;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=P541NbRWYuqXnx3+bGnLVMbeU44d3fPcyqmzLTRTyXg=;
 b=HkqQZDXjFiMWF6ZF+Cd0bcaoeJOmDhaXwhg2bFQTfchp7QA89xl1gKuBfqywkMi9u/CrU+Rqg
 N1WZRF987sSDHY46unFNIz4C8AM5wiaqxvqBzLMDMKlkS8wAs1I5cIE
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

This is follow up update to Jonathan's patch set.

Changes vs V2:
- Rebase to latest mainline.
- Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
    latest mainline code.
- Drop the bonded DSI patch as I do not have device to test it.
- Address comments from version 2.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (5):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
      drm/msm/dsi: add a comment to explain pkt_per_line encoding
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Jun Nie (1):
      drm/display: Add slice_per_pkt for dsc

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  9 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  8 +++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 42 +++++++++++-----------
 include/drm/display/drm_dsc.h                      |  4 +++
 5 files changed, 44 insertions(+), 20 deletions(-)
---
base-commit: b1e6ec0a0fd0252af046e542f91234cd6c30b2cb
change-id: 20240403-msm-drm-dsc-dsi-video-upstream-1156d110a53d

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

