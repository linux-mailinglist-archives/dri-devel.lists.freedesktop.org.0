Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A741B434031
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D3E6EB52;
	Tue, 19 Oct 2021 21:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E026EB52
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:11:02 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id i15so2802638uap.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TpcK/HQWKsth5iekyEdh0YJpS4ZJRlx0FQDs8/7AR3Y=;
 b=SSXlodiXSnX9Kkthdy9xT/VrltJrq5470L2E0Jgr1b8guyFn39HKbYJBZMFIFMelnV
 Pq0ejDnxkITIl9fB5XNQElOn9rEQM/q/RsKSjg9H7wYVKFu1mLYqIVitZuGxKAl6DvaO
 NnMRBtD4ub6LzKnQX2KcksH38IDKRBfFaVXMXibrh7lDkzz5RIDzWZFRj+s1AJTU42dy
 +Cj4l4vyOtHPXwQrCZXTXPIqpit94l9KY8NX5xtyeL78X57AawCm+Crsvr5I8OpQ5RdF
 EraNd2N1Hg20Wb35g/fA94YSm+Yy1GZDuwpnzma0t7uaiPEEhoc7hwGgWSs2npz4iTgb
 YR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TpcK/HQWKsth5iekyEdh0YJpS4ZJRlx0FQDs8/7AR3Y=;
 b=YrxuKzUTUdiFA24VHuYDgsVoqPyfFaBUv1QI1+/j4Z8WkiI3WbR8JuselJGzYXEtS+
 QnejcbNZzrDGzZc7nJPTMb/VfaK1sxaRtUUrnV0VuEMY421tprmAR+t6ChfrRRd3SmQN
 geLlXSxo8Dr2+6Fqu08O2DyLI0k8axS5E+ikPjwgoX4qEstJ53ZG7ZiO66KoWMh7Ucda
 gQo6+5E/vyG+8aN8ADL4C9uhwClxjdyVGuhg33RGWSrNJchi3V58whqLq0fRBGw2IE14
 sXuRKHsxuxX0Ge/2KpqKop6WCf7Qj8oS/tK69Bng4HbpOXHKoPWFwylQKxnmfaquEw2c
 dNrg==
X-Gm-Message-State: AOAM530kRyHuc1Dk2L6u86Y3fYVDVnvA2OxVCo5p9+2vJ/2zveb8vIR3
 uDxzzZXFK48MgLEqbziXuLY=
X-Google-Smtp-Source: ABdhPJwCubWMMgUG3n8MRSp0oEzRR4pnvDS8nOLFZCoaDhu+LGIfZmrW3fYLLRZWu+XDK3PuZXOMCQ==
X-Received: by 2002:a67:1983:: with SMTP id 125mr39141286vsz.31.1634677860933; 
 Tue, 19 Oct 2021 14:11:00 -0700 (PDT)
Received: from [192.168.15.172] ([179.99.184.127])
 by smtp.gmail.com with ESMTPSA id z28sm108721vsi.0.2021.10.19.14.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:11:00 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept new
 formats
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-7-igormtorrente@gmail.com>
 <20211018113009.5519457c@eldfell>
 <d5f92494-9c55-2b7d-6107-6048abb41759@gmail.com>
 <20211019110535.18f56272@eldfell>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <c623cfdd-1b0c-0e15-b36e-e74119c41031@gmail.com>
Date: Tue, 19 Oct 2021 18:10:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019110535.18f56272@eldfell>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

Hi Pekka,

