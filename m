Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738788667DC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D677210E5BF;
	Mon, 26 Feb 2024 02:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CUDdRDCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E1710E5BF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:49 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso37832841fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913507; x=1709518307; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=niC6C/R+J8bHYFzcrG7ZCSfnUwClyNZ5Ps4/J+IPkTo=;
 b=CUDdRDCXzj3P+mzSeImE27AHCx/TcYopEUM7/AlpcErICQfwfajtyMn7ZCxOgFdHrX
 UPDTM3VlP9/mkl8fuoAAwk/Uga5/TaRWB14R18ug4ZBWi1bkB7dVmOUmRoS7ewMHllAg
 4AAQ+Sce+faARO9YD9A5tN4tUJ87Xgt9wXJPigBi6Ah2XR5nv+53wKa6WqW1y4iXB9QX
 Bl/zo82IjVM6nl/O5xx/JR8uHSGn9+6jzPi7Y73UIAyDap72QqkFj5KEkGHGUqKJ51Wp
 6JLxxd9o1b/ENjgGFIcHPa4rfxhRvLco1ZfXObh1G323RlRGJQd7XoyGwz/5HEH8dGYk
 vBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913507; x=1709518307;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=niC6C/R+J8bHYFzcrG7ZCSfnUwClyNZ5Ps4/J+IPkTo=;
 b=PrqmBILJzQJdVzwPEj69txuw39Z4O7qpj+i7m1VkhxncuUlyF1XiADP0waFvwFHVfB
 GSjLzF4klzGNvyO0J+BGExiNSWVkyFPgyOXY4/oMvr+LDIu2fv8TUTUFN1vb7s/1xz6n
 0yuVkBu//gxyXbJ/FP4DQ0gCBiQOMQj9x3MHpqEOB/nOErSvUxzuWVDJPTblt9VOFbi8
 o8ObsKShg830YBpdpsZ2xWJV8ixSk/FZ06T1D1A8UO5cpHDS+jXm3cvyQWi8Yre/WQNg
 WQp4mK6g3V1NUmk4vzojqodRG8jSICuciRo+xZCh4aXBdlyyV3kc7L73B89q8Dzufchh
 fkhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuCe0z35MsgfOD548kPHED5kaKg0uZntnrdYEjD3sEID17TpHDTS/ywyZgfivnL9jiM751B1c5X4jeN/xEJraWOa6WjrN1bg0O6S1++Q4W
X-Gm-Message-State: AOJu0Yw7XjvAwTGeEzW9MPrNnvtyuwQnr3z5gQUmH9x3LrrShkH9XfeU
 3VGIZFBaSaBu4B7RVnLnOXRIokKoU167sSEw0LT3KeRZulfl1YyBjUxZxFLdtco=
X-Google-Smtp-Source: AGHT+IGpJQVp8IHjurEggAV+32db88s6PORpoKS28XlCdvsbLc7szOwTRcrvMXxlZIQfISmiI7H7qQ==
X-Received: by 2002:a05:6512:696:b0:513:b6:df57 with SMTP id
 t22-20020a056512069600b0051300b6df57mr14423lfe.6.1708913507400; 
 Sun, 25 Feb 2024 18:11:47 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 00/12] drm/msm: add support for regenerating shipped
 xml.h headers
Date: Mon, 26 Feb 2024 04:11:36 +0200
Message-Id: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjz22UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIyNT3bQU3YrcHN3ijMyCgtQU3aREy0RjI8PklNSUNCWgpoKi1LTMCrC
 B0UpBbs5KsbW1AO30ODJlAAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=r/X2lYaizRlma7Uc8J+e3gDzBDcqrrA0PXdUYLLO2X4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgmoR0D8vYn2Dj6bOysB6SVAOKV76Wh12Ta
 UqiW50AW9uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1Sh/B/93JtILcMlYGjXxMCpHLvdkIKPW7fB7e4wU4fg/ulZJYlD54e1NMvTQaKoOuYEoEmH0u+u
 /fALdzLOnBiMJkT1VDLbKHcI5kwtP9tMd9oXpadUJC+sIq0gbjMGVgI+u2WVhsfVc5bdj75sUQC
 H24/oIM9nU9c2vtPiar/HQgDmqfcwEMJB1FhISlkwQfgorVP6Hr14cXyVny+oFpHxsrRDgoN5Fb
 b5PbIhkFrORoSqYHttgkzAzJMrMKy5gZwo8vIkVfrUb7ZtPzK2pJpU3If//PNa656kt7O4ahb3g
 eYSUPnY+deaAkHrNr9MkqHefE8IgnTiLOJTDFlCH7s3LgEY/
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

