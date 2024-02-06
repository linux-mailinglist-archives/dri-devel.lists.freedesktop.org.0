Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E184BC9C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A4112D30;
	Tue,  6 Feb 2024 17:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="gi8EDSQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C602112D41
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:58:00 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TTrZH2TK7zDqkd;
 Tue,  6 Feb 2024 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707242279; bh=VJkSO3PfaYzE0oagpsi6CBSQneW/RECiAdVa3brOvPU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gi8EDSQOPwoa1vPXMC9dkTd5crmlkPZW1YZtjb4luwOukwgV40Y/AuBE31eHzWQPm
 KNqf3nXwA440TOBhN99JVHJoQomlGMsSTHsHUNT9PWl5nU4OE78aj7AI9c7LkUbDkB
 kr10kEX2cLw/stHkaC7qt7ndBcLHN4cAXpvuNRYI=
X-Riseup-User-ID: 315FFCB5D99C33C9CC1549F7D82B07FFDF48968B245EDF336B6361EE68307827
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TTrZ80yxDzFsfD;
 Tue,  6 Feb 2024 17:57:51 +0000 (UTC)
Message-ID: <d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net>
Date: Tue, 6 Feb 2024 14:57:48 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <20240202170734.3176dfe4@xps-13> <20240202214527.1d97c881@ferris.localdomain>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240202214527.1d97c881@ferris.localdomain>
Content-Type: text/plain; charset=UTF-8
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



On 02/02/24 16:45, Pekka Paalanen wrote:
> On Fri, 2 Feb 2024 17:07:34 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
>> Hi Pekka,
> 
> Hi Miquel,
> 
> I'm happy to see no hard feelings below. I know I may be blunt at
> times.
> 
> Another thing coming to my mind is that I suppose there is no
> agreed standard benchmark for VKMS performance, is there?
> 
> I recall people running selected IGT tests in a loop in the past,
> and I worry that the IGT start-up overhead and small plane
> dimensions might skew the results.
> 
> Would it be possible to have a standardised benchmark specifically
> for performance rather than correctness, in IGT or where-ever it
> would make sense? Then it would be simple to tell contributors to
> run this and report the numbers before and after.
> 
> I would propose this kind of KMS layout:
> 
> - CRTC size 3841 x 2161
> - primary plane, XRGB8888, 3639 x 2161 @ 101,0
> - overlay A, XBGR2101010, 3033 x 1777 @ 201,199
> - overlay B, ARGB8888, 1507 x 1400 @ 1800,250
> 
> The sizes and positions are deliberately odd to try to avoid happy
> alignment accidents. The planes are big, which should let the pixel
> operations easily dominate performance measurement. There are
> different pixel formats, both opaque and semi-transparent. There is
> lots of plane overlap. The planes also do not cover the whole CRTC
> leaving the background visible a bit.
> 
> There should be two FBs per each plane, flipped alternatingly each
> frame. Writeback should be active. Run this a number of frames, say,
> 100, and measure the kernel CPU time taken. It's supposed to take at
> least several seconds in total.
> 
> I think something like this should be the base benchmark. One can
> add more to it, like rotated planes, YUV planes, etc. or switch
> settings on the existing planes. Maybe even FB_DAMAGE_CLIPS. Maybe
> one more overlay that is very tall and thin.
> 
> Just an idea, what do you all think?

Hi Pekka,

I just finished writing this proposal using IGT.

I got pretty interesting results:

The mentioned commit 8356b97906503a02125c8d03c9b88a61ea46a05a took
around 13 seconds. While drm-misc/drm-misc-next took 36 seconds.

I'm currently bisecting to be certain that the change to the
pixel-by-pixel is the culprit, but I don't see why it wouldn't be.

I just need to do some final touches on the benchmark code and it
will be ready for revision.

Best Regards,
~Arthur Grillo

