Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00DB8391D4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 15:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58A710E510;
	Tue, 23 Jan 2024 14:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32FF10E739
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706021802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVJ0l/ExMxMzg3BeF2ONO+NHUalsweFQfWkS2d3ow8k=;
 b=WmijMCr+h4cbJzULbDpRldsOPYDA0tOe3HHG6RNiUBq5h0/2ZDA8srG/keNs5lYLkwxlaz
 AaT0+DkAWDRV2KetjTfB2k4Tq1FWD7+vEXlSAUdUvaIV7ff2HByU7aaLtHNBVvK6mJoK53
 2Nq9ZEf6+1FdsllVYuWMM2sT5SZtxHk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-wN4ulBEsMbW-vqkwsUxF5w-1; Tue, 23 Jan 2024 09:56:41 -0500
X-MC-Unique: wN4ulBEsMbW-vqkwsUxF5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e5f548313so38621255e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 06:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706021800; x=1706626600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVJ0l/ExMxMzg3BeF2ONO+NHUalsweFQfWkS2d3ow8k=;
 b=FXA9x8JWNZBZviEDSECM1rLJqBMM93KbmPQsI7iNiiWBHVt4vhE5nlnp/uuFkyxxgW
 Z6fpZsomOek0Q0djcyPLCFftZB27k2vL0I26KYufX5W//mB7xzM3B/xHsbs944QRMrod
 pVBiw/IYCydF6sx6/Eqqd/3qsH/CU6O+9qwQgqgq+jX8UytKJ0M+lot+ydKfLgg1rnxs
 Lc9M/p2eRymLt8ftEenmhedWo11Pn2dFaC+K/9xhLELrzY+bP3mprW7gXOylpc0v3QUb
 g2G4jPtSmiBkU3/T7SulCAdbv8MokZqmVNJDXAvJK8GmI+D3NzaMhy0MVQuiA6s1NI6v
 KEhw==
X-Gm-Message-State: AOJu0YxdoYLd0LjYVFyUKgcvTWulIUk3wlfGR0ZkDxv3cDfvuYJ7Qczg
 xaSXCz4mvKb9m2TNZfhEUuk74oNyZ+MLVBwt8mOnFIPEOUPuWgfeY+ndNeFOBm+Eq92HCUVoDR0
 ydWQEDfhAlsYAVGRnoYR1dz76+q5OvCQKBJwn86TKkSSTa95H5uwRXoIHpkvNY2myyA==
X-Received: by 2002:a05:600c:4747:b0:40e:714a:dff5 with SMTP id
 w7-20020a05600c474700b0040e714adff5mr620595wmo.27.1706021799824; 
 Tue, 23 Jan 2024 06:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnoAhTyncgG1e91mxJfWo03BSIU36z23Q5RVAmVDhHG76H+PeRxUCT6uw78j2DAI60QoIGSQ==
X-Received: by 2002:a05:600c:4747:b0:40e:714a:dff5 with SMTP id
 w7-20020a05600c474700b0040e714adff5mr620584wmo.27.1706021799495; 
 Tue, 23 Jan 2024 06:56:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm41966969wmb.4.2024.01.23.06.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 06:56:39 -0800 (PST)
Message-ID: <fe5cb817-bb0e-4549-aa9a-d22ffeb512f4@redhat.com>
Date: Tue, 23 Jan 2024 15:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
 <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/01/2024 13:56, Thomas Zimmermann wrote:
> Hi,
> 
> FYI for points 1 and 2, I'm typing up a patchset that introduces 
> drm_pixmap for the source buffer. I'll post it when I have something ready.

