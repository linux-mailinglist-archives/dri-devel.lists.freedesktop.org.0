Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92996978C8B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 04:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C648910E253;
	Sat, 14 Sep 2024 02:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wx0lFibl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08D410E257
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726279576; x=1757815576;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r1SPEaFbtgONlYp9N92wMuvszR631+QcjZT+HAM08G8=;
 b=Wx0lFiblieA/9/9zel9rjGGqiBhBg5zYjJ/ObIHxufVPcAMw1Fk+5oEb
 zjOJOQL72vzWiy8zQsKghpnSbtgajYcGTpXhEBXRi9FkGj/Q7G3uHH/k6
 Mp6q9arZJUfEnohcT+UYK9SFpVyVg8lfV+784+4Kc3JSkMqmKfyfZf8l3
 1fSe3I8qlsUlHfu1PSil9tghCgNGIa+ZCDyWZFVxhf8+D3hJskkidrG+u
 8y2xVFJhTo7kBnkBtA1zftgd7EosIg7aXwbmWoHQ6B2E3lw32By4gB1MF
 HvIqeRGlSQns9/n+49kVgwbAc6m84o675WYdjX7T5Ea9Rc23HTk1zQ702 A==;
X-CSE-ConnectionGUID: PsZCuLF1RNKdgkfU/AdBbw==
X-CSE-MsgGUID: lIMDaYOxQZGJXl1Qr6b3Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47706731"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="47706731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 19:06:15 -0700
X-CSE-ConnectionGUID: hrcCDiI6S7qL/42olX80Rg==
X-CSE-MsgGUID: gzoUIxuVSy6K+Ux6zmuDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="67968803"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127])
 ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2024 19:06:12 -0700
Message-ID: <42bbc500-578c-474b-98ec-1988906f31ef@linux.intel.com>
Date: Sat, 14 Sep 2024 10:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
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

On 9/13/24 10:34 PM, Dan Carpenter wrote:
> The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
> it returns error pointers.  Update the check to match.
> 
> Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
> Signed-off-by: Dan Carpenter<dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/tegra/drm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu
