Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95D7EFB09
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313C10E13D;
	Fri, 17 Nov 2023 21:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1410E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:51:01 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-280165bba25so1937468a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700257861; x=1700862661;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swBF5B7pk8gsTpy7ro1S9ZK9Y1Lu98QqRS2h9Xja/h8=;
 b=ZW4JGrKub1uWqBKaYNCpeHILrzHGyWnmujGLT2kSC2vJGG1px9xWnU/tIuYNb/AaWD
 qwrbi2Xk8iUAwAHvgRfh/eDfVD9+QCylj4wYutqD/yREq1YkZpZpDeHyj5J8uBpXT/PY
 hshUtQxANk2xX3UNkVFZzEE7ISPQ3F1Ndc3hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700257861; x=1700862661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swBF5B7pk8gsTpy7ro1S9ZK9Y1Lu98QqRS2h9Xja/h8=;
 b=ek4ZGIyTVwLN5pbhX0Dgs8ZG2iW9kLkYKMWcRguT/6H+bcft/t/fIUAk9YTo/0Mj3j
 u+P3sr0rGhXsx5kqexKZ97ZrEDTEmSisI+bdZE8/L9J7Q5LXkpr55sk6pBFbgbQmDhA/
 lyjzdyDxxepJI5PxR3XE5BpynhCFNa+Eb821vnkTq7jUq0+lioINJibArWDiEhdNN1HS
 CpbnmeC6y2Dw/5lpYHoGwedMZjvSnyAiAQPHBSkZMyWb6cp5/ghtu1KOC09jrBKNnwZ2
 Q8A/wPkJbWM5lrLJUzRZFOyLVyn4kcIdBB5UfYqmcUOcj3W7yTOwy1HWU76ry8KSAMsV
 o48w==
X-Gm-Message-State: AOJu0Yy0JKLwbbV3opFii63SrvO/67Vvb0kN8ddcka2rBhiF+B3+Vdnz
 S+dtOnLuR+ZXqGOu8kLHVbtdrXEXUqvvRFRg/aU=
X-Google-Smtp-Source: AGHT+IEUspXo2pTbNwW9zexsuhcFiZyZsalHf5KstkhLjR3XfhaoQzHpDx11A94uCRV3b5EuHixtow==
X-Received: by 2002:a17:90b:384b:b0:280:8544:42fb with SMTP id
 nl11-20020a17090b384b00b00280854442fbmr842143pjb.17.1700257861154; 
 Fri, 17 Nov 2023 13:51:01 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:7ed:b095:f0ba:5801])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090aca0700b00256b67208b1sm3639587pjt.56.2023.11.17.13.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 13:51:00 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 0/3] Use correct mode for edp panel
Date: Fri, 17 Nov 2023 13:46:31 -0800
Message-ID: <20231117215056.1883314-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 2 part to handle mode selection for edp panel:
1. (patch 1, 2) Add a quirk to override the edid mode for generic edp.
2. (patch 3) If a panel contains hardcoded mode, skip edid mode.

Previous versions:
v1: https://patchwork.kernel.org/project/dri-devel/cover/20231101212604.1636517-1-hsinyi@chromium.org/
v2: https://patchwork.kernel.org/project/dri-devel/cover/20231102221309.1971910-1-hsinyi@chromium.org/
v3: https://patchwork.kernel.org/project/dri-devel/cover/20231106202718.2770821-1-hsinyi@chromium.org/
v4: https://patchwork.kernel.org/project/dri-devel/cover/20231106210337.2900034-1-hsinyi@chromium.org/
v5: https://patchwork.kernel.org/project/dri-devel/cover/20231107000023.2928195-1-hsinyi@chromium.org/
v6: https://lore.kernel.org/lkml/20231107204611.3082200-2-hsinyi@chromium.org/

Hsin-Yi Wang (3):
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Add auo_b116xa3_mode
  drm/panel-edp: Avoid adding multiple preferred modes

 drivers/gpu/drm/panel/panel-edp.c | 79 ++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 11 deletions(-)

-- 
2.43.0.rc0.421.g78406f8d94-goog

