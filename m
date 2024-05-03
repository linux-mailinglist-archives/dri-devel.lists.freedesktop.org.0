Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555F18BB5DD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA01124B3;
	Fri,  3 May 2024 21:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KQCc0mHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F061124B3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e3f17c6491so778535ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772183; x=1715376983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O7IvcNsNHU8RMEEGHB36x94SUhZEWVNbyGS+d0gObkA=;
 b=KQCc0mHAtxkY0go/O2OP1gNO7oRqvtWRAyY9lF/cKlNIVE29O8ustaMPmNwtlNALJo
 /Y+ntvaIgbnyzI2O8P1MHwnOCKw0cQMKGbztuG4YjAhFqwKxXV8ESspijnUOkpQIeXKZ
 7wxLNd+3Ct46YWMmHGde9MCFzsd0qc4SN/lVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772183; x=1715376983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O7IvcNsNHU8RMEEGHB36x94SUhZEWVNbyGS+d0gObkA=;
 b=Q3XkQVO6l+HgvYvsKo4ZS3m1WGnw8rKYiphmWxKz1uqvqhY1qfotRniF/vGj1oE4tN
 qg4mflpWvnd9BMn8K8+PGLK7aLtSJeiPcjhbIhUDVbFIrpOJ/GP10UW3uu7oD6SJS2DY
 ucjC/yh7+FB+75/mLs893A4LuVhTy6D+aJtF5jBrKNxk+pXLUhfPrDR8NW9DcNDS8RV5
 8NXNd9rj6u564fNNaVnDuvguVFAwKhzg6HMN7jfalXrgH4STb+Mpax/8+1vvz17xKBei
 S3KX+bBfifSCfNd1J9/veMu40ov84KkdaOvgRa8RIMhb/vvQ4lovLgcOuwVWCnMYSixW
 0+9g==
X-Gm-Message-State: AOJu0YwVfXVKBblDro7mGPMBnz+zrbnDAfvD4K3wC15Bpdvy2BX/mtwD
 7GVSG7v7a5eMtHT3IKpTMDd5A8ExtP8W42fMB0f4F0LerSIw07QcIR45QUaWT6iByFZY1kN1e1Z
 vOg==
X-Google-Smtp-Source: AGHT+IH5eduOHdb1FCgLuhTvqIJg3l60grEr/JNT4BiC6IxKFTTgVq2iMUFgza4DOD4xTrjDsAYlqw==
X-Received: by 2002:a17:902:e882:b0:1eb:4950:554f with SMTP id
 w2-20020a170902e88200b001eb4950554fmr4690309plg.22.1714772183009; 
 Fri, 03 May 2024 14:36:23 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
Date: Fri,  3 May 2024 14:32:41 -0700
Message-ID: <20240503213441.177109-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
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

Sorry for the large number of patches. I've set things to mostly just
CC people on the cover letter and the patches that are relevant to
them. I've tried to CC people on the whole series that have shown
interest in this TODO item.

As patches in this series are reviewed and/or tested they could be
landed. There's really no ordering requirement for the series unless
patches touch the same driver.

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

Changes in v2:
- ("drm/panel: raydium-rm692e5: Stop tracking prepared") new for v2.
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.
- panel-edp and panel-simple just get a comment now.

Douglas Anderson (48):
  drm/panel: raydium-rm692e5: Stop tracking prepared
  drm/panel: boe-himax8279d: Stop tracking prepared/enabled
  drm/panel: boe-himax8279d: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: boe-tv101wum-nl6: Stop tracking prepared
  drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: edp: Stop tracking prepared/enabled
  drm/panel: edp: Add a comment about unprepare+disable at
    shutdown/remove
  drm/panel: innolux-p079zca: Stop tracking prepared/enabled
  drm/panel: innolux-p079zca: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: khadas-ts050: Stop tracking prepared/enabled
  drm/panel: khadas-ts050: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: kingdisplay-kd097d04: Stop tracking prepared/enabled
  drm/panel: kingdisplay-kd097d04: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: ltk050h3146w: Stop tracking prepared
  drm/panel: ltk050h3146w: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: ltk500hd1829: Stop tracking prepared
  drm/panel: ltk500hd1829: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: novatek-nt36672a: Stop tracking prepared
  drm/panel: novatek-nt36672a: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
  drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at
    remove
  drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
  drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: samsung-atna33xc20: Stop tracking prepared/enabled
  drm/panel: samsung-atna33xc20: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: simple: Stop tracking prepared/enabled
  drm/panel: simple: Add a comment about unprepare+disable at
    shutdown/remove
  drm/panel: tdo-tl070wsh30: Stop tracking prepared
  drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: xinpeng-xpp055c272: Stop tracking prepared
  drm/panel: xinpeng-xpp055c272: Don't call unprepare+disable at
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
  drm/panel: sitronix-st7703: Stop tracking prepared
  drm/panel: sitronix-st7703: Don't call disable at shutdown/remove
  drm/panel: raydium-rm67191: Stop tracking enabled
  drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
  drm/panel: sony-acx565akm: Don't double-check enabled state in disable
  drm/panel: sony-acx565akm: Don't call disable at remove
  drm/panel: Update TODO list item for cleaning up prepared/enabled
    tracking

 Documentation/gpu/todo.rst                    | 47 +++++++-------
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 40 ------------
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 23 -------
 drivers/gpu/drm/panel/panel-edp.c             | 60 +++++++-----------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 55 ----------------
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 35 -----------
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 39 ------------
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 48 --------------
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 28 ---------
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 28 ---------
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 29 ---------
 .../drm/panel/panel-olimex-lcd-olinuxino.c    | 44 -------------
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 41 +-----------
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 47 +-------------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 26 --------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 10 ---
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 36 -----------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   | 49 ---------------
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 63 +------------------
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 24 -------
 drivers/gpu/drm/panel/panel-simple.c          | 60 +++++++-----------
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 35 +++--------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  |  6 --
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  | 23 -------
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 28 ---------
 25 files changed, 83 insertions(+), 841 deletions(-)

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

