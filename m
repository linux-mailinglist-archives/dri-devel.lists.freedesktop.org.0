Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF187503A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A810F129;
	Thu,  7 Mar 2024 13:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lTLwBpwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4810F100
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:38:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 21AFFCE2488;
 Thu,  7 Mar 2024 13:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D917C433C7;
 Thu,  7 Mar 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709818735;
 bh=y4/qY3jeFIl2UKTJu7E16AxpJjaJmmRC6KiahqgyljY=;
 h=From:Subject:Date:To:Cc:From;
 b=lTLwBpwDEW5JjWTujKKSxaLNFtldgz6dcWLndyj2oEqqIoA4IgxHpTOppkGvXHm7q
 k3vlU4Vsdl1D37ADmIC/xoDRH+msUmuXT/F88BmDSG2a+JVSUNNmLXDbgdUQ7Hrn36
 LwC8WYsS0DuZcUjwe0nHIIJDPfVOOZuAhITOge3iJdKuszVXrl4GJ8A1uv8EGuPWm9
 pKwIKqDAGJj/xRzSaKeqy5hCnaEvorQD27nSROqdiYjjibZq9qgxzSaFmupccw8kW0
 0RWl8Ghgd/wymWN69NGULjCWG5quYsAQhwn8bFZlFWGxAjVvhhqoqipONUSxZt47AY
 LRg/M+7KtSe8Q==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 00/27] drm/connector: Create HDMI Connector infrastructure
Date: Thu, 07 Mar 2024 14:38:27 +0100
Message-Id: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTD6WUC/43PTWrEMAwF4KsMXtfFln/kzKr3KF14bHkSppNAH
 AJlyN0rCm1aAqYr8RDvE3qISvNAVZxPDzHTOtRhGjmEp5NIfRyvJIfMWYACo4K28navss/3QaZ
 pHCkt0yzrEheSXnsMSB47QMH1fqi8/PiSV83j9R/IqqWSygblbC7GO/tyo3mk9+dpvoo3VlfYp
 Q5UQwKWNHYGcsw5Yz5I5kfSyuiGZFgyEC6qRLIm4kGyu6QhNCTLUkKvQLtglKeD5HYJFDYkx5J
 3JpDusjf2+J3/lixfg4bkWSr2knLqsCNfDhL+kqAlIUuh2FgcupII/kjbtn0C/girEm0CAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8563; i=mripard@kernel.org;
 h=from:subject:message-id; bh=y4/qY3jeFIl2UKTJu7E16AxpJjaJmmRC6KiahqgyljY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKkvD0e5RytE9ZlVx5sY5z5WUMvesb9D4/bxsCmFPQb+q
 lvnliV0lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCKCHxgZzvpnRsz6ti39UepO
 vTLLO1aV09ozmX66x5sXHW+ITu0rZWRYyLTS4fSVbEmWkxPmm/EUyptaSu7Vyi3g81ug3ton94o
 ZAA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series that creates some extra infrastructure specifically
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
to retrieve infoframes from HDMI receiver and implementing a tool to
decode (and eventually check) infoframes. His current work on
edid-decode to enable that based on that series can be found here:
https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=hverkuil

And some more context here:
https://lore.kernel.org/dri-devel/50db7366-cd3d-4675-aaad-b857202234de@xs4all.nl/

This series thus leverages the infoframe generation code to expose it
through debugfs.

I also used the occasion to unit-test everything but the infoframe
generation, which can come later once I get a proper understanding of
what the infoframe are supposed to look like. This required to add some
extra kunit helpers and infrastructure to have multiple EDIDs and allow
each test to run with a particular set of capabilities.

This entire series has been tested on a Pi4, passes all its unittests
(125 new tests), and has only been build-tested for sunxi and rockchip.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v8:
- Drop applied patches
- Drop the YUV limited range mention in the Broadcast RGB documentation
- Rephrase the vc4_dummy_plane removal commit log
- Move infroframe mutex initialisation to the main drm_connector_init
  function to make sure it's always initialised
- Link to v7: https://lore.kernel.org/r/20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org

Changes in v7:
- Rebased on top of current next
- Only consider the Broadcast RGB property if the output format is RGB,
  and use a limited range otherwise
- Document the fact that Broadcast RGB only applies if the output format
  is RGB
- Add some test to make sure we always get a limited range if we have a
  YCbCr output format.
- Link to v6: https://lore.kernel.org/r/20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org

Changes in v6:
- Rebased on top of current next
- Split the tests into separate patches
- Improve the Broadcast RGB documentation
- Link to v5: https://lore.kernel.org/r/20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org

Changes in v5:
- Dropped the connector init arg checking patch, and the related kunit
  tests
- Dropped HDMI Vendor infoframes in rockchip inno_hdmi
- Fixed the build warnings
- Link to v4: https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org

Changes in v4:
- Create unit tests for everything but infoframes
- Fix a number of bugs identified by the unit tests
- Rename DRM (Dynamic Range and Mastering) infoframe file to HDR_DRM
- Drop RFC status
- Link to v3: https://lore.kernel.org/r/20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org

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
Maxime Ripard (27):
      drm/connector: Introduce an HDMI connector initialization function
      drm/tests: connector: Add tests for drmm_connector_hdmi_init
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/tests: Add output bpc tests
      drm/connector: hdmi: Add support for output format
      drm/tests: Add output formats tests
      drm/connector: hdmi: Add HDMI compute clock helper
      drm/tests: Add HDMI TDMS character rate tests
      drm/connector: hdmi: Calculate TMDS character rate
      drm/tests: Add TDMS character rate connector state tests
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/tests: Add HDMI connector rate filter hook tests
      drm/connector: hdmi: Compute bpc and format automatically
      drm/tests: Add HDMI connector bpc and format tests
      drm/connector: hdmi: Add Broadcast RGB property
      drm/tests: Add tests for Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector state
      drm/tests: Add RGB Quantization tests
      drm/connector: hdmi: Add Infoframes generation
      drm/tests: Add infoframes test
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Switch to HDMI connector
      drm/vc4: tests: Remove vc4_dummy_plane structure
      drm/vc4: tests: Convert to plane creation helper
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Switch to HDMI connector

 Documentation/gpu/kms-properties.csv               |    1 -
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |  667 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_connector.c                    |  265 +++
 drivers/gpu/drm/drm_debugfs.c                      |  110 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  143 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   80 +-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 1944 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 1059 ++++++++++-
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  482 +++++
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  638 +------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
 include/drm/drm_atomic_state_helper.h              |   12 +
 include/drm/drm_connector.h                        |  257 +++
 21 files changed, 5016 insertions(+), 768 deletions(-)
---
base-commit: 8df1ddb5bf11ab820ad991e164dab82c0960add9
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

