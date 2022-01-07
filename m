Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903348700D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A580810EDA3;
	Fri,  7 Jan 2022 02:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6D10ED91
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i31so10181573lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcWHJ8P3XkzFQQW3zPOm7KEW52vk02Gnrdh4I43mbBI=;
 b=cd+rt/oo4TcvTGmaRCw/ZBxa6vRgUQ4n90NeePnGws6WyOHImb01Jh9B/00qX/jOx8
 vz54bBnWmzxryxXztek9aqK9Mj7Q5ZF0IGWw1uPigqDk2la2okGhbLuuOgfPpcx4mYXQ
 CyJcU4c0VOPy9q8x+XPXA1PxMfbrwK8/jBs0f5YmTVQAXhBEr7SGQjnoW2q6IPTq9h4R
 k9U7meBuZQz11ngINp8gJRVSJitjGNlwJp/XWrfzfMierhTlTugebl9NYLFxGdJUyj0z
 F6PZAfZpTp/KWyEzan9LsuH6f0wPLLTUuXMiOb/f0Su5LqB5+F1WxnNwHWM/GoaMcODZ
 k1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcWHJ8P3XkzFQQW3zPOm7KEW52vk02Gnrdh4I43mbBI=;
 b=0Nbdq0zybQAIF3js4WRrGTc6EzwQYIG2myzOEcGw8VWBHAOJZNKTkGytEh8KFUdYIi
 imO8t0tLGIBJvxHKNjjn7DyngGuI7srs9oKEVLv0N/CP5MJylZssmeHmq3BDJBw4jdUl
 qaDX50uSqtL7MzpoFes0yI4J3tqYGj8RCS0kjDKcEZ0nSYAeTzU7B4H6UsckGrlqZxH8
 y9vIpUTg8Lrx+CkDi6giOUK0sARQClX1tQro1j2w03aj4oJqnMcgADOw9xBAAoErqzrR
 kCVdDJS6ZE3rJ7drzpO+mwaVExmd6QZXr1HAvnwpTH5GHmnO/jkYQFhdyzANY5y/CiTn
 P9AQ==
X-Gm-Message-State: AOAM53226aDVnv7aLJ+NWRRBwju+B0LQZoUWGAUy1t0mC1tLcXTUvHub
 pCfVRq+qZ7XAyVOpIQqb8hs5/Q==
X-Google-Smtp-Source: ABdhPJx5a45dP9VdBZMDUsAAoGHCn4VxigZKS9Lk/a6nV7ye2CNzgvzQ6RQBwXYDQ+qmS74ZU9qU+g==
X-Received: by 2002:a05:6512:1392:: with SMTP id
 p18mr34114418lfa.98.1641520895718; 
 Thu, 06 Jan 2022 18:01:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 0/7] Simplify and correct msm/dp bridge implementation
Date: Fri,  7 Jan 2022 05:01:25 +0300
Message-Id: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") conflicts with the panel-edp (panel bridge)
support. Both bridges will try to attach directly to the drm encoder
itself. I started writing lengthy letter describing what is broken and
how it should be fixed. Then at some point I stopped and quickly coded
this RFC (which is compile-tested only).

Comments and tests (on both DP and eDP setups) are more than welcome.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-dp-bridges

for you to fetch changes up to 7eff304d50ba520e9193a293a8e42bbd9d7aa0e1:

  drm/msm/dp: stop carying about the connector type (2022-01-07 04:56:06 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dp: fix panel bridge attachment
      drm/msm/dp: support attaching bridges to the DP encoder
      drm/msm/dp: replace dp_connector with drm_bridge_connector
      drm/msm/dp: remove extra wrappers and public functions
      drm/msm/dp: remove unused stubs
      drm/msm/dp: remove dp_display_en/disable prototypes and data argument
      drm/msm/dp: stop carying about the connector type

 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 263 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 250 ----------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  |  28 ++--
 drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +-
 drivers/gpu/drm/msm/msm_drv.h       |  32 +----
 7 files changed, 203 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c

