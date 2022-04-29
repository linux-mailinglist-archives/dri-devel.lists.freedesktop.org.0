Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815ED51425B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 08:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9275A10FB2D;
	Fri, 29 Apr 2022 06:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20010FB8F;
 Fri, 29 Apr 2022 06:31:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E12261D7A;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFB0C385AC;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651213887;
 bh=1qTI2+ULn9S33eUs/y9vp+7qFR3kaOf7jmVnCV4QTU0=;
 h=From:To:Cc:Subject:Date:From;
 b=oKda16HSltrM1J2Qv8n2yHzXm+KWDkgn6vpCbU3CbfalB9DsnP+Ip45pcRoJ4vYG2
 TXInGSja1792BOhv1g7WnGV5fnSbmrIlAMZ5QrXdOG0mmq2AzZB8r/oZTBXI46gMyO
 ILOot9hhasVU6Q0QhI3SUfoPAighV0XqYAhmPmOY/3ybC83GjCeb+DuTVpH6G1LTFW
 RAqC1CzHD5jD0vKp3aOFknDlb0mPlA1z7qAL1GRfGzPn7zVyFkPSvZJnKBjQxDlylc
 gqrmEugOKSe3ZkXOgWUUTx4NvJC+/H2fDLgdHk2RrMji1NnRlfe3qRrpwhJCCULhPY
 nu3UR42ITLJPA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkK9z-001Qmf-Ly; Fri, 29 Apr 2022 07:31:23 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 0/2] Let userspace know when snd-hda-intel needs i915
Date: Fri, 29 Apr 2022 07:31:14 +0100
Message-Id: <cover.1651212016.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 David Airlie <airlied@linux.ie>, mauro.chehab@intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, kernel/module annotates module dependencies when
request_symbol is used, but it doesn't cover more complex inter-driver
dependencies that are subsystem and/or driver-specific.

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

So, add support at kernel/modules to allow snd-hda drivers to properly
annotate when a dependency on a DRM driver dependencies exists,
and add a call to such new function at the snd-hda driver when it
successfully binds into the DRM driver.

This would allow userspace tools to check and properly remove the
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

PS.: This series was generated against next-20220428.

Luis/Takashi/Daniel/David,

If OK for you, I would prefer to have such patches applied via the drm-tip
tree once reviewed, in order to make easier to use them by some patches
I'm preparing to improve the CI tests that use i915 unbind logic.

Mauro Carvalho Chehab (2):
  module: add a function to add module references
  ALSA: hda - identify when audio is provided by a video driver

 include/linux/module.h     |  7 +++++++
 kernel/module/main.c       | 31 +++++++++++++++++++++++++++++++
 sound/hda/hdac_component.c |  8 ++++++++
 3 files changed, 46 insertions(+)

-- 
2.35.1


