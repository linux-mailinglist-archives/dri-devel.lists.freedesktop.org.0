Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF9847A2B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 21:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CD010E186;
	Fri,  2 Feb 2024 20:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="cI/JFAFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776CE10E186
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 20:02:32 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TRRWn6dTrzDq8D;
 Fri,  2 Feb 2024 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1706904150; bh=EayggpD20ZVxvOuBUHp6GQDJdR4ntp9uMY9cbHbb30I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cI/JFAFg1rFMS70ZTBUTRo6ymeh73P7sSijXzXmSUjn/8PwDYCykzIIeFnWjzcwd3
 kgmpV8gQuWK0UMyeLlJFUYGcBRVtpHrmB2VdEZNbKDhacfBfI6cN4k0CQsIQANPrka
 7IigYT89fPdC8G1IHGZD7rjdSBhF+IbiCKStwX1c=
X-Riseup-User-ID: 918AF2773BAFBA0FA6A8F54866A4FC8F79B59C8D58DAD5DE7946EB67FE979219
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TRRWh0lHnzFpvw;
 Fri,  2 Feb 2024 20:02:23 +0000 (UTC)
Message-ID: <14ac793c-6660-434f-998d-af1f51b3b1d2@riseup.net>
Date: Fri, 2 Feb 2024 17:02:20 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
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
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240202174913.789a9db9@eldfell>
Content-Type: text/plain; charset=UTF-8
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



On 02/02/24 12:49, Pekka Paalanen wrote:
> On Fri, 2 Feb 2024 13:13:22 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
>> Hello Maxime,
>>
>> + Arthur
>>
>> mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
>>
>>> Hi Miquel,
>>>
>>> On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:  
>>>> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
>>>>     
>>>>> On Thu, 01 Feb 2024 18:31:32 +0100
>>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>>>>     
>>>>>> Change the composition algorithm to iterate over pixels instead of lines.
>>>>>> It allows a simpler management of rotation and pixel access for complex formats.
>>>>>>
>>>>>> This new algorithm allows read_pixel function to have access to x/y
>>>>>> coordinates and make it possible to read the correct thing in a block
>>>>>> when block_w and block_h are not 1.
>>>>>> The iteration pixel-by-pixel in the same method also allows a simpler
>>>>>> management of rotation with drm_rect_* helpers. This way it's not needed
>>>>>> anymore to have misterious switch-case distributed in multiple places.      
>>>>>
>>>>> Hi,
>>>>>
>>>>> there was a very good reason to write this code using lines:
>>>>> performance. Before lines, it was indeed operating on individual pixels.
>>>>>
>>>>> Please, include performance measurements before and after this series
>>>>> to quantify the impact on the previously already supported pixel
>>>>> formats, particularly the 32-bit-per-pixel RGB variants.
>>>>>
>>>>> VKMS will be used more and more in CI for userspace projects, and
>>>>> performance actually matters there.
>>>>>
>>>>> I'm worrying that this performance degradation here is significant. I
>>>>> believe it is possible to keep blending with lines, if you add new line
>>>>> getters for reading from rotated, sub-sampled etc. images. That way you
>>>>> don't have to regress the most common formats' performance.    
>>>>
>>>> While I understand performance is important and should be taken into
>>>> account seriously, I cannot understand how broken testing could be
>>>> considered better. Fast but inaccurate will always be significantly
>>>> less attractive to my eyes.    
>>>
>>> AFAIK, neither the cover letter nor the commit log claimed it was fixing
>>> something broken, just that it was "better" (according to what
>>> criteria?).  
>>
>> Better is probably too vague and I agree the "fixing" part is not
>> clearly explained in the commit log. The cover-letter however states:
>>
>>> Patch 2/2: This patch is more complex. My main target was to solve issues
>>> I found in [1], but as it was very complex to do it "in place", I choose
>>> to rework the composition function.  
>> ...
>>> [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/  
>>
>> If you follow this link you will find all the feedback and especially
>> the "broken" parts. Just to be clear, writing bugs is totally expected
>> and review/testing is supposed to help on this regard. I am not blaming
>> the author in any way, just focusing on getting this code in a more
>> readable shape and hopefully reinforce the testing procedure.
>>
>>> If something is truly broken, it must be stated what exactly is so we
>>> can all come up with a solution that will satisfy everyone.  
>>
>> Maybe going through the series pointed above will give more context
>> but AFAIU: the YUV composition is not totally right (and the tests used
>> to validate it need to be more complex as well in order to fail).
>>
>> Here is a proposal.
>>
>> Today's RGB implementation is only optimized in the line-by-line case
>> when there is no rotation. The logic is bit convoluted and may possibly
>> be slightly clarified with a per-format read_line() implementation,
>> at a very light performance cost. Such an improvement would definitely
>> benefit to the clarity of the code, especially when transformations
>> (especially the rotations) come into play because they would be clearly
>> handled differently instead of being "hidden" in the optimized logic.
>> Performances would not change much as this path is not optimized today
>> anyway (the pixel-oriented logic is already used in the rotation case).
>>
>> Arthur's YUV implementation is indeed well optimized but the added
>> complexity probably lead to small mistakes in the logic. The
>> per-format read_line() implementation mentioned above could be
>> extended to the YUV format as well, which would leverage Arthur's
>> proposal by re-using his optimized version. Louis will help on this
>> regard. However, for more complex cases such as when there is a
>> rotation, it will be easier (and not sub-optimized compared to the RGB
>> case) to also fallback to a pixel-oriented processing.
>>
>> Would this approach make sense?
> 
> Hi,
> 
> I think it would, if I understand what you mean. Ever since I proposed
> a line-by-line algorithm to improve the performance, I was thinking of
> per-format read_line() functions that would be selected outside of any
> loops. Extending that to support YUV is only natural. I can imagine
> rotation complicates things, and I won't oppose that resulting in a
> much heavier read_line() implementation used in those cases. They might
> perhaps call the original read_line() implementations pixel-by-pixel or
> plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
> things even further. That way one could compose any
> rotation-format-siting combination by chaining function pointers.
> 
> I haven't looked at VKMS in a long time, and I am disappointed to find
> that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
> The reading vfunc should be called with many pixels at a time when the
> source FB layout allows it. The whole point of the line-based functions
> was that they repeat the innermost loop in every function body to make
> the per-pixel overhead as small as possible. The VKMS implementations
> benchmarked before and after the original line-based algorithm showed
> that calling a function pointer per-pixel is relatively very expensive.
> Or maybe it was a switch-case.

Hi,

I think I'm the culprit for that, as stated on [1]. My intention with
the suggestion was to remove some code repetition and too facilitate the
rotation support implementation. Going back, I think I was to high on
DRY at the time and didn't worry about optimization, which was a
mistake.

But, I agree with Miquel that the rotation logic is easier to implement
in a pixel-based way. So going pixel-by-pixel only when rotation occurs
would be great.

Best Regards,
~Arthur Grillo

[1]: https://lore.kernel.org/dri-devel/20230418130525.128733-2-mcanal@igalia.com/

> 
> Sorry, I didn't realize the optimization had already been lost.
> 
> Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
> it's not composing anything and the name mislead me.
> 
> I think if you inspect the compositing code as of revision
> 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
> what it was supposed to be.
> 
> 
> Thanks,
> pq
