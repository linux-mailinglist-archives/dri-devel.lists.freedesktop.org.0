Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50447942DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F7510E6E0;
	Wed,  6 Sep 2023 18:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414C10E6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 18:12:29 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68c0d886ea0so107377b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694023949; x=1694628749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rzB/a+Y/lgN6TI3eOxXMKAuw0gNhLZ5Kr4Exadxywqo=;
 b=kUHIg/vrpkZ227PBq7l2JQ3bn8Cn8M3N2V1H6W7bP09l8G+W5Tisn7iNWzw7jZ3mcw
 4Kelm2/lV214yHogWVraa3lq+zMm9BbGhz7U5Aa99nrxDNxL5PCvLYHTGzU1uRWek7IP
 TXR94WoICtOkNAfrZpX+5I7LovmR4rInYL/gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694023949; x=1694628749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rzB/a+Y/lgN6TI3eOxXMKAuw0gNhLZ5Kr4Exadxywqo=;
 b=g2p2qeez1Wd5dsP+R7gGxSvHZbedii2mXEqqtO0ztPE9uR+zp4GLVzhT82ajN9UFWY
 A+EUIaSYWVxepIZTOFLud+vgR4GCUjZwPbUw1zA4TFYM02wsNynRtHeuEBCzIjynH2T+
 y01vU8zsEnNXxgQbJHMhPu3ZDUX2e5IKiELnw7ovSxHHfVfkX83qypb8zXhf7M9TvxWp
 swqIk6AO+KOdc5bW1AitagKozn1J3PntYRAgsvmd/n4soa1SKliPtkSWWX92h82lZM3S
 UaMO9E/nwNaDetS6SSa/JNCbp1AVrgYuejpJvVvs97qUdNAgwZm7a7JkYjKGL7Moyif1
 fQSQ==
X-Gm-Message-State: AOJu0YzS/rr6zqWax3Zbyje76vA4I9sxKqMBvDxzG1d/kTb1pZDXGBST
 JnxHPEsk2R3b7nmhjn4Aaoz4PQ==
X-Google-Smtp-Source: AGHT+IFw80g3ey9sUj6HYD/2kE56XDAkqaOhhVXfaGukTfoWlgxr29tf8KH2PEk4eYpkhtgk61cguQ==
X-Received: by 2002:a05:6a21:3e0b:b0:14c:5dc3:f1d5 with SMTP id
 bk11-20020a056a213e0b00b0014c5dc3f1d5mr15722364pzc.32.1694023949115; 
 Wed, 06 Sep 2023 11:12:29 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a62e80a000000b0064fde7ae1ffsm11080552pfi.38.2023.09.06.11.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 11:12:28 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/msm/dp: More DPCD cleanups
Date: Wed,  6 Sep 2023 11:12:24 -0700
Message-ID: <20230906181226.2198441-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-on to this series[1]. I can resend the whole pile if
desired.

[1] https://lore.kernel.org/r/20230829184735.2841739-1-swboyd@chromium.org

Stephen Boyd (2):
  drm/msm/dp: Inline dp_display_is_sink_count_zero()
  drm/msm/dp: Remove error message when downstream port not connected

 drivers/gpu/drm/msm/dp/dp_display.c | 10 +---------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
prerequisite-patch-id: c637903336fb0fd5593f0016f0c863305c43a6b9
prerequisite-patch-id: 8610693078de9cd5041266c70c4d044d15a5f701
prerequisite-patch-id: e10675f41cc68dcefa566f7f288b2df72afdb116
prerequisite-patch-id: 63280d764b830e3d25455ae642840cff5f90e118
prerequisite-patch-id: 567e00d48c5a296b454079a51483f2acce357347
prerequisite-patch-id: 1c18472728edc1ca8800dd6ed6ff12cb98084ea8
prerequisite-patch-id: c6f74b922b3a4f2255bcdab11fe3a2ecf7891262
-- 
https://chromeos.dev

