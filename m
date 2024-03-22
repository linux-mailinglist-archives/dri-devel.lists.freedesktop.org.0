Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D128874F9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C1C112889;
	Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="znacadBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33D112889
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:57:00 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512ed314881so2056635e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711148219; x=1711753019; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kfjVwt6d+IRd8DOInllyNHPrf4pjD9asCpY8CF5unc4=;
 b=znacadBTTTPKQsRaaDhs0idDY+lCdlQMFP48AtB9rrB1cJ6FIL8pIC8FRGFg/HItRN
 uq2xB5+8CR8YErXbgRe7ylBBmsR6eOl6jANk5PCCfJEACzg2sBNY7k+pAEmNjNtSTib4
 /VlryDN8PNavdTogjGWpAwjVAhL8EuVqq74JXw2a016gc6yarBY+rxt+u0XrIMhYKD2M
 hjHijz9J5wBKn7IwOqG4IoLYDq6wmNw297+JBusHz/25tMgRsvnKBrd/PfSwnIU55yAT
 7tw9PZ97y76rNX0yK9OfvByuhFQZUXYPUmYGM8iBtTt2gMYaROEQCj75duzkDBV0c4XM
 xa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711148219; x=1711753019;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfjVwt6d+IRd8DOInllyNHPrf4pjD9asCpY8CF5unc4=;
 b=g3fKL5WV2G3zqiUobOpO7TpAzB875Fy0LKwEJ8EOk117iWqrW+ms/ZDRd+oQWMOrr/
 2C6wiNUuRHUtMtMxp1670MGJg+tZYRBtzA9hQLqySq6pThY1keC6dB2o3y1kF33gYBVZ
 2f7cwIAi/FxcGy1bU/W+RtNTnwIkgyZ835kGwpI4Deiytv1tIqvcpUogjCNLR3+KKmHf
 CJ4ewBqbZ+gtwm/ONkt0WPNkRePbjLQa6Rl4poWtRH0L8XSpnRYIsyCXBr4rURn0vJoP
 c3a29sDm9D+/v5ZT/WihnSYnhjiLGwrqOvl2mgo4zaXLF5/8nhdnG9wh9M2hxCILMHff
 g7TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx937iadssAgGCgKfgbsX73GJcDhivpYL0c/bkXRQr9V3K0C4Y4BjZ6uSJR9ll0F5gXoyL/VsMjMqw47DFF5vlQbKgRHXkgcWszqvCO9rF
X-Gm-Message-State: AOJu0YwiruSfoGeFqZhnA8cx7gw8lspFbGBCgM4SbJXZ1bEgKYk2+ZQ0
 r7a9vLYx2yVSb6QUxfdLUoObFnHWlaP02d+Pzx2xgvl8FnDlkpSobRYgw/ohFDw=
X-Google-Smtp-Source: AGHT+IFHVlDi96VVX9QQGQSp36xeTVVK2YAOFfU9flowpUO64lBi5C0OuNMJrS/SE1YaXbH3CXQNLg==
X-Received: by 2002:a05:6512:32a3:b0:512:f657:122d with SMTP id
 q3-20020a05651232a300b00512f657122dmr586259lfe.12.1711148218316; 
 Fri, 22 Mar 2024 15:56:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 15:56:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm: generate register header files
Date: Sat, 23 Mar 2024 00:56:52 +0200
Message-Id: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQM/mUC/33O0QqCMBTG8VeJXbfYztFlXfUe0YVuRx2Yky2GI
 b57U4goocvvwO/PmVggbymw825inqIN1vVpZPsd023ZN8StSZuBgEwA5Lw2fLx3PLR2GMjwqjy
 VCFIbMjVLaPBU23ENXm9ptzY8nH+u/SiX6zulflNRcsELVVVKI2bKwKWzfendwfmGLa0IH49y8
 0qE5I/aqIK0zhDExuN/j8mLWksAQqVz/PLzPL8A0skSuS0BAAA=
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6362;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SUasj9x+5boQXrGjbbvWEUUrFe45KHm8dnD84tTBZlM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy1GAeGsSVMy2dItc8Eim/HYejhaCYx4nzxi
 6x2n0RnrtGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtQAKCRCLPIo+Aiko
 1RouB/0RA0EXl8cWAvvhz4VFY1azOhyepALjUsAfJ+HobFciLte50m06U+7me+dFHP9WN6ry1zx
 mn9I4DasJ0PZ58Q/Td8thBaDEY2/cyQWTZ57tk+zNEHTieUQMstkzZWvKl1X48h7uJ5waNI3cmn
 Lziqtd2tgGqENF8TirzbiznPDeATIliXcuT6minaEbnwh3FvWSQdYE61Tyc7Q8TgI9h4oUcoaxN
 F4HmPtkmAbQiWhCoSaAE7zi7wrYXlnpGai9caKSr7CiU/rZerbdjNkc6tFIyEtxWpZIjS7lWGAn
 Tc84BNWJwSn8frUVT0U9n+F5x6CSpng7jUd5iLNgnJQ3oF6i
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

Currently display-related register headers are generated from XML files
shipped withing Mesa source tree. This is not fully optimal: it requires
multi-stage process of the changes first being landed to Mesa and only
then synced to the kernel tree.

Move original XML files to the kernel tree and generate header files
when required. Display-related XMLs are going to be dropped from the
Mesa, with the kernel becoming the primary source. Adreno-related XMLs
are still going to handled by Mesa and should be synced from Mesa to the
kernel when required.

Unless there are any objections, I'd like to consider this a final
revision with the target of it being merged for 6.10. Please review.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Updated headers, schema and script to the latest version merged to
  Mesa
- Further split of Adreno XML / Adreno headers patches in order to pass
  through more ML filters.
- Dropped the RFC tag
- Link to v3: https://lore.kernel.org/r/20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org

Changes in v3:
- Split XML and git rm patches in hope to pass ML limitations
- Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org

Changes in v2:
- Removed the _shipped files, always generating the headers (Masahiro
  Yamada)
- Replaced headergen2 with gen_headers.py
- Simplify Makefile rules, making all Adreno objects depend on Adreno
  headers and all displau objects depend on all display headers
- Also handle Adreno registers
- Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org

---
Dmitry Baryshkov (16):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: import XML display registers database
      drm/msm: import A2xx-A4xx XML display registers database
      drm/msm: import A5xx XML display registers database
      drm/msm: import A6xx XML display registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly
      drm/msm: drop display-related headers
      drm/msm: drop A2xx and common headers
      drm/msm: drop A3xx and A4xx headers
      drm/msm: drop A5xx header
      drm/msm: drop A6xx GMU header
      drm/msm: drop A6xx headers

 drivers/gpu/drm/msm/.gitignore                     |     1 +
 drivers/gpu/drm/msm/Makefile                       |    99 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} |    45 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
 drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
 drivers/gpu/drm/msm/registers/.gitignore           |     4 +
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4970 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   400 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2268 ++++
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
 drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    90 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   957 ++
 drivers/gpu/drm/msm/registers/rules-fd.xsd         |   404 +
 57 files changed, 22431 insertions(+), 39792 deletions(-)
---
base-commit: 226d3c72fcde130a99d760895ebdd20e78e02cb5
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

