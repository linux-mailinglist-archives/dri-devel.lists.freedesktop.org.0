Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB171A595B1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BCF10E454;
	Mon, 10 Mar 2025 13:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Hs6KCTK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138C210E451
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:11:04 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7nW1g015329;
 Mon, 10 Mar 2025 13:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=eVEunwoeTDsdAhdaNChHP7S
 AFdZNASrhuCkvqq03in8=; b=Hs6KCTK7egH4HQMh2QoiIoV/Tp9cm4d32sOcSO0
 dfUO3LfKW0+3FLsaM2lZTtbMYPHCBABFPAzo2/OVWq7STXjgoY8Vu+xpK+2Yc+2s
 iKFazfIBSnApcaPpDwbnnBSzHz5Raip4TZ1HwXWdCDhyMjOCyeyZP62AXPBAC0/p
 f+7yi7GaZZlXaeFUUHDhwfawESXqjOne6SSSz020OU7YkWktYOm3KnBttCztCkfZ
 7RWsRQbGtU8K4gY1I/f0iZ0gejHJLm7EpbmJesKaIftNurqcpS08gMBjdM57nI3z
 EvR3yOG+eHz2+PU8abgyVtZZJ7hK4Ry/nB5MPnWRuejUj6A==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 458d1wha4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Mar 2025 13:10:44 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:42 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v3 00/18] Imagination BXS-4-64 MC1 GPU support
Date: Mon, 10 Mar 2025 13:10:24 +0000
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDkzmcC/3XNvQ6DIBDA8VdpmHsNIBjt1PdoOuhxKIMfAUJsj
 O9etEs7mNzyv+R+t7JA3lFg98vKPCUX3DTmKK4Xhn0zdgTO5GaSSyW4FBAoBmiXAApKBXMTsYc
 kQCk0tkbUWluWj2dP1i0H/Hzl7l2Ik38ff5LYt19ScH1G5uGgyBScqlJXtXy4oYuEN5wGtptJ/
 jiiOnVkdgprlDa1bTnaP2fbtg/kxSKOBQEAAA==
X-Change-ID: 20241021-sets-bxs-4-64-patch-v1-44cdf9cc555f
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Alessio
 Belle" <alessio.belle@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>, Sarah Walker <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5405;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=SqV1IJTAkSWRFFjRTnZftoakZj1+AKPrc1tTCrwNB9Q=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3J+c/ib4pLjWpM1v5S8+KA46dF1vuPRb9PXzueac
 HnGVUbFtI5SFgYxDgZZMUWWHSssV6j9UdOSuPGrGGYOKxPIEAYuTgGYCJMfw/+w+88+XNNyeV0W
 f+WV7dsdt5nOBcocnW1iZ1ss6jcr/uAjRob1H/JSw+5JWrsnPLmcab1Cwr9izflQFRNNF5PiRr7
 /X5kB
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: VrFyge1iEh50KcVMlLEaUiCo0fw9WM9Z
X-Proofpoint-GUID: VrFyge1iEh50KcVMlLEaUiCo0fw9WM9Z
X-Authority-Analysis: v=2.4 cv=U8+SDfru c=1 sm=1 tr=0 ts=67cee4d4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=RIdblNn2LqOEELPeUbIA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=t8nPyN_e6usw4ciXM-Pk:22
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

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

A suitable firmware binary can currently be found in the IMG
linux-firmware repository[1] as powervr/rogue_36.53.104.796_v1.fw.

No new UAPI will be necessary for this platform as it is sufficiently
similar to the already supported AXE-1-16M.

UMD support is close to being complete. We're now able to pass >90% of
Vulkan conformance on our Mesa development branch. The compiler has been
undergoing a significant rework needed to accomodate the BXS-4-64, as
well as to make it more flexible to support additional Rogue GPUs going
forward. The first part of this rework landed in Mesa in [2], and more
MRs will follow in the coming weeks.

