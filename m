Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9D88C763
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384C10EBC9;
	Tue, 26 Mar 2024 15:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nb1K1069";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9310EBE9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C95436123F;
 Tue, 26 Mar 2024 15:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19436C43390;
 Tue, 26 Mar 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711467630;
 bh=WQtvtMPum8vuc7kXPbZKBVieWFr+XsBbQPh8W9jJfkQ=;
 h=From:Subject:Date:To:Cc:From;
 b=Nb1K1069SSUkrMhqvwfqU87xVHz323fIv+kIpQqYW+25hGEKdllUOym6iBfzItesW
 9CREJefMCG1m5twFWOp/Yk8kUXTBzgsM2Jz0egFWagRCmu+HgCJIhIo813DNPXki+K
 e1L15v4Am2MD/poikqMqqH7QyDDuaaR+N0yrdWeaYbbNT2zh2LaGh6MwajGc318PBN
 864JFhkqVLEuosni9EXtoN67V9PlY8zUw0ENPq4NEN/gftuoslvQbB6xlrT7lTKrg8
 ujujQS7J/crgmkEZFL9bBIRtj1VQbVnVomczSMh8/dLjuCdZ05rkhan861Wap75Q4x
 H8ICY46ZIX0kw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v11 00/28] drm/connector: Create HDMI Connector infrastructure
Date: Tue, 26 Mar 2024 16:40:04 +0100
Message-Id: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTsAmYC/43SzWrDMAwA4FcpOc/DkmzZ7mnvMXZI/dOGrgkkJ
 TBK333aYEuHwewkLOPPEtKtW/I85KXb727dnNdhGaZRDgBPuy6e+vGY1ZAk0aFG0h6MOl8WdUq
 XQcVpHHO8TrNarv01KwZ23mV2AV0nz0/DIpcf3/QKEl7/gaygtNLGa2tSIbbm5ZznMb8/T/Oxe
 xN1xU0KqBsSigQuEKY+peRSJdGvBJqgIZFIhP6gS58N9a6SzCYB+oZkRIqONYL1pDlXkt0k1K4
 hWZHYks8QEpOpu+Mfychv2JBYpGIOMcXgQuZSSe5BwpbkRPLF9MU6W2LGSvKbRM3uvEi5cM+FI
 LA5VFJ4kKA1uyBSMtYHTUhk6n0C/UBhiwL9VRVHcJ4YfPB/rPv9/gnxy7GsTgMAAA==
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
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10367; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WQtvtMPum8vuc7kXPbZKBVieWFr+XsBbQPh8W9jJfkQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMb+KWHdu5n3lBmnWgl+YiCcMu2Y//G7Pv1d64z5neE
 WOZZ5TVMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbyfh5jwzr+bJac2hJ+4x+6
 grL6eSbu/9bs35D4hrexy+jZsR1mgXf+7LGRnygfM/Fym/ZU9r8HGBs2aj4XC/v2OTWl5qj/Po2
 5t/W+Zp9jXrI+4uoangkTHnn+n+HTtKev/7bz3BxrzY2MUnwA
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
Changes in v11:
- Turn the HDMI state helpers into a separate C file under
  drivers/gpu/drm/display
- Rework the Kconfig options too to prevent configuration breakages.
- Link to v10: https://lore.kernel.org/r/20240321-kms-hdmi-connector-state-v10-0-e6c178361898@kernel.org

Changes in v10:
- Drop the YUV422 fallback, and adjust the tests accordingly
- Fix HDMI infoframe handling
- Remove the infoframe copy in drm_connector
- Add a TODO that drm_hdmi_avi_infoframe_quant_range() only works for
  RGB
- Add a TODO for the YUV420 selection
- Fix a few bugs in vc4
- Change the logging from driver to KMS for the helpers
- Drop UPDATE_INFOFRAME macro
- Add infoframe code logging
- Document the selection of 8bpc for VIC1
- Rename state to conn_state where relevant
- Link to v9: https://lore.kernel.org/r/20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org

Changes in v9:
- Generate every infoframe but the HDMI vendor one if has_hdmi_infoframe
  isn't set
- Fix typos in the doc
- Removed undef for inexisting macro
- Improve the Broadcast RGB sanitation test
- Make EDID bytes array const
- Link to v8: https://lore.kernel.org/r/20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org

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
Maxime Ripard (28):
      drm/connector: Introduce an HDMI connector initialization function
      drm/mode_object: Export drm_mode_obj_find_prop_id for tests
      drm/tests: connector: Add tests for drmm_connector_hdmi_init
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/tests: Add output bpc tests
      drm/connector: hdmi: Add support for output format
      drm/tests: Add output formats tests
      drm/display: hdmi: Add HDMI compute clock helper
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
 drivers/gpu/drm/display/Kconfig                    |    8 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   70 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  696 ++++++++
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_connector.c                    |  194 +++
 drivers/gpu/drm/drm_debugfs.c                      |  152 ++
 drivers/gpu/drm/drm_mode_object.c                  |    1 +
 drivers/gpu/drm/rockchip/Kconfig                   |    1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  143 +-
 drivers/gpu/drm/sun4i/Kconfig                      |    1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   80 +-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 1061 +++++++++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 1743 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  482 ++++++
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  644 +-------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
 include/drm/display/drm_hdmi_helper.h              |    4 +
 include/drm/display/drm_hdmi_state_helper.h        |   23 +
 include/drm/drm_connector.h                        |  229 +++
 29 files changed, 4893 insertions(+), 769 deletions(-)
---
base-commit: 3980dc0683dec4ff0b27d4a7b864e189309d7be0
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

