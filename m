Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E599D6575BE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 12:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE13710E393;
	Wed, 28 Dec 2022 11:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C74010E119
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 21:32:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 975DEB80D8B;
 Mon, 26 Dec 2022 21:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470C7C433EF;
 Mon, 26 Dec 2022 21:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672090354;
 bh=gAxrqAn735on38Yuf0hNMSWzZgYtPwUZ9SLcMdws/hE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r4pZO9qlWIbvvSqzW57LHqz825sUsWLNQYLpotzw3Rn8RYNLu0eUNGEKFelU34sBz
 /cCyG0SBE6U9whpsnvqEk1vWoKTbiCFk5y9yJeYZfQ2kebtIAwrghGwjlmCF5/365y
 6P59TEbTyF5CCAE8yUBc62qlZOuEhc0qXfpNNoN5rH4bnVWnxA1EWag/cdF1p7HrQK
 Qt2059I3Z56tMkIYhtCpb0uWIJJ9/s7zGS4b79w6Eyd7rJkA319jz01xbcyKTJICMR
 JFzXwZvUT+7r+j+zmE1ZVFwgj9rU2KERbYFToJQ2JvsH1QAl5rkVlcZTjD5ApFQ7uo
 PvFzcIhjTyVjA==
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 2/2] habanalabs: move driver to accel subsystem
Date: Mon, 26 Dec 2022 23:32:27 +0200
Message-Id: <20221226213227.26953-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221226213227.26953-1-ogabbay@kernel.org>
References: <20221226213227.26953-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Dec 2022 11:16:34 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a subsystem for compute accelerators, move the
habanalabs driver to it.

This patch only moves the files and fixes the Makefiles. Future
patches will change the existing code to register to the accel
subsystem and expose the accel device char files instead of the
habanalabs device char files.

