Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABD745282
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 23:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930310E028;
	Sun,  2 Jul 2023 21:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872CA10E011
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 21:37:59 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QvMqB2GwBz9t5Y;
 Sun,  2 Jul 2023 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1688333878; bh=6tVnnCr/NRgTI2XrKgMR72c2GYox0rECGOQbpxUkHgQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BiKvZTSbEzNNnFUBek/4Abr/v8YHug5pSgqhHiIv7B4dqxxxUNup0AI4KGftBE2UP
 uZ7RTYgs2D7WbySy7SPp2IkpYFg0J1pp1/v/5FVPuuwRwUoPQqnVC6beCiL15jTV/P
 l4mDjGtwFTm8H5T9e1dbZRaVa3PZDkdGd7MAjvzE=
X-Riseup-User-ID: 488EDC608D654CF625029D6116884A739DED0205DA5B580724CB8E67FDB1EA2E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QvMq40LzqzFq3Q;
 Sun,  2 Jul 2023 21:37:51 +0000 (UTC)
Message-ID: <a58917d1-eec5-9f0f-4951-9fca97bfaf45@riseup.net>
Date: Sun, 2 Jul 2023 18:37:49 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4] drm/vkms: Add support to 1D gamma LUT
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230621194121.184552-1-arthurgrillo@riseup.net>
 <e880d5cd-a958-164e-4ba9-dd2d0e3ad903@riseup.net>
 <20230626111745.49dbbf08@eldfell>
 <91aa3ffe-edb9-d85c-c62b-49f7bf73a0ae@riseup.net>
 <20230627111231.79ed863c@eldfell>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230627111231.79ed863c@eldfell>
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, mdaenzer@redhat.com,
 dri-devel@lists.freedesktop.org, victoria@system76.com, mwen@igalia.com,
 jadahl@redhat.com, uma.shankar@intel.com, sebastian.wick@redhat.com,
 Arthur Grillo <arthurgrillo@riseup.net>, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/27/23 05:12, Pekka Paalanen wrote:
> On Mon, 26 Jun 2023 14:35:25 -0300
> Maira Canal <mairacanal@riseup.net> wrote:
> 
>> Hi Pekka,
>>
>> On 6/26/23 05:17, Pekka Paalanen wrote:
>>> On Sat, 24 Jun 2023 18:48:08 -0300
>>> Maira Canal <mairacanal@riseup.net> wrote:
>>>    
>>>> Hi Arthur,
>>>>
>>>> Thanks for working on this feature for the VKMS!
>>>>
>>>> On 6/21/23 16:41, Arthur Grillo wrote:
>>>>> Support a 1D gamma LUT with interpolation for each color channel on the
>>>>> VKMS driver. Add a check for the LUT length by creating
>>>>> vkms_atomic_check().
>>>>>
>>>>> Tested with:
>>>>> igt@kms_color@gamma
>>>>> igt@kms_color@legacy-gamma
>>>>> igt@kms_color@invalid-gamma-lut-sizes
>>>>
>>>> Could you also mention that this will make it possible to run the test
>>>> igt@kms_plane@pixel-format?
>>>>
>>>> Also, you mentioned to me that the performance degraded with this new
>>>> feature, but I wasn't able to see it while running the VKMS CI. I
>>>> performed a couple of tests and I didn't see any significant performance
>>>> issue.
>>>>
>>>> Could you please run a benchmark and share the results with us? This way
>>>> we can atest that this new feature will not affect significantly the
>>>> VKMS performance. It would be nice to have a small brief of this
>>>> benchmark on the commit message as well.
>>>>
>>>> Attesting that there isn't a performance issue and adding those nits to
>>>> the commit message, you can add my
>>>>
>>>> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>>>>
>>>> on the next version.
>>>
>>> Hi,
>>>
>>> perfomance testing is good indeed. As future work, could there be a
>>> document describing how to test VKMS performance?
>>
>> I'll try to select a couple of more meaningful IGT tests to describe how
>> to test the VKMS performance and also add a document to describe how to
>> run this tests.
>>
>> Recently, I added a VKMS must-pass testlist to IGT. This testlist
>> tries to assure that regressions will not be introduced into VKMS. But,
>> I failed to introduce a documentation on the kernel side pointing to
>> this new testlist... I'll also work on it.
>>
>>>
>>> "I ran IGT@blah 100 times and it took xx seconds before and yy seconds
>>> after" does not really give someone like me an idea of what was
>>> actually measured. For example blending overhead increase could be
>>> completely lost in opaque pixel copying noise if the test case has only
>>> few pixels to blend, e.g. a cursor plane, not to mention the overhead
>>> of launching an IGT test in the first place.
>>
>> About the IGT overhead, I don't know exactly how we could escape from
>> it. Maybe writing KUnit tests to the VKMS's composition functions, such
>> as blend(). Anyway, we would have the overhead of the KUnit framework.
>> I mean, for whatever framework we choose, there'll be an overhead...
>>
>> Do you have any other ideas on how to test VKMS with less overhead?
> 
> Maybe put the repeat loop and time measurement inside the code of a few
> chosen IGT tests?
> 
> So that it loops only the KMS programming and somehow ensures VKMS has
> finished processing each update before doing the next cycle. I presume
> VKMS does not have a timer-based refresh cycle that might add CPU idle
> time? Writeback should be included in the measurement too, but inspecting
> writeback results should not.
> 
> Once all that is in place, then each performance test needs to use
> appropriate operations. E.g. if testing blending performance, use
> almost full-screen planes.

^ Grillo, any chance you could work on something like this for the
performance measurements?

> 
> What's the overhead of KUnit framework? Can you not do the same there,
> put the repeat loop and time measurement inside the test to cover only
> the interesting code?
> 
> Unit-testing the composition function performance might be ideal.
> 

I'll try to work on some unit tests for, at least, the composition
section of VKMS. I believe that they will be very valuable for the
maintenance and performance evaluation.

Thanks for your valuable inputs on the VKMS!

Best Regards,
- Maíra

> Depending on the type of test, if the CRTC mode and planes are big
> enough, maybe there is no need to repeat even. But testing presumably
> fast things like moving a cursor plane will likely need repeating in
> order to produce stable numbers.
> 
> 
> Thanks,
> pq
> 
>>
>> Best Regards,
>> - Maíra
>>
>>>
>>> Something that would guide new developers in running meaningful
>>> benchmarks would be nice.
>>>
>>> Should e.g. IGT have explicit (VKMS) performance tests that need to be
>>> run manually, since evaluation of the result is not feasible
>>> automatically? Or a benchmark mode in correctness tests that would run
>>> the identical operation N times and measure the time before checking
>>> for correctness?
>>>
>>> The correctness verification in IGT tests, if done by image comparison
>>> which they undoubtedly will need to be in the future, may dominate the
>>> CPU run time measurements if included.
>>>
>>>
>>> Thanks,
>>> pq
> 
