Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02457FEA0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87311363E;
	Mon, 25 Jul 2022 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AF311363E;
 Mon, 25 Jul 2022 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658749856; x=1690285856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VMJunOLuMBrFoaZqfAHBdmadFHKFANoKNw0Q+exbcm8=;
 b=gLRlwjInyeuv8chqwOBgTJbNDmkLJWeIEJtvivobWjpGkinA3focozNA
 mqx3w8PtJm2CQB8T3qmutoWRTaV0OxrTRDbqe6ZjZrAxePjGIDQ6l0+mT
 UxXO0CjUjnyvxCWGSMJG80PIZEcuBQzL1rn9//LtA4+GrChKScmYDAaRD
 CZ9y/Z4Rovzv6KAR2iQ/oh0UUvk6kNd/2i7SX/dD70Aidt97W0+EQVG1O
 vwHgN+DB2mDRJIcOB/cVmZNdlRkVN9iMynfvlTYAeMORoLIhh3lSL5y67
 j8KmycwKKy96pHFv3BX+vUS1cIkRqiNV2cx6CN7ptB/jP2imVfYAdm2vY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="270713861"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="270713861"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:50:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="632330726"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.24])
 ([10.213.13.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:50:51 -0700
Message-ID: <627131b0-7ca3-80db-7dd2-c08e7be1fd9b@intel.com>
Date: Mon, 25 Jul 2022 13:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v5 2/7] drm/i915/gem: Typecheck page lookups
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-3-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220725092528.1281487-3-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> We need to check that we avoid integer overflows when looking up a page,
> and so fix all the instances where we have mistakenly used a plain
> integer instead of a more suitable long. Be pedantic and add integer
> typechecking to the lookup so that we can be sure that we are safe.
> And it also uses pgoff_t as our page lookups must remain compatible with
> the page cache, pgoff_t is currently exactly unsigned long.
> 
> v2: Move added i915_utils's macro into drm_util header (Jani N)
> v3: Make not use the same macro name on a function. (Mauro)
>      For kernel-doc, macros and functions are handled in the same namespace,
>      the same macro name on a function prevents ever adding documentation
>      for it.
> v4: Add kernel-doc markups to the kAPI functions and macros (Mauoro)
> v5: Fix an alignment to match open parenthesis
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
