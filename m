Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0566839C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E48B10E1D9;
	Thu, 12 Jan 2023 20:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276310E1D9;
 Thu, 12 Jan 2023 20:12:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A795022A10;
 Thu, 12 Jan 2023 20:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673554318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rtrU1OUykO34xWHMi3G0sI22GeMOQtI4CaSGkZ/Gb64=;
 b=u0lcxmvnsfJo7t1P1xH2Dxro87+YV/OBhAtKuEvjwPe+U2hl8NXy4xnT+aeGsD58bdhYTW
 CqI9oS2oJoY6beiOWFoeOYP77+6SZARDm8z8nrGRkw2sV2tmFl+oe7IfLSCH0RDl9Q7SIQ
 +7csj7Cu0OzDH4nYiGOzh0Ksqg0aDwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673554318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rtrU1OUykO34xWHMi3G0sI22GeMOQtI4CaSGkZ/Gb64=;
 b=PXClotV4TKstWXpGYQf19Rvh8ZhhnQrXYtLDSySKCek7/GrxXW0BacIjQF4gpYW08gOuhC
 0hsbG2MmGFPTgkCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54F9713585;
 Thu, 12 Jan 2023 20:11:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jwn0E45pwGMGKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 20:11:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, evan.quan@amd.com, jose.souza@intel.com
Subject: [PATCH v2 0/3] drm: Generic fbdev and vga-switcheroo
Date: Thu, 12 Jan 2023 21:11:53 +0100
Message-Id: <20230112201156.26849-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(was: drm/fb-helper: Set framebuffer for vga-switcheroo clients)

This patch has now turned into a little series. The first two patches
are bug fixes for the existing code. The third patch cleans up the
drivers.

Patch 1 fixes i915 to do the correct thing if the device has not been
initialized yet. Switching to the device is only possible after the
initialization, but switching away is always possible.

Patch 2 is the original patch without the amdgpu changes. Installs
the fbdev framebuffer in vga-switcheroo for the PCI device. Does
nothing for drivers without vga-switcheroo.

Patch 3 cleans up vga_switcheroo_process_delayed_switch() in amdgpu
and the other related drivers (i.e., i915, nouveau and radeon). The
call is now located at the end of drm_lastclose() and drivers do not
need their own lastclose helpers any longer.

I kept the r-bs from v1, but patch 1 is entirely new and patch 3 has
significantly grown in size.

Thomas Zimmermann (3):
  drm/i915: Allow switching away via vga-switcheroo if uninitialized
  drm/fb-helper: Set framebuffer for vga-switcheroo clients
  drm: Call vga_switcheroo_process_delayed_switch() in drm_lastclose

 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 -------------
 drivers/gpu/drm/drm_fb_helper.c         |  8 ++++++++
 drivers/gpu/drm/drm_file.c              |  3 +++
 drivers/gpu/drm/i915/i915_driver.c      | 26 ++-----------------------
 drivers/gpu/drm/i915/i915_switcheroo.c  |  6 +++++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c   |  7 -------
 drivers/gpu/drm/nouveau/nouveau_vga.h   |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.h     |  1 -
 drivers/gpu/drm/radeon/radeon_kms.c     | 18 -----------------
 drivers/gpu/vga/vga_switcheroo.c        |  4 ++--
 14 files changed, 21 insertions(+), 72 deletions(-)


base-commit: ac04152253dccfb02dcedfa0c57443122cf79314
-- 
2.39.0

