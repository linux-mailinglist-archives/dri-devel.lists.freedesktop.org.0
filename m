Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AC8FC068
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B50510E25E;
	Wed,  5 Jun 2024 00:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bj2VPPoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875B10E25E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:11 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f692d6e990so16282415ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547050; x=1718151850;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UXkqvnUlOHE+7g2Lf+Wpe/9y5rRcSPhO6InYqluayHc=;
 b=bj2VPPoZOvQemqqPR7gIPtQf7GtPVdS1YTw8SG5DUOJfiVaGPk57x2XjFZVzwOFXRA
 kPIRa3Y70lToj1PZIk14lg668fG4sJdR/lxeX0W1DsjYmThQXfTvPcuthiOtPuwr8v6W
 D8BMhZFloKQWh0JfsseSbU/nl/uwiqByNycOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547050; x=1718151850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UXkqvnUlOHE+7g2Lf+Wpe/9y5rRcSPhO6InYqluayHc=;
 b=n6mo+tUELZX0cE6EYMbGmPG7mtBYaPx525ZCmDI8nOwMlzC79lzE9GyCy1T0u9LBvl
 UYEtv9WjshO0F0VW/rCwhcXHTl4NUcMVtb5Mpb0KL1WmW3VVR7Pl4hZbaSBTmB2xCo+/
 tJMekMBunsXOcXfZkXwljiZrkPMol8lMdPMqLlJWPevD+h1LraxQ6KbYkTHFxBCMksIp
 NTUuDOHOF8x77V558AIOdhzcJBlrOjbkQ8OhdGFHH462SkTkBwcuM23oSoShEUYokdre
 ktc4OPkq0H3oZ1UZxwax1Oj6bF+BnuSe0dtRwFi6WkwIHyXs4jAZCoowzYIWIdkbVdK4
 q1/A==
X-Gm-Message-State: AOJu0YzdVsI5X1bw90svutKtTK4JPFQbzELrAmbPmcoHkvzXYnoZXgzN
 XXP/5/9ZRAYkd/Ef4Wd9ve4c9i8+S5XYILrT0I5Yg1q+KvRtqZdcttBBH6AwStZCTytcEMLDMJQ
 =
X-Google-Smtp-Source: AGHT+IGvUgTyAuYEN02i7ZduVODq/yACl5LSlZJPkmZP9QjjxS40pxNiem+pMYUDo4VgKeR8msH+hQ==
X-Received: by 2002:a17:902:d512:b0:1f6:1c5f:e089 with SMTP id
 d9443c01a7336-1f6a5a86e72mr14291545ad.60.1717547050047; 
 Tue, 04 Jun 2024 17:24:10 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/24] drm/panel: Remove most store/double-check of
 prepared/enabled state
Date: Tue,  4 Jun 2024 17:22:46 -0700
Message-ID: <20240605002401.2848541-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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


As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

This series attempts to do just that. While the original grep, AKA:
  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
...still produces a few hits after my series, they are _mostly_ all
gone. The ones that are left are less trivial to fix.

One of the main reasons that many panels probably needed to store and
double-check their prepared/enabled appears to have been to handle
shutdown and/or remove. Panels drivers often wanted to force the power
off for panels in these cases and this was a good reason for the
double-check.

In response to my V1 series [1] we had much discussion of what to
do. The conclusion was that as long as DRM modeset drivers properly
called drm_atomic_helper_shutdown() that we should be able to remove
the explicit shutdown/remove handling in the panel drivers. Most of
the patches to improve DRM modeset drivers [2] [3] [4] have now
landed.

In contrast to my V1 series, I broke the V2 series up a lot
more. Since a few of the panel drivers in V1 already landed, we had
fewer total drivers and so we could devote a patch to each panel.
Also, since we were now relying on DRM modeset drivers I felt like we
should split the patches for each panel into two: one that's
definitely safe and one that could be reverted if we found a
problematic DRM modeset driver that we couldn't fix.

Many of the patches in the V2 series [5] landed, so this V3 series is
the patches that are left plus one new bonus patch. At this point, we
may want to just land the patches that are left since it seems like
nobody is going to test/review them and they've all been Acked by
Linus and Maxime.

NOTE: this touches _a lot_ of drivers, is repetitive, and is not
really possible to generate automatically. That means it's entirely
possible that my eyes glazed over and I did something wrong. Please
double-check me and don't assume that I got everything perfect, though
I did my best. I have at least confirmed that "allmodconfig" for arm64
doesn't fall on its face with this series. I haven't done a ton of
other testing.

[1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
[5] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org/

Changes in v3:
- drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

Douglas Anderson (24):
  drm/panel: boe-himax8279d: Stop tracking prepared/enabled
  drm/panel: boe-himax8279d: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: khadas-ts050: Stop tracking prepared/enabled
  drm/panel: khadas-ts050: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
  drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at
    remove
  drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
  drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: tdo-tl070wsh30: Stop tracking prepared
  drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
  drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
  drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
  drm/panel: panasonic-vvx10f034n00: Don't call disable at
    shutdown/remove
  drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
  drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
  drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
  drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
  drm/panel: sharp-ls043t1le01: Stop tracking prepared
  drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
  drm/panel: raydium-rm67191: Stop tracking enabled
  drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
  drm/panel: Update TODO list item for cleaning up prepared/enabled
    tracking
  drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown

 Documentation/gpu/todo.rst                    |  47 +++---
 drivers/gpu/drm/drm_panel.c                   |  12 ++
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  |  40 -----
 .../gpu/drm/panel/panel-drm-shutdown-check.h  | 151 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |  19 +--
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  35 ----
 drivers/gpu/drm/panel/panel-khadas-ts050.c    |  39 -----
 .../drm/panel/panel-olimex-lcd-olinuxino.c    |  44 -----
 .../drm/panel/panel-osd-osd101t2587-53ts.c    |  41 +----
 .../drm/panel/panel-panasonic-vvx10f034n00.c  |  47 +-----
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |  26 ---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  49 ------
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  63 +-------
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |  24 ---
 drivers/gpu/drm/panel/panel-simple.c          |  19 +--
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |  23 ---
 16 files changed, 199 insertions(+), 480 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-drm-shutdown-check.h

-- 
2.45.1.288.g0e0cd299f1-goog

