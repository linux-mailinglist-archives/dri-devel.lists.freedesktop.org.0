Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFD907959
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C377510E217;
	Thu, 13 Jun 2024 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cYrp8fqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5710EB16
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:08 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52c819f6146so1880905e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298307; x=1718903107; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5s81hRJV5Zx9U5qH2vAOJUfHtOUwvEenRjG7i+7iL4g=;
 b=cYrp8fqDw+A6Vro6t4+IYIdplHHMlzse3iKB3tS7/0L8UdnxYOWnAsgemiFf5/X125
 LRrG8AWq1ie6eK/DMQnWNskKczZIA5gnMrPjrlL9FqhGiHqK2hfuf957fGo+MVmKuF50
 BnLA+Fu08x+vGhsjs7tnsyK257l2dQcK0zfoGv2Ik9NuhW3/cvHq7faJ7RmfG0ZXvfQk
 mZ7fRsol9nOCbXVnjfeecK0DojVZ5U1Elai8Qnw1rGlsWMzDsNnfj6twgJ6IB66xEfjB
 6c2fOiRJnLufPybtlBHUSqDJNRz7dEOuYYmW6eAMbZcBUdfc26TeFV1oHlMxV31Bm3u7
 IImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298307; x=1718903107;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5s81hRJV5Zx9U5qH2vAOJUfHtOUwvEenRjG7i+7iL4g=;
 b=PhUKz2GePKXg9WrFMIsseklpI8FKO0TKzVV2jDTjzW3onTnMjdytBNa3fqUguS0ax3
 A9Rkfh4fKuXNhMMmiMVXjCR9ge9lw3kaqP7yqzB9eajFsCP6DDBrXPBo9TcTwSXBBCQs
 NakR6LfRnEU+1ND+CHqURYnR+nCtNWD74+GMbyA74lw9TWqlNpds0k1TCzBuN1lRBpbn
 XueV1sdP/8fsi87QY1CfS09UTnkSfezYfuD6kHGsVKECq2sJ5gIqz4YXmDPq1C4RLh+p
 izI0C8JHSRyU8IyCByIS5FZveqmk+S2kQG5fgwnu+LLNnhudEUqH3RiPyReo6050l26M
 5hWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/c/5TyOqKWKALpQk1ampybT79uqOj91HpOt1dTZHgqUJTGiYaxZKXlGfmL0hVMpg7/tN1Cf+kQwgl4W6EQg2TgdARytJSvVDwUOKKb+9p
X-Gm-Message-State: AOJu0YzE9e9IesaPVxnf+iPlZI8LOhx1IsO4xQ24D3ssKM6qslIgi4oj
 hmihMGaxM8u2C12WfvlwUkX2KC8f6dSlyhHJcepLCpEd0flnySMIXMhXZ891T3g=
X-Google-Smtp-Source: AGHT+IHKrwhQZ9vxGVegzTyWBoWr/raE8v/Q+V1t2Hug77JcE2x2GspnZP88cLa5rhHl6EyTzJWpaQ==
X-Received: by 2002:a05:6512:4819:b0:52b:ef61:cb73 with SMTP id
 2adb3069b0e04-52ca6e6c91emr240352e87.36.1718298306813; 
 Thu, 13 Jun 2024 10:05:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: handle non-default TE source pins
Date: Thu, 13 Jun 2024 20:05:03 +0300
Message-Id: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8ma2YC/22NwQ6CMBBEf4Xs2TXtgoic/A/DodAFNiEtaZFoC
 P9uJR49vpnMmw0iB+EIdbZB4FWieJeAThl0o3EDo9jEQIoKddEF2vmJqbAT48IYZXBmworKMu8
 Uad1aSNM5cC+vQ/toEo8SFx/ex8uqv+lPSOq/cNWosKdr3hZkVHXr7pM4E/zZhwGafd8/m4FX0
 LkAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6OI1zdDevRN8dC7/6y23Sk+GAv4kSLgtWhdz6coRuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybAGNxJLg/ANFwNRgQ8s2d4ZmCLfW5rXeILz
 SUGetZ0ls+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwAAKCRCLPIo+Aiko
 1dH7B/43p0LbaZKdVSHQbQqKu67/DTQgos56C68bQHGXcvDavLr8Ks81BXvV7JqhBwDeLNIew8Z
 ROcjWND6fsJ/kTY5bbqwX7mVpj3bY6w/g5J3Jv/WwnY/+IpWZoRvARy0dLpLRwn+s40wb0LctH/
 cPZJh/3+LDjgw+6FjoKKPim+btsmJcsNeJc/a7l1FjGIR98x67SpklgZfbpilXtIEMhsDlOTZzi
 YWVnOAccNBhuQ49f0vCzq9ef3CLyJ5izA/2swjKlKgUfVRwsju/qwscUsYeepx9AjMoWfztDuGN
 WjzW1PhDp34SXsKgTvZoslAkX7tszVGyeSQElDhXi60EZVBE
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

Command-mode DSI panels need to signal the display controlller when
vsync happens, so that the device can start sending the next frame. Some
devices (Google Pixel 3) use a non-default pin, so additional
configuration is required. Add a way to specify this information in DT
and handle it in the DSI and DPU drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- In DT bindings renamed mdp_gpioN to mdp_vsync_p/_s/_e per pins name (Abhinav)
- Extended bindings to include default: mdp_vsync_p (Rob)
- Renamed dpu_hw_setup_vsync_source() and
  dpu_hw_setup_vsync_source_and_vsync_sel() to match the implementation
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org

---
Dmitry Baryshkov (8):
      dt-bindings: display/msm/dsi: allow specifying TE source
      drm/msm/dpu: convert vsync source defines to the enum
      drm/msm/dsi: drop unused GPIOs handling
      drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
      drm/msm/dpu: rework vsync_source handling
      drm/msm/dsi: parse vsync source from device tree
      drm/msm/dpu: support setting the TE source
      drm/msm/dpu: rename dpu_hw_setup_vsync_source functions

 .../bindings/display/msm/dsi-controller-main.yaml  | 17 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         | 14 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 13 files changed, 114 insertions(+), 69 deletions(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240514-dpu-handle-te-signal-82663c0211bd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

