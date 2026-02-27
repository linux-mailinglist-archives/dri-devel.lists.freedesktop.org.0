Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEzmCmpsoWmxswQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:05:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB41B5BE0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D7010EAE6;
	Fri, 27 Feb 2026 10:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="p68IFHyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687E410EAE6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:05:26 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so1924793f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772186725; x=1772791525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8MqOduCOGo3qjojY6SOtSEjOLTtsc9XUK4HOUENpsIM=;
 b=p68IFHyCq8K0cUqr4PXc2WE5B5TyvvSVMeMszxzFcpO88xKdaiBI8eNYSfmOpw8JQh
 zVsZy0084Z6AZ+ZwZK852q2cSkSh4Ah34WLGa42hT/X2ucwwrpSnzs3oyZTLSEf9CMR2
 KeRu5+WYOWJ4AJpQK24jKW2/YmwtkllRYkclleAzH/l9URhNTkE6K3vXQGESDmkFF3XV
 2ZLqNlgUKjbb8Mg4LJVVICN4NHTuzlOpAIf7Tt7n1D9ckWNpyWu5YybF8vhCKjPzdthO
 dhziCIS+DyvGE9RfeMWiHHiEq1PL7/PqxTkO0ziJb76cNkrr3WCxuOAKxB+5WScJL7u+
 dkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772186725; x=1772791525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8MqOduCOGo3qjojY6SOtSEjOLTtsc9XUK4HOUENpsIM=;
 b=MYTMH3NO0UGqgz+NrkC7f9hrhCGELCRODZ/oGnFpXNIT4CovB9rVQtkxtqBH74UP/l
 0RG4lxPMcoBPCxWoV2MvRtvW1V7eq94MNCkKtOQ1rb8EpZAQlyM93FHDROm1u68XNAeR
 +w5ZMyz4oCo1exka+pKKMq3cshUhabArQ//UomQoS6WBmhjUzhNu+bLocpdFPA60MTHS
 rzFGV8Irn+NZUlObpzR1HLze55wIMzYihS5/SYc7AARscces/Ha4CH7bMiOT7AGSIJD9
 n3/vFuOW6ZIPrGc2D4tTwB4LwkrU0SAm7/C2pUd00WqxNEVxtlZWwwNb2BHMl+01WVLW
 6kNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVux3kOCz3nmIBnxbucRj4RUALdue0oJMm30tpGERpXFuqA4ftY64VotpQqX+ZWjz+KqJcojyueoDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv+zMZnCf2ky5T0GJtO60XKm25CQOt8pC/XKa2hmfPAJlp8EW4
 EkP5X/gWiSEebLKEQ19OgxxmWozwapwbpbe9pbQtBmstJhkZittbjL+zLhrk/lY2mA8=
X-Gm-Gg: ATEYQzwdOtYqARvFeIgyEt9uThJzVR61hiv1vsaXkxeGECm+HOGFYpNVgje9jzghI0k
 vtVQ4crfrsovrUPiD9Sg6wtytdVLbAKWArWh5Jvs9V4nsYgdC+PqzaKkMbWLzdsa4jOsci3191i
 hZi+mFgMulIKhqKIhcrSl6RnyilaEEkeyd7bvvv+Ej3NOcBEZmpLFsomW2zfgti8UKETaLh9zvh
 xoqp57XPs/EOOTZJhPN1HVk96pMtqYod+EhwTtL2vRITSoYNmNhar/nZ4cippxrxNsvkGX7yzuD
 vO4y5+EzIgWdJwXK1p5/MUMhoWcGSmJ76UWKwyW3fXTXoYZwsmiL3UeAWr6597qk/d5okk3cenL
 uwlLvP0+OXspR2ch91eOR9IXPqvIGfERmfISKLRnfpdwTiWyKfmYAxhl032Qn6fWsqI15ZJjJL8
 4GNVfhQlY62h9C+WZzfKTdWArTEqbJthJgPreMyJ20v8bT
