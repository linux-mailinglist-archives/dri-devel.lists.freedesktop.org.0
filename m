Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC69519189
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312010E315;
	Tue,  3 May 2022 22:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B2610E1E7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 22:40:52 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c11so5951245plg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
 b=CR3c66gXlI7dp0GBAFTU6S4A96UiPfse88KiZYhRAnyvdsiEtq5+rIgzLTXLBAgAFL
 rU4spHhLilzT+XqFo07FtFJT+O0In8w0k8D2zdB9Dgl1tea50Azb8JKw4BpEBlbhl6BQ
 P8/vwL4+iRR/6ZBfz77yKapJZq/VOVXeRz+5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
 b=YFJ7Zjw/zfybJSkRmBg8YoFi229NuuiP6p8yZrVR5SEfKlrSsT96dirfSXbrULn+1A
 +1WxmHuRHmOWTSizQv+wP7BYLmaImZ9PUQCUEfAf1uO4uqc8N1h0GGp6V2ut2/6/c8Ye
 FOrmdrxBFLjdgDpK/129FpfR6sYFga3bj2tHp2j57VxkJHLls6afaMgR90t1XIbKe+sL
 Q3wO9thIJMzJqFwleRTihQdt1o2DQMEn/FMb8Za1EEwd1mVDhjEfolluZGGvUg4vh3Nh
 t03KZDHcBZGL0Dz44c1ShYaTPXeTYtTG5qhS9Ls2SkaxuP+4rqYebnn2EB2dNTMJitlU
 dwbA==
X-Gm-Message-State: AOAM5339LHcUp4YvJ9BfokVYnPcUp4Wlcr52JzvzHB15//Q+eEWIahQ3
 7kt3FVBLaB3mgB+3trfaV1BIIFyGJeNOB2TQSIM=
X-Google-Smtp-Source: ABdhPJzYaUyozHYiMHueXIGD9R5owe6Q0eQLyLYo/8TUtTmGnNhSX5JUoZ8jDGchkO1aSnwI/fJfAQ==
X-Received: by 2002:a17:902:d1cd:b0:15d:1483:6ed6 with SMTP id
 g13-20020a170902d1cd00b0015d14836ed6mr19614970plb.58.1651617651626; 
 Tue, 03 May 2022 15:40:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:93ca:84cb:c452:c0a3])
 by smtp.gmail.com with ESMTPSA id
 az12-20020a170902a58c00b0015e8d4eb27esm6803778plb.200.2022.05.03.15.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 15:40:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/dp: Make DP AUX bus usage easier; use it on ps8640
Date: Tue,  3 May 2022 15:40:27 -0700
Message-Id: <20220503224029.3195306-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is v2 of the first 2 patches from my RFC series ("drm/dp: Improvements
for DP AUX channel") [1]. I've broken the series in two so we can make
progress on the two halves separately.

v2 of this series tries to incorporate all the feedback from v1. Hopefully
things are less confusing and simpler this time around. The one thing that got
slightly more confusing is that the done_probing() callback can't return
-EPROBE_DEFER in most cases so we have to adjust drivers a little more.

The idea for this series came up during the review process of
Sankeerth's series trying to add eDP for Qualcomm SoCs [2].

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
[2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/

Changes in v2:
- Change to assume exactly one device.
- Have a probe callback instead of an extra sub device.
- Rewrote atop new method introduced by patch #1.

Douglas Anderson (2):
  drm/dp: Add callbacks to make using DP AUX bus properly easier
  drm/bridge: parade-ps8640: Handle DP AUX more properly

 drivers/gpu/drm/bridge/parade-ps8640.c   |  77 +++++---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 215 +++++++++++++++--------
 include/drm/display/drm_dp_aux_bus.h     |  24 ++-
 3 files changed, 216 insertions(+), 100 deletions(-)

-- 
2.36.0.464.gb9c8b46e94-goog

