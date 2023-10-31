Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964427DD29D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02A210E574;
	Tue, 31 Oct 2023 16:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B7610E573
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:48:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11A2261019;
 Tue, 31 Oct 2023 16:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6096DC433C8;
 Tue, 31 Oct 2023 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770914;
 bh=UTXiOQLTvMkvbOw9m5YrJAM7tKQY8I2vb1txsTaB+ww=;
 h=From:Subject:Date:To:Cc:From;
 b=dKz+IPkB1YjAQopIg5/wqctpT5XPs9kwBvEabr+vWXBfR1DJQsQFx+pMcgaIEDDr6
 zhDX7M43NkPtBzJZzzP/ym0ci/wAtup3XaRXBoX8wD9GYYFclvFj8H1T1/Do5LBYd1
 hM7fDUi5YJ/V+u+BmcT3R5sBdG4xQS/6QFfxh4GAMEUNNRdFvH8fI8sEA9SvidqjFy
 JBTP7EXruC/zsdqsdIXg90Se/zIe2F4067naac1sdD0rwT89gRPsY9HJZerMqa/ChA
 ht/mLTlsTrttAEiu8flbJVOOqfdZI4dWNDV1Rt23pB+mqFg8RoKVkuCDwyYrM1dpUI
 Sq42JQDpOSaVQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RFC v3 00/37] drm/connector: Create HDMI Connector
 infrastructure
Date: Tue, 31 Oct 2023 17:48:13 +0100
Message-Id: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4vQWUC/4XNQQrCMBAF0KuUrI0kaZq0rgTBA7gVF6UzbUNtI
 kkJSundDdmIG13+P/w3KwnoDQZyKFbiMZpgnE2h3BWkG1s7IDWQMhFMlKzmkk5zoCPMhnbOWuw
 W52lY2gWp4krXGpVuhCZp/vDYm2emr+RyPpFbKkcT0uKV30WeT//lyCmjTNasktCXqpLHCb3F+
 975IatRfKRGsB+SSBLXTSmgBQANX9K2bW9wAKu8EAEAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6338; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UTXiOQLTvMkvbOw9m5YrJAM7tKQY8I2vb1txsTaB+ww=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+nef/XR+1KS6yUn3KisHU07+rHXlqS5rMrhZ0qxXe
 EoytAd1lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCKieYwMs/ZqGpVUHdwml71F
 fePTlqXcpWxxrQydIRL+rDG3emZZMjK8euUSeHxTdqmwZdWPqM+5ETF+t+4mc11SnSIyZ5qC7gZ
 WAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series that creates a subclass of drm_connector specifically
targeted at HDMI controllers.

The idea behind this series came from a recent discussion on IRC during
which we discussed infoframes generation of i915 vs everything else. 

Infoframes generation code still requires some decent boilerplate, with
each driver doing some variation of it.

In parallel, while working on vc4, we ended up converting a lot of i915
logic (mostly around format / bpc selection, and scrambler setup) to
apply on top of a driver that relies only on helpers.

While currently sitting in the vc4 driver, none of that logic actually
relies on any driver or hardware-specific behaviour.

The only missing piece to make it shareable are a bunch of extra
variables stored in a state (current bpc, format, RGB range selection,
etc.).

The initial implementation was relying on some generic subclass of
drm_connector to address HDMI connectors, with a bunch of helpers that
will take care of all the "HDMI Spec" related code. Scrambler setup is
missing at the moment but can easily be plugged in.

The feedback was that creating a connector subclass like was done for
writeback would prevent the adoption of those helpers since it couldn't
be used in all situations (like when the connector driver can implement
multiple output) and required more churn to cast between the
drm_connector and its subclass. The decision was thus to provide a set
of helper and to store the required variables in drm_connector and
drm_connector_state. This what has been implemented now.

Hans Verkuil also expressed interest in implementing a mechanism in v4l2
to retrieve infoframes from HDMI receiver and implementing an
infoframe-decode tool.

This series thus leverages the infoframe generation code to expose it
through debugfs.

This entire series has been tested on a Pi4, and has only been
build-tested for sunxi and rockchip.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Made sure the series work on the RaspberryPi4
- Handle YUV420 in the char clock rate computation
- Use the maximum bpc value the connector allows at reset 
- Expose the RGB Limited vs Full Range value in the connector state
  instead of through a helper
- Fix Broadcast RGB documentation 
- Add more debug logging
- Small fixes here and there
- Link to v2: https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org

Changes in v2:
- Change from a subclass to a set of helpers for drm_connector and
  drm_connector state
- Don't assume that all drivers support RGB, YUV420 and YUV422 but make
  them provide a bitfield instead.
- Don't assume that all drivers support the Broadcast RGB property but
  make them call the registration helper.
- Document the Broacast RGB property
- Convert the inno_hdmi and sun4i_hdmi driver.
- Link to v1: https://lore.kernel.org/r/20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org

---
Maxime Ripard (37):
      drm/connector: Introduce an HDMI connector
      drm/connector: hdmi: Create a custom state
      drm/connector: hdmi: Add Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/connector: hdmi: Add support for output format
      drm/connector: hdmi: Add HDMI compute clock helper
      drm/connector: hdmi: Calculate TMDS character rate
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/connector: hdmi: Compute bpc and format automatically
      drm/connector: hdmi: Add Infoframes generation
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Create destroy state implementation
      drm/vc4: hdmi: Switch to HDMI connector
      drm/rockchip: inno_hdmi: Remove useless mode_fixup
      drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
      drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
      drm/rockchip: inno_hdmi: Get rid of mode_set
      drm/rockchip: inno_hdmi: no need to store vic
      drm/rockchip: inno_hdmi: Remove unneeded has audio flag
      drm/rockchip: inno_hdmi: Remove useless input format
      drm/rockchip: inno_hdmi: Remove useless output format
      drm/rockchip: inno_hdmi: Remove useless colorimetry
      drm/rockchip: inno_hdmi: Remove useless enum
      drm/rockchip: inno_hdmi: Remove tmds rate from structure
      drm/rockchip: inno_hdmi: Remove useless coeff_csc matrix
      drm/rockchip: inno_hdmi: Remove useless mode_valid
      drm/rockchip: inno_hdmi: Move infoframe disable to separate function
      drm/rockchip: inno_hdmi: Create mask retrieval functions
      drm/rockchip: inno_hdmi: Switch to infoframe type
      drm/rockchip: inno_hdmi: Remove unused drm device pointer
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Convert encoder to atomic
      drm/sun4i: hdmi: Move mode_set into enable
      drm/sun4i: hdmi: Switch to container_of_const
      drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
      drm/sun4i: hdmi: Switch to HDMI connector

 Documentation/gpu/kms-properties.csv      |   1 -
 drivers/gpu/drm/Kconfig                   |   1 +
 drivers/gpu/drm/drm_atomic.c              |  11 +
 drivers/gpu/drm/drm_atomic_state_helper.c | 661 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         |   4 +
 drivers/gpu/drm/drm_connector.c           | 208 ++++++++++
 drivers/gpu/drm/drm_debugfs.c             | 110 +++++
 drivers/gpu/drm/rockchip/inno_hdmi.c      | 409 +++++++-----------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c    | 203 +++++----
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 624 ++++------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h            |  44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c        |   6 +-
 include/drm/drm_atomic_state_helper.h     |  12 +
 include/drm/drm_connector.h               | 248 +++++++++++
 14 files changed, 1598 insertions(+), 944 deletions(-)
---
base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

