Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81984E39C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ED210E863;
	Thu,  8 Feb 2024 15:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mc1kR2aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6CB10E86C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:01:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-511616b73ddso3293117e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707404470; x=1708009270; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTtnfYDI+dbV96lodd3k1eOzoNAGIDmd9/t7DM5xr5U=;
 b=mc1kR2aqw2N0upCO1ByCeOmBDsZWSjmOU/bOTCBV0AuoapbQAMya+zBKf9gEWAF2QH
 rSUSb/IuMr6fo2ov4y1kN2Jpqc5NMzKRBGOBHbLYTwk+SawzvBnJTrvumtWLV91L/WNL
 6/HH7W/TbKdv8HIuNoDRW3DxjRtKKjOFFtaP/DKVaL4W5QlJTgGrM7zuuF/cU3olDAWZ
 nSWIw9GLDtQzShQNVoPt9L9E9rzHsGTgxwXnAKSpuDsfcnjMH/NXut0rPQ4ImhpZUlqy
 E63cY+1zk7ZiJi+PU3vf6aoltciTbo8yBo5AaVDcEe/0G2K6eXvU9KCyyvprL6y3h3XF
 ZlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707404470; x=1708009270;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZTtnfYDI+dbV96lodd3k1eOzoNAGIDmd9/t7DM5xr5U=;
 b=P61g3IVMKRV2Jru7wOfnfPE8UdaX9l12neXZd1zqx/hTLABdQNu0ikoDX9BOsgf8Kv
 sOl7OB1ifvRZ8rjzZKELUwpFVgu+ExjSeJ9Esm5ZeOcLJ0w64hgZdYXWi59mSslaQI1a
 GU2SVNKoo76GsfjSlnD9VcjxGmz//EZnYpSbdeJlYOoNVuJKS9ouUs+S6EDzZhsLs9YM
 qP2PaFQ/n3KWSU4dwag6QtK70dBEwJ4zG3FY4afKp+IGVwx2KnLPOePbAlyXc0Ui/s1o
 //9hdJ+nQpmhcVSj2CsATa8ISx9ifZMX1Sfsrd1u7NyU+IRY/QUYzWhUqtmMAmXJnkeS
 MYFA==
X-Gm-Message-State: AOJu0YzjQgFZ7IJWBpFo+URqhxxPKqGtWfaaxT0cgM6pUoiFLolD24dV
 /R6oik7uHzrNWqeHNOkyDRt0tU/ZDmr7AS4CoH0t4uOtl7WT+VIMjqg3+BdqdwU=
X-Google-Smtp-Source: AGHT+IEWNqAPAd4/Tx7KBe0TnltU8DpVH4WsddMb++0Dnv69LUnzXOr7UVZvd5UM1ziBkOQpw3KTjA==
X-Received: by 2002:a05:6512:ac5:b0:511:7202:3938 with SMTP id
 n5-20020a0565120ac500b0051172023938mr965672lfu.63.1707404470455; 
 Thu, 08 Feb 2024 07:01:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+I3+J6AmT9zFJbIKgFnxWT7arsbxY6VugE9g2+q2I3pwlzpC9lBrAqspia5D3K8hWCw2sEb+PJZXTiZhRREga9cAV1p2S+V8sQcfuQ5VwWOIYRPBzzrMnbJBeiO9ySl1MC4X5hsJD3RfrlddGTszd2qPTezP+SgAv5MHoHKRYfyg4Lluh/HLR5o2E2zYuT5pkmYYhrkBbY0r448IDrc+t6O6uCmV5XgSNgP9vz+jFEoOesTyVkG0vjj9XkAsC5arfj6OQJr0E8P895tKRjZb526XeN31K52/VVWNHL/U5TxQvgeQZ22EO0IKzlxNViHcKriA377fCbaqtLzwezl0Gu7Wvhs3ObX3BUyc9qR9R6GSk/FYnCrQdqjVzhDVXeT4F+nVA1oblVxFIqIXIojalvSZxVE60nPKo5rHqzr5Md0HRADAlAmB
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x18-20020a19f612000000b00511498107b8sm22444lfe.65.2024.02.08.07.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:01:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/4] drm/msm: provide migration path from MDP5 to DPU driver
Date: Thu, 08 Feb 2024 17:01:07 +0200
Message-Id: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPsxGUC/2XOQQqDMBCF4auUrDsyyagpXfUepYtoog6tRiYil
 eLdq4VCoct/8T7eS6UgHJI6H15KwsyJ47BFfjyounNDG4D91sqgyVFjAY2HnltxU4DejwWUzjh
 X6Ko+UaW21Sih4edHvN62biT2MHUS3NchjVhqImswM7nV1iJo8D1PsmSVkyV19zhfHjw4iVmUd
 mc7TlOU5fNzph3/Xir/Ls0ECOSNLZDsCUv6tW7rur4BtEcZYvYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>, Carl Vanderlip <quic_carlv@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MCk8TcMF3O/ehJXQorsy1MIsvwzkk22sxP1KJNAZZKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOy1+2nbSjt69H/MX4GkzpIAjy60yI4a6iXp5
 OrfFQxwtxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTstQAKCRCLPIo+Aiko
 1T58B/9IdoASMAnnqawZzGDLlvyAZBvq4F6oyugJYZXZBb9NNZeXQtjonO30DWh5NvxpWBGIp95
 i05S8aUG46Q7cmlyii1LBCia8bl2nxRGtQYen0PkKgsggl9nA3q442+p/cNji9v7PQvAVsQ2J02
 /NxK81NNp6K3//yeXjLhO3IfZZedlA8RgDiuCNvcAxcFG7TP29HTnVC6PZ1s58Tl1tiZ+NKr2XT
 SSR7lN+/VjXYh3TqKG5e750iANaH3UyHfzj6C2njVAFd6VaENTvPNNUW8/rIDiFeu17w5OnfKfz
 eWHkMJxFMns7Olmw8P+a0h2jUpioBKWHKPtViFRhTSwMKtkI
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

