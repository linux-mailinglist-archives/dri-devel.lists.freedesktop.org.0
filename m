Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40B4ECFA3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584310E1AE;
	Wed, 30 Mar 2022 22:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8895410E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 5so38290499lfp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
 b=hQPWu/OIb+Zegy4kT+8Em3QCWjiXaFxFPWp5W2WJaaPEXiGblSSVNAXq8q7uOJtC47
 eJ06zbMxbNw0E/hPe5Yjp02P12DRRSmUDfhM+CttqoHsY2JzvzAmyf3wiHVPDeIoKpGw
 Gq66rgG3yK108wL0ib2j/2l2m9zypCghXh1zONv+9wNSCcx7a7214v2XygnOF3Qhh53D
 muKngZCaFu3fTimsAwa7EJL10OzYpzB9Et5MUbfTxCCjOrxUViMBWYblP13jvhXdzrc5
 a6uFuEzBRgypjI7nBMWTbFx2vY2sel6pPBIfROrWd0A1tkHllnzpARSS2BurI8UK71sO
 iNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
 b=kUg6xeKspjNfRM4NtT5oxmha6rSmBsG/eIvGq275RoOSLE2u6qz0Lakpn7BufvHuJ5
 oI93qUFMTKk5cvKwSWWNUdBWDvMpJLV5idJGv8kar4hwc/ew/RXlylDWnD6ks+riX2Cn
 ZMagEMayDBQAueeqzlo+BvLgvOgVAH98Goz0kc2ClEVcBUGHT5Z+iFwk1KujmVSquzyo
 pdpAFJ0R5qlLO/5A8kdC1aJ9cENUvzHKi2PkK3Qy8XSpqO8TPg6J3fdZ7ARAtf6UwhSo
 syt7w0j5SZ3Etb3yKRe1W8LIQ7W9dS9H0DiogP7o/wejjepMM1giaF9Fhuuo/L+YF6zc
 V+mA==
X-Gm-Message-State: AOAM530M5ZvDjc5epH0tGtLdjxvRsd0a63T+xezB/EwpmQLZz5E3S3Tf
 TRLnvODwZ9QxZ67qlEdv2MhhiA==
X-Google-Smtp-Source: ABdhPJzG/f64ACIg2eEZE7Cx4oJHdTia/6Z35v5jnReSD+gy9dIQgwNO9KoopCVhR+hFwGsgSOzuRA==
X-Received: by 2002:a05:6512:32c2:b0:44a:700c:4e97 with SMTP id
 f2-20020a05651232c200b0044a700c4e97mr8590964lfg.224.1648679409820; 
 Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 0/4] drm/msm/dp: simplify dp_connector_get_modes()
Date: Thu, 31 Mar 2022 01:30:04 +0300
Message-Id: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
on-stack interim copy of the mode. When reviewing the mentioned patch I
noticed that the rest of the code in dp_connector_get_modes() is weird,
unused since September of 2020 and can be removed. This series removes
dead weird code leaving dp_connector_get_modes() simple enough.

[1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/

Changes since v1:
- Remove unsued ret variable from dp_display_get_modes()
- Add a patch making dp_connector_mode_valid() return MODE_CLOCK_HIGH
  (suggested by Stephen)

Dmitry Baryshkov (4):
  drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
  drm/msm/dp: simplify dp_connector_get_modes()
  drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
  drm/msm/dp: make dp_connector_mode_valid() more precise

 drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 12 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
 drivers/gpu/drm/msm/dp/dp_drm.c     | 35 +++--------------------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
 6 files changed, 9 insertions(+), 50 deletions(-)

-- 
2.35.1