On 10/19/21 5:05 AM, Pekka Paalanen wrote:
> On Mon, 18 Oct 2021 16:26:06 -0300
> Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Pekka,
>>
>> On 10/18/21 5:30 AM, Pekka Paalanen wrote:
>>> On Tue,  5 Oct 2021 17:16:37 -0300
>>> Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
>>>    
>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>>>> as a color input.
>>>>
>>>> This patch refactors all the functions related to the plane composition
>>>> to overcome this limitation.
>>>>
>>>> Now the blend function receives a format handler to each plane and a
>>>> blend function pointer. It will take two ARGB_1616161616 pixels, one
>>>> for each handler, and will use the blend function to calculate and
>>>> store the final color in the output buffer.
>>>>
>>>> These format handlers will receive the `vkms_composer` and a pair of
>>>> coordinates. And they should return the respective pixel in the
>>>> ARGB_16161616 format.
>>>>
>>>> The blend function will receive two ARGB_16161616 pixels, x, y, and
>>>> the vkms_composer of the output buffer. The method should perform the
>>>> blend operation and store output to the format aforementioned
>>>> ARGB_16161616.
>>>
>>> Hi,
>>>
>>> here are some drive-by comments which you are free to take or leave.
>>>
>>> To find more efficient ways to do this, you might want research 
>>> library. It's MIT licensed.
>>>
>>> IIRC, the elementary operations there operate on pixel lines (pointer +
>>> length), not individual pixels (image, x, y). Input conversion function
>>> reads and converts a whole line a time. Blending function blends two
>>> lines and writes the output into back one of the lines. Output
>>> conversion function takes a line and converts it into destination
>>> buffer. That way the elementary operations do not need to take stride
>>> into account, and blending does not need to deal with varying memory
>>> alignment FWIW. The inner loops involve much less function calls and
>>> state, probably.
>>
>> I was doing some rudimentary profiling, and I noticed that the code
>> spends most of the time with the indirect system call overhead and not
>> the actual computation. This can definitively help with it.
> 
> Hi,
> 
> I suppose you mean function (pointer) call, not system call?

Yes, I misspelled it.

> 
> Really good that you have already profiled things. All optimisations
> should be guided by profiling, otherwise they are just guesses (and I
> got lucky this time I guess).
> 
>>> Pixman may not do exactly this, but it does something very similar.
>>> Pixman also has multiple different levels of optimisations, which may
>>> not be necessary for VKMS.
>>>
>>> It's a trade-off between speed and temporary memory consumed. You need
>>> temporary buffers for two lines, but not more (not a whole image in
>>> full intermediate precision). Further optimisation could determine
>>> whether to process whole image rows as lines, or split a row into
>>> multiple lines to stay within CPU cache size.
>>>    
>>
>> Sorry, I didn't understand the idea of the last sentence.
> 
> If an image is very wide, a single row could still be relatively large
> in size (bytes). If it is large enough that the working set falls out
> of a faster CPU cache into a slower CPU cache (or worse yet, into RAM
> accesses), performance may suffer and become memory bandwidth limited
> rather than ALU rate limited. Theoretically that can be worked around
> by limiting the maximum size of a line, and splitting an image row into
> multiple lines.

Got it now, thanks.

> 
> However, this is an optimisation one probably should not do until there
> is performance profiling data showing that it actually is useful. The
> optimal line size limit depends on the CPU model as well. So it's a bit
> far out, but something you could keep in mind just in case.

OK. For now I will not deal with this complexity, and if necessary I
will revisit it latter.

> 
>>> Since it seems you are blending multiple planes into a single
>>> destination which is assumed to be opaque, you might also be able to do
>>> the multiple blends without convert-writing and read-converting to/from
>>> the destination between every plane. I think that might be possible to
>>> architect on top of the per-line operations still.
>>
>> I tried it. But I don't know how to do this without looking like a mess.

I don't think it changes anything, but I forgot to mention that I tried
it with the blend per pixel and not a per line.

> 
> Dedicate one of the temporary line buffers for the destination, and
> instead of writing it out and loading it back for each input plane,
> leave it in place over all planes and write it out just once at the end.
> 
> I do expect more state tracking needed. You need to iterate over the
> list of planes for each output row, extract only the used part of an
> input plane's buffer into the other temporary line buffer, and offset
> the destination line buffer and length to match when passing those into
> a blending function.+

It's exactly this state tracking that was a mess when I was trying to
implement something similar. But this is one more thing that probably
I will have to revisit later.

