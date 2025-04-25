Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62534A9C562
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB0110E931;
	Fri, 25 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ertepgPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CD10E916
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576899;
 bh=hzyQlJAfvZlx9HV/nf8bNQRKE+HVZfxygYUIuwK1hSk=;
 h=From:Subject:Date:To:Cc:From;
 b=ertepgPjC9jJpyLmPe8bGVxfgpaK4sXF4Q4+GdRwuwe7d1N9I5ca5vllMMJ4qJhGd
 SqedRSORgkNz8wVbE8VhUg7e3ZcK63yb00CxoPIUMWhbWRXp39MpbaK276jSHcvYV3
 MUb4uffpCRW+fXbFcG1mHnjrdQR4QntiRtHEtuXshE7/K+DHJAigYsU0vw6O7Tks8P
 QMAvCpp9X3ym/v1QSk/igwPNJDqzHbBZcj5oo4bgvN/EIQX7OLbipqrhZJcA8VRydt
 D4mown6Qb8pusxWn83NjHhtuZu3ilbChLWOblZDGCwLirhnJcAR4mo2difixVQRnTA
 DKlXJhfzBPaSg==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D0D2217E3626;
 Fri, 25 Apr 2025 12:28:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 00/23] drm/connector: hdmi: Allow using the YUV420
 output format
Date: Fri, 25 Apr 2025 13:26:51 +0300
Message-Id: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtjC2gC/3XOSwrCMBCA4auUrI3k1bRx5T3ERZ42UBtJNFhK7
 25aEKTq8h9mPmYCyUZvEzhUE4g2++TDUILtKqA7OVws9KY0IIgwjCmCnbl6qMMwwPGRocVO1oI
 b1/AWlJtbtM4/V+90Lt35dA9xXPmMl+k/KWOIIKkZaYRELW/wUYe+lypEudfhChYtk7dQI4rxV
 iBFcMoowVzZ4OSXQD8EwrcCXX4QzFCrlGLqS5jn+QW5Wo8OMgEAAA==
X-Change-ID: 20241130-hdmi-conn-yuv-e1fa596df768
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Provide the basic support to enable using YUV420 as an RGB fallback when
computing the best output format and color depth.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Collected R-b tags from Maxime and Dmitry
- Squashed "drm/connector: hdmi: Rename hdmi_compute_format() internal
  helper" into "drm/connector: hdmi: Factor out bpc and format
  computation logic" and moved the TODO hunk to next patch (Maxime)
- Logged a debug message in "drm/connector: hdmi: Use YUV420 output
  format as an RGB fallback" for hdmi_compute_format_bpc() (Maxime)
- Reworded "drm/tests: hdmi: Fixup CamelCase warning" to "drm/tests:
  hdmi: Replace '[_]MHz' with 'mhz'"
- Reworked the patches simplifying EDID setup: ended up with just a new
  __connector_hdmi_init() function and a single helper macro (Maxime)
- Added new patches to handle EDEADLK:
  * "drm/tests: helpers: Add a (re)try helper variant to enable CRTC connector"
  * "drm/tests: hdmi: Switch to drm_kunit_helper_try_enable_crtc_connector()"
  * "drm/tests: hdmi: Add macro to support EDEADLK handling"
  * "drm/tests: hdmi: Restart atomic sequence on EDEADLK"
  * "drm/tests: hdmi: Switch to drm_atomic_get_new_connector_state() where possible"
- Updated all YUV420 test cases:
  * Moved function renames and EDID content to dedicated patches
  * Improved error handling
  * Reworded a few comment blocks
  * Hand-crafted the state and used drm_atomic_check_only() in
    drm_test_check_driver_unsupported_fallback_yuv420()
- Added "drm/tests: hdmi: Add test for unsupported RGB/YUV420 mode"
- Rebased series onto drm-misc-next from 2025-04-22
- Link to v3: https://lore.kernel.org/r/20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com

