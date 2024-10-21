Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC89A5FB2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C24810E456;
	Mon, 21 Oct 2024 09:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gsx/PQSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8F710E456;
 Mon, 21 Oct 2024 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729501655; x=1761037655;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wpRhA2ljVPeCf5nT5C2lTaLYCpjjggu0c9MRoee2Fwc=;
 b=Gsx/PQSd3upnfMGrL/YLwiRI3fajjGpEQnylvY8AFbk84ahkWQaDpZLC
 pDUypY6H8VoACk8adSr9/X3b+uSR37CqxG8d+CN+EZ+815h2/DLaTNsJu
 QTEFvBt/WeSmZI6agXzCiVMNC29xygKmrQK0nIdh2F3j8vTIrkoOJm56Q
 xfh04xEH+EJ1DFL/nGc6tPkax3zy9gAPK8Et40sLeaQPEzPEAFcdHid0S
 QoBoJlc4yu/zZTgJZXAxv36guwiW5s+aTquYxsXAXBzq0240gjeTXXBQC
 yLojiXEieTg0H7nTpAp5BWEsn/LFkctfFA1kD2akyZr4qRBpMtu4eRvY0 w==;
X-CSE-ConnectionGUID: QL7ScAQ6QyWSsfnAXoZYlA==
X-CSE-MsgGUID: bW3LDq5HRPmBe2/5/hvtEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28852621"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="28852621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:07:35 -0700
X-CSE-ConnectionGUID: vkvvP4UMQ1WqdZve735COA==
X-CSE-MsgGUID: 8tg4+vsWSsehcexGEQjzgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79468322"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.206])
 ([10.245.245.206])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:07:33 -0700
Message-ID: <3a956975-4e6b-4990-80e2-769872d17816@intel.com>
Date: Mon, 21 Oct 2024 10:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-5-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241019192030.1505020-5-matthew.brost@intel.com>
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

On 19/10/2024 20:20, Matthew Brost wrote:
> Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
> instead.
> 
> v2:
>   - Fix error handling
> 
> Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

The other user looks to be the clear color stuff for display. See 
intel_bo_read_from_page(). I think that is also potentially busted?

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c99380271de6..c8782da3a5c3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3303,7 +3303,6 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>   
>   	for (int i = 0; i < snap->num_snaps; i++) {
>   		struct xe_bo *bo = snap->snap[i].bo;
> -		struct iosys_map src;
>   		int err;
>   
>   		if (IS_ERR(snap->snap[i].data))
> @@ -3316,16 +3315,12 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>   		}
>   
>   		if (bo) {
> -			xe_bo_lock(bo, false);

I think we still need the lock, or is that grabbed somewhere else? Also 
I guess CI doesn't currently hit this path?

> -			err = ttm_bo_vmap(&bo->ttm, &src);
> -			if (!err) {
> -				xe_map_memcpy_from(xe_bo_device(bo),
> -						   snap->snap[i].data,
> -						   &src, snap->snap[i].bo_ofs,
> -						   snap->snap[i].len);
> -				ttm_bo_vunmap(&bo->ttm, &src);
> -			}
> -			xe_bo_unlock(bo);
> +			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
> +					    snap->snap[i].data, snap->snap[i].len, 0);
> +			if (!(err < 0) && err != snap->snap[i].len)
> +				err = -EIO;
> +			else if (!(err < 0))
> +				err = 0;
>   		} else {
>   			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
>   
