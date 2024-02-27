Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C390868EFD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2310E917;
	Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mBofjGGT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cPjARdQH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eI+pozVz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="exgRYLYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1177610E60B;
 Tue, 27 Feb 2024 11:38:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F9E8226DE;
 Tue, 27 Feb 2024 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5C4CK+3IOQMm2tEAZJPCPaPAJ0nIVyugJd/heULKsBk=;
 b=mBofjGGTP9buT7BDxHFEUtkHb9Ql2f+Nt/q+czcsmODUOSsHDVToHO1rbSdHvknZQbudnG
 k2hHt0aHJn91Y6RcECo/8jW056zpIpfJ3Yz79MLw6/WF02jOAUoNUikbrZqsBstu1yf5nu
 idUUE9n7SNp1ROkCrutkXtaKcrPlEtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5C4CK+3IOQMm2tEAZJPCPaPAJ0nIVyugJd/heULKsBk=;
 b=cPjARdQHlGQSH6PbnVsgqDFlGcCpvBuG4JsDRalPDUbO/B7rfTktrM+LxgLEZe9J/dno6M
 vTxrqI88UEdNoQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5C4CK+3IOQMm2tEAZJPCPaPAJ0nIVyugJd/heULKsBk=;
 b=eI+pozVzqRLV5xA6BGWTcd8Pv7AxusQ9mMxoad1zWnWGXNvZETiOWZ1+/5Z6tXVXxvFBC2
 wPlzlV+bHr8bM3x45hVU+Uxx12KFhegYLTrU6xmB78e/CoyJZga7Rftdf/eTM/J4hNHhTZ
 wm/lmNrVfwOBiCAPdqB8Mr3+/oyhxag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5C4CK+3IOQMm2tEAZJPCPaPAJ0nIVyugJd/heULKsBk=;
 b=exgRYLYRU1toZEzhUPaWw7UpZNnMlASkq200zc0im8evnK4Spfb09O+YUahTVm6WOPVATQ
 tTJvKgsxzJdp/JAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 62B8213216;
 Tue, 27 Feb 2024 11:38:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id nxXHFs/J3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and console
Date: Tue, 27 Feb 2024 11:14:47 +0100
Message-ID: <20240227113853.8464-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eI+pozVz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=exgRYLYR
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 2F9E8226DE
X-Spam-Flag: NO
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

Dma-buf locking semantics require the caller of pin and unpin to hold
the buffer's reservation lock. Fix DRM to adhere to the specs. This
enables to fix the locking in DRM's console emulation. Similar changes
for vmap and mmap have been posted at [1][2]

Most DRM drivers and memory managers acquire the buffer object's
reservation lock within their GEM pin and unpin callbacks. This
violates dma-buf locking semantics. We get away with it because PRIME
does not provide pin/unpin, but attach/detach, for which the locking
semantics is correct.

Patches 1 to 8 rework DRM GEM code in various implementations to
acquire the reservation lock when entering the pin and unpin callbacks.
This prepares them for the next patch. Drivers that are not affected
by these patches either don't acquire the reservation lock (amdgpu)
or don't need preparation (loongson).

Patch 9 moves reservation locking from the GEM pin/unpin callbacks
into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
internally it still gets the reservation lock.

With the updated GEM callbacks, the rest of the patchset fixes the
fbdev emulation's buffer locking. Fbdev emulation needs to keep its
GEM buffer object inplace while updating its content. This required
a implicit pinning and apparently amdgpu didn't do this at all.

Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
The former function map a GEM buffer into the kernel's address space
with regular vmap operations, but keeps holding the reservation lock.
The _vunmap_local() helper undoes the vmap and releases the lock. The
updated GEM callbacks make this possible. Between the two calls, the
fbdev emulation can update the buffer content without have the buffer
moved or evicted. Update fbdev-generic to use vmap_local helpers,
which fix amdgpu. The idea of adding a "local vmap" has previously been
attempted at [3] in a different form.

Patch 11 adds implicit pinning to the DRM client's regular vmap
helper so that long-term vmap'ed buffers won't be evicted. This only
affects fbdev-dma, but GEM DMA helpers don't require pinning. So
there are no practical changes.

Patches 12 and 13 remove implicit pinning from the vmap and vunmap
operations in gem-vram and qxl. These pin operations are not supposed
to be part of vmap code, but were required to keep the buffers in place
for fbdev emulation. With the conversion o ffbdev-generic to to
vmap_local helpers, that code can finally be removed.

Tested with amdgpu, nouveau, radeon, simpledrm and vc4.

[1] https://patchwork.freedesktop.org/series/106371/
[2] https://patchwork.freedesktop.org/series/116001/
[3] https://patchwork.freedesktop.org/series/84732/

Thomas Zimmermann (13):
  drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
  drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
  drm/msm: Provide msm_gem_get_pages_locked()
  drm/msm: Acquire reservation lock in GEM pin/unpin callback
  drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
  drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
  drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
  drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
  drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
  drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
  drm/client: Pin vmap'ed GEM buffers
  drm/gem-vram: Do not pin buffer objects for vmap
  drm/qxl: Do not pin buffer objects for vmap

 drivers/gpu/drm/drm_client.c            |  92 ++++++++++++++++++---
 drivers/gpu/drm/drm_fbdev_generic.c     |   4 +-
 drivers/gpu/drm/drm_gem.c               |  34 +++++++-
 drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_vram_helper.c   | 101 ++++++++++--------------
 drivers/gpu/drm/drm_internal.h          |   2 +
 drivers/gpu/drm/loongson/lsdc_gem.c     |  13 +--
 drivers/gpu/drm/msm/msm_gem.c           |  20 ++---
 drivers/gpu/drm/msm/msm_gem.h           |   4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c     |  20 +++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  43 +++++++---
 drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +
 drivers/gpu/drm/nouveau/nouveau_prime.c |   8 +-
 drivers/gpu/drm/qxl/qxl_object.c        |  26 +++---
 drivers/gpu/drm/qxl/qxl_object.h        |   2 +
 drivers/gpu/drm/qxl/qxl_prime.c         |   4 +-
 drivers/gpu/drm/radeon/radeon_prime.c   |  11 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  25 ++----
 include/drm/drm_client.h                |  10 +++
 include/drm/drm_gem.h                   |   3 +
 include/drm/drm_gem_shmem_helper.h      |   7 +-
 21 files changed, 265 insertions(+), 172 deletions(-)


base-commit: 7291e2e67dff0ff573900266382c9c9248a7dea5
prerequisite-patch-id: bdfa0e6341b30cc9d7647172760b3473007c1216
prerequisite-patch-id: bc27ac702099f481890ae2c7c4a9c531f4a62d64
prerequisite-patch-id: f5d4bf16dc45334254527c2e31ee21ba4582761c
prerequisite-patch-id: 734c87e610747779aa41be12eb9e4c984bdfa743
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.43.2

