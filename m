Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2B532B6C
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 15:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D303F10F627;
	Tue, 24 May 2022 13:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D8010F647;
 Tue, 24 May 2022 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653399712; x=1684935712;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=QFqBUXi2s8oK0yTtQfj+R94bxwTJdt4J1WAX8qZy0f0=;
 b=fX37iP49JAcR/Ev3kE4glLM0Z3iLy6aGKE319V3FwYpHsZK5UpHE/Ouu
 wfk2CEckUKu9P+IXJ2UlI7+axevdSbb5Mjy+ogD+ACbt2MBCfOL0ZztPi
 DzzghdfzLd9p8Tl1TlQM7rCOH6iug7gcpyXxPQm5kFh6ym7bBQ7m/HEhz
 3lTkd8eGezCJRNbNLH9BHq00OZZKgRn7dpt/QYr36PmO7Y7YGQxoIQJlF
 Lw54TvjsJIyh6ecqwfI2swa+DtnLn7F0njuZKCe0KpjYNp7gi010nfeha
 CI1r5D7I71LmFlQ80vnQlVKNkq3SR50O3mPR4vf4yk6C6s8VnKQQOziRI A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273528142"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273528142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:41:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="526406548"
Received: from bdunajsk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.147.125])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:41:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v1 01/13] drm/edid: add block count and data
 helper functions for drm_edid
In-Reply-To: <14a7a41a-35bb-000b-b3cf-fbc4071413c8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
 <14a7a41a-35bb-000b-b3cf-fbc4071413c8@intel.com>
Date: Tue, 24 May 2022 16:41:45 +0300
Message-ID: <87v8tvujxi.fsf@intel.com>
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

On Tue, 24 May 2022, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> On 24.05.2022 12:39, Jani Nikula wrote:
>> Add drm_edid based block count and data access helper functions that
>> take the EDID allocated size into account.
>> 
>> At the moment, the allocated size should always match the EDID size
>> indicated by the extension count, but this will change in the future.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 35 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 929fc0e46751..682d954a9e42 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1613,6 +1613,35 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
>>   	return edid_block_data(edid, index + 1);
>>   }
>>   
>> +static int drm_edid_block_count(const struct drm_edid *drm_edid)
>> +{
>> +	int num_blocks;
>> +
>> +	/* Starting point */
>> +	num_blocks = edid_block_count(drm_edid->edid);
>> +
>> +	/* Limit by allocated size */
>> +	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
>> +
>> +	return num_blocks;
>> +}
>> +
>> +static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
>> +{
>> +	return drm_edid_block_count(drm_edid) - 1;
>> +}
>> +
>> +static const void *drm_edid_block_data(const struct drm_edid *drm_edid, int index)
>> +{
>> +	return edid_block_data(drm_edid->edid, index);
>> +}
>> +
>> +static const void *drm_edid_extension_block_data(const struct drm_edid *drm_edid,
>> +						 int index)
>> +{
>> +	return edid_extension_block_data(drm_edid->edid, index);
>> +}
>> +
>>   /*
>>    * Initializer helper for legacy interfaces, where we have no choice but to
>>    * trust edid size. Not for general purpose use.
>> @@ -1665,8 +1694,8 @@ static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
>>   	if (!iter->drm_edid)
>>   		return NULL;
>>   
>> -	if (iter->index < edid_block_count(iter->drm_edid->edid))
>> -		block = edid_block_data(iter->drm_edid->edid, iter->index++);
>> +	if (iter->index < drm_edid_block_count(iter->drm_edid))
>> +		block = drm_edid_block_data(iter->drm_edid, iter->index++);
>>   
>>   	return block;
>>   }
>> @@ -3574,22 +3603,21 @@ static int add_detailed_modes(struct drm_connector *connector,
>>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>   				  int ext_id, int *ext_index)
>>   {
>> -	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
>
> Do we still need this var?

I am removing it...?

>
>
>>   	const u8 *edid_ext = NULL;
>>   	int i;
>>   
>>   	/* No EDID or EDID extensions */
>> -	if (!edid || !edid_extension_block_count(edid))
>> +	if (!drm_edid || !drm_edid_extension_block_count(drm_edid))
>>   		return NULL;
>>   
>>   	/* Find CEA extension */
>> -	for (i = *ext_index; i < edid_extension_block_count(edid); i++) {
>> -		edid_ext = edid_extension_block_data(edid, i);
>> +	for (i = *ext_index; i < drm_edid_extension_block_count(drm_edid); i++) {
>> +		edid_ext = drm_edid_extension_block_data(drm_edid, i);
>>   		if (edid_block_tag(edid_ext) == ext_id)
>>   			break;
>>   	}
>>   
>> -	if (i >= edid_extension_block_count(edid))
>> +	if (i >= drm_edid_extension_block_count(drm_edid))
>>   		return NULL;
>>   
>>   	*ext_index = i + 1;
>
> It looks OK. Some suggestions to consider:
> 1. While at it, refactor little bit the code to return ext from 'for' 
> loop and NULL later (to kill after-loop checks, and better code IMO).
> 2. Implement kind of iterator, for example 
> drm_edid_extension_block_next(drm_edid, edid_ext), then use loop:
> for (edid_ext = NULL; edid_ext = drm_edid_extension_block_next(drm_edid, 
> edid_ext;)
> 	...
>
> Up to you.
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

There's already the struct drm_edid_iter stuff that this could be
converted to, but just haven't gotten around to it yet. I'll follow up
with that later. Thanks for the review.

BR,
Jani.

>
> Regards
> Andrzej
>

-- 
Jani Nikula, Intel Open Source Graphics Center
