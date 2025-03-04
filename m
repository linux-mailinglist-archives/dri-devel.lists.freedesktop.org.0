Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD24A4DF07
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B5C10E361;
	Tue,  4 Mar 2025 13:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BWvi0QJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35B310E361
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSdKODtGh2Y8ej92Cz84htzAS7rpGkBqJXjwCGZyeVQ=; b=BWvi0QJOD2nUzVAHwpY3txYHHM
 UlvIfDm06olZilzW54ttOtFLR74V0exVDHNaG83Dn2E53OgrPHAmqcY87UzEnltopL4jRnEpvVBZt
 EepeFJgeAAGTXTcHbFyJ1aAlD0RDSImjFkk3D3AwmdKZDtUVPN16tsNxO2bYv1quUG8BL2+zS5llr
 FMx6EnyxdvkJgdctKrs4Y8ArTr3nyz2/nq8XqE7Q1y4WiSu8N6t4y15bdcS4obIYwx8AMrX1ciTJW
 fW9M3J6TMoY97wk6XplMpW9vCM3Z8URO1UxuuC3t6vGkguZlum0wcVo6ZuzXesP8FfOKJ0Cgmh8AM
 t0se2eRg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tpS9n-003iyT-23; Tue, 04 Mar 2025 14:18:04 +0100
Message-ID: <0e9edf3d-494c-49fa-ac63-5cb7737d4c5c@igalia.com>
Date: Tue, 4 Mar 2025 13:18:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/scheduler: Add scheduler unit testing
 infrastructure and some basic tests
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <20250221120917.80617-3-tvrtko.ursulin@igalia.com>
 <3bac3046d3d6b4c7debfe5d822cd8bc5015b3f32.camel@mailbox.org>
 <c7734929-9a9c-4f10-a8ff-1c5391e6e60d@igalia.com>
 <d9b5c6935021e29de611df77f61955fa0497a249.camel@mailbox.org>
 <2179b5a7-c181-4567-81d0-41209cffeda8@igalia.com>
 <abf16c9e0b070778253ad045c3ab42f1b9352812.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <abf16c9e0b070778253ad045c3ab42f1b9352812.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/03/2025 12:29, Philipp Stanner wrote:

[snip]

>>>>>> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct
>>>>>> kunit
>>>>>> *test)
>>>>>> +{
>>>>>> +	struct drm_sched_init_args args = {
>>>>>> +		.ops		= &drm_mock_scheduler_ops,
>>>>>> +		.num_rqs	= DRM_SCHED_PRIORITY_COUNT,
>>>>>> +		.credit_limit	= U32_MAX,
>>>>>> +		.hang_limit	= UINT_MAX,
>>>
>>> Another question – I think we are in the process of deprecating the
>>> hang limit since submitting the same broken job again and again and
>>> expecting it suddenly to work is the classic definition of madness.
>>>
>>> My feeling would be that it should be 1, since that is what we
>>> expect
>>> drivers to do.
>>>
>>> Or is there a specific reason why you set it to MAX anyways?
>>
>> No special reason and it doesn't matter really. It will only be
>> interesting once we add more detailed tests for timeout/ban handling,
>> at
>> which point those tests will explicitly confiture what limit they
>> want.
>> As such, for now, this only needs to be non-zero.
> 
> OK, then I'd say please set it to 1. This way we cannot forget later
> and the scheduler will always behave as we want it to for all drivers.
> 
> I assume it will be a while until we really can remove the hang_limit
> from our code base, so…

Oops I just sent v3 before seeing this. But even so, I was even wrong, 
hang_limit can even be zero. Current code does not exercise that code 
path at all.

I propose we leave it as is now, and then, as we spend time adding more 
tests, we will see how the mock framework will evolve. Until then I 
really do not think it makes sense to give much meaning to the number 
set in there.

Regards,

Tvrtko

