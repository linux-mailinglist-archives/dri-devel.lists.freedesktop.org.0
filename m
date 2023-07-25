Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FF76236A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF62210E39E;
	Tue, 25 Jul 2023 20:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6710E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:36:55 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-26830595676so1060182a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690317415; x=1690922215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t38LAy3XUaR4J5EOGa4yFGEcqNsMLyxWnJ7wsD34WsQ=;
 b=iHRPLkhXJdKw3dpQvYmFjC/99lHj3UOs9u/D/w3Bpfc5fxoExuczXi6MvTCu9QgPPN
 qy38o6HYVeTpHNYl1XXdCDM5fWKtxbXaZ+YvftsbGZWubrYe40uFfE8B/076OY49NsoG
 URvenrNwJwLsWwhi7GtNTwxo2dpPx2XWXbzwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317415; x=1690922215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t38LAy3XUaR4J5EOGa4yFGEcqNsMLyxWnJ7wsD34WsQ=;
 b=QiBBm/+1D6v1mnPACqLwxLXBJMo+uDLH2RnT14nDB5nvkVA6bFkAqUusmDJpZu+SFO
 XCMaUf1z0SidyOMJUqVbRC4xhDbZme1Oqtx0AoaiSrxdbTjBv/hLA17dB2gGRKo+cf0w
 nTqZ6ow53hJEu4FOE3Zvlnj7+rF2wF5obd3wXfU+mhC5knSPDEjr74QW52rsTqyPETA7
 tMaZNjVQX/mC1Z55ohUxSkJtgA4Jic65UXJmPx6c1hCp5Whr2njvAUKHyI4w6emJO7SU
 8Sj+omJDBYm+LBI0CW/OyWX9Gf0lyAXsIyQyonwKTjlf3YrMc4xWNLP9IM/r1ay4dBa0
 w+9Q==
X-Gm-Message-State: ABy/qLYNemUCtcSdg1uJVo158WN8nsiMOVa7nE3lNQp/mj893O4qb8wk
 KiPOCfO2OBoj2m9UlR1Ph0rnLw==
X-Google-Smtp-Source: APBJJlHGw8vWHsfZZ+Btmj+3nGK1dEOwr1gwf2QSLbSYYMWU4/ntcLarTpDHFPdMc18qiaoU1rliKw==
X-Received: by 2002:a17:90a:7e15:b0:268:2b5c:14d with SMTP id
 i21-20020a17090a7e1500b002682b5c014dmr228765pjl.36.1690317414860; 
 Tue, 25 Jul 2023 13:36:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 13:36:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/10] drm/panel and i2c-hid: Allow panels and touchscreens
 to power sequence together
Date: Tue, 25 Jul 2023 13:34:35 -0700
Message-ID: <20230725203545.2260506-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The big motivation for this patch series is mostly described in the patch
("drm/panel: Add a way for other devices to follow panel state"), but to
quickly summarize here: for touchscreens that are connected to a panel we
need the ability to power sequence the two device together. This is not a
new need, but so far we've managed to get by through a combination of
inefficiency, added costs, or perhaps just a little bit of brokenness.
It's time to do better. This patch series allows us to do better.

Assuming that people think this patch series looks OK, we'll have to
figure out the right way to land it. The panel patches and i2c-hid
patches will go through very different trees and so either we'll need
an Ack from one side or the other or someone to create a tag for the
other tree to pull in. This will _probably_ require the true drm-misc
maintainers to get involved, not a lowly committer. ;-)

Version 3 of this patch was a long time coming after v2. Maxime and I
had a very long discussion trying to figure out if there was a beter
way and in the end we didn't find one so he was OK with the series in
general [1]. After that got resolved, I tried to resolve Benjamin's
feedback but got stuck [2]. Presumably Benjamin is busy at the moment,
so I've done my best to try to resolve things. The end result is a v3
that's not that different from v2 but that has a tiny bit more code
split out.

Version 2 of this patch series didn't change too much. At a high level:
* I added all the forgotten "static" to functions.
* I've hopefully made the bindings better.
* I've integrated into fw_devlink.
* I cleaned up a few descriptions / comments.

This still needs someone to say that the idea looks OK or to suggest
an alternative that solves the problems. ;-)

[1] https://lore.kernel.org/r/gkwymmfkdy2p2evz22wmbwgw42ii4wnvmvu64m3bghmj2jhv7x@4mbstjxnagxd
[2] https://lore.kernel.org/r/CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com

Changes in v3:
- Add is_panel_follower() as a convenience for clients.
- Add "depends on DRM || !DRM" to Kconfig to avoid randconfig error.
- Split more of the panel follower code out of the core.

Changes in v2:
- Move the description to the generic touchscreen.yaml.
- Update the desc to make it clearer it's only for integrated devices.
- Add even more text to the commit message.
- A few comment cleanups.
- ("Add a devlink for panel followers") new for v2.
- i2c_hid_core_initial_power_up() is now static.
- i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
- ihid_core_panel_prepare_work() is now static.
- Improve documentation for smp_wmb().

Douglas Anderson (10):
  dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed
    touchscreens
  drm/panel: Check for already prepared/enabled in drm_panel
  drm/panel: Add a way for other devices to follow panel state
  of: property: fw_devlink: Add a devlink for panel followers
  HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
  HID: i2c-hid: Rearrange probe() to power things up later
  HID: i2c-hid: Make suspend and resume into helper functions
  HID: i2c-hid: Support being a panel follower
  HID: i2c-hid: Do panel follower work on the system_wq
  arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels

 .../bindings/input/elan,ekth6915.yaml         |   5 +
 .../bindings/input/goodix,gt7375p.yaml        |   5 +
 .../bindings/input/hid-over-i2c.yaml          |   2 +
 .../input/touchscreen/touchscreen.yaml        |   7 +
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   1 +
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |   1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   1 +
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   1 +
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |   1 +
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   1 +
 drivers/gpu/drm/drm_panel.c                   | 218 ++++++++++-
 drivers/hid/i2c-hid/Kconfig                   |   2 +
 drivers/hid/i2c-hid/i2c-hid-core.c            | 338 +++++++++++++-----
 drivers/of/property.c                         |   2 +
 include/drm/drm_panel.h                       |  94 +++++
 15 files changed, 583 insertions(+), 96 deletions(-)

-- 
2.41.0.487.g6d72f3e995-goog

