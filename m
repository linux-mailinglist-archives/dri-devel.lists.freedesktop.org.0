Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDCFC0EE8D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F0A10E4D0;
	Mon, 27 Oct 2025 15:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By6s/9az";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672B710E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761578479; x=1793114479;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DfR8yEGjULYaElqLmUFKPxHiRavLiDjroRCl069dEFE=;
 b=By6s/9azPM0CcRwkNylYn0qpBT4HQfRA4xEGmFAtgmx19mhZ7ZaYGaqW
 IaYL6yItD6xbM5VnP9UK2H7KipfoQAplp2A+lmMGYyfatTHaxGV47FfgE
 YcAj6RBkNjve+UbmhyrD7DG0LLRj0rw0nYmgJLmQiRpmZHqeXTbrUgDOq
 X64xGPEPkWELkTuhJDMWY+em3ZHgBIbfjLmOSRTQ3c9Dn3M2TVtdfZ59a
 FTAUXEPP+pS65CFu8QFegPerzt8yEAJojaJAd60xjAs2aBaxpCXKR+xOE
 sD3FSG8FjU0EaLOXwQiioL1tpC9OHg01/yAPO3RbYC6ryzK+SaYDxXCtm w==;
X-CSE-ConnectionGUID: slSVEL4nSwax7nwati6wZQ==
X-CSE-MsgGUID: dvQzL2CFQ5uuJvSFs6Qw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62692494"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62692494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:21:19 -0700
X-CSE-ConnectionGUID: JlPI35h6SUCzaELBh+Vu3w==
X-CSE-MsgGUID: Q+ZVHt8YSk2T/kRzOxAppA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185834123"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.81.7])
 ([10.245.81.7])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:21:17 -0700
Message-ID: <fa290f69-130b-44d2-bdc9-c1cf25ac3bfc@linux.intel.com>
Date: Mon, 27 Oct 2025 16:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove skip of dma unmap for imported buffers
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20251027150933.2384538-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251027150933.2384538-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/27/2025 4:09 PM, Maciej Falkowski wrote:
> Rework of imported buffers introduced in the commit
> e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
> switched the logic of imported buffers by dma mapping/unmaping
> them just as the regular buffers.
>
> The commit didn't include removal of skipping dma unmap of imported
> buffers which results in them being mapped without unmapping.
>
> Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index e7277e02840a..2a159535421a 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -158,9 +158,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  		bo->ctx = NULL;
>  	}
>  
> -	if (drm_gem_is_imported(&bo->base.base))
> -		return;
> -
>  	if (bo->base.sgt) {
>  		if (bo->base.base.import_attach) {
>  			dma_buf_unmap_attachment(bo->base.base.import_attach,
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
