Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF8743A2F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40ED10E43F;
	Fri, 30 Jun 2023 11:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AC810E43F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:02:52 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1688122970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cVG0vYo3/T6AYLTc+lVhTKp0CFi2Q+EH9QFPQ8sIsCY=;
 b=QJBgFt91Udo2cXx8LVpCoBtf7Y4/HJOpcgBM5f7wsHRC7s8fn0Gq0+gjEx8Kdqa8vLzzux
 ImcisPtx/765642G+b1B9DPM0cwQmRH7G6DfBumi4NU28u+y6k1b891sHZhyldmWbhiRGW
 1E3abKbe5vxdsoxrSChe7QJ6GbCbOoo=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v1 0/4] PCI/VGA: Improve the default VGA device selection
Date: Fri, 30 Jun 2023 19:02:39 +0800
Message-Id: <20230630110243.141671-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Currently, the default VGA device selection is not perfect. Potential
problems are:

1) This function is a no-op on non-x86 architectures.
2) It does not take the PCI Bar may get relocated into consideration.
3) It is not effective for the PCI device without a dedicated VRAM Bar.
4) It is device-agnostic, thus it has to waste the effort to iterate all
   of the PCI Bar to find the VRAM aperture.
5) It has invented lots of methods to determine which one is the default
   boot device on a multiple video card coexistence system. But this is
   still a policy because it doesn't give the user a choice to override.

With the observation that device drivers or video aperture helpers may
have better knowledge about which PCI bar contains the firmware FB,

This patch tries to solve the above problems by introducing a function
callback to the vga_client_register() function interface. DRM device
drivers for the PCI device need to register the is_boot_device() function
callback during the driver loading time. Once the driver binds the device
successfully, VRAARB will call back to the driver. This gives the device
drivers a chance to provide accurate boot device identification. Which in
turn unlock the abitration service to non-x86 architectures. A device
driver can also pass a NULL pointer to the keep the original behavior.

Sui Jingfeng (4):
  video/aperture: Add a helper to detect if an aperture contains
    firmware FB
  PCI/VGA: Improve the default VGA device selection
  drm/amdgpu: Implement the is_boot_device callback function
  drm/radeon: Implement the is_boot_device callback function

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 ++++++++-
 drivers/gpu/drm/drm_aperture.c             | 16 ++++++++++++
 drivers/gpu/drm/i915/display/intel_vga.c   |  3 +--
 drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c     | 12 ++++++++-
 drivers/pci/vgaarb.c                       | 21 +++++++++++++++-
 drivers/vfio/pci/vfio_pci_core.c           |  2 +-
 drivers/video/aperture.c                   | 29 ++++++++++++++++++++++
 include/drm/drm_aperture.h                 |  2 ++
 include/linux/aperture.h                   |  7 ++++++
 include/linux/vgaarb.h                     |  8 +++---
 11 files changed, 104 insertions(+), 10 deletions(-)

-- 
2.25.1

