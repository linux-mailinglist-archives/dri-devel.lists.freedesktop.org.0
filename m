Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC9667E66
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 19:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5916510E32F;
	Thu, 12 Jan 2023 18:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6628C10E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673549379; x=1705085379;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9guobFNINFKzs85pMdO4XSWR2kQiBbfRMF9KDbcDOZM=;
 b=TlCs3twkQUCAikiMRPjQ8t3PjR6k+US6j1SPzybVhkaS/ewkXQXGOflI
 msDhcIWgI6N1DLwNR0DQS9wCK3szpMaj9idjM752YGvAxBBrftqqKcdnk
 q4o+To1zut8GIp6jzsRrZWQEYDTSV8Tknj9ROLqOzZFFoC9C6+NZqYVF3
 A7R4RnZBtfrGAQPKokc92T7ii/dmaL3gORYhip1D4fxw1yWkj/auVPNgV
 Ea3a+BNv34TLSdsr1V6nByZHHi1r1mmiT1qSIRoJoeme/2+DnYjSONDDZ
 9OASzdBeA4ImOoaQdsDAFaLarJo0Yoy/6x/It/IYUVlbmnjTLXkF8TNbB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323854146"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="323854146"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:49:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="726429972"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="726429972"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:49:37 -0800
Message-ID: <c80fbf23-00db-3ba2-9af0-2b7fe440bc63@linux.intel.com>
Date: Thu, 12 Jan 2023 18:49:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 3/3] drm: Update file owner during use
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
 <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
 <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
 <3eccd500-9e69-111d-54bd-90e6292b2b98@amd.com>
 <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
 <5a875e31-138e-7e11-3a47-b0b85fc1413f@amd.com>
 <Y7f9weWJc1c0XiG1@phenom.ffwll.local>
 <414e4217-4ba2-3bf2-1c75-b01f679cde54@amd.com>
 <Y7hhu9M1b1thMpVf@phenom.ffwll.local>
 <9a290f65-0cc3-8d32-5039-bb7412fe6c5d@linux.intel.com>
 <Y782AC5kl6+vVKHP@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y782AC5kl6+vVKHP@phenom.ffwll.local>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/01/2023 22:19, Daniel Vetter wrote:
> On Tue, Jan 10, 2023 at 01:14:51PM +0000, Tvrtko Ursulin wrote:
>>
>> On 06/01/2023 18:00, Daniel Vetter wrote:
>>> On Fri, Jan 06, 2023 at 03:53:13PM +0100, Christian König wrote:
>>>> Am 06.01.23 um 11:53 schrieb Daniel Vetter:
>>>>> On Fri, Jan 06, 2023 at 11:32:17AM +0100, Christian König wrote:
>>>>>> Am 05.01.23 um 13:32 schrieb Daniel Vetter:
>>>>>>> [SNIP]
>>>>>>>> For the case of an master fd I actually don't see the reason why we should
>>>>>>>> limit that? And fd can become master if it either was master before or has
>>>>>>>> CAP_SYS_ADMIN. Why would we want an extra check for the pid/tgid here?
>>>>>>> This is just info/debug printing, I don't see the connection to
>>>>>>> drm_auth/master stuff? Aside from the patch mixes up the master opener and
>>>>>>> the current user due to fd passing or something like that.
>>>>>> That's exactly why my comment meant as well.
>>>>>>
>>>>>> The connect is that the drm_auth/master code currently the pid/tgid as
>>>>>> indicator if the "owner" of the fd has changed and so if an access should be
>>>>>> allowed or not. I find that approach a bit questionable.
>>>>>>
>>>>>>> Note that we cannot do that (I think at least, after pondering this some
>>>>>>> more) because it would break the logind master fd passing scheme - there
>>>>>>> the receiving compositor is explicitly _not_ allowed to acquire master
>>>>>>> rights on its own. So the master priviledges must not move with the fd or
>>>>>>> things can go wrong.
>>>>>> That could be the rational behind that, but why doesn't logind then just
>>>>>> pass on a normal render node to the compositor?
>>>>> Because the compositor wants the kms node. We have 3 access levels in drm
>>>>>
>>>>> - render stuff
>>>>> - modeset stuff (needs a card* node and master rights for changing things)
>>>>> - set/drop master (needs root)
>>>>>
>>>>> logind wants to give the compositor modeset access, but not master
>>>>> drop/set access (because vt switching is controlled by logind).
>>>>>
>>>>> The pid check in drm_auth is for the use-case where you start your
>>>>> compositor on a root vt (or setuid-root), and then want to make sure
>>>>> that after cred dropping, set/drop master keeps working. Because in that
>>>>> case the vt switch dance is done by the compositor.
>>>>>
>>>>> Maybe we should document this stuff a bit better :-)
>>>>
>>>> Maybe add a friendly warning? E.g. like "Don't touch it, it works!" :)
>>>
>>> I think Tvrtko just volunteered for that :-) Maybe addition in the
>>> drm-uapi.rst section would be good that fills out the gaps we have.
>>
>> I can attempt to copy, paste and tidy what you wrote here, albeit with less
>> than full degree of authority. Assuming into the existing comment above
>> drm_master_check_perm?
> 
> I'd put it into the DOC: section in drm_auth.c so it shows up in the
> drm-uapi.rst docs. Or do a new one if you want to split this out and then
> include it in the drm-uapi.rst.
> 
>> But in terms of where my series is going next I would need some
>> clarification in the other sub-thread.
> 
> Maybe I'm lost on what the leftover confusion is? This one seemed to be
> it?

The question of whether you are now okay with my approach to track 
file_priv->pid if !was_master, or your counter-proposal to have 
file_priv->pid and file_priv->"render_user_pid" is still relevant.

If the latter then what semantics have been settled at, one-shot 
transition or not?

I had an issue with one-shot and even didn't fully understand what you 
did not like about my proposal.

Regards,

Tvrtko
