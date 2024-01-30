Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D8842B0C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4603A1133E8;
	Tue, 30 Jan 2024 17:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A291133D5;
 Tue, 30 Jan 2024 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706636005; x=1738172005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KSB7tkjt5NHOnmeAWv0SsMQD2u1mtV1h5F6FvtwrSfA=;
 b=MlslKQ274zB+ibApgm4TNPnHSnUNcVSN11XRFxG2SjHxlGTrLHEZzUJo
 xeBRrb9ybL8zWgTIqEwWwFPjsyoKU/Bbv2Ioy4/f4hL49dlhYd3mFmfYT
 qgQA82adxexGhFXgdrjwUH/OgYwNlssKRVQXjBA0hRwFfxoItzbLhyTEd
 TWQ2AOW5InR8PruQhoVAwMOPp6Su99vdWsNRFZdDL5k/C/BAEdtSlCS+B
 /ibAzycdr2HX/oOCm8fwYBKrCKscQiBOV1xnMw0W2g5yFzA7n76l3KEsq
 1+d31wJV3nmo0c68mClvuSF9THdtcFSxOWZFTuBGJENbqiU5PkOiWsVaN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402952826"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="402952826"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119316361"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="1119316361"
Received: from nkumi-mobl3.ger.corp.intel.com (HELO [10.213.210.105])
 ([10.213.210.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:25:23 -0800
Message-ID: <0259aab4-9f0d-4e79-a6ae-0bc026d12136@linux.intel.com>
Date: Tue, 30 Jan 2024 16:25:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm: update drm_show_memory_stats() for dma-bufs
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, daniel@ffwll.ch
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
 <20240130161235.3237122-4-alexander.deucher@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240130161235.3237122-4-alexander.deucher@amd.com>
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



On 30/01/2024 16:12, Alex Deucher wrote:
> Show buffers as shared if they are shared via dma-buf as well
> (e.g., shared with v4l or some other subsystem).
> 
> v2: switch to gem helper
> 
> Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
> Reviewed-by: Rob Clark <robdclark@gmail.com> (v1)
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/drm_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 8c87287c3e16..638ffa4444f5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -913,7 +913,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   					DRM_GEM_OBJECT_PURGEABLE;
>   		}
>   
> -		if (obj->handle_count > 1) {
> +		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
>   			status.shared += obj->size;
>   		} else {
>   			status.private += obj->size;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
