Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BCAE8038
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074E10E6CD;
	Wed, 25 Jun 2025 10:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFpXIICw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC2710E6CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750848766; x=1782384766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L2E1mHlLHz7wbD1s3c/UvvxtaaMR/FMov2jR+AourPo=;
 b=IFpXIICwEDlTO+gmmcZRm1WaVvW1RBX2ph7W9RlWyXzHdj8sF+0FnzYG
 UAYZOzuR1hrb/6qEnsv1Se5avpg+8Yg9L4VBKAyJPansmxKL9aftoQsgH
 QiolDw83IjUVzNs3Ub8IyCtmw9OTxv1EFGo2GVCo5NOhH/RzJADq9lYVu
 YnfBtYbFNJIdzPq3TX55MA5+XtjfXR8cO31nPcbi3G+Ih+VwL1w2Fwegn
 ewdT3gyIgz8mMvpJYmTc//sMhT2bSbZFJ4F6fBmB6DdnEWMiz0pB78g6L
 OJ0iUBa+qVbr8DPq4tdDhZQGl7+843MVlTDM4yWiHKYLDrIo+d8V3sqI/ w==;
X-CSE-ConnectionGUID: O/3OWQftTcC3BbxnCnHpHQ==
X-CSE-MsgGUID: JUcFfemgTP2K/5kmINLdow==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64172262"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="64172262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:52:46 -0700
X-CSE-ConnectionGUID: WvY+25yWSNy9ZVBI9nCQAQ==
X-CSE-MsgGUID: Srouzp+WTZKyngVqfHLDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="183073412"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa001.fm.intel.com with ESMTP; 25 Jun 2025 03:52:40 -0700
Date: Wed, 25 Jun 2025 18:45:03 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com,
 linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 vivek.kasireddy@intel.com, yilun.xu@intel.com,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, aneesh.kumar@kernel.org,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
Message-ID: <aFvTL6MUkVZrPoBS@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
 <f5958bda-838a-4ed6-84c6-fef62cd0b28f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5958bda-838a-4ed6-84c6-fef62cd0b28f@amd.com>
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

On Sat, Jun 21, 2025 at 11:07:24AM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 11/6/25 11:55, Alexey Kardashevskiy wrote:
> > Hi,
> > 
> > Is there a QEMU tree using this somewhere?
> 
> Ping? Thanks,

Sorry for late. I've finally got a public tree.

https://github.com/yiliu1765/qemu/tree/zhenzhong/devsec_tsm

Again, I think the changes are far from good, just work for enabling.

Thanks,
Yilun
