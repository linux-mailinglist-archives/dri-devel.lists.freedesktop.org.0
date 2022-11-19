Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3966310E4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 21:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B006210E02E;
	Sat, 19 Nov 2022 20:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69810E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 20:44:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBC5960BAA;
 Sat, 19 Nov 2022 20:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5989C433C1;
 Sat, 19 Nov 2022 20:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668890685;
 bh=MmB0kiiRS0fZ8FYGoiHwWYca4qOtCXkpxetHnZytkyM=;
 h=From:To:Cc:Subject:Date:From;
 b=YTlMpSOs6F34vvnrgMqsizuCW87N2FIyluvDo0yLv4T4YCtJpNnC0HiGUlL4rQudz
 HjVDrGpzZ2iqPrR+J1EUskL5gVMb4yacrW2pTSvgXJ4aww5lOWilcPWAgB7vjdRvqB
 x9EYgLuEM3GZTOaZyWKx3UPGgCv6yQXcr5Tw+IopltmQ0eUQ6Gxodgtx/nvisAsGFv
 uEscs7DhaSC+EJXFyeBHqnxYwQGJZXXqA5H07VQCUDuxDYBpCc5xsQ9FTUdHDNVpZF
 uahbGajimfLAm0/hgsIEL5EUPJe42FFD83l9RGot815k56yOHhPjfaRBUOxZIJ2nP1
 RkV8iGIY9ltbg==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 0/4] new subsystem for compute accelerator devices
Date: Sat, 19 Nov 2022 22:44:31 +0200
Message-Id: <20221119204435.97113-1-ogabbay@kernel.org>
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the fourth (and hopefully last) version of the patch-set to add the
new subsystem for compute accelerators. I removed the RFC headline as
I believe it is now ready for merging.

Compare to v3, this patch-set contains one additional patch that adds
documentation regarding the accel subsystem. I hope it's good enough for
this stage. In addition, there were few very minor fixes according to
comments received on v3.

The patches are in the following repo:
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4

As in v3, The HEAD of that branch is a commit adding a dummy driver that
registers an accel device using the new framework. This can be served
as a simple reference.

v1 cover letter:
https://lkml.org/lkml/2022/10/22/544

v2 cover letter:
https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/

v3 cover letter:
https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/

Thanks,
Oded.

Oded Gabbay (4):
  drivers/accel: define kconfig and register a new major
  accel: add dedicated minor for accelerator devices
  drm: initialize accel framework
  doc: add documentation for accel subsystem

 Documentation/accel/index.rst         |  17 ++
 Documentation/accel/introduction.rst  | 109 +++++++++
 Documentation/admin-guide/devices.txt |   5 +
 Documentation/subsystem-apis.rst      |   1 +
 MAINTAINERS                           |   9 +
 drivers/Kconfig                       |   2 +
 drivers/accel/Kconfig                 |  24 ++
 drivers/accel/drm_accel.c             | 323 ++++++++++++++++++++++++++
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/drm_drv.c             | 102 +++++---
 drivers/gpu/drm/drm_file.c            |   2 +-
 drivers/gpu/drm/drm_sysfs.c           |  24 +-
 include/drm/drm_accel.h               |  97 ++++++++
 include/drm/drm_device.h              |   3 +
 include/drm/drm_drv.h                 |   8 +
 include/drm/drm_file.h                |  21 +-
 16 files changed, 711 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/accel/index.rst
 create mode 100644 Documentation/accel/introduction.rst
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/drm_accel.c
 create mode 100644 include/drm/drm_accel.h

--
2.25.1