Changes in v3:
- Collected R-b tags from Dmitry and Maxime
- Updated debug messages in "drm/connector: hdmi: Add support for YUV420
  format verification" to avoid referencing VIC (Maxime)
- Reworked "drm/connector: hdmi: Use YUV420 output format as an RGB
  fallback" and moved some parts to separate patches:
  * drm/connector: hdmi: Add missing bpc debug info to hdmi_try_format_bpc()
  * drm/connector: hdmi: Rename hdmi_compute_format() internal helper
  * drm/connector: hdmi: Factor out bpc and format computation logic
- Reworked "drm/tests: hdmi: Add macros to simplify EDID setup" by
  renaming the new helpers and moving the conversion to separate
  patches (Maxime):
  * drm/tests: hdmi: Fixup CamelCase warning
  * drm/tests: hdmi: Replace open coded EDID setup
  * drm/tests: hdmi: Drop unused drm_kunit_helper_connector_hdmi_init_funcs()
- Moved connector_hdmi_init_with_edid_funcs() changes from "drm/tests:
  hdmi: Add limited range tests for YUV420 mode") to "drm/tests: hdmi:
  Setup ycbcr_420_allowed before initializing connector"
- Got rid of the floating-point operation in "drm/tests: hdmi: Add max
  TMDS rate fallback tests for YUV420 mode" in order to fix the build
  errors reported by some kernel test robots
- Added new patch "drm/tests: hdmi: Add test for unsuccessful forced
  fallback to YUV420"
- Rebased series onto drm-misc-next from 2025-03-25
- Link to v2: https://lore.kernel.org/r/20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com

Changes in v2:
- Provided the missing Fixes tag on first patch (Dmitry)
- Added patch "drm/connector: hdmi: Improve debug message for supported
  format"
- Reworked "drm/connector: hdmi: Use YUV420 output format as an RGB
  fallback" so that the fallback to YUV420 will be attempted only when
  RGB cannot be supported for any of the available color depths (Maxime)
- Added a patch to simplify EDID setup in KUnit cases
- Added two patches extending KUnit coverage for YUV420 by providing
  tests for limited range and max TMDS rate fallback
- Rebased series onto drm-misc-next-2025-03-06
- Link to v1: https://lore.kernel.org/r/20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com

---
Cristian Ciocaltea (23):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Improve debug message for supported format
      drm/connector: hdmi: Add missing bpc debug info to hdmi_try_format_bpc()
      drm/connector: hdmi: Factor out bpc and format computation logic
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback
      drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
      drm/tests: hdmi: Add macro to simplify EDID setup
      drm/tests: hdmi: Replace open coded EDID setup
      drm/tests: hdmi: Drop unused drm_kunit_helper_connector_hdmi_init_funcs()
      drm/tests: hdmi: Setup ycbcr_420_allowed before initializing connector
      drm/tests: helpers: Add a (re)try helper variant to enable CRTC connector
      drm/tests: hdmi: Switch to drm_kunit_helper_try_enable_crtc_connector()
      drm/tests: hdmi: Add macro to support EDEADLK handling
      drm/tests: hdmi: Restart atomic sequence on EDEADLK
      drm/tests: hdmi: Switch to drm_atomic_get_new_connector_state() where possible
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with YUV420 only
      drm/tests: hdmi: Add limited range tests for YUV420 mode
      drm/tests: hdmi: Rename max TMDS rate fallback tests
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with RGB/YUV
      drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode
      drm/tests: hdmi: Add test for unsuccessful fallback to YUV420
      drm/tests: hdmi: Add test for unsupported RGB/YUV420 mode

 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 118 ++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 903 +++++++++++++++------
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 232 ++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  39 +
 include/drm/drm_kunit_helpers.h                    |   7 +
 5 files changed, 992 insertions(+), 307 deletions(-)
---
base-commit: a49ce9cc85a82d5c5d65186f5a8fda0ebfcff571
change-id: 20241130-hdmi-conn-yuv-e1fa596df768

