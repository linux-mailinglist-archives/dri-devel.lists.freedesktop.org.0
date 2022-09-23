Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B145E7DA4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9710E540;
	Fri, 23 Sep 2022 14:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C0B10E3EB;
 Fri, 23 Sep 2022 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663944817; x=1695480817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VDfgc4MiASMeAgQ1mGxjhaI4E2768/Rj1ktZhJ07pWk=;
 b=aqaeLv2NiutNxvw1NMhPTwS1aQVvzmvrZDdL8YZyzxRjo3mQePzzSx17
 N1aSyUyutCJgEuEantvR0yjI1dI2t9lRmoXLcazdhmYIaD8kdP4skjdbY
 Y8ebGgs20WjYM4O4Gsf6UxNjXyX6GgEAVa1nhTqdpgbD6h0WY4a4QGrUP
 3QPUTL7Odtk+41EB8xAkQdKisFOjRy/syuLL0chvUWgDJztLxV3zVrlqi
 xwMuO66hD0DvaOXtcFlN66l7IVxYVIdYJUbfAPxeNcYiwRxeah1jGSf+O
 uynceImEgxXAp+D2kyN/2edWYPpc9Zsrf7GKDbu0HEixV+hNzNKV21Mif g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300590543"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300590543"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="622542874"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.20])
 ([10.213.6.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:53:35 -0700
Message-ID: <45c4169f-7c24-2a72-ba85-2975188e25bd@intel.com>
Date: Fri, 23 Sep 2022 16:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Improve debug print in
 vm_fault_ttm
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220923084506.11968-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220923084506.11968-1-nirmoy.das@intel.com>
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
Cc: matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.09.2022 10:45, Nirmoy Das wrote:
> Print the error code returned by __i915_ttm_migrate()
> for better debuggability.
> 
> v2: Fix kernel test robot warning.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com > ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e3fc38dd5db0..55455321f652 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1034,7 +1034,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   		}
>   
>   		if (err) {
> -			drm_dbg(dev, "Unable to make resource CPU accessible\n");
> +			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", ERR_PTR(err));

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   			dma_resv_unlock(bo->base.resv);
>   			ret = VM_FAULT_SIGBUS;
>   			goto out_rpm;

