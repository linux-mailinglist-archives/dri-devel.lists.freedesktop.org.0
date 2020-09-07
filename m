Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43C260BAF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD986E4AB;
	Tue,  8 Sep 2020 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Mon, 07 Sep 2020 19:11:18 UTC
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BB36E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 19:11:18 +0000 (UTC)
Date: Mon, 07 Sep 2020 19:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1599505349;
 bh=VU8upJbsXlgcVevXq9bJo+njrd1Ivb0QGIDsJacy9fk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=S6lWI4z5rnbnO5rtJNxtHiUAw1N9MAxzKxS62lde4X96nwNKMnkixLJhDo/YVKLKN
 +inrUYy0Us/T98bwXhE5l56c9x2RR3M5FFF4xog5v5XNGJcDjG9jS72nLiw+z9v9ot
 EizvaiiPRnmFv00BpQvQF/zm3KQI4uB+Tla2m0hM=
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v16 00/20] iommu/arm-smmu + drm/msm: per-process GPU
 pgtables
Message-ID: <1eb7f10c-1504-158c-d25c-18a73b9a1607@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: Wambui Karuga <wambui.karugax@gmail.com>, Hanna Hawa <hannah@marvell.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sibi Sankar <sibis@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Krishna Reddy <vdumpa@nvidia.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-01 17:46, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> NOTE: I have re-ordered the series, and propose that we could merge this
>        series in the following order:
>
>         1) 01-11 - merge via drm / msm-next
>         2) 12-15 - merge via iommu, no dependency on msm-next pull req
>         3) 16-18 - patch 16 has a dependency on 02 and 04, so it would
>                    need to come post -rc1 or on following cycle, but I
>                    think it would be unlikely to conflict with other
>                    arm-smmu patches (other than Bjorn's smmu handover
>                    series?)
>         4) 19-20 - dt bits should be safe to land in any order without
>                    breaking anything
>
> ----
>
> This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
> pagetable switching.
>
> The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
> runtime to allow each individual instance or application to have its own
> pagetable.  In order to take advantage of the HW capabilities there are certain
> requirements needed of the SMMU hardware.
>
> This series adds support for an Adreno specific arm-smmu implementation. The new
> implementation 1) ensures that the GPU domain is always assigned context bank 0,
> 2) enables split pagetable support (TTBR1) so that the instance specific
> pagetable can be swapped while the global memory remains in place and 3) shares
> the current pagetable configuration with the GPU driver to allow it to create
> its own io-pgtable instances.
>
> The series then adds the drm/msm code to enable these features. For targets that
> support it allocate new pagetables using the io-pgtable configuration shared by
> the arm-smmu driver and swap them in during runtime.
>
> This version of the series merges the previous patchset(s) [1] and [2]
> with the following improvements:
>
> v16: (Respin by Rob)
>    - Fix indentation
>    - Re-order series to split drm and iommu parts
> v15: (Respin by Rob)
>    - Adjust dt bindings to keep SoC specific compatible (Doug)
>    - Add dts workaround for cheza fw limitation
>    - Add missing 'select IOMMU_IO_PGTABLE' (Guenter)
> v14: (Respin by Rob)
>    - Minor update to 16/20 (only force ASID to zero in one place)
>    - Addition of sc7180 dtsi patch.
> v13: (Respin by Rob)
>    - Switch to a private interface between adreno-smmu and GPU driver,
>      dropping the custom domain attr (Will Deacon)
>    - Rework the SCTLR.HUPCF patch to add new fields in smmu_domain->cfg
>      rather than adding new impl hook (Will Deacon)
>    - Drop for_each_cfg_sme() in favor of plain for() loop (Will Deacon)
>    - Fix context refcnt'ing issue which was causing problems with GPU
>      crash recover stress testing.
>    - Spiff up $debugfs/gem to show process information associated with
>      VMAs
> v12:
>    - Nitpick cleanups in gpu/drm/msm/msm_iommu.c (Rob Clark)
>    - Reorg in gpu/drm/msm/msm_gpu.c (Rob Clark)
>    - Use the default asid for the context bank so that iommu_tlb_flush_all works
>    - Flush the UCHE after a page switch
>    - Add the SCTLR.HUPCF patch at the end of the series
> v11:
>    - Add implementation specific get_attr/set_attr functions (per Rob Clark)
>    - Fix context bank allocation (per Bjorn Andersson)
> v10:
>    - arm-smmu: add implementation hook to allocate context banks
>    - arm-smmu: Match the GPU domain by stream ID instead of compatible string
>    - arm-smmu: Make DOMAIN_ATTR_PGTABLE_CFG bi-directional. The leaf driver
>      queries the configuration to create a pagetable and then sends the newly
>      created configuration back to the smmu-driver to enable TTBR0
>    - drm/msm: Add context reference counting for submissions
>    - drm/msm: Use dummy functions to skip TLB operations on per-instance
>      pagetables
>
> [1] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045653.html
> [2] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045659.html
>
> Jordan Crouse (12):
>    drm/msm: Add a context pointer to the submitqueue
>    drm/msm: Drop context arg to gpu->submit()
>    drm/msm: Set the global virtual address range from the IOMMU domain
>    drm/msm: Add support to create a local pagetable
>    drm/msm: Add support for private address space instances
>    drm/msm/a6xx: Add support for per-instance pagetables
>    iommu/arm-smmu: Pass io-pgtable config to implementation specific
>      function
>    iommu/arm-smmu: Add support for split pagetables
>    iommu/arm-smmu: Prepare for the adreno-smmu implementation
>    iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>    dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>    arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
>
> Rob Clark (8):
>    drm/msm: Remove dangling submitqueue references
>    drm/msm: Add private interface for adreno-smmu
>    drm/msm/gpu: Add dev_to_gpu() helper
>    drm/msm: Set adreno_smmu as gpu's drvdata
>    drm/msm: Show process names in gem_describe
>    iommu/arm-smmu: Constify some helpers
>    iommu/arm-smmu: Add a way for implementations to influence SCTLR
>    arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
>
>   .../devicetree/bindings/iommu/arm,smmu.yaml   |   9 +-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
>   arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   9 +
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
>   drivers/gpu/drm/msm/Kconfig                   |   1 +
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  12 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  68 +++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   1 +
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |  12 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  18 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   3 +-
>   drivers/gpu/drm/msm/msm_drv.c                 |  16 +-
>   drivers/gpu/drm/msm/msm_drv.h                 |  25 +++
>   drivers/gpu/drm/msm/msm_gem.c                 |  25 ++-
>   drivers/gpu/drm/msm/msm_gem.h                 |   6 +
>   drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
>   drivers/gpu/drm/msm/msm_gem_vma.c             |  10 +
>   drivers/gpu/drm/msm/msm_gpu.c                 |  41 +++-
>   drivers/gpu/drm/msm/msm_gpu.h                 |  21 +-
>   drivers/gpu/drm/msm/msm_gpummu.c              |   2 +-
>   drivers/gpu/drm/msm/msm_iommu.c               | 206 +++++++++++++++++-
>   drivers/gpu/drm/msm/msm_mmu.h                 |  16 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.h          |   1 +
>   drivers/gpu/drm/msm/msm_submitqueue.c         |   7 +-
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   6 +-
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 155 ++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c         | 100 ++++-----
>   drivers/iommu/arm/arm-smmu/arm-smmu.h         |  87 +++++++-
>   include/linux/adreno-smmu-priv.h              |  36 +++
>   29 files changed, 771 insertions(+), 134 deletions(-)
>   create mode 100644 include/linux/adreno-smmu-priv.h
>
Tested in combination with 
https://lore.kernel.org/linux-arm-msm/20200904155513.282067-1-bjorn.andersson@linaro.org/

Fixes booting on the OnePlus 6 (SDM845) with the display enabled.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
