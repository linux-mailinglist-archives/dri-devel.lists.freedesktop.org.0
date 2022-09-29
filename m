Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A870B5EFB93
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228010EB4E;
	Thu, 29 Sep 2022 17:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B634010EB4C;
 Thu, 29 Sep 2022 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664471216; x=1696007216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qqP7bXZfWN3ubK4nqoz1CZPrDOhfJnd0ShZ+86KT7Og=;
 b=jVv6ltVpEqwjnt7f7mAd5H3eoKMiC8l5EWOZ2eN5arsqOpncsziVRA18
 nu8JSAsaBwPyYgo5OECnXlBZoGvoHTXfPl0liMFA1Vm8GOjVq41lOknCE
 yie9UOuTsrSVHVWeIF0mJGMHgVbDXFtXfPGsxrRPW7+7OQY97OaA8CLmW
 1SwKaE9tVlJWIeJkOnmezg7kF/cyLVuOAdvJ/5LyBbq5hQPSKanBlrraV
 eDp0j3DiNohmCAmmOUdz2f3Lp8c3as+4SftnWVsJtQ+sQP49UZQLZDkaC
 7sTKd9FHYnhbwS2OBF6yGQlqP/9SxK/sbKnub0uK/US5Y/QW1aZ/tr7Gy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="289128323"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="289128323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 10:04:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="684926921"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="684926921"
Received: from bpingot-mobl1.ger.corp.intel.com (HELO [10.252.6.106])
 ([10.252.6.106])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 10:04:40 -0700
Message-ID: <6de15aaf-e88a-5cfc-3216-58d9c5ba5fba@intel.com>
Date: Thu, 29 Sep 2022 18:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 04/16] drm/i915/vm_bind: Add support to create persistent
 vma
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-5-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-5-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> Add i915_vma_instance_persistent() to create persistent vmas.
> Persistent vmas will use i915_gtt_view to support partial binding.
> 
> vma_lookup is tied to segment of the object instead of section
> of VA space. Hence, it do not support aliasing. ie., multiple
> mappings (at different VA) point to the same gtt_view of object.
> Skip vma_lookup for persistent vmas to support aliasing.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>
