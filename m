Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F14D2EA1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5B310E533;
	Wed,  9 Mar 2022 12:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622110E546
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646827391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tg1o0vf2e/XRSv/u3YehBRlt1pjhs1t2fKcaz6fZZ34=;
 b=fhlYUfiZjwZ8W+9YOQsIvOne9LY+lsq3PJ44BazGQ9AB9EmEJ4qFpYvETa9BRGhLPDhiEx
 SPvvCbCQN4AjH54N10b06SlLVcMQreYYwIRmYLgxbJw/qMwjcYAWvEn9KBB6Y4pTf+rwXn
 AH9XQanLnB4Hj2FvK+IV+rDvSNgK4Qc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-ilfmn9V7MzykQWFsmxwdcg-1; Wed, 09 Mar 2022 07:03:10 -0500
X-MC-Unique: ilfmn9V7MzykQWFsmxwdcg-1
Received: by mail-wr1-f69.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so690858wrw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tg1o0vf2e/XRSv/u3YehBRlt1pjhs1t2fKcaz6fZZ34=;
 b=MFi70No6J4d1fUnMEHKtkqHdsA+fMha0vbxuFatkU5ziswtXQFQBtwtnB6vmmJVK8N
 s1PhJ1lwiWl5HO8z9WSu3yId0gixOGunKRlc7RgLzI+3n7D3jvzuireTxHcoV2YB/jPL
 QyulFwp4J2gVgKV0tkTQ54/vlCZP84W3HnBJtxUGfdT7oK9fie92aam5KpOGke09tWQw
 YGwcQUlCx+nbNTPXTLqiaLqWHnmaHUsQta6G/9yPFnLxLo3PGQOOc9ZLAZPZhE7Oim7q
 kicE1WNbBfI1fAO3icq6L5fTSQd+O22nOYi8nTSbFKlOEP0JNwrqSJFvJOzRkkhbGwtV
 6usA==
X-Gm-Message-State: AOAM530msy0IRRzWW6dM0sSbX74wd2vy6yJeQD3kWQe0Dl9Xz/gNGBLi
 2vaIBqyDfzEWxxoxlcC8fLrohZGRVCvygDhgOuZNOSnsSVINSytQ9PaOMYlGpsc1IJ6FsK+mvv2
 V4fx5u67E+5Io49zirZucCK3fQ5lu
X-Received: by 2002:a05:600c:22cd:b0:389:c99a:45a4 with SMTP id
 13-20020a05600c22cd00b00389c99a45a4mr3087807wmg.38.1646827387294; 
 Wed, 09 Mar 2022 04:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvQMnTjm+Qq5odCLZwgqJ2OfY5/z2HM+SprEExkrP+P+U9HfPpAzWfgeU88YgEHXz8I1b3Nw==
X-Received: by 2002:a05:600c:22cd:b0:389:c99a:45a4 with SMTP id
 13-20020a05600c22cd00b00389c99a45a4mr3087777wmg.38.1646827386977; 
 Wed, 09 Mar 2022 04:03:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g17-20020adff411000000b001f03426827csm1551217wro.71.2022.03.09.04.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:03:06 -0800 (PST)
Message-ID: <809430bb-4ffb-3bd4-7062-ec8b78245387@redhat.com>
Date: Wed, 9 Mar 2022 13:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-3-javierm@redhat.com>
 <CAMuHMdWZHBVwaLDi-B=PrVOfcHxGLxwgDBisvexE94x72qvdJg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWZHBVwaLDi-B=PrVOfcHxGLxwgDBisvexE94x72qvdJg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

Thanks a lot for your feedback.

On 3/8/22 17:13, Geert Uytterhoeven wrote:

[snip]

>> +
>> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
> 
> "pixels" is not the number of pixels to process, but the number of
> bytes in the monochrome destination buffer.
>

Right, that parameter name is misleading / incorrect indeed. Probably
should be changed by dst_pitch or dst_stride.
 
>> +                                              unsigned int start_offset, unsigned int end_len)
>> +{
>> +       unsigned int xb, i;
>> +
>> +       for (xb = 0; xb < pixels; xb++) {
>> +               unsigned int start = 0, end = 8;
>> +               u8 byte = 0x00;
>> +
>> +               if (xb == 0 && start_offset)
>> +                       start = start_offset;
>> +
>> +               if (xb == pixels - 1 && end_len)
>> +                       end = end_len;
>> +
>> +               for (i = start; i < end; i++) {
>> +                       unsigned int x = xb * 8 + i;
>> +
>> +                       byte >>= 1;
>> +                       if (src[x] >> 7)
>> +                               byte |= BIT(7);
>> +               }
>> +               *dst++ = byte;
>> +       }
> 
> The above is IMHO very hard to read.
> I think it can be made simpler by passing the total number of pixels
> to process instead of "pixels" (which is bytes) and "end_len".
>

Agreed that's hard to read. I think is better if you propose a patch
with your idea to make it simpler.
 
[snip]

>> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
>> +                                     const struct drm_framebuffer *fb, const struct drm_rect *clip)
>> +{
>> +       unsigned int linepixels = drm_rect_width(clip);
>> +       unsigned int lines = clip->y2 - clip->y1;
> 
> drm_rect_height(clip)?
>

Yes, unsure why didn't use it since used drm_rect_width() for the width.
 
>> +       unsigned int cpp = fb->format->cpp[0];
>> +       unsigned int len_src32 = linepixels * cpp;
>> +       struct drm_device *dev = fb->dev;
>> +       unsigned int start_offset, end_len;
>> +       unsigned int y;
>> +       u8 *mono = dst, *gray8;
>> +       u32 *src32;
>> +
>> +       if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
>> +               return;
>> +
>> +       /*
>> +        * The reversed mono destination buffer contains 1 bit per pixel
>> +        * and destination scanlines have to be in multiple of 8 pixels.
>> +        */
>> +       if (!dst_pitch)
>> +               dst_pitch = DIV_ROUND_UP(linepixels, 8);
> 
> This is not correct when clip->x1 is not a multiple of 8 pixels.
> Should be:
> 
>     DIV_ROUND_UP(linepixels + clip->x1 % 8, 8);
>

Agreed.
 
>> +
>> +       drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> 
> This triggers for me: dst_pitch = 1.
> Which is perfectly fine, when flashing an 8-pixel wide cursor ;-)
>

Indeed. I think we should just drop that warn.

Do you want me to post patches for all these or would you do it
when simplifying the drm_fb_gray8_to_mono_reversed_line() logic ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