Update the MAINTAINERS file to reflect this change.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 MAINTAINERS                                                 | 4 +++-
 drivers/Makefile                                            | 1 +
 drivers/accel/Kconfig                                       | 2 ++
 drivers/accel/Makefile                                      | 3 +++
 drivers/{misc => accel}/habanalabs/Kconfig                  | 6 ++++--
 drivers/{misc => accel}/habanalabs/Makefile                 | 2 +-
 drivers/{misc => accel}/habanalabs/common/Makefile          | 0
 drivers/{misc => accel}/habanalabs/common/asid.c            | 0
 drivers/{misc => accel}/habanalabs/common/command_buffer.c  | 0
 .../{misc => accel}/habanalabs/common/command_submission.c  | 0
 drivers/{misc => accel}/habanalabs/common/context.c         | 0
 drivers/{misc => accel}/habanalabs/common/debugfs.c         | 0
 drivers/{misc => accel}/habanalabs/common/decoder.c         | 0
 drivers/{misc => accel}/habanalabs/common/device.c          | 0
 drivers/{misc => accel}/habanalabs/common/firmware_if.c     | 0
 drivers/{misc => accel}/habanalabs/common/habanalabs.h      | 0
 drivers/{misc => accel}/habanalabs/common/habanalabs_drv.c  | 0
 .../{misc => accel}/habanalabs/common/habanalabs_ioctl.c    | 0
 drivers/{misc => accel}/habanalabs/common/hw_queue.c        | 0
 drivers/{misc => accel}/habanalabs/common/hwmon.c           | 0
 drivers/{misc => accel}/habanalabs/common/irq.c             | 0
 drivers/{misc => accel}/habanalabs/common/memory.c          | 0
 drivers/{misc => accel}/habanalabs/common/memory_mgr.c      | 0
 drivers/{misc => accel}/habanalabs/common/mmu/Makefile      | 0
 drivers/{misc => accel}/habanalabs/common/mmu/mmu.c         | 0
 drivers/{misc => accel}/habanalabs/common/mmu/mmu_v1.c      | 0
 drivers/{misc => accel}/habanalabs/common/mmu/mmu_v2_hr.c   | 0
 drivers/{misc => accel}/habanalabs/common/pci/Makefile      | 0
 drivers/{misc => accel}/habanalabs/common/pci/pci.c         | 0
 drivers/{misc => accel}/habanalabs/common/security.c        | 0
 drivers/{misc => accel}/habanalabs/common/state_dump.c      | 0
 drivers/{misc => accel}/habanalabs/common/sysfs.c           | 0
 drivers/{misc => accel}/habanalabs/gaudi/Makefile           | 0
 drivers/{misc => accel}/habanalabs/gaudi/gaudi.c            | 0
 drivers/{misc => accel}/habanalabs/gaudi/gaudiP.h           | 0
 drivers/{misc => accel}/habanalabs/gaudi/gaudi_coresight.c  | 0
 drivers/{misc => accel}/habanalabs/gaudi/gaudi_security.c   | 0
 drivers/{misc => accel}/habanalabs/gaudi2/Makefile          | 0
 drivers/{misc => accel}/habanalabs/gaudi2/gaudi2.c          | 0
 drivers/{misc => accel}/habanalabs/gaudi2/gaudi2P.h         | 0
 .../{misc => accel}/habanalabs/gaudi2/gaudi2_coresight.c    | 0
 .../habanalabs/gaudi2/gaudi2_coresight_regs.h               | 0
 drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_masks.h    | 0
 drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_security.c | 0
 drivers/{misc => accel}/habanalabs/goya/Makefile            | 0
 drivers/{misc => accel}/habanalabs/goya/goya.c              | 0
 drivers/{misc => accel}/habanalabs/goya/goyaP.h             | 0
 drivers/{misc => accel}/habanalabs/goya/goya_coresight.c    | 0
 drivers/{misc => accel}/habanalabs/goya/goya_hwmgr.c        | 0
 drivers/{misc => accel}/habanalabs/goya/goya_security.c     | 0
 .../{misc => accel}/habanalabs/include/common/cpucp_if.h    | 0
 .../{misc => accel}/habanalabs/include/common/hl_boot_if.h  | 0
 drivers/{misc => accel}/habanalabs/include/common/qman_if.h | 0
 .../habanalabs/include/gaudi/asic_reg/cpu_if_regs.h         | 0
 .../habanalabs/include/gaudi/asic_reg/dma0_core_masks.h     | 0
 .../habanalabs/include/gaudi/asic_reg/dma0_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h       | 0
 .../habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma1_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma2_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma3_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma4_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma5_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma6_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/dma7_core_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h        | 0
 .../include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h       | 0
 .../include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h     | 0
 .../include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h       | 0
 .../include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h     | 0
 .../include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h       | 0
 .../include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h     | 0
 .../include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h       | 0
 .../include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h     | 0
 .../habanalabs/include/gaudi/asic_reg/gaudi_blocks.h        | 0
 .../habanalabs/include/gaudi/asic_reg/gaudi_regs.h          | 0
 .../habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h       | 0
 .../habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h      | 0
 .../habanalabs/include/gaudi/asic_reg/mmu_up_regs.h         | 0
 .../habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h      | 0
 .../habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h   | 0
 .../habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h       | 0
 .../include/gaudi/asic_reg/psoc_global_conf_masks.h         | 0
 .../include/gaudi/asic_reg/psoc_global_conf_regs.h          | 0
 .../habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h | 0
 .../habanalabs/include/gaudi/asic_reg/stlb_regs.h           | 0
 .../habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h      | 0
 .../habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h        | 0
 .../habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h       | 0
 .../habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h        | 0
 drivers/{misc => accel}/habanalabs/include/gaudi/gaudi.h    | 0
 .../habanalabs/include/gaudi/gaudi_async_events.h           | 0
 .../habanalabs/include/gaudi/gaudi_async_ids_map_extended.h | 0
 .../habanalabs/include/gaudi/gaudi_coresight.h              | 0
 .../{misc => accel}/habanalabs/include/gaudi/gaudi_fw_if.h  | 0
 .../{misc => accel}/habanalabs/include/gaudi/gaudi_masks.h  | 0
 .../habanalabs/include/gaudi/gaudi_packets.h                | 0
 .../habanalabs/include/gaudi/gaudi_reg_map.h                | 0
 .../include/gaudi2/arc/gaudi2_arc_common_packets.h          | 0
 .../include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h    | 0
 .../include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h       | 0
 .../include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h        | 0
 .../gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h     | 0
 .../include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h    | 0
 .../gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h        | 0
 .../include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h | 0
 .../include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h       | 0
 .../include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h        | 0
 .../include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h   | 0
 .../include/gaudi2/asic_reg/arc_farm_kdma_masks.h           | 0
 .../habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h | 0
 .../habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h        | 0
 .../include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h         | 0
 .../include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h          | 0
 .../gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h     | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h    | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_core_masks.h       | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_core_regs.h        | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h  | 0
 .../asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h       | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h      | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h         | 0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h          | 0
 .../gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h     | 0
 .../asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h       | 0
 .../include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h        | 0
 .../include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h         | 0
 .../include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h       | 0
 .../include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h        | 0
 .../include/gaudi2/asic_reg/dcore0_mme_acc_regs.h           | 0
 .../dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h         | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h | 0
 .../dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h         | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h  | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h   | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h  | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h   | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h  | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h   | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h  | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h   | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h  | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h   | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h       | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h  | 0
 .../dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h         | 0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h | 0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h | 0
 .../asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h     | 0
 .../include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h      | 0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h    | 0
 .../include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h       | 0
 .../gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h        | 0
 .../include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h    | 0
 .../gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h | 0
 .../gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h        | 0
 .../gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h  | 0
 .../gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h     | 0
 .../include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h        | 0
 .../habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h | 0
 .../include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h        | 0
 .../gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h  | 0
 .../gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h    | 0
 .../include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h         | 0
 .../gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h  | 0
 .../gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h  | 0
 .../gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h  | 0
 .../gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h  | 0
 .../include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h   | 0
 .../include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h    | 0
 .../gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h | 0
 .../gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h  | 0
 .../include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h   | 0
 .../include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h    | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h   | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h   | 0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h  | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h         | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h       | 0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h   | 0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h      | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h          | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h  | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h      | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h   | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h     | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h      | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h   | 0
 .../gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h       | 0
 .../include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h           | 0
 .../asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h       | 0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h         | 0
 .../asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h  | 0
 .../asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h  | 0
 .../asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h  | 0
 .../include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h  | 0
 .../include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h   | 0
 .../gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h        | 0
 .../include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h       | 0
 .../include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h       | 0
 .../include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h    | 0
 .../habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h        | 0
 .../habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h  | 0
 .../habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h      | 0
 .../include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h         | 0
 .../habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h     | 0
 .../asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h       | 0
 .../gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h   | 0
 .../habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h      | 0
 .../habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h      | 0
 .../include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h           | 0
 .../habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h | 0
 .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h  | 0
 .../asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h  | 0
 .../asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h    | 0
 .../asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h    | 0
 .../asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h    | 0
 .../include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h    | 0
 .../include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h     | 0
 .../include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h  | 0
 .../habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h     | 0
 .../include/gaudi2/asic_reg/pcie_wrap_special_regs.h        | 0
 .../include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h    | 0
 .../include/gaudi2/asic_reg/pdma0_core_ctx_regs.h           | 0
 .../habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h   | 0
 .../habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h    | 0
 .../include/gaudi2/asic_reg/pdma0_core_special_masks.h      | 0
 .../include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h         | 0
 .../gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h       | 0
 .../include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h  | 0
 .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h  | 0
 .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h     | 0
 .../habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h      | 0
 .../include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h    | 0
 .../gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h       | 0
 .../include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h           | 0
 .../habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h | 0
 .../habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h      | 0
 .../habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h     | 0
 .../habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h      | 0
 .../include/gaudi2/asic_reg/psoc_global_conf_masks.h        | 0
 .../include/gaudi2/asic_reg/psoc_global_conf_regs.h         | 0
 .../include/gaudi2/asic_reg/psoc_reset_conf_masks.h         | 0
 .../include/gaudi2/asic_reg/psoc_reset_conf_regs.h          | 0
 .../include/gaudi2/asic_reg/psoc_timestamp_regs.h           | 0
 .../habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h     | 0
 .../habanalabs/include/gaudi2/asic_reg/rot0_masks.h         | 0
 .../include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h          | 0
 .../gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h        | 0
 .../habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h   | 0
 .../habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h       | 0
 .../habanalabs/include/gaudi2/asic_reg/rot0_regs.h          | 0
 .../habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h   | 0
 .../habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h    | 0
 drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2.h  | 0
 .../habanalabs/include/gaudi2/gaudi2_async_events.h         | 0
 .../include/gaudi2/gaudi2_async_ids_map_extended.h          | 0
 .../habanalabs/include/gaudi2/gaudi2_coresight.h            | 0
 .../habanalabs/include/gaudi2/gaudi2_fw_if.h                | 0
 .../habanalabs/include/gaudi2/gaudi2_packets.h              | 0
 .../habanalabs/include/gaudi2/gaudi2_reg_map.h              | 0
 .../habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h   | 0
 .../habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h    | 0
 .../habanalabs/include/goya/asic_reg/cpu_if_regs.h          | 0
 .../habanalabs/include/goya/asic_reg/cpu_pll_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_0_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_0_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_1_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_2_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_3_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_ch_4_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_macro_masks.h      | 0
 .../habanalabs/include/goya/asic_reg/dma_macro_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/dma_nrtr_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/dma_nrtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_0_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_0_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_1_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_2_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_3_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/dma_qm_4_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/goya_blocks.h          | 0
 .../habanalabs/include/goya/asic_reg/goya_masks.h           | 0
 .../habanalabs/include/goya/asic_reg/goya_regs.h            | 0
 .../habanalabs/include/goya/asic_reg/ic_pll_regs.h          | 0
 .../habanalabs/include/goya/asic_reg/mc_pll_regs.h          | 0
 .../habanalabs/include/goya/asic_reg/mme1_rtr_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/mme1_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme2_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme3_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme4_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme5_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme6_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme_cmdq_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/mme_cmdq_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/mme_masks.h            | 0
 .../habanalabs/include/goya/asic_reg/mme_qm_masks.h         | 0
 .../habanalabs/include/goya/asic_reg/mme_qm_regs.h          | 0
 .../habanalabs/include/goya/asic_reg/mme_regs.h             | 0
 .../habanalabs/include/goya/asic_reg/mmu_masks.h            | 0
 .../habanalabs/include/goya/asic_reg/mmu_regs.h             | 0
 .../habanalabs/include/goya/asic_reg/pci_nrtr_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/pci_nrtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/pcie_aux_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/pcie_wrap_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h   | 0
 .../habanalabs/include/goya/asic_reg/psoc_etr_regs.h        | 0
 .../include/goya/asic_reg/psoc_global_conf_masks.h          | 0
 .../include/goya/asic_reg/psoc_global_conf_regs.h           | 0
 .../habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h    | 0
 .../habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h    | 0
 .../habanalabs/include/goya/asic_reg/psoc_spi_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h  | 0
 .../habanalabs/include/goya/asic_reg/stlb_masks.h           | 0
 .../habanalabs/include/goya/asic_reg/stlb_regs.h            | 0
 .../habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h      | 0
 .../habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h   | 0
 .../habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h    | 0
 .../habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h      | 0
 .../habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc0_qm_masks.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc0_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc1_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc2_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc3_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc4_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc5_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc6_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h        | 0
 .../habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h       | 0
 .../habanalabs/include/goya/asic_reg/tpc7_qm_regs.h         | 0
 .../habanalabs/include/goya/asic_reg/tpc_pll_regs.h         | 0
 drivers/{misc => accel}/habanalabs/include/goya/goya.h      | 0
 .../habanalabs/include/goya/goya_async_events.h             | 0
 .../habanalabs/include/goya/goya_coresight.h                | 0
 .../{misc => accel}/habanalabs/include/goya/goya_fw_if.h    | 0
 .../{misc => accel}/habanalabs/include/goya/goya_packets.h  | 0
 .../{misc => accel}/habanalabs/include/goya/goya_reg_map.h  | 0
 .../habanalabs/include/hw_ip/mmu/mmu_general.h              | 0
 .../{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_0.h | 0
 .../{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_1.h | 0
 .../{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v2_0.h | 0
 .../habanalabs/include/hw_ip/pci/pci_general.h              | 0
 drivers/misc/Kconfig                                        | 1 -
 drivers/misc/Makefile                                       | 1 -
 430 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 drivers/accel/Makefile
 rename drivers/{misc => accel}/habanalabs/Kconfig (86%)
 rename drivers/{misc => accel}/habanalabs/Makefile (88%)
 rename drivers/{misc => accel}/habanalabs/common/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/asid.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/command_buffer.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/command_submission.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/context.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/debugfs.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/decoder.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/device.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/firmware_if.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs.h (100%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs_drv.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs_ioctl.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/hw_queue.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/hwmon.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/irq.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/memory.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/memory_mgr.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu_v1.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu_v2_hr.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/pci/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/pci/pci.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/security.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/state_dump.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/sysfs.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudiP.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi_coresight.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi_security.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2P.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_security.c (100%)
 rename drivers/{misc => accel}/habanalabs/goya/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya.c (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goyaP.h (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_coresight.c (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_hwmgr.c (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_security.c (100%)
 rename drivers/{misc => accel}/habanalabs/include/common/cpucp_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/common/hl_boot_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/common/qman_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/gaudi_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_async_events.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_fw_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_reg_map.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_async_events.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_fw_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_reg_map.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_macro_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_macro_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_blocks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/ic_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mmu_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_spi_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/stlb_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_async_events.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_fw_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_reg_map.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_general.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_0.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_1.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v2_0.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/pci/pci_general.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce47d05693d9..0fb59aa03856 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9043,11 +9043,13 @@ F:	block/partitions/efi.*
 
 HABANALABS PCI DRIVER
 M:	Oded Gabbay <ogabbay@kernel.org>
+L:	dri-devel@lists.freedesktop.org
 S:	Supported
+C:	irc://irc.oftc.net/dri-devel
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
 F:	Documentation/ABI/testing/debugfs-driver-habanalabs
 F:	Documentation/ABI/testing/sysfs-driver-habanalabs
-F:	drivers/misc/habanalabs/
+F:	drivers/accel/habanalabs/
 F:	include/trace/events/habanalabs.h
 F:	include/uapi/drm/habanalabs_accel.h
 
diff --git a/drivers/Makefile b/drivers/Makefile
index bdf1c66141c9..9ea6eb3b5d7b 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -189,3 +189,4 @@ obj-$(CONFIG_COUNTER)		+= counter/
 obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_PECI)		+= peci/
 obj-$(CONFIG_HTE)		+= hte/
+obj-$(CONFIG_DRM_ACCEL)		+= accel/
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index c9ce849b2984..a5989b55178a 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -22,3 +22,5 @@ menuconfig DRM_ACCEL
 	  major number than GPUs, and will be exposed to user-space using
 	  different device files, called accel/accel* (in /dev, sysfs
 	  and debugfs).
+
+source "drivers/accel/habanalabs/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
new file mode 100644
index 000000000000..4df38885d6c6
--- /dev/null
+++ b/drivers/accel/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-y  += habanalabs/
\ No newline at end of file
diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/accel/habanalabs/Kconfig
similarity index 86%
rename from drivers/misc/habanalabs/Kconfig
rename to drivers/accel/habanalabs/Kconfig
index 585235531b9b..be85336107f9 100644
--- a/drivers/misc/habanalabs/Kconfig
+++ b/drivers/accel/habanalabs/Kconfig
@@ -3,8 +3,10 @@
 # HabanaLabs AI accelerators driver
 #
 
-config HABANA_AI
-	tristate "HabanaAI accelerators (habanalabs)"
+config DRM_ACCEL_HABANALABS
+	tristate "HabanaLabs AI accelerators"
+	depends on DRM_ACCEL
+	depends on X86_64
 	depends on PCI && HAS_IOMEM
 	select GENERIC_ALLOCATOR
 	select HWMON
diff --git a/drivers/misc/habanalabs/Makefile b/drivers/accel/habanalabs/Makefile
similarity index 88%
rename from drivers/misc/habanalabs/Makefile
rename to drivers/accel/habanalabs/Makefile
index a48a9e0969ed..98510cdd5066 100644
--- a/drivers/misc/habanalabs/Makefile
+++ b/drivers/accel/habanalabs/Makefile
@@ -3,7 +3,7 @@
 # Makefile for HabanaLabs AI accelerators driver
 #
 
-obj-$(CONFIG_HABANA_AI) := habanalabs.o
+obj-$(CONFIG_DRM_ACCEL_HABANALABS) := habanalabs.o
 
 include $(src)/common/Makefile
 habanalabs-y += $(HL_COMMON_FILES)
diff --git a/drivers/misc/habanalabs/common/Makefile b/drivers/accel/habanalabs/common/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/common/Makefile
rename to drivers/accel/habanalabs/common/Makefile
diff --git a/drivers/misc/habanalabs/common/asid.c b/drivers/accel/habanalabs/common/asid.c
similarity index 100%
rename from drivers/misc/habanalabs/common/asid.c
rename to drivers/accel/habanalabs/common/asid.c
diff --git a/drivers/misc/habanalabs/common/command_buffer.c b/drivers/accel/habanalabs/common/command_buffer.c
similarity index 100%
rename from drivers/misc/habanalabs/common/command_buffer.c
rename to drivers/accel/habanalabs/common/command_buffer.c
diff --git a/drivers/misc/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
similarity index 100%
rename from drivers/misc/habanalabs/common/command_submission.c
rename to drivers/accel/habanalabs/common/command_submission.c
diff --git a/drivers/misc/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
similarity index 100%
rename from drivers/misc/habanalabs/common/context.c
rename to drivers/accel/habanalabs/common/context.c
diff --git a/drivers/misc/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
similarity index 100%
rename from drivers/misc/habanalabs/common/debugfs.c
rename to drivers/accel/habanalabs/common/debugfs.c
diff --git a/drivers/misc/habanalabs/common/decoder.c b/drivers/accel/habanalabs/common/decoder.c
similarity index 100%
rename from drivers/misc/habanalabs/common/decoder.c
rename to drivers/accel/habanalabs/common/decoder.c
diff --git a/drivers/misc/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
similarity index 100%
rename from drivers/misc/habanalabs/common/device.c
rename to drivers/accel/habanalabs/common/device.c
diff --git a/drivers/misc/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
similarity index 100%
rename from drivers/misc/habanalabs/common/firmware_if.c
rename to drivers/accel/habanalabs/common/firmware_if.c
diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
similarity index 100%
rename from drivers/misc/habanalabs/common/habanalabs.h
rename to drivers/accel/habanalabs/common/habanalabs.h
diff --git a/drivers/misc/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
similarity index 100%
rename from drivers/misc/habanalabs/common/habanalabs_drv.c
rename to drivers/accel/habanalabs/common/habanalabs_drv.c
diff --git a/drivers/misc/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
similarity index 100%
rename from drivers/misc/habanalabs/common/habanalabs_ioctl.c
rename to drivers/accel/habanalabs/common/habanalabs_ioctl.c
diff --git a/drivers/misc/habanalabs/common/hw_queue.c b/drivers/accel/habanalabs/common/hw_queue.c
similarity index 100%
rename from drivers/misc/habanalabs/common/hw_queue.c
rename to drivers/accel/habanalabs/common/hw_queue.c
diff --git a/drivers/misc/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
similarity index 100%
rename from drivers/misc/habanalabs/common/hwmon.c
rename to drivers/accel/habanalabs/common/hwmon.c
diff --git a/drivers/misc/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
similarity index 100%
rename from drivers/misc/habanalabs/common/irq.c
rename to drivers/accel/habanalabs/common/irq.c
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
similarity index 100%
rename from drivers/misc/habanalabs/common/memory.c
rename to drivers/accel/habanalabs/common/memory.c
diff --git a/drivers/misc/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
similarity index 100%
rename from drivers/misc/habanalabs/common/memory_mgr.c
rename to drivers/accel/habanalabs/common/memory_mgr.c
diff --git a/drivers/misc/habanalabs/common/mmu/Makefile b/drivers/accel/habanalabs/common/mmu/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/common/mmu/Makefile
rename to drivers/accel/habanalabs/common/mmu/Makefile
diff --git a/drivers/misc/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
similarity index 100%
rename from drivers/misc/habanalabs/common/mmu/mmu.c
rename to drivers/accel/habanalabs/common/mmu/mmu.c
diff --git a/drivers/misc/habanalabs/common/mmu/mmu_v1.c b/drivers/accel/habanalabs/common/mmu/mmu_v1.c
similarity index 100%
rename from drivers/misc/habanalabs/common/mmu/mmu_v1.c
rename to drivers/accel/habanalabs/common/mmu/mmu_v1.c
diff --git a/drivers/misc/habanalabs/common/mmu/mmu_v2_hr.c b/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
similarity index 100%
rename from drivers/misc/habanalabs/common/mmu/mmu_v2_hr.c
rename to drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
diff --git a/drivers/misc/habanalabs/common/pci/Makefile b/drivers/accel/habanalabs/common/pci/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/common/pci/Makefile
rename to drivers/accel/habanalabs/common/pci/Makefile
diff --git a/drivers/misc/habanalabs/common/pci/pci.c b/drivers/accel/habanalabs/common/pci/pci.c
similarity index 100%
rename from drivers/misc/habanalabs/common/pci/pci.c
rename to drivers/accel/habanalabs/common/pci/pci.c
diff --git a/drivers/misc/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
similarity index 100%
rename from drivers/misc/habanalabs/common/security.c
rename to drivers/accel/habanalabs/common/security.c
diff --git a/drivers/misc/habanalabs/common/state_dump.c b/drivers/accel/habanalabs/common/state_dump.c
similarity index 100%
rename from drivers/misc/habanalabs/common/state_dump.c
rename to drivers/accel/habanalabs/common/state_dump.c
diff --git a/drivers/misc/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
similarity index 100%
rename from drivers/misc/habanalabs/common/sysfs.c
rename to drivers/accel/habanalabs/common/sysfs.c
diff --git a/drivers/misc/habanalabs/gaudi/Makefile b/drivers/accel/habanalabs/gaudi/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/gaudi/Makefile
rename to drivers/accel/habanalabs/gaudi/Makefile
diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi/gaudi.c
rename to drivers/accel/habanalabs/gaudi/gaudi.c
diff --git a/drivers/misc/habanalabs/gaudi/gaudiP.h b/drivers/accel/habanalabs/gaudi/gaudiP.h
similarity index 100%
rename from drivers/misc/habanalabs/gaudi/gaudiP.h
rename to drivers/accel/habanalabs/gaudi/gaudiP.h
diff --git a/drivers/misc/habanalabs/gaudi/gaudi_coresight.c b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi/gaudi_coresight.c
rename to drivers/accel/habanalabs/gaudi/gaudi_coresight.c
diff --git a/drivers/misc/habanalabs/gaudi/gaudi_security.c b/drivers/accel/habanalabs/gaudi/gaudi_security.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi/gaudi_security.c
rename to drivers/accel/habanalabs/gaudi/gaudi_security.c
diff --git a/drivers/misc/habanalabs/gaudi2/Makefile b/drivers/accel/habanalabs/gaudi2/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/Makefile
rename to drivers/accel/habanalabs/gaudi2/Makefile
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2.c
rename to drivers/accel/habanalabs/gaudi2/gaudi2.c
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2P.h
rename to drivers/accel/habanalabs/gaudi2/gaudi2P.h
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c
rename to drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight_regs.h b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2_coresight_regs.h
rename to drivers/accel/habanalabs/gaudi2/gaudi2_coresight_regs.h
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_masks.h b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2_masks.h
rename to drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
similarity index 100%
rename from drivers/misc/habanalabs/gaudi2/gaudi2_security.c
rename to drivers/accel/habanalabs/gaudi2/gaudi2_security.c
diff --git a/drivers/misc/habanalabs/goya/Makefile b/drivers/accel/habanalabs/goya/Makefile
similarity index 100%
rename from drivers/misc/habanalabs/goya/Makefile
rename to drivers/accel/habanalabs/goya/Makefile
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
similarity index 100%
rename from drivers/misc/habanalabs/goya/goya.c
rename to drivers/accel/habanalabs/goya/goya.c
diff --git a/drivers/misc/habanalabs/goya/goyaP.h b/drivers/accel/habanalabs/goya/goyaP.h
similarity index 100%
rename from drivers/misc/habanalabs/goya/goyaP.h
rename to drivers/accel/habanalabs/goya/goyaP.h
diff --git a/drivers/misc/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
similarity index 100%
rename from drivers/misc/habanalabs/goya/goya_coresight.c
rename to drivers/accel/habanalabs/goya/goya_coresight.c
diff --git a/drivers/misc/habanalabs/goya/goya_hwmgr.c b/drivers/accel/habanalabs/goya/goya_hwmgr.c
similarity index 100%
rename from drivers/misc/habanalabs/goya/goya_hwmgr.c
rename to drivers/accel/habanalabs/goya/goya_hwmgr.c
diff --git a/drivers/misc/habanalabs/goya/goya_security.c b/drivers/accel/habanalabs/goya/goya_security.c
similarity index 100%
rename from drivers/misc/habanalabs/goya/goya_security.c
rename to drivers/accel/habanalabs/goya/goya_security.c
diff --git a/drivers/misc/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/common/cpucp_if.h
rename to drivers/accel/habanalabs/include/common/cpucp_if.h
diff --git a/drivers/misc/habanalabs/include/common/hl_boot_if.h b/drivers/accel/habanalabs/include/common/hl_boot_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/common/hl_boot_if.h
rename to drivers/accel/habanalabs/include/common/hl_boot_if.h
diff --git a/drivers/misc/habanalabs/include/common/qman_if.h b/drivers/accel/habanalabs/include/common/qman_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/common/qman_if.h
rename to drivers/accel/habanalabs/include/common/qman_if.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/gaudi_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/stlb_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/stlb_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/stlb_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/stlb_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h b/drivers/accel/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi.h b/drivers/accel/habanalabs/include/gaudi/gaudi.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_async_events.h b/drivers/accel/habanalabs/include/gaudi/gaudi_async_events.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_async_events.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_async_events.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_coresight.h b/drivers/accel/habanalabs/include/gaudi/gaudi_coresight.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_coresight.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_coresight.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_fw_if.h b/drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_fw_if.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_masks.h b/drivers/accel/habanalabs/include/gaudi/gaudi_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_masks.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_packets.h b/drivers/accel/habanalabs/include/gaudi/gaudi_packets.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_packets.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_packets.h
diff --git a/drivers/misc/habanalabs/include/gaudi/gaudi_reg_map.h b/drivers/accel/habanalabs/include/gaudi/gaudi_reg_map.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi/gaudi_reg_map.h
rename to drivers/accel/habanalabs/include/gaudi/gaudi_reg_map.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h b/drivers/accel/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
rename to drivers/accel/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_masks.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_masks.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_masks.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/rot0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/rot0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h
rename to drivers/accel/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_async_events.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_async_events.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_coresight.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_coresight.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_coresight.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_coresight.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_fw_if.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_fw_if.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_packets.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_packets.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h
diff --git a/drivers/misc/habanalabs/include/gaudi2/gaudi2_reg_map.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_reg_map.h
similarity index 100%
rename from drivers/misc/habanalabs/include/gaudi2/gaudi2_reg_map.h
rename to drivers/accel/habanalabs/include/gaudi2/gaudi2_reg_map.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/cpu_if_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/cpu_if_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/cpu_if_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/cpu_if_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/cpu_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/cpu_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/cpu_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/cpu_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_macro_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_macro_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_macro_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_macro_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_macro_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_macro_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_macro_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_macro_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/goya_blocks.h b/drivers/accel/habanalabs/include/goya/asic_reg/goya_blocks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/goya_blocks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/goya_blocks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/goya_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/goya_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/goya_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/goya_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/goya_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/goya_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/goya_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/goya_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/ic_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/ic_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/ic_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/ic_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mc_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mc_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mc_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mc_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_qm_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_qm_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mme_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mme_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mme_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mme_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mmu_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/mmu_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mmu_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mmu_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/mmu_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/mmu_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/mmu_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/mmu_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/pcie_aux_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/pcie_aux_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/pcie_aux_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/pcie_aux_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_etr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_etr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_etr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_etr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_spi_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_spi_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_spi_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_spi_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/stlb_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/stlb_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/stlb_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/stlb_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/stlb_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/stlb_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/stlb_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/stlb_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/asic_reg/tpc_pll_regs.h b/drivers/accel/habanalabs/include/goya/asic_reg/tpc_pll_regs.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/asic_reg/tpc_pll_regs.h
rename to drivers/accel/habanalabs/include/goya/asic_reg/tpc_pll_regs.h
diff --git a/drivers/misc/habanalabs/include/goya/goya.h b/drivers/accel/habanalabs/include/goya/goya.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya.h
rename to drivers/accel/habanalabs/include/goya/goya.h
diff --git a/drivers/misc/habanalabs/include/goya/goya_async_events.h b/drivers/accel/habanalabs/include/goya/goya_async_events.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya_async_events.h
rename to drivers/accel/habanalabs/include/goya/goya_async_events.h
diff --git a/drivers/misc/habanalabs/include/goya/goya_coresight.h b/drivers/accel/habanalabs/include/goya/goya_coresight.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya_coresight.h
rename to drivers/accel/habanalabs/include/goya/goya_coresight.h
diff --git a/drivers/misc/habanalabs/include/goya/goya_fw_if.h b/drivers/accel/habanalabs/include/goya/goya_fw_if.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya_fw_if.h
rename to drivers/accel/habanalabs/include/goya/goya_fw_if.h
diff --git a/drivers/misc/habanalabs/include/goya/goya_packets.h b/drivers/accel/habanalabs/include/goya/goya_packets.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya_packets.h
rename to drivers/accel/habanalabs/include/goya/goya_packets.h
diff --git a/drivers/misc/habanalabs/include/goya/goya_reg_map.h b/drivers/accel/habanalabs/include/goya/goya_reg_map.h
similarity index 100%
rename from drivers/misc/habanalabs/include/goya/goya_reg_map.h
rename to drivers/accel/habanalabs/include/goya/goya_reg_map.h
diff --git a/drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h b/drivers/accel/habanalabs/include/hw_ip/mmu/mmu_general.h
similarity index 100%
rename from drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h
rename to drivers/accel/habanalabs/include/hw_ip/mmu/mmu_general.h
diff --git a/drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v1_0.h b/drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v1_0.h
similarity index 100%
rename from drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v1_0.h
rename to drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v1_0.h
diff --git a/drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v1_1.h b/drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v1_1.h
similarity index 100%
rename from drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v1_1.h
rename to drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v1_1.h
diff --git a/drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v2_0.h b/drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v2_0.h
similarity index 100%
rename from drivers/misc/habanalabs/include/hw_ip/mmu/mmu_v2_0.h
rename to drivers/accel/habanalabs/include/hw_ip/mmu/mmu_v2_0.h
diff --git a/drivers/misc/habanalabs/include/hw_ip/pci/pci_general.h b/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
similarity index 100%
rename from drivers/misc/habanalabs/include/hw_ip/pci/pci_general.h
rename to drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 9947b7892bd5..a615605d6d56 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -532,7 +532,6 @@ source "drivers/misc/cxl/Kconfig"
 source "drivers/misc/ocxl/Kconfig"
 source "drivers/misc/bcm-vk/Kconfig"
 source "drivers/misc/cardreader/Kconfig"
-source "drivers/misc/habanalabs/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 87b54a4a4422..33f80469e5f4 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -56,7 +56,6 @@ obj-$(CONFIG_OCXL)		+= ocxl/
 obj-$(CONFIG_BCM_VK)		+= bcm-vk/
 obj-y				+= cardreader/
 obj-$(CONFIG_PVPANIC)   	+= pvpanic/
-obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
-- 
2.34.1