> 
> 
> Thanks,
> pq
> 
>> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 17:49:13 +0200:
>>
>>> On Fri, 2 Feb 2024 13:13:22 +0100
>>> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>>>   
>>>> Hello Maxime,
>>>>
>>>> + Arthur
>>>>
>>>> mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
>>>>     
>>>>> Hi Miquel,
>>>>>
>>>>> On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:      
>>>>>> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
>>>>>>         
>>>>>>> On Thu, 01 Feb 2024 18:31:32 +0100
>>>>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>>>>>>         
>>>>>>>> Change the composition algorithm to iterate over pixels instead of lines.
>>>>>>>> It allows a simpler management of rotation and pixel access for complex formats.
>>>>>>>>
>>>>>>>> This new algorithm allows read_pixel function to have access to x/y
>>>>>>>> coordinates and make it possible to read the correct thing in a block
>>>>>>>> when block_w and block_h are not 1.
>>>>>>>> The iteration pixel-by-pixel in the same method also allows a simpler
>>>>>>>> management of rotation with drm_rect_* helpers. This way it's not needed
>>>>>>>> anymore to have misterious switch-case distributed in multiple places.          
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> there was a very good reason to write this code using lines:
>>>>>>> performance. Before lines, it was indeed operating on individual pixels.
>>>>>>>
>>>>>>> Please, include performance measurements before and after this series
>>>>>>> to quantify the impact on the previously already supported pixel
>>>>>>> formats, particularly the 32-bit-per-pixel RGB variants.
>>>>>>>
>>>>>>> VKMS will be used more and more in CI for userspace projects, and
>>>>>>> performance actually matters there.
>>>>>>>
>>>>>>> I'm worrying that this performance degradation here is significant. I
>>>>>>> believe it is possible to keep blending with lines, if you add new line
>>>>>>> getters for reading from rotated, sub-sampled etc. images. That way you
>>>>>>> don't have to regress the most common formats' performance.        
>>>>>>
>>>>>> While I understand performance is important and should be taken into
>>>>>> account seriously, I cannot understand how broken testing could be
>>>>>> considered better. Fast but inaccurate will always be significantly
>>>>>> less attractive to my eyes.        
>>>>>
>>>>> AFAIK, neither the cover letter nor the commit log claimed it was fixing
>>>>> something broken, just that it was "better" (according to what
>>>>> criteria?).      
>>>>
>>>> Better is probably too vague and I agree the "fixing" part is not
>>>> clearly explained in the commit log. The cover-letter however states:
>>>>     
>>>>> Patch 2/2: This patch is more complex. My main target was to solve issues
>>>>> I found in [1], but as it was very complex to do it "in place", I choose
>>>>> to rework the composition function.      
>>>> ...    
>>>>> [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/      
>>>>
>>>> If you follow this link you will find all the feedback and especially
>>>> the "broken" parts. Just to be clear, writing bugs is totally expected
>>>> and review/testing is supposed to help on this regard. I am not blaming
>>>> the author in any way, just focusing on getting this code in a more
>>>> readable shape and hopefully reinforce the testing procedure.
>>>>     
>>>>> If something is truly broken, it must be stated what exactly is so we
>>>>> can all come up with a solution that will satisfy everyone.      
>>>>
>>>> Maybe going through the series pointed above will give more context
>>>> but AFAIU: the YUV composition is not totally right (and the tests used
>>>> to validate it need to be more complex as well in order to fail).
>>>>
>>>> Here is a proposal.
>>>>
>>>> Today's RGB implementation is only optimized in the line-by-line case
>>>> when there is no rotation. The logic is bit convoluted and may possibly
>>>> be slightly clarified with a per-format read_line() implementation,
>>>> at a very light performance cost. Such an improvement would definitely
>>>> benefit to the clarity of the code, especially when transformations
>>>> (especially the rotations) come into play because they would be clearly
>>>> handled differently instead of being "hidden" in the optimized logic.
>>>> Performances would not change much as this path is not optimized today
>>>> anyway (the pixel-oriented logic is already used in the rotation case).
>>>>
>>>> Arthur's YUV implementation is indeed well optimized but the added
>>>> complexity probably lead to small mistakes in the logic. The
>>>> per-format read_line() implementation mentioned above could be
>>>> extended to the YUV format as well, which would leverage Arthur's
>>>> proposal by re-using his optimized version. Louis will help on this
>>>> regard. However, for more complex cases such as when there is a
>>>> rotation, it will be easier (and not sub-optimized compared to the RGB
>>>> case) to also fallback to a pixel-oriented processing.
>>>>
>>>> Would this approach make sense?    
>>>
>>> Hi,
>>>
>>> I think it would, if I understand what you mean. Ever since I proposed
>>> a line-by-line algorithm to improve the performance, I was thinking of
>>> per-format read_line() functions that would be selected outside of any
>>> loops. Extending that to support YUV is only natural. I can imagine
>>> rotation complicates things, and I won't oppose that resulting in a
>>> much heavier read_line() implementation used in those cases. They might
>>> perhaps call the original read_line() implementations pixel-by-pixel or
>>> plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
>>> things even further. That way one could compose any
>>> rotation-format-siting combination by chaining function pointers.  
>>
>> I'll let Louis also validate but on my side I feel like I totally
>> agree with your feedback.
>>
>>> I haven't looked at VKMS in a long time, and I am disappointed to find
>>> that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
>>> The reading vfunc should be called with many pixels at a time when the
>>> source FB layout allows it. The whole point of the line-based functions
>>> was that they repeat the innermost loop in every function body to make
>>> the per-pixel overhead as small as possible. The VKMS implementations
>>> benchmarked before and after the original line-based algorithm showed
>>> that calling a function pointer per-pixel is relatively very expensive.
>>> Or maybe it was a switch-case.  
>>
>> Indeed, since your initial feedback Louis made a couple of comparisons
>> and the time penalty is between +5% and +60% depending on the case,
>> AFAIR.
>>
>>> Sorry, I didn't realize the optimization had already been lost.  
>>
>> No problem, actually I also lost myself in my first answer as I
>> initially thought the (mainline) RGB logic was also broken in edge
>> cases, which it was not, only the YUV logic suffered from some
>> limitations.
>>
>>> Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
>>> it's not composing anything and the name mislead me.  
>>
>> Makes sense.
>>
>>> I think if you inspect the compositing code as of revision
>>> 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
>>> what it was supposed to be.  
>>
>> Excellent, thanks a lot!
>>
>> Miquèl
> 
> 
