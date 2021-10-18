Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC08C43278A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 21:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5AD89CA1;
	Mon, 18 Oct 2021 19:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E289CA1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 19:26:10 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id h4so6668928uaw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6q9mrYREhy1PS0zxwbz6IygpGUtwaBnRqvZjeZk381w=;
 b=RY1BYPX+CGClIeAb+4/EKVV7QzBSx+Goqe566R5NqfrEOUXLrCu3Hvnnwy8XBJzh7e
 B+MnaxDaPfX7pXad4XBu57TlLMefrNJhhxLhkMjGlBLK+niAN0Ga+dtgfjwgl0LGI4D3
 1ge1AAMXAVjSWilE0IJVM3FkNYgJNtocaVt1qxbXll6EqU1GnydyY43QkZBdoqpNT6C3
 qMg03sMNpNS4QGsD15wxRf28mNBFcRyiPsndOC3H8VZobuAntm94xG5+TAqfpp502e1+
 f+80VEqwGwEpANSIuxnnFW6yd0jvI+Dy4rYwmwDBgHdKdtdbswNGa17beHlt5FfRXl0o
 rKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6q9mrYREhy1PS0zxwbz6IygpGUtwaBnRqvZjeZk381w=;
 b=GQySrFCPc8IE9mSXS0/Giy6ufsLYCfrvOS5ldGIg0Vn6av4nI7rriTP5jjw3N37uXw
 GhGbtlXX2Wrgx3cMOefDf8uziBGQ5RLq9yJl3lLMRJaRqKo6kUNfuYasIWm2pR7pTHJX
 LEf01HdKc37ovKGJKn4uFIomUxiBANw419LpOq0ptTRtgMJ3uw9FrfQIjnZ7+aiSjuWl
 Oyip7OXFvnfm+i7jRZHk65763C7lKjgd9wJj5h+H1bvKT5eEYZPYtQw+5gcbdREqYFgY
 Q3qOhc9gB1a5jFEuJW0bZNhBc0+vcVNY/hSZMZymTC7NGIHGUGF9Y1o4uDz51UXcTvTq
 MM1Q==
X-Gm-Message-State: AOAM53237srs3qYIeQZ1Fx6dSAloj+cF5AIBvCD23pzg7OGxYf1PwWNB
 7FUo/sKeNcJbgXponMS8mbVjDwv99rY=
X-Google-Smtp-Source: ABdhPJwQr9j8xnumy0Lb0UXlWqho1sFEyszT/pmlUflLpUXCEybORWiM8jx9B3HdIg4ppQ18QhAw5Q==
X-Received: by 2002:a67:d504:: with SMTP id l4mr29712049vsj.42.1634585169691; 
 Mon, 18 Oct 2021 12:26:09 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc?
 ([2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc])
 by smtp.gmail.com with ESMTPSA id x21sm9571007uao.2.2021.10.18.12.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 12:26:09 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept new
 formats
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-7-igormtorrente@gmail.com>
 <20211018113009.5519457c@eldfell>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <d5f92494-9c55-2b7d-6107-6048abb41759@gmail.com>
Date: Mon, 18 Oct 2021 16:26:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018113009.5519457c@eldfell>
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

On 10/18/21 5:30 AM, Pekka Paalanen wrote:
> On Tue,  5 Oct 2021 17:16:37 -0300
> Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> 
>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>> as a color input.
>>
>> This patch refactors all the functions related to the plane composition
>> to overcome this limitation.
>>
>> Now the blend function receives a format handler to each plane and a
>> blend function pointer. It will take two ARGB_1616161616 pixels, one
>> for each handler, and will use the blend function to calculate and
>> store the final color in the output buffer.
>>
>> These format handlers will receive the `vkms_composer` and a pair of
>> coordinates. And they should return the respective pixel in the
>> ARGB_16161616 format.
>>
>> The blend function will receive two ARGB_16161616 pixels, x, y, and
>> the vkms_composer of the output buffer. The method should perform the
>> blend operation and store output to the format aforementioned
>> ARGB_16161616.
> 
> Hi,
> 
> here are some drive-by comments which you are free to take or leave.
> 
> To find more efficient ways to do this, you might want research Pixman
> library. It's MIT licensed.
> 
> IIRC, the elementary operations there operate on pixel lines (pointer +
> length), not individual pixels (image, x, y). Input conversion function
> reads and converts a whole line a time. Blending function blends two
> lines and writes the output into back one of the lines. Output
> conversion function takes a line and converts it into destination
> buffer. That way the elementary operations do not need to take stride
> into account, and blending does not need to deal with varying memory
> alignment FWIW. The inner loops involve much less function calls and
> state, probably.

