Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CEE45496C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596B6E4B0;
	Wed, 17 Nov 2021 14:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2211 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 14:59:07 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AC76E046
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 6AC8841F28;
 Wed, 17 Nov 2021 14:59:03 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/simpledrm: Apple M1 / DT platform support fixes
Date: Wed, 17 Nov 2021 23:58:26 +0900
Message-Id: <20211117145829.204360-1-marcan@marcan.st>
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
Cc: Hector Martin <marcan@marcan.st>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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

Hector Martin (3):
  drm/simpledrm: Bind to OF framebuffers in /chosen
  drm/format-helper: Add drm_fb_xrgb8888_to_xrgb2101010_dstclip()
  drm/simpledrm: Enable XRGB2101010 format

 drivers/gpu/drm/drm_format_helper.c | 64 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c    | 19 ++++++++-
 include/drm/drm_format_helper.h     |  4 ++
 3 files changed, 86 insertions(+), 1 deletion(-)

-- 
2.33.0

