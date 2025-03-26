Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD7A71C2E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728010E156;
	Wed, 26 Mar 2025 16:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MalDFA0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951610E167
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:48:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBt2SY012691;
 Wed, 26 Mar 2025 16:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=mWYf65wum9YG05RQy2xoKrp
 1dLK3sDGYBOQTnyQI+ao=; b=MalDFA0Pn84XGf3SHD3RvTiCaDDB0Wqsl+03zQM
 pqxLezJqlwzsn9URFxqnkP1C5H0eJe1BsCiLfIt2tPc3cT2SWNgo9UYziWROb5bb
 pm929iO7UbYRXmxc1BztY3q68RSjuuXG7YjagZYoDFk4JANOkKmLiaAcAMTwLgpP
 7LMSHQKavEhv7UT+y11hw5Y7OC3sMWwg1g17oQqMTzXlouTi+qilPeLxuGAEIGeb
 GSOU1XfIGVVkKnGwxqKa/HkEzUE/S3PZFeHWd0fhrxNy61fkp72GOHz36zsUIG9v
 LisStg+yOfTwGLbGnczoHacKGX6XO0dCAnEetEJJJZAPKog==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45kbmy9d6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Mar 2025 16:48:40 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 16:48:38 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v5 00/18] Imagination BXS-4-64 MC1 GPU support
Date: Wed, 26 Mar 2025 16:48:20 +0000
Message-ID: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQv5GcC/3XNwQrCMAyA4VeRno2kbaqrJ99DPGxp6nrQyTqGI
 nt3qyIoMsjlD+TLXWXpk2S1XdxVL2PKqTuXcMuF4rY+HwVSKK0MGtJoNGQZMjTXDARrgks9cAu
 jBiIO0TM756Iqx5deYrq+4P2hdJvy0PW3159RP7dvUqObI8sgkASLUq1d5c0unY6D8Iq7k3qao
 /lydDXrmOLYGMgFHxvk+OfYj+PQapx1bHE02caGRiKaf4e+HDPvUHGCrzYciWuy/seZpukB47y
 mpJUBAAA=
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
 "Sarah Walker" <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6640;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=JmDfH/GRvZwV6wsN8zaHDB+4XiPsyvfLR4mRZSAWymU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaQ/0X+sIOs+M6M61zRo2tsbcw5MaWGYHsgQYWhVFV+Sc
 EC37YxCRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEzk7mxGhgmzr887FyiYGrNV
 Z+/a7/MS91Wdtzvf/0/mZoPpVQ9u58kM//OdDkzf8OpS9mHfxSoLxI+VuPsYsnh450S9eZ6dq9P
 czAcA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: AnZ-Mtphwlzz-ka5uzAZ28sE7qOw0Jf9
X-Authority-Analysis: v=2.4 cv=L+sdQ/T8 c=1 sm=1 tr=0 ts=67e42fe8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=4ypaFGEvw_zvJEgvs6UA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: AnZ-Mtphwlzz-ka5uzAZ28sE7qOw0Jf9
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

UMD support is close to being complete. We're now able to pass >95% of
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

This version of the series depends on a patch[4] which exists in
drm-misc-fixes, but has not yet made it back to drm-misc-next (the
target of this series). That patch adds the function pvr_vm_unmap_obj()
which is used in patch 14 ("drm/imagination: Add RISC-V firmware
processor support").

[1]: https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32258
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33998
[4]: https://lore.kernel.org/r/20250226-hold-drm_gem_gpuva-lock-for-unmap-v2-1-3fdacded227f@imgtec.com

---
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
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  82 ++--------
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         | 165 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  17 +++
 drivers/gpu/drm/imagination/pvr_fw_util.c          |  67 +++++++++
 drivers/gpu/drm/imagination/pvr_gem.c              |  10 +-
 drivers/gpu/drm/imagination/pvr_gem.h              |   6 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |   8 +-
 drivers/gpu/drm/imagination/pvr_power.c            | 114 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h            |   3 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 153 ++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |  41 +++++
 21 files changed, 896 insertions(+), 178 deletions(-)
---
base-commit: 95f9bc4e0bc812541a7007a29e0de0c5d2a98e12
change-id: 20241021-sets-bxs-4-64-patch-v1-44cdf9cc555f

