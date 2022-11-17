Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E862D95C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3C10E086;
	Thu, 17 Nov 2022 11:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B6E10E086;
 Thu, 17 Nov 2022 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668684364; x=1700220364;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wIhdk+ODh3SdPim6EYJThsglCh/rL6J3AMNR3/FxZbw=;
 b=AORIOgt2zilxZsf8aBt4Tqja2TV1gIsgqSUxI401KapZ+sA+gF867nIc
 A1eS92FonTbtCfcpAYjGbwwI/QzlMvZCBn+FSMIbxaXtKWfzEMT9cKE2R
 YDYYYnnzJCtufFDfvUFJVsnldrxp1xrA/iMNZV8tECy2X5ngSUvGwhLwl
 noRcLVRlBVNjDRdjjcFzkVE8NQ5Hp43PmGxkjr3o7UrZokqAVKfen9RQm
 mKUG0i4bUb+esuEnKAn46ypeQUN0PSsvZ/J68kdPQK2XUSPilUERF3V4Q
 Bcc6R5UXO4UFWjWTJg8TMJVyfulyYF1MRqA8YVZEGfCQWSFF1MUYP5Yr7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="311530094"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="311530094"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 03:25:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639768415"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="639768415"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.18.140])
 ([10.252.18.140])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 03:25:51 -0800
Message-ID: <423905ec-1584-3035-7c9e-d118296b4d04@intel.com>
Date: Thu, 17 Nov 2022 11:25:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] drm/i915: Ratelimit debug log in vm_fault_ttm
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221013084007.19843-1-nirmoy.das@intel.com>
 <20221013084007.19843-2-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221013084007.19843-2-nirmoy.das@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/10/2022 09:40, Nirmoy Das wrote:
> Test like i915_gem_mman_live_selftests/igt_mmap_migrate can cause
> dmesg spamming. Use ratelimit api to reduce log rate.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7038
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index d63f30efd631..6b60b99461e2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1080,8 +1080,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   		}
>   
>   		if (err) {
> -			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n",
> -				ERR_PTR(err));
> +			drm_dbg_ratelimited(dev,
> +					    "Unable to make resource CPU accessible(err = %pe)\n",
> +					    ERR_PTR(err));
>   			dma_resv_unlock(bo->base.resv);
>   			ret = VM_FAULT_SIGBUS;
>   			goto out_rpm;
