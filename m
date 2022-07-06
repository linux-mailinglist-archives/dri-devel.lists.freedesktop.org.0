Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F905688B8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C98B11AEF0;
	Wed,  6 Jul 2022 12:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BD111AEEA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:53:02 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d10so496091pfd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Jrq+9nhJVPkb16NrcuFTfB7e3j9IauFbZGggqbekZE=;
 b=RMIyRXkUpjKnFsk+wP6wqhXeoDxmMid3B2636Lj2B7JZTN1p2wmjS3KpKD4co3iyNI
 edYJxzgcQBzWYIgV5L+rGFGTukpsT/v7zNAEVBfcEKm8pN7U6yrOX4CCfd4tdxNs5K2l
 BcqM08kUWzxMO8XuHPOwYTDbad0jXWomJKCzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Jrq+9nhJVPkb16NrcuFTfB7e3j9IauFbZGggqbekZE=;
 b=aILQpnL0MAxyidkliRJfhlGTVIPq6FoyLPZss4yyj8H0XEvaagWvrp3W8dwmPwXqA1
 Sgr1JzPzMZw/ibjLub1RUD3xydJplBMxnBpc5Ke8p06oCq+d5up82sPjqLIEaPQ+ij19
 ZLWHl6pg3zhzPgTBhtNBOsdMu9mWqQIkzihSGkXNjYxVNAJEBfbIV5lmccAfTvzj5jm3
 Vln03I2VriNoJKwkfd5/ZLMydxMgrtVE1FyR+d9GySZJYC6+nhgKXgp/uGsVE8poHdyY
 HGhQsAJ517QKx1h2LQWycOf6pDRfzrqN5eouCdO7rE+uyBH2hZQpvZ4eBxb0d9PMzBeB
 RBow==
X-Gm-Message-State: AJIora/BYFdBQ6pHFHQXoU7YtpPl4Ijec3CXDHJCjHIghvjoHMybav2K
 WtMgKXDdvZ3ZLh1OIQwjJNl0dI6OwSHBLA==
X-Google-Smtp-Source: AGRyM1tFsvASDX/k79J0S9FSg9rF1KUurn8OfXWYH4+7+zq6n6k0/x6kaTMJPetzy+8EIukF98Q+2A==
X-Received: by 2002:a05:6a00:14c7:b0:525:89c1:35fb with SMTP id
 w7-20020a056a0014c700b0052589c135fbmr46792853pfu.36.1657111981746; 
 Wed, 06 Jul 2022 05:53:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5300:b974:1680:1bd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0016a6cd546d6sm25640127ple.251.2022.07.06.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:53:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 0/4] anx7625: Cleanup, fixes,
 and implement wait_hpd_asserted
Date: Wed,  6 Jul 2022 20:52:50 +0800
Message-Id: <20220706125254.2474095-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains:
Cleanup:
- Convert to use devm_i2c_new_dummy_device()
- Use pm_runtime_force_suspend(resume)
Fixes:
- Fix NULL pointer crash when using edp-panel
and Impelment wait_hpd_asserted() callback.

The patches are not related to each other, but they are all
anx7625 patches so they are all stacked in this series.

Hsin-Yi Wang (4):
  drm/bridge: anx7625: Convert to devm_i2c_new_dummy_device()
  drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
  drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
  drm/bridge: anx7625: Add wait_hpd_asserted() callback

 drivers/gpu/drm/bridge/analogix/anx7625.c | 179 ++++++++--------------
 1 file changed, 65 insertions(+), 114 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

