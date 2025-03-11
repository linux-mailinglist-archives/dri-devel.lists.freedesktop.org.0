Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA304A5BE4E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D5B10E565;
	Tue, 11 Mar 2025 10:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rav6C5HJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44B610E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741690679;
 bh=+mKgffAaxj4n9s5N2ZleDY350EAzzSm1xnGJ5jxB6K8=;
 h=From:Subject:Date:To:Cc:From;
 b=Rav6C5HJkLMcIp7aZrtxIBy/ultfremmSpwpDzX7WUN/Cj0adE3qc+ELUYGtj+kO7
 VgQrT6Lb0cPQ3AsVT60rAOqpMo9rpS4prYiINTGV3uY/3lys1RocXieVfCoUDLFbvb
 BZpHuf4jR2HV6OJc3FKDjYapGns6PdFzHonfPVnwtkAUrmy+zgPgHQTnk3aYHDMjBR
 OoH0ZHSvqCaxjgDDlRY7r/OjKjI0z9ENzWpAX03gbPQy4YK70gjkwxhC2zGztJU+BA
 oFK16ePb67xF50IPaF3l81T0rFUsQNsf7Z94zXAn7+xfzFY4VEBhErQJtNlfnloGyz
 ZsF0TkaQ3z2Gg==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BD7F117E0B25;
 Tue, 11 Mar 2025 11:57:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/7] drm/connector: hdmi: Allow using the YUV420 output
 format
Date: Tue, 11 Mar 2025 12:57:32 +0200
Message-Id: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwX0GcC/3XMQQ6DIBCF4auYWXcaoIraVe/RuKAIdRIFAy2pM
 dy91H2X/0vet0M0gUyEa7VDMIkieVdCnCrQk3JPgzSWBsFEzfmF4TQuhNo7h9s7oeFWNb0cbSs
 7KJ81GEufw7sPpSeKLx+2g0/8t/6TEkeGoqlF2yvWyZbftJ9n9fBBnbVfYMg5fwFzzbckrgAAA
 A==
X-Change-ID: 20241130-hdmi-conn-yuv-e1fa596df768
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cristian Ciocaltea (7):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Improve debug message for supported format
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback
      drm/tests: hdmi: Add macros to simplify EDID setup
      drm/tests: hdmi: Add limited range tests for YUV420 mode
      drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode

 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 115 +++--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 479 ++++++++++++++-------
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 222 ++++++++++
 3 files changed, 615 insertions(+), 201 deletions(-)
---
base-commit: 4423e607ff50157aaf088854b145936cbab4d560
change-id: 20241130-hdmi-conn-yuv-e1fa596df768