> 
> It's not an obvious win but a trade-off, so profiling is again needed.
> 
> Btw. the use of temporary line buffers should also help with
> implementing scaling. You could do the filtering during reading of the
> input buffer. If the filter is not nearest, meaning you need to access
> more than one input pixel per pixel-for-blending, there are a few ways
> to go about that. You could do the filtering during the input buffer
> reading, or you could load two input buffer rows into temporary line
> buffers and do filtering as a separate step into yet another line
> buffer. As the composition advances from top to bottom, only one of the
> input buffer rows will change at a time (during up-scaling) so you can
> avoid re-loading a row by swapping the line buffers.
> 
> This is getting ahead of things, so don't worry about scaling or
> filtering yet. The first thing is to see if you can make the line
> buffer approach give you a significant speed-up.
> 
>> Does the pixman perform some similar?
> 
> No, Pixman composition operation has only three images: source,
> mask, and destination. All those it can handle simultaneously, but
> since there is no "multi-blending" API, it doesn't need to take care of
> more.
> 
> IIRC, Pixman also has a form of optimised operations that do blending
> and converting to destination in the same pass. The advantage of that
> is that blending can work with less precision when it knows what
> precision the output will be converted to and it saves some bandwidth
> by not needing to write-after-blending and read-for-conversion
> intermediate precision values. The disadvantage is that the number of
> needed specialised blending functions explodes by the number of
> possible destination formats. Pixman indeed makes those specialised
> functions optional, falling back to more generic C code. I would hope
> that VKMS does not need to go this far in optimisations though.

This should be plenty fast indeed. Maybe worth for formats that are
extremely common.

