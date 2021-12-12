Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861E4718DC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 07:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1FD10EA70;
	Sun, 12 Dec 2021 06:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D610EA70
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 06:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 990CF424CD;
 Sun, 12 Dec 2021 06:24:12 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 0/3] drm/simpledrm: Apple M1 / DT platform support fixes
Date: Sun, 12 Dec 2021 15:24:04 +0900
Message-Id: <20211212062407.138309-1-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
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
Cc: devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DRM folks,

This short series makes simpledrm work on Apple M1 (including Pro/Max)
platforms the way simplefb already does, by adding XRGB2101010 support
and making it bind to framebuffers in /chosen the same way simplefb
does.

This avoids breaking the bootloader-provided framebuffer console when
simpledrm is selected to replace simplefb, as these FBs always seem to
be 10-bit (at least when a real screen is attached).

Changes since v2:
- Made 10-bit conversion code fill the LSBs
- Added ARGB2101010 to supported formats list
- Simplified OF core code per review feedback
Hector Martin (3):
  of: Move simple-framebuffer device handling from simplefb to of
  drm/format-helper: Add drm_fb_xrgb8888_to_xrgb2101010_toio()
  drm/simpledrm: Add [AX]RGB2101010 formats

 drivers/gpu/drm/drm_format_helper.c | 64 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c    |  4 +-
 drivers/of/platform.c               |  4 ++
 drivers/video/fbdev/simplefb.c      | 21 +---------
 include/drm/drm_format_helper.h     |  3 ++
 5 files changed, 74 insertions(+), 22 deletions(-)

-- 
2.33.0

