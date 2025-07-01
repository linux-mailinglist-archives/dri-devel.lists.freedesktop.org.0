Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0609AF019D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 19:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E03910E5F5;
	Tue,  1 Jul 2025 17:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="St+44kTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95E10E5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 17:20:03 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bWqXb4vjTz9ss3;
 Tue,  1 Jul 2025 19:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751390399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Upi7gXCdSmXmLc7iCXZvxLGu6z1r/J9DMWSV6Wh+hHI=;
 b=St+44kTWVEC/6sy/j9R/V8yH7hR66jIWOVq0FLiPxq+qc8vi4GM6I5pxcu6jYomF7a+Dvs
 2PUTWv2opirgTYkJBD//B6CLNd4oXAq2+ZI5Jsw9DfVsTF/03ED8GtCUiv7VyaruRFDK3q
 POC9+G7OI2txZ1Q4+X0/PG+iAFAaLXVM0LHtxN7+XNso9miq6/gCphxorAZRNE4uHNFXSP
 Ce/5X3jIJFUAkcJ8o+GJKHEtvk5T9A7xgs+Lr3pllMAf5VYcZUEUIVJZ2m3JWgTXd+7Vm4
 IfS7y4BLyQL1hKRvPjnJoQfVoHujqvpycu3WrXmrhFIPRk+K6THbNwJWCiiQ7w==
Message-ID: <6ac158fa-9333-492f-af24-4e6f6425eb96@mailbox.org>
Date: Tue, 1 Jul 2025 19:19:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 cristian.ciocaltea@collabora.com, gcarlos@disroot.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
 <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org> <aGQQjTUrG8-p8qAC@fedora>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <aGQQjTUrG8-p8qAC@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 138cba6277061f1d9ca
X-MBO-RS-META: hfpqywu3o1ptz33jfptm4tyhdpzeexee
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

On 01.07.25 18:45, José Expósito wrote:
> Hey Michel,
> 
> Thanks for looking into this.
> 
> On Tue, Jul 01, 2025 at 10:22:13AM +0200, Michel Dänzer wrote:
>> On 30.06.25 11:00, José Expósito wrote:
>>> When compiling with sparse enabled, this warning is thrown:
>>>
>>>   warning: incorrect type in argument 2 (different base types)
>>>      expected restricted __le32 const [usertype] *buf
>>>      got unsigned int [usertype] *[assigned] buf
>>>
>>> Add a cast to fix it.
>>>
>>> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> index 7299fa8971ce..86829e1cb7f0 100644
>>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>>>  		NULL : &result->dst_pitch;
>>>  
>>>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>>> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>>> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>>>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>>  
>>>  	buf = dst.vaddr; /* restore original value of buf */
>>
>> It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)
> 
> Yes, however, the same pattern is repeated 10 times in this file.
> 
> What do you think about fixing it in a follow up? I don't think it
> should block fixing the KUnit tests.

Ah, yes, makes sense to do it separately then.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