> 
>>>    
>>>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/vkms/vkms_composer.c | 275 ++++++++++++++-------------
>>>>    drivers/gpu/drm/vkms/vkms_formats.h  | 125 ++++++++++++
>>>>    2 files changed, 271 insertions(+), 129 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>>>
>>> ...
>>>    
>>>> +
>>>> +u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
>>>> +{
>>>> +	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
>>>> +
>>>> +	/*
>>>> +	 * Organizes the channels in their respective positions and converts
>>>> +	 * the 8 bits channel to 16.
>>>> +	 * The 257 is the "conversion ratio". This number is obtained by the
>>>> +	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>>>> +	 * the best color value in a color space with more possibilities.
>>>
>>> Pixel format, not color space. >
>>>> +	 * And a similar idea applies to others RGB color conversions.
>>>> +	 */
>>>> +	return ((u64)pixel_addr[3] * 257) << 48 |
>>>> +	       ((u64)pixel_addr[2] * 257) << 32 |
>>>> +	       ((u64)pixel_addr[1] * 257) << 16 |
>>>> +	       ((u64)pixel_addr[0] * 257);
>>>
>>> I wonder if the compiler is smart enough to choose between "mul 257"
>>> and "(v << 8) | v" operations... but that's probably totally drowning
>>> under the overhead of per (x,y) looping.
>>
>> I disassembled the code to check it. And looks like the compiler is
>> replacing the multiplication with shifts and additions.
>>
>> ARGB8888_to_ARGB16161616:
>>      0xffffffff816ad660 <+0>:     imul   0x12c(%rdi),%edx
>>      0xffffffff816ad667 <+7>:     imul   0x130(%rdi),%esi
>>      0xffffffff816ad66e <+14>:    add    %edx,%esi
>>      0xffffffff816ad670 <+16>:    add    0x128(%rdi),%esi
>>      0xffffffff816ad676 <+22>:    movslq %esi,%rax
>>      0xffffffff816ad679 <+25>:    add    0xe8(%rdi),%rax
>>      0xffffffff816ad680 <+32>:    movzbl 0x3(%rax),%ecx
>>      0xffffffff816ad684 <+36>:    movzbl 0x2(%rax),%esi
>>      0xffffffff816ad688 <+40>:    mov    %rcx,%rdx
>>      0xffffffff816ad68b <+43>:    shl    $0x8,%rdx
>>      0xffffffff816ad68f <+47>:    add    %rcx,%rdx
>>      0xffffffff816ad692 <+50>:    mov    %rsi,%rcx
>>      0xffffffff816ad695 <+53>:    shl    $0x8,%rcx
>>      0xffffffff816ad699 <+57>:    shl    $0x30,%rdx
>>      0xffffffff816ad69d <+61>:    add    %rsi,%rcx
>>      0xffffffff816ad6a0 <+64>:    movzbl (%rax),%esi
>>      0xffffffff816ad6a3 <+67>:    shl    $0x20,%rcx
>>      0xffffffff816ad6a7 <+71>:    or     %rcx,%rdx
>>      0xffffffff816ad6aa <+74>:    mov    %rsi,%rcx
>>      0xffffffff816ad6ad <+77>:    shl    $0x8,%rcx
>>      0xffffffff816ad6b1 <+81>:    add    %rsi,%rcx
>>      0xffffffff816ad6b4 <+84>:    or     %rcx,%rdx
>>      0xffffffff816ad6b7 <+87>:    movzbl 0x1(%rax),%ecx
>>      0xffffffff816ad6bb <+91>:    mov    %rcx,%rax
>>      0xffffffff816ad6be <+94>:    shl    $0x8,%rax
>>      0xffffffff816ad6c2 <+98>:    add    %rcx,%rax
>>      0xffffffff816ad6c5 <+101>:   shl    $0x10,%rax
>>      0xffffffff816ad6c9 <+105>:   or     %rdx,%rax
>>      0xffffffff816ad6cc <+108>:   ret
> 
> Nice!
> 
>>>    
>>>> +}
>>>> +
>>>> +u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
>>>> +{
>>>> +	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
>>>> +
>>>> +	/*
>>>> +	 * The same as the ARGB8888 but with the alpha channel as the
>>>> +	 * maximum value as possible.
>>>> +	 */
>>>> +	return 0xffffllu << 48 |
>>>> +	       ((u64)pixel_addr[2] * 257) << 32 |
>>>> +	       ((u64)pixel_addr[1] * 257) << 16 |
>>>> +	       ((u64)pixel_addr[0] * 257);
>>>> +}
>>>> +
>>>> +u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
>>>> +{
>>>> +	__le64 *pixel_addr = packed_pixels_addr(composer, x, y);
>>>> +
>>>> +	/*
>>>> +	 * Because the format byte order is in little-endian and this code
>>>> +	 * needs to run on big-endian machines too, we need modify
>>>> +	 * the byte order from little-endian to the CPU native byte order.
>>>> +	 */
>>>> +	return le64_to_cpu(*pixel_addr);
>>>> +}
>>>> +
>>>> +/*
>>>> + * The following functions are used as blend operations. But unlike the
>>>> + * `alpha_blend`, these functions take an ARGB16161616 pixel from the
>>>> + * source, convert it to a specific format, and store it in the destination.
>>>> + *
>>>> + * They are used in the `compose_active_planes` and `write_wb_buffer` to
>>>> + * copy and convert one pixel from/to the output buffer to/from
>>>> + * another buffer (e.g. writeback buffer, primary plane buffer).
>>>> + */
>>>> +
>>>> +void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
>>>> +			 struct vkms_composer *dst_composer)
>>>> +{
>>>> +	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>>>> +
>>>> +	/*This should be plenty fast indeed. Maybe worth for formats that are
extremely common.
>>>> +	 * This sequence below is important because the format's byte order is
>>>> +	 * in little-endian. In the case of the ARGB8888 the memory is
>>>> +	 * organized this way:
>>>> +	 *
>>>> +	 * | Addr     | = blue channel
>>>> +	 * | Addr + 1 | = green channel
>>>> +	 * | Addr + 2 | = Red channel
>>>> +	 * | Addr + 3 | = Alpha channel
>>>> +	 */
>>>> +	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
>>>> +	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
>>>> +	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
>>>> +	pixel_addr[3] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 48)) >> 48, 257);
>>>
>>> This could be potentially expensive if the compiler ends up using an
>>> actual div instruction.
>>>    
>> Yes, I'm using the DIV_ROUND_UP because I couldn't figure out how the
>> "Faster div by 255" works to adapt to 16 bits.
> 
> But does the compiler actually do a div instruction? If not, then no
> worries. If it does, then maybe something to look into, *if* this shows
> up in profiling.