I was doing some rudimentary profiling, and I noticed that the code 
spends most of the time with the indirect system call overhead and not 
the actual computation. This can definitively help with it.

> 
> Pixman may not do exactly this, but it does something very similar.
> Pixman also has multiple different levels of optimisations, which may
> not be necessary for VKMS.
> 
> It's a trade-off between speed and temporary memory consumed. You need
> temporary buffers for two lines, but not more (not a whole image in
> full intermediate precision). Further optimisation could determine
> whether to process whole image rows as lines, or split a row into
> multiple lines to stay within CPU cache size.
> 

Sorry, I didn't understand the idea of the last sentence.

> Since it seems you are blending multiple planes into a single
> destination which is assumed to be opaque, you might also be able to do
> the multiple blends without convert-writing and read-converting to/from
> the destination between every plane. I think that might be possible to
> architect on top of the per-line operations still.

I tried it. But I don't know how to do this without looking like a mess. 
Does the pixman perform some similar?

> 
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_composer.c | 275 ++++++++++++++-------------
>>   drivers/gpu/drm/vkms/vkms_formats.h  | 125 ++++++++++++
>>   2 files changed, 271 insertions(+), 129 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> 
> ...
> 
>> +
>> +u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
>> +{
>> +	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
>> +
>> +	/*
>> +	 * Organizes the channels in their respective positions and converts
>> +	 * the 8 bits channel to 16.
>> +	 * The 257 is the "conversion ratio". This number is obtained by the
>> +	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>> +	 * the best color value in a color space with more possibilities.
> 
> Pixel format, not color space. >
>> +	 * And a similar idea applies to others RGB color conversions.
>> +	 */
>> +	return ((u64)pixel_addr[3] * 257) << 48 |
>> +	       ((u64)pixel_addr[2] * 257) << 32 |
>> +	       ((u64)pixel_addr[1] * 257) << 16 |
>> +	       ((u64)pixel_addr[0] * 257);
> 
> I wonder if the compiler is smart enough to choose between "mul 257"
> and "(v << 8) | v" operations... but that's probably totally drowning
> under the overhead of per (x,y) looping.

I disassembled the code to check it. And looks like the compiler is 
replacing the multiplication with shifts and additions.

ARGB8888_to_ARGB16161616:
    0xffffffff816ad660 <+0>:     imul   0x12c(%rdi),%edx
    0xffffffff816ad667 <+7>:     imul   0x130(%rdi),%esi
    0xffffffff816ad66e <+14>:    add    %edx,%esi
    0xffffffff816ad670 <+16>:    add    0x128(%rdi),%esi
    0xffffffff816ad676 <+22>:    movslq %esi,%rax
    0xffffffff816ad679 <+25>:    add    0xe8(%rdi),%rax
    0xffffffff816ad680 <+32>:    movzbl 0x3(%rax),%ecx
    0xffffffff816ad684 <+36>:    movzbl 0x2(%rax),%esi
    0xffffffff816ad688 <+40>:    mov    %rcx,%rdx
    0xffffffff816ad68b <+43>:    shl    $0x8,%rdx
    0xffffffff816ad68f <+47>:    add    %rcx,%rdx
    0xffffffff816ad692 <+50>:    mov    %rsi,%rcx
    0xffffffff816ad695 <+53>:    shl    $0x8,%rcx
    0xffffffff816ad699 <+57>:    shl    $0x30,%rdx
    0xffffffff816ad69d <+61>:    add    %rsi,%rcx
    0xffffffff816ad6a0 <+64>:    movzbl (%rax),%esi
    0xffffffff816ad6a3 <+67>:    shl    $0x20,%rcx
    0xffffffff816ad6a7 <+71>:    or     %rcx,%rdx
    0xffffffff816ad6aa <+74>:    mov    %rsi,%rcx
    0xffffffff816ad6ad <+77>:    shl    $0x8,%rcx
    0xffffffff816ad6b1 <+81>:    add    %rsi,%rcx
    0xffffffff816ad6b4 <+84>:    or     %rcx,%rdx
    0xffffffff816ad6b7 <+87>:    movzbl 0x1(%rax),%ecx
    0xffffffff816ad6bb <+91>:    mov    %rcx,%rax
    0xffffffff816ad6be <+94>:    shl    $0x8,%rax
    0xffffffff816ad6c2 <+98>:    add    %rcx,%rax
    0xffffffff816ad6c5 <+101>:   shl    $0x10,%rax
    0xffffffff816ad6c9 <+105>:   or     %rdx,%rax
    0xffffffff816ad6cc <+108>:   ret

> 
>> +}
>> +
>> +u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
>> +{
>> +	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
>> +
>> +	/*
>> +	 * The same as the ARGB8888 but with the alpha channel as the
>> +	 * maximum value as possible.
>> +	 */
>> +	return 0xffffllu << 48 |
>> +	       ((u64)pixel_addr[2] * 257) << 32 |
>> +	       ((u64)pixel_addr[1] * 257) << 16 |
>> +	       ((u64)pixel_addr[0] * 257);
>> +}
>> +
>> +u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
>> +{
>> +	__le64 *pixel_addr = packed_pixels_addr(composer, x, y);
>> +
>> +	/*
>> +	 * Because the format byte order is in little-endian and this code
>> +	 * needs to run on big-endian machines too, we need modify
>> +	 * the byte order from little-endian to the CPU native byte order.
>> +	 */
>> +	return le64_to_cpu(*pixel_addr);
>> +}
>> +
>> +/*
>> + * The following functions are used as blend operations. But unlike the
>> + * `alpha_blend`, these functions take an ARGB16161616 pixel from the
>> + * source, convert it to a specific format, and store it in the destination.
>> + *
>> + * They are used in the `compose_active_planes` and `write_wb_buffer` to
>> + * copy and convert one pixel from/to the output buffer to/from
>> + * another buffer (e.g. writeback buffer, primary plane buffer).
>> + */
>> +
>> +void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
>> +			 struct vkms_composer *dst_composer)
>> +{
>> +	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>> +
>> +	/*
>> +	 * This sequence below is important because the format's byte order is
>> +	 * in little-endian. In the case of the ARGB8888 the memory is
>> +	 * organized this way:
>> +	 *
>> +	 * | Addr     | = blue channel
>> +	 * | Addr + 1 | = green channel
>> +	 * | Addr + 2 | = Red channel
>> +	 * | Addr + 3 | = Alpha channel
>> +	 */
>> +	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
>> +	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
>> +	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
>> +	pixel_addr[3] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 48)) >> 48, 257);
> 
> This could be potentially expensive if the compiler ends up using an
> actual div instruction.
> 
Yes, I'm using the DIV_ROUND_UP because I couldn't figure out how the 
"Faster div by 255" works to adapt to 16 bits.

> Btw. this would be shorter to write as
> 
> 	(argb_src1 >> 16) & 0xffff
> 
> etc.
I will use it in the V2. Thanks.

> 
> Thanks,
> pq
> 
>> +}
>> +
>> +void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
>> +			 struct vkms_composer *dst_composer)
>> +{
>> +	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>> +
>> +	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
>> +	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
>> +	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
>> +	pixel_addr[3] = 0xff;
>> +}
>> +
>> +void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
>> +			     struct vkms_composer *dst_composer)
>> +{
>> +	__le64 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
>> +
>> +	*pixel_addr = cpu_to_le64(argb_src1);
>> +}
>> +
>> +#endif /* _VKMS_FORMATS_H_ */
> 
