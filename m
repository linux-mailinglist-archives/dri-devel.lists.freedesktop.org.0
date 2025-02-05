Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCEA29ADF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587B610E3DE;
	Wed,  5 Feb 2025 20:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BDE10E3DE;
 Wed,  5 Feb 2025 20:11:51 +0000 (UTC)
Message-ID: <cd63aaf6-8c17-4e6f-9fa1-bf4d23410806@lankhorst.se>
Date: Wed, 5 Feb 2025 21:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 0/8] drm/xe: Convert xe_force_wake
 calls to guard helpers.
To: David Lechner <dlechner@baylibre.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <e4befaab-9622-40d3-bd4c-e12111df45e7@baylibre.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <e4befaab-9622-40d3-bd4c-e12111df45e7@baylibre.com>
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

Hey,

Thanks for your feedback. I think in this case you are right, and it 
will become unreadable.

I'll try to make sparse annotations work, and then see if we can enable 
it in CI for all.

Cheers,
~Maarten

On 2025-02-04 18:40, David Lechner wrote:
> On 2/4/25 7:22 AM, Maarten Lankhorst wrote:
>> Ignore my previous series please, it should have been sent to intel-xe, was sent to intel-gfx.
>>
>> Instead of all this repetition of
>>
>> {
>> 	unsigned fw_ref;
>>
>> 	fw_ref = xe_force_wake_get(fw, domain);
>> 	if (!xe_force_wake_ref_has_domain(..))
>> 		return -ETIMEDOUT;
>>
>> 	...
>>
>> out:
>> 	xe_force_wake_put(fw_ref);
>> 	return ret;
>> }
>>
>> I thought I would look at how to replace it with the guard helpers.
>> It is easy, but it required some minor fixes to make DEFINE_LOCK_GUARD_1
>> work with extra init arguments.
>>
>> So I changed the function signature slightly to make the first optional argument
>> a struct member (current behavior), and any additional argument goes to the init
>> call.
>>
>> This replaces the previous code with
>> {
>> 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, domain) {
>> 		....
>>
>> 		return ret;
>> 	}
>> }
>>
>> I' ve thought also of playing with this:
>> {
>> 	CLASS(xe_force_wake_get, fw_ref)(fw, domain);
>> 	if (!fw_ref.lock))
>> 		return -ETIMEDOUT;
>>
>> 	...
>> 	return ret;
>> }
>>
>> I'm just fearing that the scoped_cond_guard makes it imposssible to get this
>> wrong, while in the second example it's not clear that it can fail, and that
>> you have to check.
>>
>> Let me know what you think!
>> Feedback welcome for the header change as well, should probably go into the locking tree..
>>
> When I tried to make a similar improvement, Linus said to please stop trying
> with the conditional guard stuff [1]. So my advice is don't do it.
> 
> Just replace the:
> 
>> 	...
>>
>> out:
> 
> with a helper function if you want to get rid of the gotos.
> 
> That is what we are doing in the iio subsystem [2][3].
> 
> [1]: https://lore.kernel.org/all/CAHk-=whn07tnDosPfn+UcAtWHBcLg=KqA16SHVv0GV4t8P1fHw@mail.gmail.com/
> [2]: https://lore.kernel.org/all/20250105172613.1204781-1-jic23@kernel.org/
> [3]: https://lore.kernel.org/all/20250202210045.1a9e85d7@jic23-huawei/

