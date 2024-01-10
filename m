Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D382959B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BF810E6C6;
	Wed, 10 Jan 2024 09:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4B510E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:03:30 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T91zz0H8Kz9t3m;
 Wed, 10 Jan 2024 10:03:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1704877407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjHN93azKnEuOUWGM0r3bWfEPzofsXR8IbsK4VGRkuk=;
 b=M6vMA8NA10OVcP/26JqoLQfPnXm0sN6SA9OnVNozCrkMD5u4DayFyJ1xKSRy0QmPncXHTi
 V3NEY0wlHeURLHUMxT8i3zz+J9ClDXyYfyF+q8TAekACRMqYvHkUpVRKs9INpwoPlJn8HM
 SVZbXogMzQ4ya6edbddHmgG3R0YYo/VJPbaOk1Wvz2hYqxm7Pk0IS9T9vWaSGD7Pw2YqBK
 gY1j/8qDD5JHQhHP6db0o23v5Uf77LTcfqbPVG507Bucl3ZMj4dn4Y6yNBhKnHop14pZeg
 r9MD8RUxPQj8wwXad/EZpMlfhECZzrrzlUbexRugrD3wi1R8ZzmageD9wCnB3w==
Message-ID: <9833fda7-c80a-4132-904e-3cf7131e72d4@mailbox.org>
Date: Wed, 10 Jan 2024 10:03:24 +0100
MIME-Version: 1.0
Subject: Re: Rework TTMs busy handling
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 zack.rusin@broadcom.com, lyude@redhat.com, kherbst@redhat.com,
 jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240109074729.3646-1-christian.koenig@amd.com>
 <70484d976d3af4286652a6b26ed8783a9362f403.camel@linux.intel.com>
 <6eff58f4-7956-47cf-9a66-92456d5577d3@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <6eff58f4-7956-47cf-9a66-92456d5577d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f2a3c17d68677d37a5c
X-MBO-RS-META: 8m3zywe4fcp3r8bgq4s5cieadyt5uyis
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

On 2024-01-09 09:34, Christian König wrote:
> Am 09.01.24 um 09:14 schrieb Thomas Hellström:
>> On Tue, 2024-01-09 at 08:47 +0100, Christian König wrote:
>>>
>>> I'm trying to make this functionality a bit more useful for years now
>>> since we multiple reports that behavior of drivers can be suboptimal
>>> when multiple placements be given.
>>>
>>> So basically instead of hacking around the TTM behavior in the driver
>>> once more I've gone ahead and changed the idle/busy placement list
>>> into idle/busy placement flags. This not only saves a bunch of code,
>>> but also allows setting some placements as fallback which are used if
>>> allocating from the preferred ones didn't worked.
>>
>> I also have some doubts about the naming "idle" vs "busy", since an
>> elaborate eviction mechanism would probably at some point want to check
>> for gpu idle vs gpu busy, and this might create some confusion moving
>> forward for people confusing busy as in memory overcommit with busy as
>> in gpu activity.
>>
>> I can't immediately think of something better, though.
> 
> Yeah, I was wondering about that as well. Especially since I wanted to add some more flags in the future when for example a bandwidth quota how much memory can be moved in/out is exceeded.
> 
> Something like phase1, phase2, phase3 etc..., but that's also not very descriptive either.

Maybe something like "desired" vs "fallback"?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