Thanks, I didn't have time to look into this yet.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> Am 19.01.24 um 11:58 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 17.01.24 um 17:40 schrieb Jocelyn Falempe:
>>>
>>>
>>> On 17/01/2024 16:06, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 04.01.24 um 17:00 schrieb Jocelyn Falempe:
>>>>> This is needed for drm_panic, to draw the font, and fill
>>>>> the background color, in multiple color format.
>>>>
>>>> TBH, I don't like this patch at all. It looks like you're 
>>>> reimplementing existing functionality for a single use case; 
>>>> specifically drm_fb_blit().
>>>>
>>>> What's wrong with the existing interfaces?
>>
>> I've spend considerable time to clean up the format-helper code and 
>> get it into shape. It's not there yet, but on its way. So I'd rather 
>> prefer to update the existing code for new use cases. Adding a new 
>> interface for a single use case is something like a leap backwards.
>>
>> So let's see if we can work out something.
>>
>>>
>>> drm_fb_blit() is good to copy a framebuffer to another, but is 
>>> clearly unoptimal to draw font.
>>
>> 1) The framebuffer data structure is only there for historical 
>> reasons. It should be removed from the internal implementation 
>> entirely. A first patch should go into this in any case. It didn't 
>> happened so far, as I've been busy with other work.
>>
>> 2) For the public API, I've long wanted to replace framebuffers with 
>> something more flexible, let's call it drm_pixmap
>>
>>    struct drm_pixmap {
>>      struct drm_format_info *format
>>      unsigned int width, height
>>      unsigned int pitches[DRM_FORMAT_MAX_PLANES]
>>      iomap vaddr[DRM_FORMAT_MAX_PLANES]
>>    };
>>
>> It's the essence of drm_framebuffer. Let's say there's also an init 
>> helper drm_pixmap_init_from_framebuffer(pix, fb) that sets up 
>> everything. The implementation of drm_fb_blit() would look like this:
>>
>>    drm_fb_blit(...) {
>>
>>      drm_pixmap pix;
>>      drm_pixmap_init_from_framebuffer(pix, fb)
>>      __drm_fb_blit_pixmap( <like drm_fb_blit() but with a pixmap> )
>>    }
>>
>> That would require some changes to drivers, but it's only simple 
>> refactoring.
>>
>> 3) When looking at your patch, there's
>>
>>    src = font->data + (msg->txt[i] * font->height) * src_stride;
>>
>> which should be in a helper that sets up the drm_pixmap for a font 
>> character:
>>
>>    drm_pixmap_init_from_char(pixmap, c, font_data)
>>
>> where 'c' equals msg->txt[i]
>>
>> The text drawing in the panic handler would do something like
>>
>>    for (msg->txt[i]) {
>>      drm_pixmap_init_from_char(pixmap, ...)
>>            drm_fb_blit_pixmap(...)
>>    }
>>
>>
>>> It handles xrgb8888 to any rgb format, and I need monochrome to any 
>>> rgb format.
>>
>> 4) You're free to add any conversion to drm_fb_blit(). It's supposed 
>> to handle all available format conversion. With the pixmap-related 
>> changes outlined above and the actual conversion code, I think that 
>> would already put characters on the screen.
>>
>>> I need to convert foreground and background color to the destination 
>>> format, but using drm_fb_blit() to convert 1 pixel is tedious.
>>
>> 5) I've recently added drm_format_conv_state to the API. It is 
>> supposed to hold state that is required for the conversion process. I 
>> specifically had color palettes in mind. Please use the data 
>> structure. Something like that:
>>
>>    struct drm_format_conv_state {
>>      ...
>>      const drm_color_lut *palette;
>>    }
>>
>> and in the conversion code:
>>
>>    void r1_to_rgb() {
>>      for (x < pixels) {
>>          rgb = state->palette[r1]
>>      }
>>    }
>>
>>>
>>> It also requires an additional memory buffer, and do an additional 
>>> memory copy that we don't need at all.
>>
>> 6) That memcpy_to_io() not a big deal. You should pre-allocate that 
>> memory buffer in the panic handler and init the drm_format_conv_state 
>> with DRM_FORMAT_CONV_STATE_INIT_PREALLOCATED().
>>
>>>
>>> It also has no way to fill a region with the background color.
>>
>> 7) Please add a separate drm_fb_fill() implementation. If you have a 
>> palette in struct drm_format_conf_state, you can add a helper for each 
>> destination format that takes a drm_color_lut value as input.
>>
>> This point is probably worth a separate discussion.
>>
>>>
>>> The last thing, is if I plan to add YUV support, with this 
>>> implementation, I only need to write one function that convert one 
>>> pixel. Otherwise I would need to add the drm_fb_r1_to_yuvxxx_line() 
>>> and drm_fb_r1_to_yuvxxxx() boilerplate.
>>
>> 8) YUVs are multi-plane formats IIRC. So it's likely a bit more 
>> complicated.And I'm not aware of any current use case for YUV. If the 
>> framebuffer console doesn't support it, the panic helper probably 
>> won't either.
>>
>> Best regards
>> Thomas
>>
>>>
>>> Best regards,
>>>
>>
> 

