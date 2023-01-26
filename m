Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056867D77E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 22:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E7510E3C6;
	Thu, 26 Jan 2023 21:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD45910E3BF;
 Thu, 26 Jan 2023 21:15:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D559ACE24A4;
 Thu, 26 Jan 2023 21:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834FEC433D2;
 Thu, 26 Jan 2023 21:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674767739;
 bh=kDoN7lRtkiguVPMIrt2hz2XvkeOAxA8ec5u0EoQ2oZU=;
 h=From:To:Cc:Subject:Date:From;
 b=MZIYwYDxGRui5ufSSQCI03NAPZNsVz2pa74E1a6S835vWtFU/TqegK/BdgJZHyn3D
 fq1l4NeIEbkMq2GODsWzDFq1+sS3yYiFuCJ/uaZgVEkaK24VxjPzZQwou2YhYlZ169
 hF/LiP5B7rK2WENUAK9rtuvNnnxQIyv3jaiQNnIgPJXtIN2giNjB3gt0KGgOIbkJsR
 786k4VnAtaA+AkLvo1AhU2QySPMZAx1+MAUBG240zIV6BQS6XbUNMnsB2UpzTM9imk
 RnpHu4KDinDlB6hjS4AHJ/XNrolgE5CC/4m39TtoPEUFcvf1pQRdBl5HjsPe3kS7pn
 mtx6dg/QdCdoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH] [v2] vfio-mdev: add back CONFIG_VFIO dependency
Date: Thu, 26 Jan 2023 22:08:31 +0100
Message-Id: <20230126211211.1762319-1-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Sven Schnelle <svens@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_VFIO_MDEV cannot be selected when VFIO itself is
disabled, otherwise we get a link failure:

WARNING: unmet direct dependencies detected for VFIO_MDEV
  Depends on [n]: VFIO [=n]
  Selected by [y]:
  - SAMPLE_VFIO_MDEV_MTTY [=y] && SAMPLES [=y]
  - SAMPLE_VFIO_MDEV_MDPY [=y] && SAMPLES [=y]
  - SAMPLE_VFIO_MDEV_MBOCHS [=y] && SAMPLES [=y]
/home/arnd/cross/arm64/gcc-13.0.1-nolibc/x86_64-linux/bin/x86_64-linux-ld: samples/vfio-mdev/mdpy.o: in function `mdpy_remove':
mdpy.c:(.text+0x1e1): undefined reference to `vfio_unregister_group_dev'
/home/arnd/cross/arm64/gcc-13.0.1-nolibc/x86_64-linux/bin/x86_64-linux-ld: samples/vfio-mdev/mdpy.o: in function `mdpy_probe':
mdpy.c:(.text+0x149e): undefined reference to `_vfio_alloc_device'

Fixes: 8bf8c5ee1f38 ("vfio-mdev: turn VFIO_MDEV into a selectable symbol")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix the s390 and drm drivers as well, in addition to the
sample code.
---
 arch/s390/Kconfig            | 4 +++-
 drivers/gpu/drm/i915/Kconfig | 1 +
 samples/Kconfig              | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 045e681caa36..078cd1a773a3 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -715,6 +715,7 @@ config VFIO_CCW
 	def_tristate n
 	prompt "Support for VFIO-CCW subchannels"
 	depends on S390_CCW_IOMMU
+	depends on VFIO
 	select VFIO_MDEV
 	help
 	  This driver allows usage of I/O subchannels via VFIO-CCW.
@@ -726,8 +727,9 @@ config VFIO_AP
 	def_tristate n
 	prompt "VFIO support for AP devices"
 	depends on S390_AP_IOMMU && KVM
-	select VFIO_MDEV
+	depends on VFIO
 	depends on ZCRYPT
+	select VFIO_MDEV
 	help
 	  This driver grants access to Adjunct Processor (AP) devices
 	  via the VFIO mediated device interface.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index a14f68730d6d..b84c16933bbd 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -120,6 +120,7 @@ config DRM_I915_GVT_KVMGT
 	depends on X86
 	depends on 64BIT
 	depends on KVM
+	depends on VFIO
 	select DRM_I915_GVT
 	select KVM_EXTERNAL_WRITE_TRACKING
 	select VFIO_MDEV
diff --git a/samples/Kconfig b/samples/Kconfig
index 56b191d128d8..44a09dfa8a0b 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -185,6 +185,7 @@ config SAMPLE_UHID
 
 config SAMPLE_VFIO_MDEV_MTTY
 	tristate "Build VFIO mtty example mediated device sample code"
+	depends on VFIO
 	select VFIO_MDEV
 	help
 	  Build a virtual tty sample driver for use as a VFIO
@@ -192,6 +193,7 @@ config SAMPLE_VFIO_MDEV_MTTY
 
 config SAMPLE_VFIO_MDEV_MDPY
 	tristate "Build VFIO mdpy example mediated device sample code"
+	depends on VFIO
 	select VFIO_MDEV
 	help
 	  Build a virtual display sample driver for use as a VFIO
@@ -209,6 +211,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
 
 config SAMPLE_VFIO_MDEV_MBOCHS
 	tristate "Build VFIO mdpy example mediated device sample code"
+	depends on VFIO
 	select VFIO_MDEV
 	select DMA_SHARED_BUFFER
 	help
-- 
2.39.0

