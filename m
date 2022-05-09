Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B884520243
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10110E421;
	Mon,  9 May 2022 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1912610E0A7;
 Mon,  9 May 2022 16:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EA216137D;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E049C385B6;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=XjCnODs5eDe2B6X2CKoYdGCfUAZLm0o230Hy5WWYtoI=;
 h=From:To:Cc:Subject:Date:From;
 b=dDCQULQx6Ix7kDV0M/p/zOdD8C5+qlFZUsCYdG06NUh0Uy31yjFYb2UG7GWVu1V+R
 wexdYfEEQl4hJym0y7yoVcFFkcW0SZC9EJF/u1IqwoxN97dFar7D+XA6TlvumAECd1
 1s9alS5L1GNT+/vr5mUiCL/I0X1Pk+pVaIKRafifXSmmDf9a6d4ZIpMUw4X4ITi1gR
 0kRsP6TIiWHPVXrv5GCD29mz90FmHHP/dcl82vLLjxIoJWo3Ut2350lvSxjevDyABQ
 ONDIEdCUIYQtUZAzpx5mM8JMIgLC/i+aOmUTw/Z0JD9YrvCa1MvGzKJif8nb8bF8+4
 oFBbvRfQFq6fw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVL-E7; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Date: Mon,  9 May 2022 18:23:35 +0200
Message-Id: <cover.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
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
Cc: mauro.chehab@linux.intel.com, Richard Weinberger <richard@nod.at>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, kernel/module annotates module dependencies when
request_symbol is used, but it doesn't cover more complex inter-driver
dependencies that are subsystem and/or driver-specific.

That's because module_try_get() and symbol_get() doesn't try to
setup the module owner.

In the case of hdmi sound, depending on the CPU/GPU, sometimes the
snd_hda_driver can talk directly with the hardware, but sometimes, it
uses the i915 driver. When the snd_hda_driver uses i915, it should
first be unbind/rmmod, as otherwise trying to unbind/rmmod the i915
driver cause driver issues, as as reported by CI tools with different
GPU models:
	https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6415/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
	https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11495/bat-adlm-1/igt@i915_module_load@reload.html

In the past, just a few CPUs were doing such bindings, but this issue now
applies to all "modern" Intel CPUs  that have onboard graphics, as well as
to the  newer discrete GPUs.

With the discrete GPU case, the HDA controller is physically separate and
requires i915 to power on the hardware for all hardware  access. In this
case, the issue is hit basicly 100% of the time.

With on-board graphics, i915 driver is needed only when the display
codec is accessed. If i915 is unbind during runtime suspend, while
snd-hda-intel is still bound, nothing bad happens, but unbinding i915
on other situations may also cause issues.

So, add support at kernel/modules to properly set the holders when
try_module_get() and symbol_get() are used.

This allow allow audio drivers to properly annotate when a dependency 
on a DRM driver dependencies exists, and add a call to such new 
function at the snd-hda driver when it successfully binds into the DRM 
driver.

With that, userspace tools can now check and properly remove the
audio driver before trying to remove or unbind the GPU driver.

It should be noticed that this series conveys the hidden module
dependencies. Other changes are needed in order to allow
removing or unbinding the i915 driver while keeping the snd-hda-intel
driver loaded/bound. With that regards, there are some discussions on
how to improve this at alsa-devel a while  back:

https://mailman.alsa-project.org/pipermail/alsa-devel/2021-September/190099.html

So, future improvements on both in i915 and the audio drivers could be made.
E.g. with  discrete GPUs, it's the only codec of the card, so it seems feasible
to detach the ALSA card if i915 is bound (using infra made for VGA
switcheroo), but,  until these improvements are done and land in
upstream, audio drivers needs to be unbound if i915 driver goes unbind.

Yet, even if such fixes got merged, this series is still needed, as it makes
such dependencies more explicit and easier to debug.

PS.: This series was generated against next-20220506.

---

v6:
- dropped an unused function prototype for __symbol_get_gpl();
- addressed several issues that were noticed while testing the series on
  an slow atom machine;
- also add holders when symbol_get() is used.

v5:
- while v4 works fine, it ends calling try_module_format() recursively, which
  is not what it it was supposed to do. So, change the logic to avoid such
  recursion, by adding a static __try_module_format() and renaming the
  new version that takes two arguments as try_module_format_owner().

v4:
 - fix a compilation warning reported by Intel's Kernel robot when
   !CONFIG_MODULE_UNLOAD or !CONFIG_MODULE.

v3: minor fixes:
 - fixed a checkpatch warning;
 - use a single line for the new function prototype.

v2:
 - the dependencies are now handled directly at try_module_get().
Mauro Carvalho Chehab (4):
  module: drop prototype for non-existing __symbol_get_gpl()
  module: update dependencies at try_module_get()
  module: set holders when symbol_get() is used
  ALSA: hda - identify when audio is provided by a video driver

 drivers/mtd/chips/gen_probe.c           |  4 +-
 include/linux/module.h                  | 13 +++--
 kernel/module/main.c                    | 76 ++++++++++++++++++++-----
 samples/hw_breakpoint/data_breakpoint.c |  2 +-
 sound/hda/hdac_component.c              |  2 +-
 5 files changed, 72 insertions(+), 25 deletions(-)

-- 
2.35.3


