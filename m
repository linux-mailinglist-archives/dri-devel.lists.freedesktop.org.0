Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9109677856
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CC810E337;
	Mon, 23 Jan 2023 10:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494F1882D0;
 Mon, 23 Jan 2023 10:06:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08ED334211;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674468363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zvbfFxmPA6MckGsa12w4Fd8iWOMpJ3cRPXUsw4iIFlE=;
 b=hnx13NtxzNm1St8ipbiG73i6D7suAB2xOt8zRS7nVB69ksjHiMHL25Q0pxRnnbNqOza/V1
 oXY/KmiKYhbwQHSeDvZ+uJ5z/ZCBPW1SXEFs64XCNW1mxEnRWgSwAMDQ6uAAWyotEizlA0
 hyAeowqfZwQqI4LT+znkkDhO8Z6+fl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674468363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zvbfFxmPA6MckGsa12w4Fd8iWOMpJ3cRPXUsw4iIFlE=;
 b=zzKj3UI4WR5ICeAArZmfACKc11DAuP7TD0zJfbZGYG5byVInNlwnlYmH/cP98v1w34uLiQ
 3n6CZISuR2ebLNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9860134F5;
 Mon, 23 Jan 2023 10:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o3VQLApczmO+DwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 00/10] drm/fb-helper: Various cleanups
Date: Mon, 23 Jan 2023 11:05:49 +0100
Message-Id: <20230123100559.12351-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add various cleanups and changes to DRM's fbdev helpers and the
generic fbdev emulation. There's no clear theme here, just lots
of small things that need to be updated.
 
In the end, the code will better reflect which parts are in the 
DRM client, which is fbdev emulation, and which are shared fbdev
helpers.

Thomas Zimmermann (10):
  drm/client: Test for connectors before sending hotplug event
  drm/client: Add hotplug_failed flag
  drm/fb-helper: Introduce drm_fb_helper_unprepare()
  drm/fbdev-generic: Initialize fb-helper structure in generic setup
  drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
  drm/fb-helper: Initialize fb-helper's preferred BPP in prepare
    function
  drm/fbdev-generic: Minimize hotplug error handling
  drm/fbdev-generic: Minimize client unregistering
  drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy()
  drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'

 drivers/gpu/drm/armada/armada_fbdev.c      |   4 +-
 drivers/gpu/drm/drm_client.c               |  10 ++
 drivers/gpu/drm/drm_fb_helper.c            |  58 ++++++---
 drivers/gpu/drm/drm_fbdev_generic.c        | 129 ++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  11 +-
 drivers/gpu/drm/msm/msm_fbdev.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |   4 +-
 drivers/gpu/drm/radeon/radeon_fb.c         |   4 +-
 drivers/gpu/drm/tegra/fb.c                 |   7 +-
 include/drm/drm_client.h                   |   8 ++
 include/drm/drm_fb_helper.h                |   7 +-
 13 files changed, 133 insertions(+), 121 deletions(-)


base-commit: 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.39.0

