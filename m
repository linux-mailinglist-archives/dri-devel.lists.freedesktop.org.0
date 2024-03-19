Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0687FE93
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7982710FA9B;
	Tue, 19 Mar 2024 13:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VLMsIlue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0810FAB3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:03 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so29340281fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854522; x=1711459322; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bozLgVEsHwe94zFSCLw5L7te+ic20oRug81TlWIaqUc=;
 b=VLMsIlueujrWa2UTK804o7WEjzsHQ3xu0hwSJTpVXHub9qQ2o8Su63GaItfuxO/N4c
 BIJ8r6w7rzmiKz19RUcB8xzR2o9M3QHIStR0p8J0AxcsFCnotzPfnqa8gBC8SJCXNu/s
 4yKCs38bDUEW7LHbhWgfqU8QnREqmZp9F+uoydc25jCrucXu2RG45/kbZnXw2Nv15EIv
 zQjzrKj2SWsvdpg7eA4HigSf9LlHHdBBA+s/l96Zk7emW2IdCCtRHlXvogkO2qfUu0Jx
 XUJuc0o/1xCxvcr19Yd83zNvfYzpIpp6ig5w9Dgp2uHjaKNghBy1iLeMTdR6NOp+UtVw
 eykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854522; x=1711459322;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bozLgVEsHwe94zFSCLw5L7te+ic20oRug81TlWIaqUc=;
 b=KCKe5ze4eu0DRfGtYWuZb0DkulaEn69au3Fbd8dRkk7w70Jdatmwefnn3qnfPc6KCb
 Hd11bz2a7ub3vBFWzWAUwE8Tr9stv2Ypuh0cgIKVeeinT5oRb5DaefAN38nF3SrSFjlU
 TNdQb48F2xUJ5v+Jvpm2O9t6gJyPJ7BsJEJHNgyNafISlwKDbWvvGNwOtoH7Mngd7cvr
 9R3rwC7vEdG2Yvi9/cF3VCjhpLMQEyWnWXMp37VvoEUB5Bw8SHglVc6bEpieFKWLDzjx
 Jdl2eSdPAGGd9E70fpe838UraG7wMfnMECxZh71shcWMoJg/o4b7noCNKeDMQSTWBxB4
 E0UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHC4/nWcksI8H5jJ5Zv/0Niw7Sx475oaXzdswZU8FFtRfBnm/AeMQaLstkR/bfXPl9/s0lhwoBhcuOkI4LbSx8G1lV0H/wuMPLjWVC1p17
X-Gm-Message-State: AOJu0YxpSTyvNKA5dxq3d0EIGMaMNFeLUjbVaIWWUPNsFYt6/PcRYLQh
 YAzBPEezXbMCmBtc1KuAOSNHLUXOqfaX/a7YevQ4OI22umd1wa2cNt2UabTI3Pa6hyT0mQrMmQa
 G
X-Google-Smtp-Source: AGHT+IGC6bucP3tsOwv8jCC11mr1M3U8g1c6PjVup2qX0GFAfX3rE4RaAkHuMb0ok0C7hrmlqSXgUg==
X-Received: by 2002:a05:651c:8e:b0:2d4:9936:a45c with SMTP id
 14-20020a05651c008e00b002d49936a45cmr6235663ljq.41.1710854521621; 
 Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/9] drm/msm/dpu: be more friendly to X.org
Date: Tue, 19 Mar 2024 15:21:58 +0200
Message-Id: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaR+WUC/x3MSQqAMAxA0atI1ga0dcKriIvSRM3CVlonEO9uc
 fkW/z8QOQhH6LMHAp8SxbuEMs/ALsbNjELJoApVFbrskLYDV0+M1rtJZryE9gUb1ZC2raFaGUj
 tFniS+/8O4/t+4zKbnmcAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vEwF8PeSZna9nyompVbo2D0ZcBnEt90ZIcLtzS4Bm6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3wFpasaqjdm/4ur/9DTow0nLUrxTvBCG91
 EYn7Cju/4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1fLGB/9kmw1QZW4GgH7KifImPbi6NW0/CaWZFUkI0zWssY2OAeLsste9Utpbnpjf5onfGSd+hJE
 oj/v+ixuwL3Bza1W8Fvj4juZGgSKM17pnzG/Db+k7vzTFTPNoq9hnvHE8KWQhgmI0z+2P7NsSdO
 8Za2RPquLLCHSfXTFbkmCYrkxRc7/7hlzzeTinXHNXZU2Bwtqx9L0vwe8I9OLzfQyBnIfHvpgFD
 dpEE5TSdVxvg94KL00zy1PHE7XG0konZwllPLhmOiwEZ9RzUgI0e60/E0H5AZplSj5ieWYaUDb/
 SVZEcWzFVrhkoPo+reKO88vf9Mr1vnwpswHc2ToGwVWBRNPV
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

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (9):
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds from atomic_begin
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 17 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 92 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 23 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  5 --
 10 files changed, 75 insertions(+), 126 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

