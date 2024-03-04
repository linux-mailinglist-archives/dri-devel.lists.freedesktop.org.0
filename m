Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C3870B02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3DE11224A;
	Mon,  4 Mar 2024 19:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="L8I6SSM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E211224A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:52:18 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e617b39877so1302856b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709581938; x=1710186738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L2YF/tllYikOHtree+lJgBUznCn/Cf96YkN5i0u5L7M=;
 b=L8I6SSM5aK+91NmVOZfu87swZNn+mY8hgdhiB/eg6HsLZNDWGedV6OFo5gc+3BrGmK
 in7i5NhRRff+JB4PjoKPx+2w6D7vWvngJ4FRpwohP+4NeeDpAwNjvqnMFNiP/e81HP62
 h0T/enyUcLkI50f/0A5SFCZeC72yAlbARDfqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581938; x=1710186738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L2YF/tllYikOHtree+lJgBUznCn/Cf96YkN5i0u5L7M=;
 b=wtgL5eaVZn3KuaHorXRiNObrRixwwC9+hQLnjuCT7iY8d3u6uFx5PZWmhqBBLM/gUc
 WuP6S2PHtRiNYq0QjHgB4WbtSGUS81tvDZl7SdHJ7UHVb75PUmxiHz86YgK+U2LbL/DP
 GYSaAUW8nahSDZCZXW9SH1UBqnxf+Xe6Pvd2gupOMYFK+Xo/IWBpOKa9Sz+1ZI1Icpz8
 PtbKkp1drtzNgVSAH7bQfcB/NuX+YsbCHdnX9/1ujuUkO4i8jTOh1rXOGlfqRPDc9U2i
 y2FgEhWwzzw1mDu9PCGmppg5Szh2kULaeBCq8tJiBZ+oVQtNWq+sbSS5dKpUGqG+RGHo
 tYbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg/rSOaaa06KOo0KNV/qX6TnB07aPIgN8oWgZIeV7y8xrMJThp0xv/e25XuaCcgwUCjTtbgz2reNi9LIs3UeOgZOxc0iiNn1zqnrtsAj20
X-Gm-Message-State: AOJu0YySl0paa9ZU1GGlBYur1DpHWom7C9nyL5fja92X7IG23kZGLeGy
 2W4En6iz2uM2Eebm6iYJbFyoN4jqHabmu1tHqfYJFgeH3MfCS+ePqbNm+lYvcg==
X-Google-Smtp-Source: AGHT+IFvoBTWPISuhFRebI8OudEATtlEpmelxZSJ1DFYb6YYmUlCcAx8kS6YqeGubnHARR6ayMjlAg==
X-Received: by 2002:a05:6a00:3d56:b0:6e6:3920:7a26 with SMTP id
 lp22-20020a056a003d5600b006e639207a26mr125447pfb.3.1709581937713; 
 Mon, 04 Mar 2024 11:52:17 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bcf3:25da:25cd:199])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm7600820pfn.187.2024.03.04.11.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:52:17 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Match panel with id and name
Date: Mon,  4 Mar 2024 11:44:55 -0800
Message-ID: <20240304195214.14563-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
product id. One of them requires an overridden mode, while the other should
use the mode directly from edid.

Match the panel for both name and id. If not found, fallback to match id.

v1: https://lore.kernel.org/lkml/20240223223958.3887423-1-hsinyi@chromium.org
v2: https://lore.kernel.org/lkml/20240228011133.1238439-1-hsinyi@chromium.org

Hsin-Yi Wang (4):
  drm_edid: Add a function to get EDID base block
  drm/edid: Add a function to check monitor string
  drm/panel: panel-edp: Match edp_panels with panel name
  drm/panel: panel-edp: Fix AUO 0x405c panel naming and add a variant

 drivers/gpu/drm/drm_edid.c        | 107 +++++++++++++++++++++++-------
 drivers/gpu/drm/panel/panel-edp.c |  42 +++++++++---
 include/drm/drm_edid.h            |   8 ++-
 3 files changed, 123 insertions(+), 34 deletions(-)

-- 
2.44.0.rc1.240.g4c46232300-goog