There are several dt-bindings changes at the beginning of this series.
We expect the result to be versatile enough to handle all Imagination
Rogue GPUs while being a strong foundation to build bindings for the
newer Volcanic architecture (for which we're currently developing
support).

The DTS changes at the end of the series are marked [DO NOT MERGE]. Once
the series is reviewed, we will request these be taken through the
relevant tree.

[1]: https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32258

---
Changes in v3:
- Reorder some patches to ensure the proper sequencing
- Update status of UMD support (cover)
- Don't use more specific compatible strings when not required (P1)
- Avoid ABI break by limiting new required properties to new compatible
  strings (P2)
- Move power domain changes to the patch in which they're used (P2/P5)
- Update register definitions (P3) [Thanks, Alessio!]
- Don't use more specific compatible strings when not required (P4)
- Enhanced commit messages (P4)
- Remove unnecessary example (P5)
- Add proper fixes for threaded IRQs (P6) [Thanks, Alessio!]
- Include fix for a separate IRQ issue (P7) [Thanks, Alessio!]
- Don't enable firmware debug module (was P13 in v2, also in P14)
- Change from a workaround to a regular codepath (P15)
- Drop platform overrides framework (was P18 in v2, also in P16)
- Mark DTS changes [DO NOT MERGE] (P17/P18)
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com

Changes in v2:
- Clarified justification for compatible strings (P1)
- Simplified clocks constraints (P2)
- Simplified power-domains constraints (P3/P4)
- Use normal reg syntax for 64-bit values (P8/P21)
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com

---
Alessio Belle (3):
      drm/imagination: Update register defs for newer GPUs
      drm/imagination: Mask GPU IRQs in threaded handler
      drm/imagination: Handle Rogue safety event IRQs

Matt Coster (14):
      dt-bindings: gpu: img: Future-proofing enhancements
      dt-bindings: gpu: img: Add BXS-4-64 devicetree bindings
      drm/imagination: Use new generic compatible string
      drm/imagination: Add power domain control
      drm/imagination: Remove firmware enable_reg
      drm/imagination: Rename event_mask -> status_mask
      drm/imagination: Make has_fixed_data_addr a value
      drm/imagination: Use a lookup table for fw defs
      drm/imagination: Use callbacks for fw irq handling
      drm/imagination: Move ELF fw utils to common file
      drm/imagination: Use cached memory with dma_coherent
      drm/imagination: Add support for TI AM68 GPU
      [DO NOT MERGE] arm64: dts: ti: k3-am62: New GPU binding details
      [DO NOT MERGE] arm64: dts: ti: k3-j721s2: Add GPU node

Sarah Walker (1):
      drm/imagination: Add RISC-V firmware processor support

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  77 +++++++++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   3 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  12 ++
 drivers/gpu/drm/imagination/Makefile               |   2 +
 drivers/gpu/drm/imagination/pvr_device.c           | 124 ++++++++++++++--
 drivers/gpu/drm/imagination/pvr_device.h           |  31 +++-
 drivers/gpu/drm/imagination/pvr_drv.c              |  16 ++
 drivers/gpu/drm/imagination/pvr_fw.c               |  28 +++-
 drivers/gpu/drm/imagination/pvr_fw.h               |  85 +++++------
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |  23 +--
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  82 ++---------
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         | 163 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  17 +++
 drivers/gpu/drm/imagination/pvr_fw_util.c          |  67 +++++++++
 drivers/gpu/drm/imagination/pvr_gem.c              |  10 +-
 drivers/gpu/drm/imagination/pvr_gem.h              |   6 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |   8 +-
 drivers/gpu/drm/imagination/pvr_power.c            | 114 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h            |   3 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 153 ++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |  41 ++++++
 21 files changed, 886 insertions(+), 179 deletions(-)
---
base-commit: 10232dac98d3803ec4fcc0cd8a4d1bd2a09b3e18
change-id: 20241021-sets-bxs-4-64-patch-v1-44cdf9cc555f

