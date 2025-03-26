Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B1BA71497
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4000510E691;
	Wed, 26 Mar 2025 10:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UHHXxmQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B3710E690
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984397;
 bh=n+TFJw5CGKB+/PTmbbM3BjqDwj4jnWtLU2D8rSom1rk=;
 h=From:Subject:Date:To:Cc:From;
 b=UHHXxmQmlRiHMuf4nEl/jrg+sXj8cEX528SAyRxirzuq/JHRdEQZsJbTjASGyQbJ5
 w4XqBJPBGG5Oe1X950dQQvTiyUUuJJdwLh3snhgDYnh6lbPiynsAes+3MaGZ/FJBa5
 6dwS7SDBvMEwrYlYecIzd0jq5LRtHyq/X+R9iuSA3vsNwNetH6tCF4HEFiRO/8OH2i
 nlpsVtGIQawX3ud3QKr/5Blq+3ZOQIYPKahJEAXQwkK2oK31oF2P8LYpn+TAMX9MRW
 pk9mAkNtIpH+ILqAYucKM8u72pfGRr6EVefBlZuO/0QA6STJJawGQhfVTTupkSYA/Y
 xXjqoK4V4IlrA==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 814DD17E0A5D;
 Wed, 26 Mar 2025 11:19:57 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 00/15] drm/connector: hdmi: Allow using the YUV420
 output format
Date: Wed, 26 Mar 2025 12:19:49 +0200
Message-Id: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXU42cC/3XMTQ6CMBCG4auQrq3pDFDAlfcwLkp/pAm0ptVGQ
 ri7hcQNict3Mt+zkKiD1ZFcioUEnWy03uUoTwWRg3APTa3KTZBhBVAyOqjJUumdo/M7UQ1G1B1
 XpuEtyZtn0MZ+du92zz3Y+PJh3vkE2/WflIAyinWFTSdYyxu4Sj+OovdBnKWfyKYl/Ak1KwGOA
 mbB9KrvKpM/OB6FdV2/etWomfAAAAA=
X-Change-ID: 20241130-hdmi-conn-yuv-e1fa596df768
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
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
Changes in v3:
- Collected R-B tags from Dmitry and Maxime
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
Cristian Ciocaltea (15):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Improve debug message for supported format
      drm/connector: hdmi: Add missing bpc debug info to hdmi_try_format_bpc()
      drm/connector: hdmi: Rename hdmi_compute_format() internal helper
      drm/connector: hdmi: Factor out bpc and format computation logic
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback
      drm/tests: hdmi: Add macros to simplify EDID setup
      drm/tests: hdmi: Fixup CamelCase warning
      drm/tests: hdmi: Replace open coded EDID setup
      drm/tests: hdmi: Drop unused drm_kunit_helper_connector_hdmi_init_funcs()
      drm/tests: hdmi: Setup ycbcr_420_allowed before initializing connector
      drm/tests: hdmi: Add limited range tests for YUV420 mode
      drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode
      drm/tests: hdmi: Add test for unsuccessful forced fallback to YUV420

 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 114 +++--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 557 ++++++++++++++-------
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 222 ++++++++
 3 files changed, 678 insertions(+), 215 deletions(-)
---
base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
change-id: 20241130-hdmi-conn-yuv-e1fa596df768

