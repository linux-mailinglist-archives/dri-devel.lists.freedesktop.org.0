Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE388B343
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABCA10EB15;
	Mon, 25 Mar 2024 21:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ej+nPdl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EEE10EB1E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:56:59 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5f034b4dcecso2439756a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711403818; x=1712008618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UR7sFSEYjP8BO01JVRD78Toou7R7NTsnLZcSYy9yMLk=;
 b=Ej+nPdl8xB/iegBeQVk9mpbd3oHOxE4Ix+7kTl/LSiyh9+1TF1MRCz2vAwM/3/oar5
 NNVJIEmE5InkRqelBuLUpSuJ3GwQ+pO2lOHa05r2OnqNLOp9judfLcvtzV0yoe9+jvvs
 BDjQJN1u4o0pWKJG0CkBIp03f8f8lN/EhtMFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711403818; x=1712008618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UR7sFSEYjP8BO01JVRD78Toou7R7NTsnLZcSYy9yMLk=;
 b=T6axy1xF9i5tLrvD7vf/w/Jld24YlUdw9fkmCZR9Lzis9ubFo/MSZv6nL0II2hBZdA
 AJ60v70jO4g5UTTVMJj/jDYmCQBD4gi09D09nvUrt4nck0Mo0M0Tuh/ZF2yZqoV4PKFN
 fBAf03gZnYYPxYhH9EuJRoQBCFQQHpQtPHDAn9tsXg7/ruoinhzTnICHsUUYrDm1Mm/p
 Y5m53239l3be4iOwyU0/AtJnCWkvT7BJ7eBQ4hB6oxLek/qVpIrOCGra+Zcs7lZf05Yr
 tMJoU98cbvvlhsSFwoeOkWOp/soOOdpHejwnbgSzOE6/Y9lqb1jf2RxZ3zgpniH3OoW7
 R7Vg==
X-Gm-Message-State: AOJu0YyFc3RHbtZ66MVxhytafEzGcBjTX1DfSq/RYLYkEkzqt/eCCaAF
 rAG7Vg0m2BfA9VXBhV8TNt0fZu2Njp4LlJxx0S2CI3Lln6t5Usd/N2yV8bSrxdh/RMsKrY6CNXA
 =
X-Google-Smtp-Source: AGHT+IFvvymI/+nAjVhwHLdNpVFDRLNACuh+o6MvjynK0XJWPebIEwChaIwn4LWdWp8KHSfw+SjCnQ==
X-Received: by 2002:a17:902:ec8f:b0:1e0:73d:9172 with SMTP id
 x15-20020a170902ec8f00b001e0073d9172mr10772950plg.23.1711403817749; 
 Mon, 25 Mar 2024 14:56:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f21b:7dde:93cc:b987])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001def0897284sm5207866plf.76.2024.03.25.14.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 14:56:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Pin-yen Lin <treapking@chromium.org>,
 Prahlad Kilambi <prahladk@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm-panel: Don't make failures quite so fatal
Date: Mon, 25 Mar 2024 14:56:24 -0700
Message-ID: <20240325215631.3804796-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
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


This patch series is born out of the observation that after several
Chromebooks transitioned over to the generic "edp-panel" compatible
string that we received a number of in-the-field reports of the
primary graphics device for the Chromebook not coming up.

The current belief is that these Chromebooks are actually suffering
from a true hardware failure and the panel is either fully
disconnected or it has some type of intermittent connection. While we
can't solve that problem, digging showed that we actually dealt with
this situation better _before_ switching to the generic "edp-panel"
compatible string.

Before switching to "edp-panel", devices using eDP would finish their
probe and would actually not show any failure until you tried to turn
the panel on. That was a _good_ thing. The component model used by
many DRM devices means that if the panel doesn't finish probing that
the rest of the DRM device doesn't probe. In turn, that means that any
other display adapters (like ones that would allow hooking up an
external display) don't probe. The end result was that a device with a
broken panel that could have continued to be a useful computer by
hooking up an external display became e-waste.

I won't say that this series is the most elegant/wonderful thing in
the world. Ideally we could fail the probe of the panel and still use
the external display. That's a pretty serious re-design, though. DRM
devices work like they do with the component model because of some of
their inherent complexities.


Douglas Anderson (3):
  drm/panel-edp: Abstract out function to set conservative timings
  drm/panel-edp: If we fail to powerup/get EDID, use conservative
    timings
  drm-panel: If drm_panel_dp_aux_backlight() fails, don't fail panel
    probe

 drivers/gpu/drm/panel/panel-edp.c             | 60 +++++++++++--------
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |  9 ++-
 2 files changed, 41 insertions(+), 28 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

