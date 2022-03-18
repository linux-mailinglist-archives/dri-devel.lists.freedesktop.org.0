Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8BF4DDA5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 14:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8136110E07B;
	Fri, 18 Mar 2022 13:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A810E06F;
 Fri, 18 Mar 2022 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647609565; x=1679145565;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0fiB8K5hLBCApgF7MtseTRH1fW4539mCyei9nEZWdxg=;
 b=T1cMi8h/7KJimHTIXXOQnrHfyY4dqaXor4Rg3ybSpru3Ui+0g1WZiWd+
 13IS88yhW3pCF098//IR3cKpD0mo6liadixR9oXA4Bb9N/H0dCVU+dYqX
 32VznYhpG7r+T75ZtWiCFq68dyqGdpcCom15HmIczR55obqllrjFzOGLI
 HxtN0E+ZXGqUfZXBqTmM08ozournAcR+Auru8lpf7lgi8ihf1qiKLclXa
 BWWOGILFMVvPKdZIIerB9ncaOoAZmt9PfxF5kn39X70SxOWihhg0YEEeR
 4Odz5jn+YK8DQmHbYCsXFTA8E51hMp+laNrcMA+smyqe4OyCoW9U6EuMr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="320343466"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="320343466"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 06:19:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="647459720"
Received: from cfahey-mobl.ger.corp.intel.com (HELO [10.252.9.62])
 ([10.252.9.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 06:19:21 -0700
Message-ID: <dde37ab3-7065-d1b6-df4c-937001a038c0@intel.com>
Date: Fri, 18 Mar 2022 13:19:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/7] drm/i915/gt: create per-tile sysfs interface
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-5-andi.shyti@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220318021046.40348-5-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi@etezian.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2022 02:10, Andi Shyti wrote:
> Now that we have tiles we want each of them to have its own
> interface. A directory "gt/" is created under "cardN/" that will
> contain as many diroctories as the tiles.
> 
> In the coming patches tile related interfaces will be added. For
> now the sysfs gt structure simply has an id interface related
> to the current tile count.
> 
> The directory structure will follow this scheme:
> 
>      /sys/.../card0
>               └── gt
>                   ├── gt0
>                   │   └── id
>                   :
> 		 :
> 		 └─- gtN
>                       └── id
> 
> This new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile            |   1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 103 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 ++++++++
>   drivers/gpu/drm/i915/i915_drv.h          |   2 +
>   drivers/gpu/drm/i915/i915_sysfs.c        |   7 +-
>   drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
>   scripts/extract-cert                     | Bin 0 -> 17952 bytes

What is extract-cert?
