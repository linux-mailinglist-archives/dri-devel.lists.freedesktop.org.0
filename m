Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9A70E568
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4770610E4A8;
	Tue, 23 May 2023 19:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1710E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:09 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ae763f9c0bso275215ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870268; x=1687462268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=da7xHElmRhs7yLWfdeHx4hSBX9WK1oPzedpFeX43g5E=;
 b=LzUeez59b5Pg0Ump+sB4OM8jCT2gUu+L3cHDGuYq6KxKNdbWzzUcYfIjiAl9CHb7/y
 Zd/xCwCoNFjhdzyDFQL7kt91TMpOZffzujd6HC05iDlXlLzNfOfWBkCHqD6ablJniuG1
 PQBLx18VMf6dlXe/RbYmWDRnV0qm5puEiOYyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870268; x=1687462268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=da7xHElmRhs7yLWfdeHx4hSBX9WK1oPzedpFeX43g5E=;
 b=EDhSnXIagE+bXZztZS2BojHhqInYVY8C7yMdEspzoY8seN1TCNRyta7j9oI2o9XZHI
 aec4hPL3zxSxe8nQOhiyLSrL1hDfqPIbqg13wUcBNvRJURAwGErvz42Yrlfdv8bKNFyv
 1hZM/F93cFWahcU8QCSI+I9uYlD38ZE9vUlDHj2BOAAqGLYgyKjaYU4/Y1bT79nZnnS0
 ZD7ljtVxtmeeUvI4dkw8E2yczEpuQHySDxVioWPq6yJyMeTPuXPsCSSAkMgEWJ/q36jr
 b+t+xg88VRqDTmyM+nI0/AcUNZrZbTLYgL42JEbMetZbJBwiMAcmiwb3mRoXzFIpWl+D
 ezVw==
X-Gm-Message-State: AC+VfDwLh7s2pyYvkYEiwB2qEYt3WFIpawF6k0ccXR2aBY8eRjFcSL6Q
 YE4FHnZfdu+Iy9a6HOra14m1mA==
X-Google-Smtp-Source: ACHHUZ4/GhcYkmDFF4G/tiyzD+WQyx75cWfu4Fa2ANvrz/NLC/goHxpAkTJKe2ReitBreL7vc+KZpA==
X-Received: by 2002:a17:902:c151:b0:1aa:cf25:41d0 with SMTP id
 17-20020a170902c15100b001aacf2541d0mr14164593plj.33.1684870268211; 
 Tue, 23 May 2023 12:31:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm/panel and i2c-hid: Allow panels and touchscreens to
 power sequence together
Date: Tue, 23 May 2023 12:27:54 -0700
Message-ID: <20230523193017.4109557-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
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


Douglas Anderson (9):
  dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed
    panels
  drm/panel: Check for already prepared/enabled in drm_panel
  drm/panel: Add a way for other devices to follow panel state
  HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
  HID: i2c-hid: Rearrange probe() to power things up later
  HID: i2c-hid: Make suspend and resume into helper functions
  HID: i2c-hid: Support being a panel follower
  HID: i2c-hid: Do panel follower work on the system_wq
  arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels

 .../bindings/input/elan,ekth6915.yaml         |   6 +
 .../bindings/input/goodix,gt7375p.yaml        |   6 +
 .../bindings/input/hid-over-i2c.yaml          |   6 +
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   1 +
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |   1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   1 +
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   1 +
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |   1 +
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   1 +
 drivers/gpu/drm/drm_panel.c                   | 194 +++++++++-
 drivers/hid/i2c-hid/i2c-hid-core.c            | 330 +++++++++++++-----
 include/drm/drm_panel.h                       |  89 +++++
 12 files changed, 542 insertions(+), 95 deletions(-)

-- 
2.40.1.698.g37aff9b760-goog

