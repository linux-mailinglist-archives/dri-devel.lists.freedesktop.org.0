Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04266061CF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12710E099;
	Thu, 20 Oct 2022 13:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C1010F202
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666273101; x=1697809101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nNa39/5lml3fae1V2WjoeWQNtiHsTMRGBjRzq9rF1cc=;
 b=h0xuOOxAjY4GKdi+dnCNRpMA4R3w3h0mnBD0slNGz9LxVlSFMht6o6Zg
 AvzKwdXyIVap725nbz9tEfc8L0naczE66J21vAhDBxTpIUqKK1s8w+rtW
 oLmivv0nUIphiDCev+dtX9qETFIrKGLW7+lPS5o4p1qRfEO8ZikBejcxa
 wZ0jNyxx6cUnSWCfEsIuNuuO31XQClYUqDEtpX28GO9z9U7yTPYuvmR7R
 qYlQEj4PHLf9U2Go9UCV7usJJLq3kUNUdIELJhPjnDLZmlkOjYC4ZKj+V
 W8yWxmU+zZkrjif6fGlMRjBn4FCatHjM19aIIp4X0B3ydz8QuiplHzm3M g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307805918"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="307805918"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:38:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064408"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="719064408"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:38:17 -0700
From: "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v4 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Date: Thu, 20 Oct 2022 15:35:15 +0200
Message-Id: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

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

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

