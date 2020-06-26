Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D320B9D6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 22:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B951C6E4C9;
	Fri, 26 Jun 2020 20:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2076ED0B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 20:04:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593201892; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Y52DfZmPsADiviryLIjbB10Q7p9PKIz9PJgeiGWZpfo=;
 b=tXZVY6LZV0JEX1utO9N9gd7rDx4f9x9TEkFVf+MOsF7YcBVd25TmulxDTD4WJf5kETQ42hA6
 0PDkGKk7////sbCEvZxdXlK0C7toyu1SXQcXQ9V1DXuy51Fro0UTVHHM36JsZawujWlCyf/3
 uF2H54nOlwkpTN75ZVb0CaWY3Nk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ef654c8567385e8e7bdf8c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:04:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D135BC4345D; Fri, 26 Jun 2020 20:04:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0451C433C6;
 Fri, 26 Jun 2020 20:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0451C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/6] iommu-arm-smmu: Add auxiliary domains and per-instance
 pagetables
Date: Fri, 26 Jun 2020 14:04:08 -0600
Message-Id: <20200626200414.14382-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Joerg Roedel <jroedel@suse.de>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, Yong Wu <yong.wu@mediatek.com>,
 Emil Velikov <emil.velikov@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a new refresh of support for auxiliary domains for arm-smmu-v2
and per-instance pagetables for drm/msm. The big change here from past
efforts is that outside of creating a single aux-domain to enable TTBR0
all of the per-instance pagetables are created and managed exclusively
in drm/msm without involving the arm-smmu driver. This fits in with the
suggested model of letting the GPU hardware do what it needs and leave the
arm-smmu driver blissfully unaware.

Almost. In order to set up the io-pgtable properly in drm/msm we need to
query the pagetable configuration from the current active domain and we need to
rely on the iommu API to flush TLBs after a unmap. In the future we can optimize
this in the drm/msm driver to track the state of the TLBs but for now the big
hammer lets us get off the ground.

This series is built on the split pagetable support [1].

[1] https://patchwork.kernel.org/patch/11628543/

v2: Remove unneeded cruft in the a6xx page switch sequence

Jordan Crouse (6):
  iommu/arm-smmu: Add auxiliary domain support for arm-smmuv2
  iommu/io-pgtable: Allow a pgtable implementation to skip TLB
    operations
  iommu/arm-smmu: Add a domain attribute to pass the pagetable config
  drm/msm: Add support to create a local pagetable
  drm/msm: Add support for address space instances
  drm/msm/a6xx: Add support for per-instance pagetables

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  43 +++++
 drivers/gpu/drm/msm/msm_drv.c         |  15 +-
 drivers/gpu/drm/msm/msm_drv.h         |   4 +
 drivers/gpu/drm/msm/msm_gem_vma.c     |   9 +
 drivers/gpu/drm/msm/msm_gpu.c         |  17 ++
 drivers/gpu/drm/msm/msm_gpu.h         |   5 +
 drivers/gpu/drm/msm/msm_gpummu.c      |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 180 +++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h         |  16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  |   1 +
 drivers/iommu/arm-smmu.c              | 231 ++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h              |   1 +
 include/linux/io-pgtable.h            |  11 +-
 include/linux/iommu.h                 |   1 +
 14 files changed, 507 insertions(+), 29 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
