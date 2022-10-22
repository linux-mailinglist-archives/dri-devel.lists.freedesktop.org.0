Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373B608FD4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 23:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE8810E00E;
	Sat, 22 Oct 2022 21:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986DD10E00E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 21:46:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7C3D6068B;
 Sat, 22 Oct 2022 21:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D02C433D7;
 Sat, 22 Oct 2022 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666475192;
 bh=OMqxGbhs6IW6+TTHrfUolLyZ69ETq76ct24yDkL2rOo=;
 h=From:To:Cc:Subject:Date:From;
 b=MDamo/zrdlDpG6RPEK82w1JhW4mRCSqbP6ra3YGavNICs3uUXGccAnU/u7gGSEzzJ
 VqhNfRBNeRituLobc2g9e/rXcal70oiRPddpebg9cAx3W/aPcpIBoKK7IPf3ZtvPf1
 Fj7qrXIeIO9Gtt1V/a6nC/wDHcRQE3EEjQbuxl56xsY/pkH4nFK8wBhBs+1jb+032k
 rnU2NOVFJQWSN9NGdAImiysyWjadGbaY38aK7AnM/ZdCzVAv8VZlSfs2fdvA95fIXE
 bovjvDAwqXPb99tPeDYX4cFS/R2ZpuhiQ+P+ULkm7/qprKR9SXYAaRVBK88mjVhE6T
 +pNfJc8hIm1zA==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Date: Sun, 23 Oct 2022 00:46:19 +0300
Message-Id: <20221022214622.18042-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jiho Chu <jiho.chu@samsung.com>,
 Christoph Hellwig <hch@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the last couple of months we had a discussion [1] about creating a new
subsystem for compute accelerator devices in the kernel.

After an analysis that was done by DRM maintainers and myself, and following
a BOF session at the Linux Plumbers conference a few weeks ago [2], we
decided to create a new subsystem that will use the DRM subsystem's code and
functionality. i.e. the accel core code will be part of the DRM subsystem.

This will allow us to leverage the extensive DRM code-base and
collaborate with DRM developers that have experience with this type of
devices. In addition, new features that will be added for the accelerator
drivers can be of use to GPU drivers as well (e.g. RAS).

As agreed in the BOF session, the accelerator devices will be exposed to
user-space with a new, dedicated device char files and a dedicated major
number (261), to clearly separate them from graphic cards and the graphic
user-space s/w stack. Furthermore, the drivers will be located in a separate
place in the kernel tree (drivers/accel/).

This series of patches is the first step in this direction as it adds the
necessary infrastructure for accelerator devices to DRM. The new devices will
be exposed with the following convention:

device char files - /dev/accel/accel*
sysfs             - /sys/class/accel/accel*/
debugfs           - /sys/kernel/debug/accel/accel*/

I tried to reuse the existing DRM code as much as possible, while keeping it
readable and maintainable.

One thing that is missing from this series is defining a namespace for the
new accel subsystem, while I'll add in the next iteration of this patch-set,
after I will receive feedback from the community.

As for drivers, once this series will be accepted (after adding the namespace),
I will start working on migrating the habanalabs driver to the new accel
subsystem. I have talked about it with Dave and we agreed that it will be
a good start to simply move the driver as-is with minimal changes, and then
start working on the driver's individual features that will be either added
to the accel core code (with or without changes), or will be removed and
instead the driver will use existing DRM code.

In addition, I know of at least 3 or 4 drivers that were submitted for review
and are good candidates to be included in this new subsystem, instead of being
a drm render node driver or a misc driver.

[1] https://lkml.org/lkml/2022/7/31/83
[2] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

Thanks,
Oded

Oded Gabbay (3):
  drivers/accel: add new kconfig and update MAINTAINERS
  drm: define new accel major and register it
  drm: add dedicated minor for accelerator devices

 Documentation/admin-guide/devices.txt |   5 +
 MAINTAINERS                           |   8 +
 drivers/Kconfig                       |   2 +
 drivers/accel/Kconfig                 |  24 +++
 drivers/gpu/drm/drm_drv.c             | 214 +++++++++++++++++++++-----
 drivers/gpu/drm/drm_file.c            |  69 ++++++---
 drivers/gpu/drm/drm_internal.h        |   5 +-
 drivers/gpu/drm/drm_sysfs.c           |  81 +++++++++-
 include/drm/drm_device.h              |   3 +
 include/drm/drm_drv.h                 |   8 +
 include/drm/drm_file.h                |  21 ++-
 include/drm/drm_ioctl.h               |   1 +
 12 files changed, 374 insertions(+), 67 deletions(-)
 create mode 100644 drivers/accel/Kconfig

--
2.34.1

