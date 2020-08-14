Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A48244333
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748016EADD;
	Fri, 14 Aug 2020 02:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FE089CC1;
 Fri, 14 Aug 2020 02:40:43 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 2so3713223pjx.5;
 Thu, 13 Aug 2020 19:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owfmQXFgf/fH58BV+ic1nMBs1aCC02JSGh5gYv3klp8=;
 b=lsiZrbDjIcUnnBikCQDJEBZ82+asgOneztDDZB/zGHWwNfBBIlDvZig6cPm+zpN9uL
 I6faNW9U9xRDsexV0d3yePpmSWqj152dK7U2QPNytL/KC+gvyQJKACs2+u+YiUEEza1f
 MuM1pqhImoxHVu5b9LlFgP7nJJtXYNa9NVdBBuOGLzYK8bPHvmtwf+CUB+zia0WL8wt4
 XYegTlvmeExE/ExPkHNGXMLctzdipPb9a8wUiWVbBOYeiC4nHDgLdWag/j8GGWwC03Qf
 iFLKJVdwelOIQuvRP/cAfkF9w/2XixQHpnvUSmBgH9bNlytB/Fb5EthFc/B5uRdE0/8w
 iKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owfmQXFgf/fH58BV+ic1nMBs1aCC02JSGh5gYv3klp8=;
 b=FePLtne0BY8yMqiicUSliBdsz0HG32/CSvqVYTsKdz72QImQ4lt+bjl8HIZAR2ih5A
 N3FzQt3oI7hPU0nFDoDJFDtWdjmozRtCOsUKgMKOoobgt9TfiN5Gf01FqPEb2f1VpAVN
 2p9Wz+aRwTKV5Ub3YRG19QPhVvfJy/ayqidCG0+I5uCjMqkedSjO+OKA1bstxfTnc+/J
 mJzfpI84kgotJA+/2WjTTGkrY0qMyb9BRSiYAcJKWmYI+sRrSv6+o3GbOl4MJ5IjadDl
 9bhvPYanA6z8oDJMd5pP5bWzAIAWKJwGGo3TIIkvluapCknJZXQbLmvU2/ZsbE70wmCQ
 hB+Q==
X-Gm-Message-State: AOAM533P16miSNCyHOJuVB5nSiPQ6xo4v8seUUAqhO9zzqRoDaT5Q36v
 Tag7dmg9OmG9FQ7gaRJtjUEJuZB3jMg=
X-Google-Smtp-Source: ABdhPJwWmUSOx1eEo2u76f8aikt4xuixi23dTQV5RYorGVXebHwyI7SWesWZ3r2epsMthKNgKT0I/Q==
X-Received: by 2002:a17:902:ed4a:: with SMTP id
 y10mr575938plb.106.1597372842579; 
 Thu, 13 Aug 2020 19:40:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id mh14sm6740321pjb.23.2020.08.13.19.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:40:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/19] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Date: Thu, 13 Aug 2020 19:40:55 -0700
Message-Id: <20200814024114.1177553-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

NOTE: Since Jordan was out today, and I wanted to keep things moving on
      this, I took the liberty of respinning his series (originally
      titled "iommu/arm-smmu: Add Adreno SMMU specific implementation")
      with updates based on Will's review comments, and some fixes and
      extra bits that I found in stress testing the series.  Original
      commit msg and updated version history below.

      In general I like the private interface between adreno-smmu and
      the GPU driver.  It should make for a more straightforward way
      to extend things to optimize TLB invalidation in the future, for
      example, rather than shoe-horning everything thru domain attrs.
      And it lets us describe the get_ttbr1_cfg/set_ttrb0_cfg dance
      more clearly.  Although it is going to make landing this via
      iommu vs drm tree a bit more difficult.  Maybe there are some
      arm-smmu parts of this series that could be pulled out to make
      it not conflicty to land the private interface and adreno-smmu
      bits via the drm tree?  (But I'm jumping a bit ahead here.  Just
      wanted to point out that issue.)

      The complete series can be found at:
      https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-pgtables

This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
pagetable switching.

