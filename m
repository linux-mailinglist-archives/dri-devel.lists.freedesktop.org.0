Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8F14C2CD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 23:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D78F6F43B;
	Tue, 28 Jan 2020 22:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260F6E155
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 22:16:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580249784; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=i+aFwz/XZq1hLfURdhwYcNPvIQ+jYpVpqGRNNihkjB8=;
 b=t68r4dZFy37uqZuV3kR93gT/9u9mIe2o0mFWDBiCqYrb8z9Yjcw7B0XeuTxOV8wcL8sYWmTo
 Cy3WxTY0zlG9wRIMQxDc01/Czemi+1FHDW1hWZ+Gihy+B3FbCNnM/ntAM/KWmPTwpWJK34xx
 Fj5r398yUFjai+/UftRyEMKm8Ew=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b2b3.7fb6d67462d0-smtp-out-n02;
 Tue, 28 Jan 2020 22:16:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A9A8EC4479F; Tue, 28 Jan 2020 22:16:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3BD1C433CB;
 Tue, 28 Jan 2020 22:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3BD1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v1 0/6] iommu/arm-smmu: Auxiliary domain and per instance
 pagetables
Date: Tue, 28 Jan 2020 15:16:04 -0700
Message-Id: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 will@kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some clients have a requirement to sandbox memory mappings for security and
advanced features like SVM. This series adds support to enable per-instance
pagetables as auxiliary domains in the arm-smmu driver and adds per-instance
support for the Adreno GPU.

This patchset builds on the split pagetable support from [1]. In that series the
TTBR1 address space is programmed for the default ("master") domain and enables
support for auxiliary domains. Each new auxiliary domain will allocate a
pagetable which the leaf driver can program through the usual IOMMU APIs. It can
also query the physical address of the pagetable.

In the SMMU driver the first auxiliary domain will enable and program the TTBR0
space. Subsequent auxiliary domains won't touch the hardware. Similarly when
the last auxiliary domain is detached the TTBR0 region will be disabled again.

In the Adreno driver each new file descriptor instance will create a new
auxiliary domain / pagetable and use it for all the memory allocations of that
instance. The driver will query the base address of each pagetable and switch
them dynamically using the built-in table switch capability of the GPU. If any
of these features fail the driver will automatically fall back to using the
default (global) pagetable.

This patchset had previously been submitted as [2] but has been significantly
modified since then.

Jordan

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041438.html
[2] https://patchwork.freedesktop.org/series/57441/


Jordan Crouse (6):
  iommu: Add DOMAIN_ATTR_PTBASE
  arm/smmu: Add auxiliary domain support for arm-smmuv2
  drm/msm/adreno: ADd support for IOMMU auxiliary domains
  drm/msm: Add support to create target specific address spaces
  drm/msm/gpu: Add ttbr0 to the memptrs
  drm/msm/a6xx: Support per-instance pagetables

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  89 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         |  22 +++-
 drivers/gpu/drm/msm/msm_gpu.h         |   2 +
 drivers/gpu/drm/msm/msm_iommu.c       |  72 +++++++++++
 drivers/gpu/drm/msm/msm_mmu.h         |   3 +
 drivers/gpu/drm/msm/msm_ringbuffer.h  |   1 +
 drivers/iommu/arm-smmu.c              | 230 +++++++++++++++++++++++++++++++---
 drivers/iommu/arm-smmu.h              |   3 +
 include/linux/iommu.h                 |   2 +
 9 files changed, 405 insertions(+), 19 deletions(-)

-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
