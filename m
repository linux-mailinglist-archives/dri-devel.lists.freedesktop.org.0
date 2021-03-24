Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBA347780
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358906E14C;
	Wed, 24 Mar 2021 11:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77DF6E0C1;
 Wed, 24 Mar 2021 11:36:12 +0000 (UTC)
IronPort-SDR: BU/94J9Q3OsjYzr+8htJBjVgseIuYPR0oOi6Z5D7B35qH2WjvCZUT+y0vd7mYm6PUdQbRk6m/s
 ZkzIPJVv+33w==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190097116"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190097116"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:36:12 -0700
IronPort-SDR: byCswZqrpS2ASRr5Smr/6uP0UvoGD+LNepbN8I46jJueLcNWl0sZh+GeezGw6exwW6cd40XTm1
 mnE29hi4HIKw==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="514152512"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO [10.213.248.133])
 ([10.213.248.133])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:36:10 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement SINGLE_TIMELINE with a
 syncobj (v2)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210319223856.2983244-5-jason@jlekstrand.net>
 <20210323175149.3390801-1-jason@jlekstrand.net>
 <6fa4f29f-a98e-b22b-ae0c-7df7e1bf71a7@linux.intel.com>
 <YFsL1ZQ3pkOHXZ9B@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <97de980a-8d19-aa0a-0598-628b9c874af2@linux.intel.com>
Date: Wed, 24 Mar 2021 11:36:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFsL1ZQ3pkOHXZ9B@phenom.ffwll.local>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/03/2021 09:52, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 09:28:58AM +0000, Tvrtko Ursulin wrote:
>>
>> On 23/03/2021 17:51, Jason Ekstrand wrote:
>>> This API is entirely unnecessary and I'd love to get rid of it.  If
>>> userspace wants a single timeline across multiple contexts, they can
>>> either use implicit synchronization or a syncobj, both of which existed
>>> at the time this feature landed.  The justification given at the time
>>> was that it would help GL drivers which are inherently single-timeline.
>>> However, neither of our GL drivers actually wanted the feature.  i965
>>> was already in maintenance mode at the time and iris uses syncobj for
>>> everything.
>>>
>>> Unfortunately, as much as I'd love to get rid of it, it is used by the
>>> media driver so we can't do that.  We can, however, do the next-best
>>> thing which is to embed a syncobj in the context and do exactly what
>>> we'd expect from userspace internally.  This isn't an entirely identical
>>> implementation because it's no longer atomic if userspace races with
>>> itself by calling execbuffer2 twice simultaneously from different
>>> threads.  It won't crash in that case; it just doesn't guarantee any
>>> ordering between those two submits.
>>>
>>> Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
>>> advantages beyond mere annoyance.  One is that intel_timeline is no
>>> longer an api-visible object and can remain entirely an implementation
>>> detail.  This may be advantageous as we make scheduler changes going
>>> forward.  Second is that, together with deleting the CLONE_CONTEXT API,
>>> we should now have a 1:1 mapping between intel_context and
>>> intel_timeline which may help us reduce locking.
>>
>> Much, much better commit message although I still fail to understand where
>> do you see implementation details leaking out. So for me this is still
>> something I'd like to get to the bottom of.
>>
>> I would also mention the difference regarding fence context change.
>>
>> And in general I would maintain this patch as part of a series which ends up
>> demonstrating the "mays" and "shoulds".
> 
> I disagree. The past few years we've merged way too much patches and
> features without carefully answering the high level questions of
> - do we really need to solve this problem
> - and if so, are we really solving this problem in the right place
> 
> Now we're quite in a hole, and we're not going to get out of this hole if
> we keep applying the same standards that got us here. Anything that does
> not clearly and without reservation the above two questions with "yes"
> needs to be removed or walled off, just so we can eventually see which
> complexity we really need, and what is actually superflous.

I understand your general point but when I apply it to this specific 
patch, even if it is simple, it is neither removing the uapi or walling 
it off. So I see it as the usual review standard to ask to see what 
"mays" and "shoulds" actually get us in concrete terms.

I would be able to understand putting the uapi behind the "if gen > 12 
|| is_discrete EINVAL", or whatever, since it is fair game to deprecate 
for any new platform or say GuC submission.

Not doing simply that makes me worry there are still misunderstandings 
on what kind of problems were encountered with regards to 
intel_timeline, by work item this or work item that, and that there 
isn't still a confusion about what is the internal timeline object and 
what is the internal hwsp object. I feel there hasn't been full 
transparency on these technical issues which is why I think seeing the 
actual series which is supposed to build on top of this would be helpful.

I even worry that we still have a big disconnect on whether this flag is 
leaking any internal implementation details out to userspace. If the 
commit message was reworded without actual agreement that implementation 
details are not exposed we will continue disagreeing going forward, 
which is not a good start.

We exchanged so many emails on this but I don't feel we are getting 
anywhere so I really have no idea - obviously you will steamroll this in 
regardless so I don't think there is point to argue further.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
