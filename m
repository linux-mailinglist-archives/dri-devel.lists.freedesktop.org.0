Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A082A708DCE
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62D10E59F;
	Fri, 19 May 2023 02:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA210E5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:30:15 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af189d323fso3953461fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463413; x=1687055413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
 b=NuwG2uPjamA6Yx0vJDLArcowBr4ZoSpGnYB9+jv/JCan6gx5QKwaE00loNgAjwRn2F
 H4yW+W96CcshJkTqxQavCiJ3qm8F0d1tlBoODob+MTYdazhASYurCy5uWpksGA4CXkbu
 CKjFtHRIdedDmJxfVK22AAydMOmDO6ouswHNJ03TZSWXJ8+xUHy6bSG4fsqVLYNx/S5y
 LsYQtUCH/H1cZXkQ0NptXtqJKbp1ZLW5dMTt1rvfhv93VD935e6snE7mf1W4rhzqwqjI
 Aok5kdiSP2FZt/HsnYL+1ZdqyNgUKTo2wTCnmIQC7CZjdQFV39uiJmhHEfPU8Ah0RLVS
 RwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463413; x=1687055413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
 b=TScTECtULDzvbwU8zfBoHAvrgdRiN7d50F3fs1A+8AB0rIbPtCqMG1uJ4JMUTEk2zi
 P4pCLr8uOA+CU8J/Kj0ca9LOr/ea2Tm1TkU/NOmSGgrNG5EWImDxTp+U6UXDpqT/S6GH
 qhw7AWF/fr/OPy85PiTz0xz9N+AZKjxUDFrAo6yzgiRzV9pMWYYCaMkK13JG68HBq/dw
 0Ae7RtIta7ycLZu5/rhGIsAAo6ZZ0uxB1FlWoXDcaM7N0UZMr/zHiUUdG99aJ9sp6Tci
 ZOZWChWL4UHUP4l/kZcG5XF9f8CRC9GisrtkzrjrS8C35lGdnqoRN+DWSwBnd6rEdenW
 PvtA==
X-Gm-Message-State: AC+VfDzohZtunqRgQDYOONiHKiEQCB1tcu/6ov/ZkZG3dvq3FCCqGYdG
 9cWRg5q3BCwscvvQZHHqi11ufw==
X-Google-Smtp-Source: ACHHUZ4oeJ5J16LVLCVISH6GDvEJK/vLNpUO437sEPnP1IpDfHiUbChHlbnBXJhiN3q9XOGwc7ugzQ==
X-Received: by 2002:a05:651c:33a:b0:2a8:ea26:5c72 with SMTP id
 b26-20020a05651c033a00b002a8ea265c72mr94875ljp.8.1684463413315; 
 Thu, 18 May 2023 19:30:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:30:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_check()
Date: Fri, 19 May 2023 05:30:09 +0300
Message-Id: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Dependency chanin:
- https://patchwork.freedesktop.org/series/116851/
- https://patchwork.freedesktop.org/series/116615/
- https://patchwork.freedesktop.org/series/117148/
- https://patchwork.freedesktop.org/series/116530/
- https://patchwork.freedesktop.org/series/117150/

Dmitry Baryshkov (2):
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 15 -----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 6 files changed, 60 insertions(+), 77 deletions(-)

-- 
2.39.2

