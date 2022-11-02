Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FA616ECF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 21:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B8710E1D1;
	Wed,  2 Nov 2022 20:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392A710E1D1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 20:34:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9625CB81AA7;
 Wed,  2 Nov 2022 20:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D23C433D6;
 Wed,  2 Nov 2022 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667421254;
 bh=Yy6Mwdb7/j4vB86rzZF4wVb0nPq2hqeNtWXnpbDy+vE=;
 h=From:To:Cc:Subject:Date:From;
 b=JLJU5v0WCvU7/zr4PuJ04bvmVEC8Qs3YbsHg4xOb4OIDCh7uoiHwJaAUQmLx27qxY
 GWsvN3FJLTt30n6HVkU0p6/tSU6EqhhTuqayuhY3in5Gr3sDJuKZ6g+/KG0+l3ykB3
 WlvXac38ku/hTvCYeKGTVVhPL4Ay+nv6iQJUUTmkoY82Htay/vA/yfmolmMU5IoGeR
 IKnXbA6Qhwtgem0A14j1oTmuAY4d1wIGlC6g4Tn/YYSzEslOJRwjDt/kJ3KgVSuJ2b
 iEodvIRQyJ9yiGciy73uQQ2suVufx6ta5KIZlgIVaoiTpSQD9KMuX6jmpj3TP2isM4
 Jb3i4sdt4Zaww==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v2 0/3] new subsystem for compute accelerator devices
Date: Wed,  2 Nov 2022 22:34:02 +0200
Message-Id: <20221102203405.1797491-1-ogabbay@kernel.org>
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
 Christoph Hellwig <hch@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second version of the RFC following the comments given on the
first version. Nothing materially has changed in regard to how accel
devices are registered and exposed to user-space. The changes are mostly
re-factoring according to the comments.

Changes since v1:
- Instead of embedding the accel code inside drm core functions, create
  accel_drv.c to hold all the new core code and call that code from
  DRM core.

- Replace deprecated IDR with xarray to manage the accel minors.

- Remove all #ifdef from drm_drv.c. Instead, there are empty inline
  implementations in a new header file drm_accel.h (in include/drm/) that
  will be compiled in case CONFIG_ACCEL is set to 'N'.

- Patch-set organization is a bit different:
  - Patch 1 introduces the accel major code and the new Kconfig.
  - Patch 2 introduces the accel minor code.
  - Patch 3 adds the call to accel functions from DRM core code.

I still haven't added formal documentation as I want to make sure the
general design of the new version is acceptable. If there won't be any
major comments, I'll add the documentation and send the next version as
the version to be merged to drm-next.

The patches are in the following repo:
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v2

The HEAD of that branch is a commit adding a dummy driver that
registers an accel device using the new framework. This can be served
as a simple reference.

v1 cover letter:
https://lkml.org/lkml/2022/10/22/544

Thanks,
Oded.

Oded Gabbay (3):
  drivers/accel: define kconfig and register a new major
  accel: add dedicated minor for accelerator devices
  drm: initialize accel framework

 Documentation/admin-guide/devices.txt |   5 +
 MAINTAINERS                           |   8 +
 drivers/Kconfig                       |   2 +
 drivers/Makefile                      |   3 +
 drivers/accel/Kconfig                 |  24 +++
 drivers/accel/Makefile                |  10 +
 drivers/accel/accel_drv.c             | 281 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c             |  98 ++++++---
 drivers/gpu/drm/drm_file.c            |   2 +-
 drivers/gpu/drm/drm_sysfs.c           |  24 ++-
 include/drm/drm_accel.h               |  58 ++++++
 include/drm/drm_device.h              |   3 +
 include/drm/drm_drv.h                 |   8 +
 include/drm/drm_file.h                |  21 +-
 14 files changed, 513 insertions(+), 34 deletions(-)
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/Makefile
 create mode 100644 drivers/accel/accel_drv.c
 create mode 100644 include/drm/drm_accel.h

--
2.25.1

