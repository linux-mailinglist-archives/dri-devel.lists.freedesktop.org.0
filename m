Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BD527F52
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098A9112B92;
	Mon, 16 May 2022 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC23112B92;
 Mon, 16 May 2022 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652688725; x=1684224725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v2Z88oTsJs3+GQocdaeMUBul37U8vY3QOzFnfK7oZjI=;
 b=Kyk4JWxejtXqaIZKJij6DR1vBgxZKhYFIHYUF3imDXdozHYXLnHwYyw8
 hHiXyuwCks7dOkX+mFZUitr7s/krKzvioN4FGTGLg4z8z9J2u1eia+TUz
 bMxjqFfWLth7mhUknVlenCB1tFzPj6NIqlXMCl8dL4DiMBa73KO5Ssy6l
 ezUQE4jHSZ/5jqwfKPolEQm+R075EK/Z0hiW2ZeDJ/H+PJK6qpKFTuVXW
 0pwRFPwAMXRLB4d2ZtpUp7NkkbneBSjdtNLH+E9nBR/00Z7ZGxND8o4f+
 C7lHDu0wYQW2bEY1FjjaSLBJkA9xqsdJuwPYlSoO3pTk1jtmNY4JtWfnu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="270718997"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="270718997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:12:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596410220"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:12:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 03/25] drm/edid: add struct drm_edid
 container
In-Reply-To: <0d36849d-fb09-c507-894a-f5c5e5340997@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1652097712.git.jani.nikula@intel.com>
 <f3ecabd8a219aea678ad00f7bcdecf77b27b3c78.1652097712.git.jani.nikula@intel.com>
 <0d36849d-fb09-c507-894a-f5c5e5340997@intel.com>
Date: Mon, 16 May 2022 11:11:59 +0300
Message-ID: <87v8u5hp68.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> LGTM.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Thanks for the review, pushed the lot already on Friday.

BR,
Jani.

>
> Regards,
>
> Ankit
>
> On 5/9/2022 5:33 PM, Jani Nikula wrote:
>> Introduce new opaque type struct drm_edid to encapsulate the EDID data
>> and the size allocated for it. The contents will be private to
>> drm_edid.c.
>>
>> There are a number of reasons for adding a container around struct edid:
>>
>> * struct edid is a raw blob pointer to data that usually originates
>>    outside of the kernel. Its size is contained within the structure.
>>
>> * There's no way to attach meta information (such as allocated memory
>>    size) to struct edid.
>>
>> * Validation of the EDID blob and its size become crucial, and it's
>>    spread all over the subsystem, with varying levels of accuracy.
>>
>> * HDMI Forum has introduced an HF-EEODB extension that defines an
>>    override EDID size within an EDID extension. The size allocated for an
>>    EDID depends on whether the allocator understands the HF-EEODB
>>    extension. Given a struct edid *, it's impossible to know how much
>>    memory was actually allocated for it.
>>
>> There are also some reasons for making the container type struct
>> drm_edid opaque and private to drm_edid.c:
>>
>> * Have only one place for creating and parsing the EDID, to avoid
>>    duplicating bugs.
>>
>> * Prepare for reading a pure DisplayID 2.0 from its own DDC address, and
>>    adding it within the same struct drm_edid container, transparently,
>>    and for all drivers.
>>
>> * With the idea that the drm_edid objects are immutable during their
>>    lifetimes, it will be possible to refcount them and reduce EDID
>>    copying everywhere (this is left for future work).
>>
>> Initially, just add the type. In follow-up, we'll start converting the
>> guts of drm_edid.c to use it, and finally add interfaces around it.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index dcef92c8887a..480fd9fbe412 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1567,6 +1567,15 @@ static const struct drm_display_mode edid_4k_modes[] = {
>>   
>>   /*** DDC fetch and block validation ***/
>>   
>> +/*
>> + * The opaque EDID type, internal to drm_edid.c.
>> + */
>> +struct drm_edid {
>> +	/* Size allocated for edid */
>> +	size_t size;
>> +	const struct edid *edid;
>> +};
>> +
>>   static int edid_extension_block_count(const struct edid *edid)
>>   {
>>   	return edid->extensions;

-- 
Jani Nikula, Intel Open Source Graphics Center
