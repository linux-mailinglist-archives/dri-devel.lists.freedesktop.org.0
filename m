Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0C61E60F
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 22:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A32210E04D;
	Sun,  6 Nov 2022 21:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7079610E04D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 21:02:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E07160CF1;
 Sun,  6 Nov 2022 21:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE5DC433D7;
 Sun,  6 Nov 2022 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667768553;
 bh=EXvwdhWEYV7UJ2h0xFwZgcbB4zy2TYFGbCvTW03tHYU=;
 h=From:To:Cc:Subject:Date:From;
 b=GprBHDGEFAa8bq7NcFH9F6bzocK/wwk4LpOUsP86Ft/pnzakOV/s7rhPdDIb4LvoB
 b6bMd37UQcYM80/6j6/hEp82DmnwLbT5qI0ba8NmhZGbm91FwwElyzR8BTsFQZwknL
 DJVjSPfYJSSlRtjvvz5INLEKCXy/W6Twpl3tCl1p/kmKLXLZFeV+VgU4+nepV7EbPW
 b3orOmpSRCucQ+nwO6glQMSnMKY5UA35GQb9DdH6P72CxJGNhedkAqo+SrnL0VSxL1
 4HUoyZs6G2FkbB59ucvGgI4gtwsMuZmxyz1tvjtVLSWAvSWV6QnYnT8AvjajVhIz2W
 +jnxmIcA88duA==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v3 0/3] new subsystem for compute accelerator devices
Date: Sun,  6 Nov 2022 23:02:22 +0200
Message-Id: <20221106210225.2065371-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
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
 Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the third version of the RFC following the comments given on the
second version, but more importantly, following testing done by the VPU
driver people and myself. We found out that there is a circular dependency
between DRM and accel. DRM calls accel exported symbols during init and when
accel devices are registering (all the minor handling), then accel calls DRM
exported symbols. Therefore, if the two components are compiled as modules,
there is a circular dependency.

To overcome this, I have decided to compile the accel core code as part of
the DRM kernel module (drm.ko). IMO, this is inline with the spirit of the
design choice to have accel reuse the DRM core code and avoid code
duplication.

Another important change is that I have reverted back to use IDR for minor
handling instead of xarray. This is because I have found that xarray doesn't
handle well the scenario where you allocate a NULL entry and then exchange it
with a real pointer. It appears xarray still considers that entry a "zero"
entry. This is unfortunate because DRM works that way (first allocates a NULL
entry and then replaces the entry with a real pointer).

I decided to revert to IDR because I don't want to hold up these patches,
as many people are blocked until the support for accel is merged. The xarray
issue should be fixed as a separate patch by either fixing the xarray code or
changing how DRM + ACCEL do minor id handling.

The patches are in the following repo:
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v3

As in v2, The HEAD of that branch is a commit adding a dummy driver that
registers an accel device using the new framework. This can be served
as a simple reference. I have checked inserting and removing the dummy driver,
and opening and closing /dev/accel/accel0 and nothing got broken :)

v1 cover letter:
https://lkml.org/lkml/2022/10/22/544

v2 cover letter:
https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/

Thanks,
Oded.

Oded Gabbay (3):
  drivers/accel: define kconfig and register a new major
  accel: add dedicated minor for accelerator devices
  drm: initialize accel framework

 Documentation/admin-guide/devices.txt |   5 +
 MAINTAINERS                           |   8 +
 drivers/Kconfig                       |   2 +
 drivers/accel/Kconfig                 |  24 ++
 drivers/accel/drm_accel.c             | 322 ++++++++++++++++++++++++++
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/drm_drv.c             | 102 +++++---
 drivers/gpu/drm/drm_file.c            |   2 +-
 drivers/gpu/drm/drm_sysfs.c           |  24 +-
 include/drm/drm_accel.h               |  97 ++++++++
 include/drm/drm_device.h              |   3 +
 include/drm/drm_drv.h                 |   8 +
 include/drm/drm_file.h                |  21 +-
 13 files changed, 582 insertions(+), 37 deletions(-)
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/drm_accel.c
 create mode 100644 include/drm/drm_accel.h

--
2.25.1

