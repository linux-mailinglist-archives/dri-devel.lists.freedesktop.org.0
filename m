Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119884B30E6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1710EBB7;
	Fri, 11 Feb 2022 22:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816F810EBAA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i34so19280615lfv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqrGjJky4QHW+nCXoO2D5B1Is7dfhEvVRFup6JlSelo=;
 b=tBIBK61QKzeRfYGXURoiPtSrXZUamLlmdY4J4hdjLaFSdkYAnb4XXKW2ZGhTZyEYku
 0FGQPpnxi0W0yUxDJba61130RA56BuDBBEFvGUAcxLHq3z5WCsliwSkR4RVHjhuivYfl
 r3iKJObj5Pw/ftV7cM2aHbvNl+rE8mNTqWU4FFfKEyrdnOUikYqROnfOZYKLLFGZd8mP
 wIPOP2MTmiH1ZHMFrmH7TuDJa2WvcvwApHMNjXa+otZnZVeDPdDULuXztPYAJfH4GAez
 NSH/sE+b0BaQhdoS/EZBenzTs/F8lYaszOLG/QrtZjglzy39FlrTuDT1zF6iw+PfNEhT
 lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqrGjJky4QHW+nCXoO2D5B1Is7dfhEvVRFup6JlSelo=;
 b=YHp6HxVihVwFnsJso4MnBc8zjGZZmTnH9fyk08Ql/EUrtxGaVqsv5FM6Cio7eG9Ojx
 yTXusU8MoGwplt9Ccp47elXRTFMylR3tHSh/HelJq8nI4Ks45pFMDwRqNk86lgCNrsyy
 ndvRjmjXRA7Omha73Wp3CP5Fu0RZf7JT/faHCdSwrqb4uDUcLQWXFqNRjWYMPVfF903j
 QVMgbY60/ObKwETfhrLFfX/EnhVPj3ntc2o+Y/huUy7h2PtD4qVg0+lZ/X3oigSpgW/N
 eJbId4DYPB3Xk22Dj0GYbjQG8Y/m/9mCgFxeAVEbgo+2f2yI/sWVQASSNa5eyQDra1px
 8CsQ==
X-Gm-Message-State: AOAM530O4lR7qiXbl4glClOocPyu5glV5BsBG8fQ5Oy5uXZzILYH58HJ
 7VV7QEaUJ8DdXCKsxLAXAkZVog==
X-Google-Smtp-Source: ABdhPJxkNJ1LnV/L9NG6QflGexprn9zjVcmWDTASNxV9z8sUfjJcdg6L8KDp08gHHq+orYxFSMJBfQ==
X-Received: by 2002:a05:6512:e8c:: with SMTP id
 bi12mr2687360lfb.612.1644619207381; 
 Fri, 11 Feb 2022 14:40:07 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH v2 0/5] Simplify and correct msm/dp bridge implementation
Date: Sat, 12 Feb 2022 01:40:01 +0300
Message-Id: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") conflicts with the panel-edp (panel bridge)
support. Both bridges will try to attach directly to the drm encoder
itself without forming a proper bridge chain.

Initially I started writing lengthy letter describing what is broken and
how it should be fixed. Then at some point I stopped and quickly coded
this RFC (which is compile-tested only).

Comments and tests (on both DP and eDP setups) are more than welcome.

Changes since RFC v1:
 - Expanded commit messages to reference possible setups
   Added details about possible bridges, usage, etc
 - Changed handling of errors for devm_drm_of_get_bridge(). Made the
   -ENODEV fatal for the eDP connectors only, all other errors should be
   fatal for both eDP and DP.

Dmitry Baryshkov (5):
  drm/msm/dp: fix panel bridge attachment
  drm/msm/dp: support attaching bridges to the DP encoder
  drm/msm/dp: support finding next bridge even for DP interfaces
  drm/msm/dp: replace dp_connector with drm_bridge_connector
  drm/msm/dp: remove extra wrappers and public functions

 drivers/gpu/drm/msm/dp/dp_display.c |  76 +++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 186 +++++++---------------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +++-
 drivers/gpu/drm/msm/dp/dp_parser.c  |  38 +++---
 drivers/gpu/drm/msm/dp/dp_parser.h  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h       |  31 -----
 7 files changed, 137 insertions(+), 221 deletions(-)


base-commit: 6aa89ae1fb049614b7e03e24485bbfb96754a02b
prerequisite-patch-id: 89e012b5b7da1a90cc243cc4c305400a4fafdf0b
prerequisite-patch-id: 0de618d54d5fea5b48c2b540c8731a1a7e2f4c15
prerequisite-patch-id: a9b1a27e9800626cc0ebc73291d65c2790670583
prerequisite-patch-id: 2067135baa2995fbcbfd6793b61e39027e6b7516
prerequisite-patch-id: 0591114f3c59f9376ba25e77e7a48daf90cf7aa6
prerequisite-patch-id: 684cf6c7a177cb7c6c9d83a859eec0acef5c132c
prerequisite-patch-id: 083313bc9b19fcf7fed78f63a3cb0752f54cec4f
prerequisite-patch-id: 6e46e24cd7471ba38679b3d6f99a1132fa1154b3
-- 
2.34.1

