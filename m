Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDFCBD635
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 11:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825F010E2B8;
	Mon, 15 Dec 2025 10:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jt90EQFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3CB10E2B8;
 Mon, 15 Dec 2025 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765795212; x=1797331212;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o9H/LKs925Vskw9BGFDaGUHnHJQgq3SNAII98dtIPk4=;
 b=jt90EQFO8dZTy9sGCdVM5FBpucbYR6BWerA5y+tDPlEY2F95dR2u9utk
 KXG9GswDREblf6kblvFCvlnnqRpqLgIz8lP3U7wmcBJTlPDl2gDMS1S4w
 t9gYXO2CeAOZeW+Y4WDpw2Ey0pQi2RIQEXMCwlXyqYzHcRmRAPkLd62AG
 Mvld5hBU30ii6JPqNfGDdhP6oQms7BmwISXa42Vmt7xnR3zrUBTpa4zHe
 xQc0ILJDNIaWJZVWvTB5gtHRR898yRiTwzjlOHGraFbCl4sCjZps0u6JO
 vTdeNPK5nBuZ6BGJcaP5ahDD04042KhdqSG+WWSnJeNaCDzpsbvzu78eD w==;
X-CSE-ConnectionGUID: G8M15H3lQwG+G9tr2zvluA==
X-CSE-MsgGUID: UcqbAVgFR8aTVaIM+Y1X6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67576001"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67576001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:40:11 -0800
X-CSE-ConnectionGUID: AUDHU6dyR8SEAwaOJCOBMA==
X-CSE-MsgGUID: +wWs2tQzSlmkdLptHlzu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202103886"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:40:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/gem: fix build for mm_get_unmapped_area() call
 after backmerge
In-Reply-To: <aT_Wn63528lO8fOu@fdugast-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215092706.3218018-1-jani.nikula@intel.com>
 <aT_Wn63528lO8fOu@fdugast-desk>
Date: Mon, 15 Dec 2025 12:40:07 +0200
Message-ID: <3d78a20a6960e69cbb477ab366e82b8c1567b1e6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 15 Dec 2025, Francois Dugast <francois.dugast@intel.com> wrote:
> On Mon, Dec 15, 2025 at 11:27:06AM +0200, Jani Nikula wrote:
>> Commit 9ac09bb9feac ("mm: consistently use current->mm in
>> mm_get_unmapped_area()") upstream dropped a parameter from
>> mm_get_unmapped_area() while commit 99bda20d6d4c ("drm/gem: Introduce
>> drm_gem_get_unmapped_area() fop") in drm-misc-next added a new user.
>> 
>> Drop the extra parameter from the call.
>> 
>> Fixes: 7f790dd21a93 ("Merge drm/drm-next into drm-misc-next")
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_gem.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index bcc08a6aebf8..28d6792112be 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1303,8 +1303,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>>  
>>  	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>>  	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>> -		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
>> -					    flags);
>> +		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>>  
>>  	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>>  						 flags);
>> -- 
>> 2.47.3
>> 

-- 
Jani Nikula, Intel