GCC isn't issuing any div instruction here.

convert_to_ARGB8888:
    0xffffffff816ad770 <+0>:	imul   0x12c(%rcx),%edx
    0xffffffff816ad777 <+7>:	mov    %rcx,%rax
    0xffffffff816ad77a <+10>:	imul   0x130(%rcx),%esi
    0xffffffff816ad781 <+17>:	add    %edx,%esi
    0xffffffff816ad783 <+19>:	movzwl %di,%edx
    0xffffffff816ad786 <+22>:	add    0x128(%rcx),%esi
    0xffffffff816ad78c <+28>:	add    $0x100,%rdx
    0xffffffff816ad793 <+35>:	movslq %esi,%rcx
    0xffffffff816ad796 <+38>:	movabs $0xff00ff00ff00ff01,%rsi
    0xffffffff816ad7a0 <+48>:	add    0xe8(%rax),%rcx
    0xffffffff816ad7a7 <+55>:	mov    %rdx,%rax
    0xffffffff816ad7aa <+58>:	mul    %rsi
    0xffffffff816ad7ad <+61>:	shr    $0x8,%rdx
    0xffffffff816ad7b1 <+65>:	mov    %dl,(%rcx)
    0xffffffff816ad7b3 <+67>:	mov    %rdi,%rdx
    0xffffffff816ad7b6 <+70>:	shr    $0x10,%rdx
    0xffffffff816ad7ba <+74>:	movzwl %dx,%edx
    0xffffffff816ad7bd <+77>:	add    $0x100,%rdx
    0xffffffff816ad7c4 <+84>:	mov    %rdx,%rax
    0xffffffff816ad7c7 <+87>:	mul    %rsi
    0xffffffff816ad7ca <+90>:	shr    $0x8,%rdx
    0xffffffff816ad7ce <+94>:	mov    %dl,0x1(%rcx)
    0xffffffff816ad7d1 <+97>:	mov    %rdi,%rdx
    0xffffffff816ad7d4 <+100>:	shr    $0x30,%rdi
    0xffffffff816ad7d8 <+104>:	shr    $0x20,%rdx
    0xffffffff816ad7dc <+108>:	movzwl %dx,%edx
    0xffffffff816ad7df <+111>:	add    $0x100,%rdx
    0xffffffff816ad7e6 <+118>:	mov    %rdx,%rax
    0xffffffff816ad7e9 <+121>:	mul    %rsi
    0xffffffff816ad7ec <+124>:	shr    $0x8,%rdx
    0xffffffff816ad7f0 <+128>:	mov    %dl,0x2(%rcx)
    0xffffffff816ad7f3 <+131>:	lea    0x100(%rdi),%rdx
    0xffffffff816ad7fa <+138>:	mov    %rdx,%rax
    0xffffffff816ad7fd <+141>:	mul    %rsi
    0xffffffff816ad800 <+144>:	shr    $0x8,%rdx
    0xffffffff816ad804 <+148>:	mov    %dl,0x3(%rcx)
    0xffffffff816ad807 <+151>:	ret

> 
> 
> Thanks,
> pq
> 
>>> Btw. this would be shorter to write as
>>>
>>> 	(argb_src1 >> 16) & 0xffff
>>>
>>> etc.
>> I will use it in the V2. Thanks.
>>
>>>
>>> Thanks,
>>> pq
>>>    
>>>> +}
>>>> +
>>>> +void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
>>>> +			 struct vkms_composer *dst_composer)
>>>> +{
>>>> +	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>>>> +
>>>> +	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
>>>> +	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
>>>> +	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
>>>> +	pixel_addr[3] = 0xff;
>>>> +}
>>>> +
>>>> +void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
>>>> +			     struct vkms_composer *dst_composer)
>>>> +{
>>>> +	__le64 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>>>> +
>>>> +	*pixel_addr = cpu_to_le64(argb_src1);
>>>> +}
>>>> +
>>>> +#endif /* _VKMS_FORMATS_H_ */
>>>    
> 
