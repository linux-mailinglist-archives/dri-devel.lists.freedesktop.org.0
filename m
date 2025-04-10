Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7CA83F7E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF27A10E8B4;
	Thu, 10 Apr 2025 09:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LvWwte8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0955A10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:55:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A62MMB009620;
 Thu, 10 Apr 2025 10:55:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=fKyqre9o12bMreROiygGZcb
 PIQU5yqupHfEAXNIX6dA=; b=LvWwte8MutisLJUsBHZChBm+98dnvWEC22cn9rV
 eywcXLBcE4lVF7V5QTV3QxiJ+ZIjtU7RM6GtQzzgIwC3nrLomU9NmRPLend4P7sb
 V8cWLCSIFW6PowWr1dKN3WRxus18U4UEoXOip5XOz6Dc7tyPu8/gd842eoxc2hHK
 nInK0/dY2xaaWgpOmdcB+YNmtzb3D7HwejwP/QpmYd36Wu5XON5FD7+t21iqqbmw
 FwZQJvDk5JQ7+u7cWYHMaM4JhDapNKEEkkScnpOa8bRtbT+vM6keuRqDMFhAYAs7
 sUFmq55jiSI6asU9bya18ZCSnDkgq610Rb25/26QF4KS3Aw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbgdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Apr 2025 10:55:17 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:15 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v6 00/18] Imagination BXS-4-64 MC1 GPU support
Date: Thu, 10 Apr 2025 10:54:59 +0100
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSV92cC/3XNwWrDMAyA4VcpPs9DtmXP3mnvMXpIZLnxoU2JQ
 +goefe6HYOMYNDlF+jTXRSeMhfxebiLiZdc8nip4d4OgobucmKZY22hQaMCrWThucj+ViRKh/L
 azTTIRUlEiikQWWuTqMfXiVO+veDvY+0hl3mcfl5/FvXc/pIKbIusAxI5GmDvrA/6K59PM9M7j
 WfxNBe9cZRvOro6JkW0MaQeKO0c8+dYMAqajqmOQtOb2HMCvXdw4+i2g9WJwX9QQurQhJ1jt45
 rOrY6jISOvfbQ/XfWdX0Awl5unt0BAAA=
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sarah Walker
 <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7055;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=RTNf0An7VMxVgndS725rYxfxLRqYdqvYExJhfY2QCvo=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9rQn7DvrXfvQpbaptyJXz68+LpRSHRj9tQVW6Zl3
 9q45QmDckcpC4MYB4OsmCLLjhWWK9T+qGlJ3PhVDDOHlQlkCAMXpwBMJKWUkWHOktTAg/1vVnrY
 HNaOuGNXWS3789Cm8Oz4zc+0nl/iP/eXkWHFtIP/1crn5Kut+JMp85VvuUr/qiRN728tATNFlP3
 PVXMAAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: JQd1VyzDKwFkLJFb788VYR2UOgoGvMJk
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f79585 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=nqLAmxgFuAfZ1xXCSiEA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: JQd1VyzDKwFkLJFb788VYR2UOgoGvMJk
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

UMD support is close to being complete. We're now able to pass >99% of
Vulkan conformance on our Mesa development branch. The compiler has been
undergoing a significant rework needed to accomodate the BXS-4-64, as
well as to make it more flexible to support additional Rogue GPUs going
forward. The first part of this rework landed in Mesa in [2], and the
next chunk is currently in review in [3].

There are several dt-bindings changes at the beginning of this series.
We expect the result to be versatile enough to handle all Imagination
Rogue GPUs while being a strong foundation to build bindings for the
newer Volcanic architecture (for which we're currently developing
support).

The DTS changes at the end of the series are marked [DO NOT MERGE]. Once
the series is reviewed, we will request these be taken through the
relevant tree.

This version of the series depends on the following patches which exist
in drm-misc-fixes but have not yet made it back to drm-misc-next (the
target of this series):

- 5d84783d621e ("drm/imagination: take paired job reference") [4]
- b05e8911cb7c ("drm/imagination: fix firmware memory leaks") [5]

[1]: https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32258
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33998
[4]: https://lore.kernel.org/r/20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com
[5]: https://lore.kernel.org/r/20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com

---
Changes in v6:
- Add Krzysztof's Rb to dt-bindings changes (P1/P2)
- Add Frank's Rb to drm/imagination changes (P3-P16)
- Move loop variable (P13)
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com

Changes in v5:
- Remove extraneous (and error-causing) power-domains minItems
  constraint (P1)
- Replace anyOf/const with enum (P2)
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com

Changes in v4:
- Update status of UMD support (cover)
- Fix backwards compatibility of new compatible strings (P1)
- Fix power-domains property constraints (P1/P2)
- Fix power-domain-names property constraints (P2)
- Only invoke pvr_device_safety_irq_clear() if has_safety_events is set
  (P7)
- Use pvr_vm_unmap_obj() in pvr_riscv_vm_unmap() (P14)
- Fix formatting of pvr_riscv_fw_process() signature (P14)
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com

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

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  81 +++++++++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   4 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  12 ++
 drivers/gpu/drm/imagination/Makefile               |   2 +
 drivers/gpu/drm/imagination/pvr_device.c           | 126 ++++++++++++++--
 drivers/gpu/drm/imagination/pvr_device.h           |  31 +++-
 drivers/gpu/drm/imagination/pvr_drv.c              |  16 ++
 drivers/gpu/drm/imagination/pvr_fw.c               |  28 +++-
 drivers/gpu/drm/imagination/pvr_fw.h               |  85 +++++------
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |  23 +--
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  81 ++--------
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         | 165 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  17 +++
 drivers/gpu/drm/imagination/pvr_fw_util.c          |  66 +++++++++
 drivers/gpu/drm/imagination/pvr_gem.c              |  10 +-
 drivers/gpu/drm/imagination/pvr_gem.h              |   6 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |   8 +-
 drivers/gpu/drm/imagination/pvr_power.c            | 114 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h            |   3 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 153 ++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |  41 +++++
 21 files changed, 895 insertions(+), 177 deletions(-)
---
base-commit: 07484031a8cdc0da8edd07d00528d9ccb5543e4b
change-id: 20241021-sets-bxs-4-64-patch-v1-44cdf9cc555f

