Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A68A6AE4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA310F05F;
	Tue, 16 Apr 2024 12:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMmdJG+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491E910F05C;
 Tue, 16 Apr 2024 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713270483; x=1744806483;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ET/e1zQSLNAHBMFREalWJxxiSJdwMcYsufnfC0a1jB4=;
 b=nMmdJG+1abdJ2ZCri5jWkY1ErQ64uONvrLqV/JE7W218SMRmMs4S1Yyx
 S+jl0wCdUSGwkKlIFUEqR42AiNFG5ynZtTri58nwo5ZpOte7CJK3SdiDz
 pUvGpbCk6RrUQj0JMGx0TjRmModPrtFUKyxo8HSwxm+9bWHG0HfX5AWoa
 pMndoyKwPbA2JbA882Cmie39VundCxs83qQvqXmP7/dpzVCBXVrVi9JVm
 Y9E6kMlnxFwQjQnBg6UwbeF2ypkzHSdekJ9vrogKtJXsW4OA1PNaHG9he
 iR8OlikIMueCgSo7IORU6bt4ov2Ox8JZYkvtwFuwrjhtYPN807QGkWTik g==;
X-CSE-ConnectionGUID: YU+lAKIdTFi8lRTz24apFg==
X-CSE-MsgGUID: weM2nWNDQ1S1nJXvTEUvKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12480523"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="12480523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 05:28:02 -0700
X-CSE-ConnectionGUID: VARXVk0URlWu0PlRBcLJSQ==
X-CSE-MsgGUID: 4wUXCZAhThSeiRSaKefu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26908988"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 05:28:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [REBASE 7/7] drm/edid: make drm_edid_are_equal() more
 convenient for its single user
In-Reply-To: <a2e36f83-0e5c-4a57-bf31-37665f8ece71@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713259151.git.jani.nikula@intel.com>
 <1011a285d30babce3aabd8218abb7ece7dcf58a2.1713259151.git.jani.nikula@intel.com>
 <a2e36f83-0e5c-4a57-bf31-37665f8ece71@suse.de>
Date: Tue, 16 Apr 2024 15:27:57 +0300
Message-ID: <87h6g1ze42.fsf@intel.com>
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
> Am 16.04.24 um 11:20 schrieb Jani Nikula:
>> Repurpose drm_edid_are_equal() to be more helpful for its single user,
>> and rename drm_edid_eq(). Functionally deduce the length from the blob
>> size, not the blob data, making it more robust against any errors.
>
> Could be squashed into patch 6.

Ack.

Thanks for the review. I'll hold of on resending these until there are
some R-b's... I've send them a few times already with no comments. :(

BR,
Jani.

>
> Best regards
> Thomas
>
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 41 ++++++++++++++------------------------
>>   1 file changed, 15 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 463fbad85d90..513590931cc5 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1820,30 +1820,20 @@ static bool edid_block_is_zero(const void *edid)
>>   	return !memchr_inv(edid, 0, EDID_LENGTH);
>>   }
>>   
>> -/**
>> - * drm_edid_are_equal - compare two edid blobs.
>> - * @edid1: pointer to first blob
>> - * @edid2: pointer to second blob
>> - * This helper can be used during probing to determine if
>> - * edid had changed.
>> - */
>> -static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
>> +static bool drm_edid_eq(const struct drm_edid *drm_edid,
>> +			const void *raw_edid, size_t raw_edid_size)
>>   {
>> -	int edid1_len, edid2_len;
>> -	bool edid1_present = edid1 != NULL;
>> -	bool edid2_present = edid2 != NULL;
>> +	bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
>> +	bool edid2_present = raw_edid && raw_edid_size;
>>   
>>   	if (edid1_present != edid2_present)
>>   		return false;
>>   
>> -	if (edid1) {
>> -		edid1_len = edid_size(edid1);
>> -		edid2_len = edid_size(edid2);
>> -
>> -		if (edid1_len != edid2_len)
>> +	if (edid1_present) {
>> +		if (drm_edid->size != raw_edid_size)
>>   			return false;
>>   
>> -		if (memcmp(edid1, edid2, edid1_len))
>> +		if (memcmp(drm_edid->edid, raw_edid, drm_edid->size))
>>   			return false;
>>   	}
>>   
>> @@ -6936,15 +6926,14 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
>>   	int ret;
>>   
>>   	if (connector->edid_blob_ptr) {
>> -		const struct edid *old_edid = connector->edid_blob_ptr->data;
>> -
>> -		if (old_edid) {
>> -			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
>> -				connector->epoch_counter++;
>> -				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
>> -					    connector->base.id, connector->name,
>> -					    connector->epoch_counter);
>> -			}
>> +		const void *old_edid = connector->edid_blob_ptr->data;
>> +		size_t old_edid_size = connector->edid_blob_ptr->length;
>> +
>> +		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
>> +			connector->epoch_counter++;
>> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
>> +				    connector->base.id, connector->name,
>> +				    connector->epoch_counter);
>>   		}
>>   	}
>>   

-- 
Jani Nikula, Intel
