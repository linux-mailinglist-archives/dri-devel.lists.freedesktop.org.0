Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6DB91206B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A2310F129;
	Fri, 21 Jun 2024 09:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbVjIxfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687B10F125;
 Fri, 21 Jun 2024 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718961880; x=1750497880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XboIY6qFvbRwfGMMF2AcRwDyU7lcA8/+oLJJ1frWXJA=;
 b=UbVjIxfYnHs/WvasYGrfUfgKvH4fnfb/HVnneNZhLZ2RJbxOGLoPj3Ry
 MVEsf6AJEm+wM+1rP5m1jDx0v5ZRhedwBAY0qk6XcXzb4fCMBhJEMkonK
 skthAYvn1xsrIcg5Ztqu6pRt+l4/zH+yS4mP3ng/fZp8XG8cRhM6w+L89
 wLgT+fz6lW7Jot9rol5duZ10XYpb08hvO2UzV1Vouz1dtGw5vD3Y4/w2c
 AO/Sv7ugVpaD9MrAUeyBTfGocQt3Wy5B9nL0D/t8EcIkFbGMDjD51ljhZ
 j+uW/tcRfXaS/Qq2WNzkF0vs5MYelm359qjn/Pt+9JTVYwk066TXGY1s2 g==;
X-CSE-ConnectionGUID: IUj7XssRTCeeuoUkwGfSEA==
X-CSE-MsgGUID: Yy9opqCZRHG+Vax4dBFplg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="12179357"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="12179357"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:24:39 -0700
X-CSE-ConnectionGUID: 088dLW81QX+rFTjxz8Uoig==
X-CSE-MsgGUID: olP6rLtqQP2KVGFmPsjgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42402517"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:24:38 -0700
Message-ID: <6e23bf3b-4c7c-411a-a0fa-02af98c8c4e5@intel.com>
Date: Fri, 21 Jun 2024 10:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/bo: Fix fixed placement ggtt pinning code
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
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

On 21/06/2024 08:15, Alan Previn wrote:
> When calling xe_bo_create_pin_map_at, use the correct
> starting offset provided by caller at xe_ggtt_insert_bo_at.
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 74294f1b05bc..cc6101b49c08 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1436,7 +1436,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>   
>   		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
>   			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
> -						   start + bo->size, U64_MAX);
> +						   start, end);


I think this is just about controlling the ggtt bias range. i.e please 
allocate bo->size somewhere within [start + bo->size, U64_MAX]. There 
was a reason for the + bo->size, I think something odd like initial fb 
using low ggtt address (pre-programmed by bios), and wanting to use that 
for guc or something instead so we effectively move it with the above.

I think we also only need such an interface for funky stuff like initial 
fb, which is either in stolen or vram. The actual allocate backing pages 
part of the api should respect start, like for vram and stolen, which is 
the main point of FIXED_PLACEMENT. Trying to do that for system memory 
is not really possible AFAIK.

If we just want something with specific ggtt alignment we could plumb 
that through to the mm interface. For example, put this anywhere within 
ggtt but ensure address is aligned to 256M. We then only pass FLAG_GGTT 
and not FIXED_PLACEMENT.

>   		} else {
>   			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
>   		}
> 
> base-commit: cffd77865f476994680892601e09bc2164179907
