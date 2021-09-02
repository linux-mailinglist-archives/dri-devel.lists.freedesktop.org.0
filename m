Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF53FEF28
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982E66E508;
	Thu,  2 Sep 2021 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6CC6E528
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bw/td3GssnwtaBeINhtYQ/1qNIlura/RSFQlypdU1SY=; b=c/k/TKt5fLdGPjWCONe/5nriVj
 T353ets3IrCKf4nNLYel5YBEfv1dUulR1QI6KcWpolWY18Reu45V4UTfRvnElPaeyDUQYuvww2l5z
 4G2IyozoY9loVBoOYJiAM27zESLPdrUIoSgy3L2tubszkwAYRe2Mdkb0eWcbE7p/t0K+fb1p/ki6p
 t+Nn7f/w0sferhjGAGQq7NFDP2BpnQ2ZJyJ9K72+5FyOFvA51lSsL7VQpylmwU0m09nJr7+zIuEBK
 J4rHdHdUO4phun3/w997ti/xAFt08QgscpcAabEHdMPSUVvMECLGMKiXWdO57LuACaszQ1J5FJJXq
 xJSpRm4A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51795
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mLnO5-0005yF-Ai; Thu, 02 Sep 2021 16:08:17 +0200
Subject: Re: [PATCH 2/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se,
 linus.walleij@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-3-noralf@tronnes.org>
 <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
 <d72f5ef1-f701-3549-c459-236716674fd6@tronnes.org>
 <YS4fTzPUbwMvK5NK@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <848f5d65-8bad-0d69-18dd-ae81549283b4@tronnes.org>
Date: Thu, 2 Sep 2021 16:08:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YS4fTzPUbwMvK5NK@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
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



Den 31.08.2021 14.23, skrev Daniel Vetter:
> On Mon, Aug 30, 2021 at 02:08:14PM +0200, Noralf Trønnes wrote:
>>
>>
>> Den 17.08.2021 15.56, skrev Daniel Vetter:
>>> On Tue, Aug 17, 2021 at 02:29:12PM +0200, Noralf Trønnes wrote:
>>>> Add XRGB8888 emulation support for devices that can only do RGB332.
>>>>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>>> ---
>>>>  drivers/gpu/drm/drm_format_helper.c | 47 +++++++++++++++++++++++++++++
>>>>  include/drm/drm_format_helper.h     |  2 ++
>>>>  2 files changed, 49 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>>>> index 5231104b1498..53b426da7467 100644
>>>> --- a/drivers/gpu/drm/drm_format_helper.c
>>>> +++ b/drivers/gpu/drm/drm_format_helper.c
>>>> @@ -135,6 +135,53 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>>>>  }
>>>>  EXPORT_SYMBOL(drm_fb_swab);
>>>>  
>>>> +static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, u32 *sbuf, unsigned int pixels)
>>>> +{
>>>> +	unsigned int x;
>>>> +
>>>> +	for (x = 0; x < pixels; x++)
>>>> +		dbuf[x] = ((sbuf[x] & 0x00e00000) >> 16) |
>>>
>>> I think for 2/3 bits correct rounding would be useful, not just masking.
>>> i.e. before you shift add 0x00100000 here, and similar below.
>>>
>>
>> Math isn't my strongest side and my brain failed to turn this into code.
> 
> Essentially add half of the lowest bit before you mask, so
> 
> ((sbuf[x] + 0x10) & 0xe0 )
> 

But what if the value is 0xff, it overflows:

((0xff + 0x10) & 0xe0 ) == 0x00

Should it be OR?

((0xff | 0x10) & 0xe0 ) == 0xe0

Noralf.

> I dropped the shift to make it clear what's going on. If you're mask is
> 0xc0, then you simply add 0x20 before masking.
> 
>>> Also I just realized we've totally ignored endianess on these, which is
>>> not great, because strictly speaking all the drm_fourcc codes should be
>>> little endian. But I'm also not sure that's worth fixing ...
>>>
>>
>> Is it as simple as using le32_to_cpu()?
> 
> I think so.
> 
> Plus on any format that has u16 output we'd need a cpu_to_le16 wrapped
> around the entire thing.
> -Daniel
> 
>> static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf,
>> unsigned int pixels)
>> {
>> 	unsigned int x;
>> 	u32 pix;
>>
>> 	for (x = 0; x < pixels; x++) {
>> 		pix = le32_to_cpu(sbuf[x]);
>> 		dbuf[x] = ((pix & 0x00e00000) >> 16) |
>> 			  ((pix & 0x0000e000) >> 11) |
>> 			  ((pix & 0x000000c0) >> 6);
>> 	}
>> }
>>
>> Noralf.
>>
>>> Either way, lgtm:
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>>> +			  ((sbuf[x] & 0x0000e000) >> 11) |
>>>> +			  ((sbuf[x] & 0x000000c0) >> 6);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
>>>> + * @dst: RGB332 destination buffer
>>>> + * @src: XRGB8888 source buffer
>>>> + * @fb: DRM framebuffer
>>>> + * @clip: Clip rectangle area to copy
>>>> + *
>>>> + * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
>>>> + *
>>>> + * This function does not apply clipping on dst, i.e. the destination is a small buffer
>>>> + * containing the clip rect only.
>>>> + */
>>>> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
>>>> +			       struct drm_rect *clip)
>>>> +{
>>>> +	size_t width = drm_rect_width(clip);
>>>> +	size_t src_len = width * sizeof(u32);
>>>> +	unsigned int y;
>>>> +	void *sbuf;
>>>> +
>>>> +	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
>>>> +	sbuf = kmalloc(src_len, GFP_KERNEL);
>>>> +	if (!sbuf)
>>>> +		return;
>>>> +
>>>> +	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
>>>> +	for (y = 0; y < drm_rect_height(clip); y++) {
>>>> +		memcpy(sbuf, src, src_len);
>>>> +		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
>>>> +		src += fb->pitches[0];
>>>> +		dst += width;
>>>> +	}
>>>> +
>>>> +	kfree(sbuf);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>>>> +
>>>>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
>>>>  					   unsigned int pixels,
>>>>  					   bool swab)
>>>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
>>>> index 4e0258a61311..d0809aff5cf8 100644
>>>> --- a/include/drm/drm_format_helper.h
>>>> +++ b/include/drm/drm_format_helper.h
>>>> @@ -16,6 +16,8 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vadd
>>>>  			   struct drm_rect *clip);
>>>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>>>>  		 struct drm_rect *clip, bool cached);
>>>> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
>>>> +			       struct drm_rect *clip);
>>>>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
>>>>  			       struct drm_framebuffer *fb,
>>>>  			       struct drm_rect *clip, bool swab);
>>>> -- 
>>>> 2.32.0
>>>>
>>>
> 
