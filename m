Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46066070F8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5810E5E8;
	Fri, 21 Oct 2022 07:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DC10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288627; x=1697824627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m2r7COfPD+GRyevUno5IMG60hpKoNPIlXxjgIIBcKUs=;
 b=lg0k+Y9AmwkmkERT6Da3RkiOV7iA2nQrT4wI4WNkkPtlRgO0LhHY5HdD
 xWt52pWAHPGq7Lm55xlecqo8JKk4m9PyyuQf/Af3uI1VvtG455WiQKSOP
 uAmUo7kAfnxFWVwziS1+NHEFbya9hzXpWD93xhGDyhynkWNDWsF+NowYE
 zBzhtjN6mkn/cdGqcmFGJ1vPV7EGl1h1CMtvDtqveqWx1Nwq+NFbpDAlr
 g8+BJJuC2zMNxNmSfHXW34+cNBl/Cy+xJlCtNtlfTjoihn2P6qbdHXi6B
 S49f3AeaHyUWFwgKiKs8WtU/XeqdUlE3ZlX+nLvqhM/NpauezHjXR0qFm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528480"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528480"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516693"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772516693"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:00 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Date: Thu, 20 Oct 2022 19:53:24 +0200
Message-Id: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear kernel maintainers,

This submission is a kernel driver to support Intel(R) Gaussian & Neural
Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
available on multiple Intel platforms. AI developers and users can offload
continuous inference workloads to an Intel(R) GNA device in order to free
processor resources and save power. Noise reduction and speech recognition
are the examples of the workloads Intel(R) GNA deals with while its usage
is not limited to the two.

For a list of processors equipped with Intel(R) GNA device, please refer to
this link:
https://docs.openvinotoolkit.org/latest/openvino_docs_IE_DG_supported_plugins_GNA.html

We think contributing this driver to the upstream kernel project is the
best way for developers and users to get the latest Intel(R) GNA support in
a Linux kernel, through the mainline to any Linux distributions installed
on their systems. Upstreaming also enables contribution from developers
around the world to the driver once it is merged.

The driver works with Intel(R) libraries in user space. The Intel(R) driver
exposes a few IOCTL interfaces for use by libraries in user space. The
libraries are open sourced and are available at:
https://github.com/intel/gna

---

Changelogs:

 v1->v2:
 - driver's new layout:
   - driver name: gna -> intel_gna
   - module name: gna -> intel_gna
   - device file name: /dev/gnaN -> /dev/intel_gnaN
   - driver's source directory: drivers/misc/gna/ -> drivers/misc/intel/gna/
   - UAPI: include/uapi/misc/gna.h -> include/uapi/misc/intel/gna.h
   - DOC: Documentation/misc-devices/gna.rst ->
       Documentation/misc-devices/intel/gna.rst
 - 'MISC' device framework used
 - fixes throughout GNA device's PCI management
 - header files' includes and forward declarations cleanup
 - ISR made static
 - unused comments cleanup
 - "_priv_" segment removed from function names
 - tested: v5.11-rc3 -> v5.11
 - number of other/minor fixes

 v2->v3:
 - PCI glue driver part split.
 - GNA probe fail path made fully implicit.
 - 'recovery_timeout' module parameter present under 'CONFIG_DEBUG_INTEL_GNA' flag only.
 - build for X86_32 enabled.
 - module initialization through 'module_pci_driver()'.
 - gna_priv->file_list cleanup.
 - 'gna_' prefix removed from source files' names.
 - power management handling added.
 - number of other/minor fixes
 - tests performed on kernel v5.12

 v3->v4:
 - GNA driver adapted to DRM framework (+userspace GNA library adapted to use the driver)
   - drm_managed (drmm) feature is used for objects lifetime management
   - GNA memory objects use ~drm_gem_shmem_object~ objects as a base
 - patches reorganized to meet symbols' usage with their declarations/definitions
 - 'recovery_timeout' module parameter removed
 - number of other/minor fixes from v3 review
 - tests performed on kernel v6.0

 v4->v5:
 - indentation fixed in drivers/gpu/drm/gna/Kconfig

Maciej Kwapulinski (4):
  gna: add PCI driver module
  gna: add GNA DRM device
  gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
  gna: add power management

Tomasz Jankowski (6):
  gna: read hardware info
  gna: initialize MMU
  gna: add GNA_GET_PARAMETER ioctl
  gna: add GNA_COMPUTE ioctl
  gna: add GNA_WAIT ioctl
  gna: add open and close operations on GNA device

 Documentation/gpu/drivers.rst     |   1 +
 Documentation/gpu/gna.rst         |  64 +++++
 MAINTAINERS                       |   7 +
 drivers/gpu/drm/Kconfig           |   2 +
 drivers/gpu/drm/Makefile          |   1 +
 drivers/gpu/drm/gna/Kbuild        |   5 +
 drivers/gpu/drm/gna/Kconfig       |  15 +
 drivers/gpu/drm/gna/gna_device.c  | 317 +++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h  | 114 ++++++++
 drivers/gpu/drm/gna/gna_gem.h     |  22 ++
 drivers/gpu/drm/gna/gna_hw.c      | 110 ++++++++
 drivers/gpu/drm/gna/gna_hw.h      | 107 ++++++++
 drivers/gpu/drm/gna/gna_ioctl.c   | 208 ++++++++++++++
 drivers/gpu/drm/gna/gna_mem.c     | 249 +++++++++++++++++
 drivers/gpu/drm/gna/gna_mem.h     |  58 ++++
 drivers/gpu/drm/gna/gna_pci.c     | 148 ++++++++++
 drivers/gpu/drm/gna/gna_pci.h     |  12 +
 drivers/gpu/drm/gna/gna_request.c | 441 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_request.h |  64 +++++
 drivers/gpu/drm/gna/gna_score.c   | 222 +++++++++++++++
 drivers/gpu/drm/gna/gna_score.h   |  11 +
 include/uapi/drm/gna_drm.h        | 169 ++++++++++++
 22 files changed, 2347 insertions(+)
 create mode 100644 Documentation/gpu/gna.rst
 create mode 100644 drivers/gpu/drm/gna/Kbuild
 create mode 100644 drivers/gpu/drm/gna/Kconfig
 create mode 100644 drivers/gpu/drm/gna/gna_device.c
 create mode 100644 drivers/gpu/drm/gna/gna_device.h
 create mode 100644 drivers/gpu/drm/gna/gna_gem.h
 create mode 100644 drivers/gpu/drm/gna/gna_hw.c
 create mode 100644 drivers/gpu/drm/gna/gna_hw.h
 create mode 100644 drivers/gpu/drm/gna/gna_ioctl.c
 create mode 100644 drivers/gpu/drm/gna/gna_mem.c
 create mode 100644 drivers/gpu/drm/gna/gna_mem.h
 create mode 100644 drivers/gpu/drm/gna/gna_pci.c
 create mode 100644 drivers/gpu/drm/gna/gna_pci.h
 create mode 100644 drivers/gpu/drm/gna/gna_request.c
 create mode 100644 drivers/gpu/drm/gna/gna_request.h
 create mode 100644 drivers/gpu/drm/gna/gna_score.c
 create mode 100644 drivers/gpu/drm/gna/gna_score.h
 create mode 100644 include/uapi/drm/gna_drm.h

-- 
2.25.1

