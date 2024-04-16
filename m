Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176118A6ADA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC1810F065;
	Tue, 16 Apr 2024 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MU6dYIS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F102310F062;
 Tue, 16 Apr 2024 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713270279; x=1744806279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uxsjQHuhxxD2zkPITtQUCN2fmYVf/bf10CIt3VGM6nE=;
 b=MU6dYIS09uPLSGjSQ4jc6Xe7BMiHJ05vK4GIXmmDqMCtEs/zCEJNPLgm
 XVnfhV4zO+qea4gpU4X/3lNAYNLAwcOC8wfIKHr71bQR8eGVeYQ3qwvpC
 5KR0HtInCb/lOTc1wQf1r65Kr6VVsssygGR/+JuH7ZoJFWE99hi5HVO0b
 ksvwvIU7GIuiFeaek0UMZLSDwlYNdH05bu8M3NkK8/giUGAUeg9osT1jY
 WLYAGyJnr9M6YdQbMWj/qLGZyR1Lvd85APl+8ac2RSmFta2mKapVWPInQ
 36+IIvsCej1Jiunkxp4XznYWvttwX/DCDstIODtAmZvj5z1n7stIlAiXl w==;
X-CSE-ConnectionGUID: /h+6qj5URACWtaXIeAbRrQ==
X-CSE-MsgGUID: Gyber7reT5eyJ66fShMHcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11649601"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="11649601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 05:24:38 -0700
X-CSE-ConnectionGUID: fHdp9ieCSceU83gdmgUNUQ==
X-CSE-MsgGUID: itQRKseASZS2kESCmYFjsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22306159"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 05:24:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [REBASE 5/7] drm/edid: avoid drm_edid_find_extension() internally
In-Reply-To: <fb57c317-25ec-4001-abb4-cb52b0aff741@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713259151.git.jani.nikula@intel.com>
 <9fa366147b06a28304527be48f1b363c3484c8a3.1713259151.git.jani.nikula@intel.com>
 <fb57c317-25ec-4001-abb4-cb52b0aff741@suse.de>
Date: Tue, 16 Apr 2024 15:24:34 +0300
Message-ID: <87jzkxze9p.fsf@intel.com>
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

On Tue, 16 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 16.04.24 um 11:19 schrieb Jani Nikula:
>> Prefer the EDID iterators over drm_edid_find_extension() in
>> drm_edid_has_cta_extension(), even if this leads to more code. The key
>> is to use the same patterns as much as possible.
>
> Should this patch go before patch 4? That would limit the impact of the 
> latter.

I can if you want, IMO not a big deal.

> Why is this instance different than the one in 
> drm_find_displayid_extension()? Best regards Thomas

Overall I'd like to get rid of the function altogether, but I'm
undecided what the replacement interface towards drm_displayid.c should
be. Maybe expose the drm_edid_iter_* stuff? But I really don't want
anyone to export and start using them in drivers.

BR,
Jani.

>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index c29f31dcc818..4b3ad42a8f95 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4230,11 +4230,21 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
>>   {
>>   	const struct displayid_block *block;
>>   	struct displayid_iter iter;
>> -	int ext_index = 0;
>> +	struct drm_edid_iter edid_iter;
>> +	const u8 *ext;
>>   	bool found = false;
>>   
>>   	/* Look for a top level CEA extension block */
>> -	if (drm_edid_find_extension(drm_edid, CEA_EXT, &ext_index))
>> +	drm_edid_iter_begin(drm_edid, &edid_iter);
>> +	drm_edid_iter_for_each(ext, &edid_iter) {
>> +		if (ext[0] == CEA_EXT) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +	drm_edid_iter_end(&edid_iter);
>> +
>> +	if (found)
>>   		return true;
>>   
>>   	/* CEA blocks can also be found embedded in a DisplayID block */

-- 
Jani Nikula, Intel
