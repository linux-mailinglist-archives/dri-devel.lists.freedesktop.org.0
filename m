Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29E84C893
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB91131F4;
	Wed,  7 Feb 2024 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946D61131F4;
 Wed,  7 Feb 2024 10:27:30 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 7 Feb
 2024 13:27:28 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Feb 2024
 13:27:28 +0300
Message-ID: <6497acbb-7970-4fd5-bc47-f6896f22efc1@fintech.ru>
Date: Wed, 7 Feb 2024 02:27:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Prevent possible NULL dereference in
 __caps_show()
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
References: <20240206164543.46834-1-n.zhandarovich@fintech.ru>
 <3c63aea1-1a04-45eb-9af1-02f52d4132e4@linux.intel.com>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <3c63aea1-1a04-45eb-9af1-02f52d4132e4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

Hello,

On 2/7/24 01:16, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 06/02/2024 16:45, Nikita Zhandarovich wrote:
>> After falling through the switch statement to default case 'repr' is
>> initialized with NULL, which will lead to incorrect dereference of
>> '!repr[n]' in the following loop.
>>
>> Fix it with the help of an additional check for NULL.
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: 4ec76dbeb62b ("drm/i915/gt: Expose engine properties via sysfs")
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>> P.S. The NULL-deref problem might be dealt with this way but I am
>> not certain that the rest of the __caps_show() behaviour remains
>> correct if we end up in default case. For instance, as far as I
>> can tell, buf might turn out to be w/o '\0'. I could use some
>> direction if this has to be addressed as well.
>>
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> index 021f51d9b456..6b130b732867 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -105,7 +105,7 @@ __caps_show(struct intel_engine_cs *engine,
>>         len = 0;
>>       for_each_set_bit(n, &caps, show_unknown ? BITS_PER_LONG : count) {
>> -        if (n >= count || !repr[n]) {
>> +        if (n >= count || !repr || !repr[n]) {
> 
> There are two input combinations to this function when repr is NULL.
> 
> First is show_unknown=true and caps=0, which means the for_each_set_bit
> will not execute its body. (No bits set.)
> 
> Second is show_unknown=false and caps=~0, which means count is zero so
> for_each_set_bit will again not run. (Bitfield size input param is zero.)
> 
> So unless I am missing something I do not see the null pointer dereference.
> 
> What could theoretically happen is that a third input combination
> appears, where caps is not zero in the show_unknown=true case, either
> via a fully un-handled engine->class (switch), or a new capability bit
> not added to the static array a bit above.
> 
> That would assert during driver development here:
> 
>             if (GEM_WARN_ON(show_unknown))
> 
> Granted that could be after the dereference in "if (n >= count ||
> !repr[n])", but would be caught in debug builds (CI) and therefore not
> be able to "ship" (get merge to the repo).
> 
> Your second question is about empty buffer returned i.e. len=0 at the
> end of the function? (Which is when the buffer will not be null
> terminated - or you see another option?)
> 
> That I think is safe too since it just results in a zero length read in
> sysfs.
> 
> Regards,
> 
> Tvrtko
> 
>>               if (GEM_WARN_ON(show_unknown))
>>                   len += sysfs_emit_at(buf, len, "[%x] ", n);
>>           } else {

Thank you for such a full response.

I think you are right. I was under the impression that either currently
or in the future there might be an input combination, as you mentioned,
that may trigger the NULL dereference. If you feel it will be caught
beforehand, I am satisfied as well. Same goes for the empty buffer stuff.

I think dropping the patch is the best option then. Apologies for any
inconvenience.

Nikita