Over the last several years the DPU driver has been actively developed,
while the MDP5 is mostly in the maintenance mode. This results in some
features being available only in the DPU driver. For example, bandwidth
scaling, writeback support, properly supported bonded DSI aka dual DSI
support, DSC (display stream compression).

All the pre-SDM845 platforms were originally supported by the MDP5
driver only. However it is possible and easy to support some of the
older SoCs in the DPU driver. For example in the v5.18 it got
support for MSM8998.  This can not be considered as a proper migration,
since there msm8998.dtsi didn't describe the display hardware
beforehand. Instead new bindings were added, making MSM8998 just another
display hardware to be supported by the DPU driver.

This series provides a way to gradually migrate support for several
existing and well-supported SoCs from the MDP5 to the DPU driver without
changing the DT. From the user experience point of view this is
facilitated by the `msm.prefer_mdp5' kernel param. If the parameter is
set to `true' (current default), all `shared' platforms will be handled
by the MDP5 driver. If the switch is flipped to `false' (or if the MDP5
driver is disabled), these platforms will be handled by the DPU driver.
Handling this by the modparam (rather than solely by kernel config)
allows one to easly switch between the drivers, simplifying testing.

This series implements support for two DPU 3.n platforms, SDM660 and
SDM630. The MSM8996 support was a part of the previous iterations of
this patchset, but it was removed in v3. It requires additional
development and testing.

In theory after additional testing we can drop most of migration code
and some parts of MDP5 driver. The proposed boundary is to move all
platforms supporting cursor planes to the DPU driver, while limiting
MDP5 to support only the older platforms which implement cursor as a
part of the LM hardware block (MSM8974, APQ8084, MSM8x26, MSM8x16 and
MSM8x39).

---
Changes in v4:
- Fixed param name for the msm_disp_drv_should_bind() stub (Carl
  Vanderlip)
- Fixed the SoC name for MDP5 version 0x1010 (1.0.16), it is MSM8953
  (Abhinav)
- Rewored commit message for the msm_mdss change to mention possible
  crash on the unclocked HW_REV read (Abhinav)
- Fixed dpu_kms_mmap_mdp5() to call dev_is_platform() on the parent of
  the DPU device (Abhinav)
- Link to v3: https://lore.kernel.org/r/20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org

Changes in v3:
- Rebased on top of linux-next
- After additional consideration dropped MSM8996 patch. It will be
  reiterated later, once the generic migration framework is accepted
  (and after we implement scalers support for that platform).

Changes in v2:
- Dropped accepted patches
- Rebased on top of updated [1]
- Added defines for MDSS hw revisions (Stephen)
- Changed msm_mdss_generate_mdp5_mdss_data() to return const struct
  pointer (Stephen)
- Fixed error handling in msm_ioremap_mdss() (Stephen)

[1] https://patchwork.freedesktop.org/series/119804/

---
Dmitry Baryshkov (4):
      drm/msm/mdss: generate MDSS data for MDP5 platforms
      drm/msm/dpu: support binding to the mdp5 devices
      drm/msm: add a kernel param to select between MDP5 and DPU drivers
      drm/msm/dpu: add support for SDM660 and SDM630 platforms

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h | 291 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 225 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 103 ++++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   3 +
 drivers/gpu/drm/msm/msm_drv.c                      |  33 +++
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +
 drivers/gpu/drm/msm/msm_io_utils.c                 |  13 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  51 ++++
 10 files changed, 706 insertions(+), 21 deletions(-)
---
base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
change-id: 20240105-fd-migrate-mdp5-6a2aa51bc83b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

