Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F3AE5B96
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DABD10E4BA;
	Tue, 24 Jun 2025 04:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtJg/Vod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB7D10E4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 04:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750740255; x=1782276255;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=70vF/+LDkN4q7jTfHlGAIAhxNTippQO8QdvV+YYKln0=;
 b=LtJg/VodfdOJE0vsCBm0M4TQNyrN5nxq20QX2i5afMTULXVLmiHC9azW
 1bbBRV5aRdiPdCxhmk1i/VmAEFTPDikYXq+RVBk7Qpc6FFBhMMw0clXcn
 f+JxwNu8kJG9+gGgX7DrLbWj+rb3wBZJyp2+fittPdZpNRpKTy+WdyQyf
 acgfAmLpuuhr6wBpHVhwUDW03GDtsZ41YSPz2e4e539FcaDUHDtekXxdH
 Xzva66R3IRroVEN/1+Ld4fbb9G5I96u4zVg8DRfYxZGFbMHDx09/LMoaE
 hAXQw27z7s+/UU2FY/D+eoVF8/xU+Q3ZKnszsDz6JDWZjb8FZ32SaACMh A==;
X-CSE-ConnectionGUID: PxXiUy2mTwmglOGAZ0xc5Q==
X-CSE-MsgGUID: q4u4WOz4Rj603XqNGz0ckA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53097160"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="53097160"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:44:14 -0700
X-CSE-ConnectionGUID: /IMDF3uBQ862VPPddpuBuw==
X-CSE-MsgGUID: ZdH+2z/NRSGVG1dkvjtRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="157578062"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:44:08 -0700
Message-ID: <06992407-0c84-4f3f-a89a-5986024928a4@linux.intel.com>
Date: Tue, 24 Jun 2025 12:42:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] iommu/vt-d: Use pci_is_display()
To: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Bjorn Helgaas <helgaas@kernel.org>
References: <20250623184757.3774786-1-superm1@kernel.org>
 <20250623184757.3774786-5-superm1@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250623184757.3774786-5-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/24/25 02:47, Mario Limonciello wrote:
> From: Mario Limonciello<mario.limonciello@amd.com>
> 
> The inline pci_is_display() helper does the same thing.  Use it.
> 
> Reviewed-by: Daniel Dadap<ddadap@nvidia.com>
> Reviewed-by: Simona Vetter<simona.vetter@ffwll.ch>
> Suggested-by: Bjorn Helgaas<helgaas@kernel.org>
> Signed-off-by: Mario Limonciello<mario.limonciello@amd.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
