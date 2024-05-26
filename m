Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28A8CF5D4
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 21:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770D10F0A1;
	Sun, 26 May 2024 19:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ljUUPJo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7300210ED5A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 19:59:16 +0000 (UTC)
X-Envelope-To: maarten.lankhorst@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716753553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jxmqEj250Efur2ANihKilbqvxEioI+rBu1p7H01pzAk=;
 b=ljUUPJo5WMDcfBAd7LxoCQoBhDiI8LAgymmYrjMZri0/3IqB3x3kvXmKGBoaIDgAsNRdvQ
 0Wv1vkXMnrEw4EQ191dItUT1zsZAsWPIAw8in9xEed5nCcCdClP+AiiNYdjzu2azrWALp6
 OxYsqPSKVmHP8++sTaMsiHmrAFKC1Sg=
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: markus.elfring@web.de
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Elfring <Markus.Elfring@web.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 0/3] drm/loongson: Introduce component framework support
Date: Mon, 27 May 2024 03:58:23 +0800
Message-Id: <20240526195826.109008-1-sui.jingfeng@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce component framework to bind child and sibling devices, for better
modularity and offload the deferral probe issue to submodule if it need to
attach exterinal module someday. Also for better reflect the hardware
layout.

Hardware units that come with PCIe are all ready to drive, but there are
some board specific modules will return -EPROBE_DEFER to us. We need all
submodules ready to use before we can register the drm device to userspace.

The idea is to device the exterinal module dependent part and exterinal
module independent part. For example, the display controller and the
GPIO-I2C just belong to exterinal module independent part. While the
outputs are just belong to exterinal module dependent part.

We abstract the output ports as child devices, the output ports may
consists of encoder phy and level shifter. Well, the GPU are standalone
siblings relative to the DC. Those units are relatively separated
hardware units from display controller itself.

By design, the display controller PCI(e) is selected as master, gpio-i2c
go with master. Manually created virtual subdevice functional as agents
for the master, it could return the -EPROBE_DEFER back to the drvier core.
This allows the master don't have to tear down everything, thereore
majority setups work can be preserved. The potential cyclic dependency
problem can be solved then.

v1 -> v2:
	* Squash patch 0002 and patch 0003 into one
	* Fill type and improve commit message

Sui Jingfeng (3):
  drm/loongson: Add a helper for creating child devices
  drm/loongson: Introduce component framework support
  drm/loongson: Add dummy gpu driver as a subcomponent

 drivers/gpu/drm/loongson/Makefile             |   4 +
 drivers/gpu/drm/loongson/loong_gpu_pci_drv.c  |  90 ++++++++
 drivers/gpu/drm/loongson/loong_gpu_pci_drv.h  |  27 +++
 drivers/gpu/drm/loongson/loongson_device.c    |  42 ++++
 drivers/gpu/drm/loongson/loongson_module.c    |  26 ++-
 drivers/gpu/drm/loongson/loongson_module.h    |   8 +
 drivers/gpu/drm/loongson/lsdc_drv.c           | 217 +++++++++++-------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  45 +---
 drivers/gpu/drm/loongson/lsdc_i2c.c           |   5 +-
 drivers/gpu/drm/loongson/lsdc_i2c.h           |   3 -
 drivers/gpu/drm/loongson/lsdc_output.c        | 176 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  38 ++-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   3 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  17 +-
 14 files changed, 564 insertions(+), 137 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loong_gpu_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loong_gpu_pci_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

-- 
2.34.1