X-Received: by 2002:a05:6000:144c:b0:439:909f:c594 with SMTP id
 ffacd0b85a97d-439971ae7f0mr12712817f8f.10.1772186723690; 
 Fri, 27 Feb 2026 02:05:23 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c764a35sm5931375f8f.30.2026.02.27.02.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 02:05:23 -0800 (PST)
Message-ID: <3731bc32-43a1-41a5-8134-06b97bd03ce6@ursulin.net>
Date: Fri, 27 Feb 2026 10:05:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: Maxime Ripard <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
 <20260227-silent-eagle-from-uranus-f196a5@houat>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260227-silent-eagle-from-uranus-f196a5@houat>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url,igalia.com:email,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: 8ECB41B5BE0
X-Rspamd-Action: no action


On 27/02/2026 08:41, Maxime Ripard wrote:
> On Thu, Feb 26, 2026 at 12:42:39PM +0000, Tvrtko Ursulin wrote:
>>
>> On 26/02/2026 10:56, Maxime Ripard wrote:
>>> Hi Tvrtko,
>>>
>>> On Tue, Feb 24, 2026 at 12:49:01PM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/02/2026 11:03, Maxime Ripard wrote:
>>>>> Some DRM tests cross the 1s execution time threshold that defines a test
>>>>> as slow. Let's flag them as such.
>>>>
>>>> Curious that both did not trigger for me and I even run them under nested
>>>> qemu most of the time.
>>>>
>>>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
>>>>>     drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
>>>>>     2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>>> index 82a41a456b0a..a5a5a35a87b0 100644
>>>>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>>> @@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct kunit *test)
>>>>>     		drm_mock_sched_entity_free(entity[i]);
>>>>>     }
>>>>>     static struct kunit_case drm_sched_priority_tests[] = {
>>>>>     	KUNIT_CASE(drm_sched_priorities),
>>>>> -	KUNIT_CASE(drm_sched_change_priority),
>>>>> +	KUNIT_CASE_SLOW(drm_sched_change_priority),
>>>>
>>>> This one deliberately aims to run for ~1s and I don't have an immediate idea
>>>> how it would go over 2s.
>>>
>>> 1s is the threshold for a slow test:
>>> https://elixir.bootlin.com/linux/v6.19.3/source/lib/kunit/test.c#L365
>>>
>>> It only warns about it if it crosses 2s, but if it's expected to take
>>> 1s, it should be flagged as such still.
>>
>> I know, just curious which environment managed to trigger the warning.
>> Because I thought my test setup was the slowest one (nested virtualization -
>> qemu-system inside vmware).
> 
> I was running a cross-compiled arm64 system on my x86 machine, so
> emulated. That being said, that one didn't cross the 2s threshold
> either.

Good to know I wasn't missing something obvious in the test logic.

The tweaks I just sent change some tests from emitting 1000 1ms jobs to 
only emitting 500 of them. Effectively targetting their runtime to 
500ms, plus the hrtimer and worker item scheduling delays. Hopefully 
even under emulation that is enough of a margin to never get over 1s, 
let alone 2s of wall clock time.

Regards,

Tvrtko

> 
> Other tests did, and I used the occasion to flag every test that was
> taking more than 1s.
> 
>>>>>     	{}
>>>>>     };
>>>>>     static struct kunit_suite drm_sched_priority = {
>>>>>     	.name = "drm_sched_basic_priority_tests",
>>>>> @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
>>>>>     	drm_mock_sched_entity_free(entity);
>>>>>     	drm_mock_sched_fini(sched);
>>>>>     }
>>>>>     static struct kunit_case drm_sched_credits_tests[] = {
>>>>> -	KUNIT_CASE(drm_sched_test_credits),
>>>>> +	KUNIT_CASE_SLOW(drm_sched_test_credits),
>>>>
>>>> Same really.
>>>>
>>>> Anyway, the scheduler parts LGTM and I can follow up trying to optimise
>>>> these two later.
>>>>
>>>> For the scheduler:
>>>>
>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Thanks!
>>
>> I have a patch already which makes those (and one more) test cases faster,
>> but I will wait sending it until you merge this one.
> 
> Ack, thanks!
> Maxime

