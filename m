Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290F7270C1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2710E12E;
	Wed,  7 Jun 2023 21:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86910E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:53:08 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-650bacd6250so4481794b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686174786; x=1688766786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zyvg8QoYW74O3dONADg7EXfdyKnd4yv7Gmv6YiJL6Jc=;
 b=iePh4xT2Yhrear5qpZ3eugazHSxMjjqSEgKmar+Ut8XG0gUXqV3+DPWIWO09stke09
 0sr+XWhd8OagjvtCkuJCoF6Om04OkLWuToCO2Gt6TAD4ec0pmpgF/GmtqJihDHZ8KABU
 x8jE5yePkFVZ6kuRL45vOx05NhD4JAgE/H3Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174786; x=1688766786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyvg8QoYW74O3dONADg7EXfdyKnd4yv7Gmv6YiJL6Jc=;
 b=btbp4cBe18yc5jO1PBP+AbieiWo2G4ALfRGIupWP6lNm28xEmtzwonX0fe496qwsJ5
 ihVezd8IVFR1D8SfJQsx+Jwl8Tsa10wOSsPqFmu2NQsanDngGfaJgmlB4jvZOSPxpkwe
 3awse/E+NftTssnRobp4UYfl4nOn9o4i93i9jmdd2k5wR8lGjNgSTESRyHZHqvyHb76H
 BEZXGsJzKpNJDgEeGy9D7sfP5mJ5iuFJgOD2r1TOj/MQVd99UUl4kOt7Py6Lnji/NME3
 IPYVnzyMVL62aFtQelN/WJ5UV+Oari4ZNYKEhUUjiwYSgvnErxrfk/7uLgIHjNMLLSkK
 vVeg==
X-Gm-Message-State: AC+VfDx7kChevc40r0L5spcuO7QD6Z20d8F69mzUUa8TcVn8fZccbcW6
 Pikm7mMafEUbGsF8FDLZ5iMGwQ==
X-Google-Smtp-Source: ACHHUZ6H7ZkK58BxyoTwnLorjymlRn/oik+FiO502U+pJ/YGoiUFqx9sXjwVAXid4XKljYd63Yhfgw==
X-Received: by 2002:a05:6a20:9384:b0:10b:f590:5a26 with SMTP id
 x4-20020a056a20938400b0010bf5905a26mr2885518pzh.26.1686174786491; 
 Wed, 07 Jun 2023 14:53:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
 by smtp.gmail.com with ESMTPSA id
 j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 14:53:05 -0700 (PDT)
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
Subject: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and touchscreens
 to power sequence together
Date: Wed,  7 Jun 2023 14:49:22 -0700
Message-ID: <20230607215224.2067679-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
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

Version 2 of this patch series doesn't change too much. At a high level:
* I added all the forgotten "static" to functions.
* I've hopefully made the bindings better.
* I've integrated into fw_devlink.
* I cleaned up a few descriptions / comments.

This still needs someone to say that the idea looks OK or to suggest
an alternative that solves the problems. ;-)

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
 drivers/gpu/drm/drm_panel.c                   | 196 +++++++++-
 drivers/hid/i2c-hid/i2c-hid-core.c            | 338 +++++++++++++-----
 drivers/of/property.c                         |   2 +
 include/drm/drm_panel.h                       |  89 +++++
 14 files changed, 555 insertions(+), 95 deletions(-)

-- 
2.41.0.162.gfafddb0af9-goog

