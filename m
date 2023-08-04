Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA2770A6E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B07810E12C;
	Fri,  4 Aug 2023 21:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99C10E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:13 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686daaa5f1fso1947219b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183232; x=1691788032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FEsheO3i+HT5uw/jZO9+tyUmSgAmpT4RBKmVdn+zt9Y=;
 b=MbcqXgmgURNTb9/gZqb669uU3dqLJV9HcwqZn4T5sF5Ws5iVArgRTrt27V9qLBZxgv
 BbTxsDBfbFtHBZA9G/zHKsT6EazAsMO3fFO14Z3iCt4whJoEQtnLsR0ZQAa2JOwkEG/F
 6P5hZptRjK1kQinoF6CEemcdNqonYQqI+eqoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183232; x=1691788032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FEsheO3i+HT5uw/jZO9+tyUmSgAmpT4RBKmVdn+zt9Y=;
 b=G1bfGQ7qs0NDZSk9J3Vb/K0O/rZcLYsuW0obwygw1Z5gEV25UUvNYHMqZWgBGiZGnz
 eL0PfUfI+adp8+wUJNkqaqSj3eRXe8JpN33fF8pGaqFVR3XcB3y70JQe7C7PDVa6Phf1
 5vzEBaoLVjkvmqn0fgDf5sDvGAUK4OfgR+P7eClDUcji0y1wuAtA9DMgf5AndpDB5QcT
 LvWuvqaTthEaJsUo17NogWpckVSQTi1WNB+zDraf9KOoQSgA+slvT3svv9bXRieNiIoa
 gIv+7lq080bC1o+FtIfdbao5eAEeNmiBLqSMf49BmNudu6jnwv0t9yBPZTcJAA6zSMhj
 k8qg==
X-Gm-Message-State: AOJu0Yw7HThSsKIzsIch0shD7C4p6vmRWRQ0QbkJFA1dWi7Y3U0duUHJ
 s6WVNNe00QNWvvRgyXpeHhivdQp7XY20+xjL6CcBP5zK
X-Google-Smtp-Source: AGHT+IHep7ebzLJrmBCFhZqJ9B/HwBWs/2tGY0CKlI1vt5kyDas+U9VcbwaanW++1dZJasYOhqPZpg==
X-Received: by 2002:a05:6a00:248c:b0:63d:3339:e967 with SMTP id
 c12-20020a056a00248c00b0063d3339e967mr3357033pfv.19.1691183232385; 
 Fri, 04 Aug 2023 14:07:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 00/10] drm/panel: Remove most store/double-check of
 prepared/enabled state
Date: Fri,  4 Aug 2023 14:06:03 -0700
Message-ID: <20230804210644.1862287-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
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
Cc: Ondrej Jirman <megous@megous.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stefan Mavrodiev <stefan@olimex.com>, Jianhua Lu <lujianhua000@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Ondrej Jirman <megi@xff.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org
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
double-check. As part of this series a new helper is added that uses
the state tracking that the drm_panel core is doing so each individual
panel driver doesn't need to do it.

This series changes a lot of drivers and obviously the author can't
test on all of them. The changes here are also not completely trivial
in all cases. Please double-check your drivers carefully to make sure
something wasn't missed. After looking at over 40 drivers I'll admit
that my eyes glazed over a little.

I've attempted to organize these patches like to group together panels
that needed similar handling. Panels that had code that didn't seem to
match anyone else got their own patch. I made judgement calls on what
I considered "similar".

As noted in individual patches, there are some cases here where I
expect behavior to change a little bit. I'm hoping these changes are
for the better and don't cause any problems. Fingers crossed.

I have at least confirmed that "allmodconfig" for arm64 doesn't fall
on its face with this series. I haven't done a ton of other testing.


Douglas Anderson (10):
  drm/panel: Don't store+check prepared/enabled for simple cases
  drm/panel: s6e63m0: Don't store+check prepared/enabled
  drm/panel: otm8009a: Don't double check prepared/enabled
  drm/panel_helper: Introduce drm_panel_helper
  drm/panel: Don't store+check prepared/enabled for panels needing
    shutdown
  drm/panel: Don't store+check prepared/enabled for panels disabled at
    shutdown
  drm/panel: st7703: Don't store+check prepared
  drm/panel: rm67191: Don't store+check enabled
  drm/panel: sony-acx565akm: Don't double-check enabled state in disable
  drm/panel: Update TODO list item for cleaning up prepared/enabled
    tracking

 Documentation/gpu/todo.rst                    | 33 +++++-------
 drivers/gpu/drm/Makefile                      |  1 +
 drivers/gpu/drm/drm_panel_helper.c            | 37 ++++++++++++++
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  9 ----
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  9 ----
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 36 ++-----------
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 16 +-----
 drivers/gpu/drm/panel/panel-edp.c             | 34 ++-----------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 21 +-------
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 21 +-------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 51 ++-----------------
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  9 ----
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 30 ++---------
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 35 ++-----------
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 43 ++--------------
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 21 +-------
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 21 +-------
 drivers/gpu/drm/panel/panel-novatek-nt35950.c |  9 ----
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 12 -----
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 24 ++-------
 .../drm/panel/panel-olimex-lcd-olinuxino.c    | 45 +---------------
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 17 -------
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 37 ++------------
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 42 ++-------------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 21 +-------
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 38 --------------
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 31 ++---------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 25 ---------
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 10 ----
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  9 ----
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   | 45 ++--------------
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 46 ++---------------
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 19 ++-----
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 10 ----
 drivers/gpu/drm/panel/panel-simple.c          | 34 ++-----------
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 20 +-------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  |  7 +--
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c |  9 ----
 .../panel/panel-sony-tulip-truly-nt35521.c    | 18 -------
 .../drm/panel/panel-startek-kd070fhfid015.c   | 11 ----
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  | 19 ++-----
 drivers/gpu/drm/panel/panel-truly-nt35597.c   | 20 --------
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 16 ------
 .../gpu/drm/panel/panel-visionox-rm69299.c    |  8 ---
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   |  9 ----
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 21 +-------
 include/drm/drm_panel_helper.h                | 13 +++++
 47 files changed, 131 insertions(+), 941 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panel_helper.c
 create mode 100644 include/drm/drm_panel_helper.h

-- 
2.41.0.585.gd2178a4bd4-goog