Move original XML files to the kernel tree and generate header files if
required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (12):
      kbuild: create destination directory for _shipped handling
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: use _shipped suffix for all xml.h files
      drm/msm/headergen: import source files from freedreno/envytools
      drm/msm/headergen: use asprintf instead of custom aprintf
      drm/msm/headergen: don't output full file paths
      drm/msm/headergen: generate _shipped files
      drm/msm: import XML registers database
      drm/msm: tie regeneration of shipped headers
      drm/msm: sync shipped headers database

 drivers/gpu/drm/msm/Makefile                       |   80 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |   11 +
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |  111 --
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |  131 --
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   70 -
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   61 -
 drivers/gpu/drm/msm/headergen2/colors.c            |   61 +
 drivers/gpu/drm/msm/headergen2/colors.h            |   49 +
 drivers/gpu/drm/msm/headergen2/headergen2.c        |  514 ++++++++
 drivers/gpu/drm/msm/headergen2/path.c              |   64 +
 drivers/gpu/drm/msm/headergen2/rnn.c               | 1363 ++++++++++++++++++++
 drivers/gpu/drm/msm/headergen2/rnn.h               |  243 ++++
 drivers/gpu/drm/msm/headergen2/rnndec.c            |  550 ++++++++
 drivers/gpu/drm/msm/headergen2/rnndec.h            |   59 +
 drivers/gpu/drm/msm/headergen2/util.h              |  113 ++
 drivers/gpu/drm/msm/headergen2/util/u_debug.h      |   12 +
 drivers/gpu/drm/msm/registers/.gitignore           |    5 +
 .../{dsi/dsi.xml.h => registers/dsi.xml.h_shipped} |   38 +-
 .../dsi_phy_10nm.xml.h_shipped}                    |   37 +-
 .../dsi_phy_14nm.xml.h_shipped}                    |   37 +-
 .../dsi_phy_20nm.xml.h_shipped}                    |   37 +-
 .../dsi_phy_28nm.xml.h_shipped}                    |   37 +-
 .../dsi_phy_28nm_8960.xml.h_shipped}               |   37 +-
 .../dsi_phy_7nm.xml.h_shipped}                     |   37 +-
 .../hdmi.xml.h => registers/hdmi.xml.h_shipped}    |  111 +-
 .../mdp4.xml.h => registers/mdp4.xml.h_shipped}    |   37 +-
 .../mdp5.xml.h => registers/mdp5.xml.h_shipped}    |   39 +-
 .../gpu/drm/msm/registers/mdp_common.xml.h_shipped |  114 ++
 drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped   |   67 +
 drivers/gpu/drm/msm/registers/xml/dsi.xml          |  390 ++++++
 drivers/gpu/drm/msm/registers/xml/dsi_phy_10nm.xml |  102 ++
 drivers/gpu/drm/msm/registers/xml/dsi_phy_14nm.xml |  135 ++
 drivers/gpu/drm/msm/registers/xml/dsi_phy_20nm.xml |  100 ++
 drivers/gpu/drm/msm/registers/xml/dsi_phy_28nm.xml |  180 +++
 .../drm/msm/registers/xml/dsi_phy_28nm_8960.xml    |  134 ++
 drivers/gpu/drm/msm/registers/xml/dsi_phy_7nm.xml  |  230 ++++
 drivers/gpu/drm/msm/registers/xml/edp.xml          |  239 ++++
 .../drm/msm/registers/xml/freedreno_copyright.xml  |   40 +
 drivers/gpu/drm/msm/registers/xml/hdmi.xml         | 1015 +++++++++++++++
 drivers/gpu/drm/msm/registers/xml/mdp4.xml         |  480 +++++++
 drivers/gpu/drm/msm/registers/xml/mdp5.xml         |  806 ++++++++++++
 drivers/gpu/drm/msm/registers/xml/mdp_common.xml   |   89 ++
 drivers/gpu/drm/msm/registers/xml/mmss_cc.xml      |   48 +
 drivers/gpu/drm/msm/registers/xml/msm.xml          |   32 +
 drivers/gpu/drm/msm/registers/xml/rules-ng.xsd     |  457 +++++++
 drivers/gpu/drm/msm/registers/xml/sfpb.xml         |   17 +
 scripts/Makefile.lib                               |    2 +-
 47 files changed, 8034 insertions(+), 587 deletions(-)
---
base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

