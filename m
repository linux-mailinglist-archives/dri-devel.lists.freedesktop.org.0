Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C9D6E6A0B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 18:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280D710E48F;
	Tue, 18 Apr 2023 16:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1990E10E48F;
 Tue, 18 Apr 2023 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681836266; x=1713372266;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5vpLfe3QIQVmOsw5kVQYmIImM0d/sebpR+pHLkx5atc=;
 b=On4rqPmnJBOl6XozOilM98lMLSwG35fISUPUW9fuWxbvbzph6S7C18VT
 dzgFUFQUfTjgPF9DkVIkjTge6QkuEC0CLOj57AKOYTCQIQsOhdlC8PDXR
 YR8WCquiuTbmY+vfarHnsV0MFLbUyfICaO2Q8GVlj2m0drgr7NxIId/BH
 EWkvryarKJrP7LcoXQEoWLiLkc5sOmfchAs9sxrmEwqdxi0dsOK+tKpO2
 ZsAZX0mTAYcGl8bnkDMMRwWqdlIMiy4HhqfyyGTggZuDeI2iHj230K70R
 Z19oiRF6bsagoz3yscgpSQzpmmuWIPBY6/3kGH63wkRabSxejsLeGwdLh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408131229"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="408131229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 09:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693687295"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693687295"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 09:44:23 -0700
Message-ID: <b2241375-ba94-750d-7b4e-2e008e11d421@linux.intel.com>
Date: Tue, 18 Apr 2023 17:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
 <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
 <CAF6AEGswZZZxwRTOXbCVKmhUYwz8BSu-GDVCJ=FfyJ-w=e4dLQ@mail.gmail.com>
 <0faa3b0f-342c-87e0-9587-f8c11131689e@linux.intel.com>
 <CAF6AEGu+AbQnPV-1goqJi_RJR7TB8Ta5FXTKn-j6Aq4fiuPN2w@mail.gmail.com>
 <8a16f714-d20a-7608-a08f-88b20dc05d86@linux.intel.com>
 <CAF6AEGuhYNY6z0rHBufVJvXmXrpb9yQRqGrdJkzBK_kFcE0Vtg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGuhYNY6z0rHBufVJvXmXrpb9yQRqGrdJkzBK_kFcE0Vtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/04/2023 17:13, Rob Clark wrote:
> On Tue, Apr 18, 2023 at 7:46 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 18/04/2023 15:36, Rob Clark wrote:
>>> On Tue, Apr 18, 2023 at 7:19 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>>
>>>> On 18/04/2023 14:49, Rob Clark wrote:
>>>>> On Tue, Apr 18, 2023 at 2:00 AM Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 17/04/2023 20:39, Rob Clark wrote:
>>>>>>> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>
>>>>>>>> Add support to dump GEM stats to fdinfo.
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>> ---
>>>>>>>>      Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>>>>>>>>      drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>>>>>>>>      include/drm/drm_drv.h                 |  7 ++++
>>>>>>>>      include/drm/drm_file.h                |  8 +++++
>>>>>>>>      4 files changed, 79 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> index 2ab32c40e93c..8273a41b2fb0 100644
>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> @@ -21,6 +21,7 @@ File format specification
>>>>>>>>
>>>>>>>>      - File shall contain one key value pair per one line of text.
>>>>>>>>      - Colon character (`:`) must be used to delimit keys and values.
>>>>>>>> +- Caret (`^`) is also a reserved character.
>>>>>>>
>>>>>>> this doesn't solve the problem that led me to drm-$CATEGORY-memory... ;-)
>>>>>>
>>>>>> Could you explain or remind me with a link to a previous explanation?
>>>>>
>>>>> How is userspace supposed to know that "drm-memory-foo" is a memory
>>>>> type "foo" but drm-memory-foo^size is not memory type "foo^size"?
>>>>
>>>> Are you referring to nvtop?
>>>
>>> I'm not referring to any particular app.  It could even be some app
>>> that isn't even written yet but started with an already existing
>>> kernel without this change.  It is just a general point about forwards
>>> compatibility of old userspace with new kernel.  And it doesn't really
>>> matter what special character you use.  You can't retroactively define
>>> some newly special characters.
>>
>> What you see does not work if we output both legacy and new key with
>> extra category? Userspace which hardcode the name keep working, and
>> userspace which parses region names as opaque strings also keeps working
>> just shows more entries.
> 
> well, it shows nonsense entries.. I'd not call that "working"
> 
> But honestly we are wasting too many words on this.. we just can't
> re-use the "drm-memory-<anything>" namespace, it is already burnt.
> Full stop.
> 
> If you don't like the "drm-$CATEGORY-$REGION" workaround then we can
> shorten to "drm-mem-$REGION-$CATEGORY" since that won't accidentally
> match the existing "drm-memory-" pattern.

I can live with that token reversal, it was not the primary motivation 
for my RFC as we have discussed that side of things already before I 
sketched my version up.

But I also still don't get what doesn't work with what I described and 
you did not really address my specific questions with more than a 
"doesn't work" with not much details.

Unless for you it starts and ends with "nonsense entries". If so then it 
seems there is no option than to disagree and move on. Again, I can 
accept the drm-$category-memory-$region.

Regards,

Tvrtko
