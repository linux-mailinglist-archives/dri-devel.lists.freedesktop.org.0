Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D232E6F82
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2CB89336;
	Tue, 29 Dec 2020 09:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68649892FD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 01:49:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609206558; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=N8vblr7WLA9MBowjRomnjKEqPtQ1SL9FvyoDvOUsoR4=;
 b=jMI3yzhtGkYBK1yO9osTMyDesy0yg02ZPneyiZBlarJMy3XjSkuhZlsUn2nvHxxJh6XwdEJO
 nr+b7Xwuve1QckoJ2kLK6Oblz5a94nbOmyj0xJIR6bPdssJnPtlx0LRzu/GzQW341BIh6le+
 B6UPbXpJOLG8OouX/ql96mLiuN4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fea8b15db8e07fa6c948119 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 01:49:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83FF2C43469; Tue, 29 Dec 2020 01:49:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F1E3C433C6;
 Tue, 29 Dec 2020 01:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F1E3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Subject: [PATCH 0/7] iommu: Permit modular builds of io-pgtable drivers
Date: Mon, 28 Dec 2020 17:48:54 -0800
Message-Id: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno@lists.freedesktop.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal of the Generic Kernel Image (GKI) effort is to have a common
kernel image that works across multiple Android devices. This involves
generating a kernel image that has core features integrated into it,
while SoC specific functionality can be added to the kernel for the
device as a module.

Along with modularizing IOMMU drivers, this also means building the
io-pgtable code as modules, which allows for SoC vendors to only include
the io-pgtable implementations that they use. For example, GKI for arm64
must include support for both the IOMMU ARM LPAE/V7S formats at the
moment. Having the code for both formats as modules allows SoC vendors
to only provide the page table format that they use, along with their
IOMMU driver.

The patches are split into 4 parts:

1) Modularizing io-pgtable-arm[-v7s].c, while leaving the io-pgtable.c
code as part of the core kernel, requires removing the references to
the ARM LPAE and ARM V7S io-pgtable init functions, and using a
dynamic method for formats to register their io-pgtable init functions.

2) Taking references to the io-pgtable format drivers to ensure that they
cannot be unloaded while in use.

3) Adding pre MODULE_SOFTDEP() dependencies to drivers in the kernel
that are tristate, and invoke [alloc/free]_io_pgtable_ops(). This makes
it so that the io-pgtable format drivers are loaded before the driver
that needs them.

4) Changing the Kconfig options for the ARM LPAE nad ARM V7S to tristate
and allowing the io-pgtable code to be enabled without having to select
either page table format. The reason for doing this is so that a kernel
can be built, such that it only provides the interface for io-pgtable
formats to be registered as modules, as would be the case for the GKI.

Thanks,
Isaac

Isaac J. Manjarres (7):
  iommu/io-pgtable: Introduce dynamic io-pgtable format registration
  iommu/io-pgtable: Add refcounting for io-pgtable format modules
  iommu/arm-smmu: Add dependency on io-pgtable format modules
  iommu/arm-smmu-v3: Add dependency on io-pgtable-arm format module
  drm/msm: Add dependency on io-pgtable-arm format module
  drm/panfrost: Add dependency on io-pgtable-arm format module
  iommu/io-pgtable-arm: Allow building modular io-pgtable formats

 drivers/gpu/drm/msm/msm_drv.c               |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     |   1 +
 drivers/iommu/Kconfig                       |  11 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   1 +
 drivers/iommu/io-pgtable-arm-v7s.c          |  36 +++++++++-
 drivers/iommu/io-pgtable-arm.c              | 104 +++++++++++++++++++++-------
 drivers/iommu/io-pgtable.c                  |  54 ++++++++++-----
 include/linux/io-pgtable.h                  |  52 +++++++++-----
 9 files changed, 196 insertions(+), 65 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
