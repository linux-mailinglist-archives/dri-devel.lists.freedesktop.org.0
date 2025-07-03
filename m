Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B2AF815A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958BE10E1C2;
	Thu,  3 Jul 2025 19:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEiKHGt4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0510E1C2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751571000; x=1783107000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S5LofzUEXpq1vyCwo3YZcP+hQsGsFW0lU5QbNdytI7I=;
 b=cEiKHGt4uhUoqQJrj50jHHAsYspKmgmVIW5/yhkQgN0oZ3VFin1bxYuZ
 KuxN9MuZwcBRR6ERl1mAOapcZRHczReK1F3gNZssOgYPXdHJ0/da0IarB
 lIZtT7WhJBUxuyvKQczAJKRrTZQI8diom5zjvxu65bgUVlHLiIhaxwDSD
 lcICqnP6LuG7mpqqSp4VdnvC0PqK8rF4YPnAb5lj+6Z7GCUze6T56YUdJ
 SdcUN/ywTaQkylBZNuW0Lr8MTq7T3V5BNqg7Pm9KvFEMh/GK4zNQRXiHK
 CDd1CkQJCS/4YwvMd6YchP7UjYQkyOg1VQhg3jBiCvppqFO76VsjWt/zq A==;
X-CSE-ConnectionGUID: x/OzNVYCREW+8yH+bizkIg==
X-CSE-MsgGUID: y3AFioFDSCGPR34/3HQflg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54024334"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="54024334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:30:00 -0700
X-CSE-ConnectionGUID: gJ+8UEYCShSEF1UXpBmqjg==
X-CSE-MsgGUID: ktih2KroQKWMHOuYOaJtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="185399038"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:29:58 -0700
Date: Thu, 3 Jul 2025 12:29:57 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Ben Hutchings <ben@decadent.org.uk>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ahmed Salem <x0rw3ll@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] agp/amd64: Check AGP Capability before binding to
 unsupported devices
Message-ID: <aGbaNd3qCK3WvAe-@tassilo>
References: <b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de>
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


I suspect these days it would be also reasonable to drop it this old
hack.

If any of these old chipsets are still missing I would rather adds its
PCI-ID.

There will be certainly not any new unknown ones for these old CPUs.

Also there shouldn't be that many high speed devices that need the 
old 4GB IOMMU anyways, and for low speed ones it's fine to use swiotlb
instead.

-Andi

