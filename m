Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D571A63BD46
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 10:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7897510E3A0;
	Tue, 29 Nov 2022 09:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCF10E3A0;
 Tue, 29 Nov 2022 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669715460; x=1701251460;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=va4oFqeghkExL+xaPKGG+xULxrpZnJfLBRDcWTTKGUM=;
 b=cKa0kUkAxrT5aiyWFbTlK1wDxfaiz45F2u3hWTwui3ivbJyoF70KSpBC
 zSB7EzG/4Ijz2t0GwU+YZzb6JWw3sDeXVOc6cNPl5rTOxAw92wiVyTVx3
 0/4AZtESF4tpuPoOGe8GdK0yxBns23RYE0L71kUauOFf1043bDaOy6xN4
 +uiS71eX2/LX6d92iJ3x/2amFzygHy/y3G+3IVxdKlEmj8XxtM8sroJCA
 TPSXkdQDDi2QHRpCK3x9A56g9sZwk1J+7sqjZhLdVtMbNYySyIKT3OLvl
 C11NM2XPO1s8S/NHye1KUsFtooGsowOOeJ29c9S3WD4KDTkKqisi+O3Yl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="315099373"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="315099373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:50:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="707151581"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="707151581"
Received: from lclaesso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:50:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xia Fukun <xiafukun@huawei.com>, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 joonas.lahtinen@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/bios: fix a memory leak in
 generate_lfp_data_ptrs
In-Reply-To: <875yf35tx1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221125063428.69486-1-xiafukun@huawei.com>
 <875yf35tx1.fsf@intel.com>
Date: Tue, 29 Nov 2022 11:50:43 +0200
Message-ID: <87fse23x8s.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, xiafukun@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 25 Nov 2022, Xia Fukun <xiafukun@huawei.com> wrote:
>> When (size != 0 || ptrs->lvds_ entries != 3), the program tries to
>> free() the ptrs. However, the ptrs is not created by calling kzmalloc(),
>> but is obtained by pointer offset operation.
>> This may lead to memory leaks or undefined behavior.
>
> Yeah probably worse things will happen than just leak.
>
>>
>> Fix this by replacing the arguments of kfree() with ptrs_block.
>>
>> Fixes: a87d0a847607 ("drm/i915/bios: Generate LFP data table pointers if the VBT lacks them")
>> Signed-off-by: Xia Fukun <xiafukun@huawei.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 28bdb936cd1f..edbdb949b6ce 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -414,7 +414,7 @@ static void *generate_lfp_data_ptrs(struct drm_i915_private *i915,
>>  		ptrs->lvds_entries++;
>>  
>>  	if (size != 0 || ptrs->lvds_entries != 3) {
>> -		kfree(ptrs);
>> +		kfree(ptrs_block);
>>  		return NULL;
>>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