The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
runtime to allow each individual instance or application to have its own
pagetable.  In order to take advantage of the HW capabilities there are certain
requirements needed of the SMMU hardware.

This series adds support for an Adreno specific arm-smmu implementation. The new
implementation 1) ensures that the GPU domain is always assigned context bank 0,
2) enables split pagetable support (TTBR1) so that the instance specific
pagetable can be swapped while the global memory remains in place and 3) shares
the current pagetable configuration with the GPU driver to allow it to create
its own io-pgtable instances.

The series then adds the drm/msm code to enable these features. For targets that
support it allocate new pagetables using the io-pgtable configuration shared by
the arm-smmu driver and swap them in during runtime.

This version of the series merges the previous patchset(s) [1] and [2]
with the following improvements:

v13: (Respin by Rob)
  - Switch to a private interface between adreno-smmu and GPU driver,
    dropping the custom domain attr (Will Deacon)
  - Rework the SCTLR.HUPCF patch to add new fields in smmu_domain->cfg
    rather than adding new impl hook (Will Deacon)
  - Drop for_each_cfg_sme() in favor of plain for() loop (Will Deacon)
  - Fix context refcnt'ing issue which was causing problems with GPU
    crash recover stress testing.
  - Spiff up $debugfs/gem to show process information associated with
    VMAs
v12:
  - Nitpick cleanups in gpu/drm/msm/msm_iommu.c (Rob Clark)
  - Reorg in gpu/drm/msm/msm_gpu.c (Rob Clark)
  - Use the default asid for the context bank so that iommu_tlb_flush_all works
  - Flush the UCHE after a page switch
  - Add the SCTLR.HUPCF patch at the end of the series
v11:
  - Add implementation specific get_attr/set_attr functions (per Rob Clark)
  - Fix context bank allocation (per Bjorn Andersson)
v10:
  - arm-smmu: add implementation hook to allocate context banks
  - arm-smmu: Match the GPU domain by stream ID instead of compatible string
  - arm-smmu: Make DOMAIN_ATTR_PGTABLE_CFG bi-directional. The leaf driver
    queries the configuration to create a pagetable and then sends the newly
    created configuration back to the smmu-driver to enable TTBR0
  - drm/msm: Add context reference counting for submissions
  - drm/msm: Use dummy functions to skip TLB operations on per-instance
    pagetables

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045653.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045659.html


Jordan Crouse (12):
  iommu/arm-smmu: Pass io-pgtable config to implementation specific
    function
  iommu/arm-smmu: Add support for split pagetables
  iommu/arm-smmu: Prepare for the adreno-smmu implementation
  iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  drm/msm: Add a context pointer to the submitqueue
  drm/msm: Drop context arg to gpu->submit()
  drm/msm: Set the global virtual address range from the IOMMU domain
  drm/msm: Add support to create a local pagetable
  drm/msm: Add support for private address space instances
  drm/msm/a6xx: Add support for per-instance pagetables
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Rob Clark (7):
  drm/msm: remove dangling submitqueue references
  iommu: add private interface for adreno-smmu
  drm/msm/gpu: add dev_to_gpu() helper
  drm/msm: set adreno_smmu as gpu's drvdata
  iommu/arm-smmu: constify some helpers
  iommu/arm-smmu: add a way for implementations to influence SCTLR
  drm/msm: show process names in gem_describe

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  75 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  12 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  18 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   3 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  16 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  25 +++
 drivers/gpu/drm/msm/msm_gem.c                 |  25 ++-
 drivers/gpu/drm/msm/msm_gem.h                 |   6 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
 drivers/gpu/drm/msm/msm_gem_vma.c             |  10 +
 drivers/gpu/drm/msm/msm_gpu.c                 |  41 +++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  21 +-
 drivers/gpu/drm/msm/msm_gpummu.c              |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c               | 206 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h                 |  16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h          |   1 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |   7 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 155 ++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 102 ++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |  87 +++++++-
 include/linux/adreno-smmu-priv.h              |  36 +++
 26 files changed, 765 insertions(+), 132 deletions(-)
 create mode 100644 include/linux/adreno-smmu-priv.h

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
