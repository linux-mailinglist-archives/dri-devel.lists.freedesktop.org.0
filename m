Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741DA9EE166
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDF910ECF8;
	Thu, 12 Dec 2024 08:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TtZyqFCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFA510ECF8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733992608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2OdCCLE8DIZKmdBcmfkMR6vuKRmVHnvlSP4k0Du3Rk=;
 b=TtZyqFCnCg+GL+0ejWPnWHIBKn1f5bhA46s/mMRyei6shqEmJS8t/xIhaA+d2sNe/gIMKL
 PaFu9CemYJcnKzXCA+jrvN4gB52AA67+masIDQizZsAFmn3Vu33VbrmikNGawCdhAyeXiN
 hWVjgRX9DZHdB9CwD5/KG2QCQ3A3fRo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-NhD43WHOPqOF-NmeJ7PP0w-1; Thu, 12 Dec 2024 03:36:47 -0500
X-MC-Unique: NhD43WHOPqOF-NmeJ7PP0w-1
X-Mimecast-MFC-AGG-ID: NhD43WHOPqOF-NmeJ7PP0w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434fb9646efso3044765e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733992606; x=1734597406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b2OdCCLE8DIZKmdBcmfkMR6vuKRmVHnvlSP4k0Du3Rk=;
 b=gVnlH0Rkhlb3Dwy+w0mKAltgaIfI7sEQLqep6RfTU7QWoaD7L4BRhdxB+fcZG9ZTFx
 4cKrJfkR4tNddlBkfFOj9cf7HznrFaGmKSNrU5gjvo7p6gCLSZrev5tuUrL4ZxVmcLjt
 u4PxgCH2mu55/ybbnGjKlOLOoucx7XQitQkFupONLMyVriAmLkXTcpo1e7pR2ln4vubn
 3rNnFj3QKySEIcGPzsmGzhfYmqFFAyR0n8TzmbZQ2J6mHOdukPBlRxacl8ndThGxon80
 fqXu9yo6RaxXfBj3pgMZj2QcEvV2xtO25lDfzCMn9Sz0kVKbuVr4w9FP/CElIVvRCW4P
 DTXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhWGgt5A0qfEXfWKfsQdbdDnRflqSPcJGrwptS/1CGk54GB/lMTkxSlyufqfpmKITYu0AJ4ooVQrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEMlHaMxF/xsmvOQ67mxiqyGBnCViu/DFB2QCt431HSPUCawjT
 02xU7Vlbq5400uAVqrd/KA514M8TC7gPH2X1AOT/hiyGYGut0oxMK7mzCUNv0hARswgDx9hx3T3
 zHsk6QXfI5PSLTTyLi1SHeluOzVP5tvEQxSRVxVQSk8aBK+HUf8T5sChv//PQPGFPwMr12eE8Cw
 ==
X-Gm-Gg: ASbGnctYekfJsNDcO6xikjq2upabhntNmnykUIoQeQ/RUjgplsJv8sGi+Raawbp8Ygb
 TRPjbqOIzEApOtpUACILYrjqDZQH/EG4XUiAR1D+ugwtK06LmsOiwlLQ6jU6Co9Bnf3Y4m5qKSe
 P7k4NaNXWALyRm2v6UCqvWVpW7gutsfQ3IXwS0PicOlIfa9P/gqFsINBDCFriub/H+A02/BvH4p
 dy5ffs7AzptnPlr26MqEsgknvVDT2UinU5EyjXKke6CRnUCCIiJ5HLpuCKbX7EB3UIjgP6CTUkE
 fPuP+zMlQDWYpZKePKvm
X-Received: by 2002:a05:6000:1a86:b0:385:e4a7:df07 with SMTP id
 ffacd0b85a97d-3864cec38ddmr5207787f8f.42.1733992605832; 
 Thu, 12 Dec 2024 00:36:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiOspl7lVtaRS3a8U1e3Ugidr/FeZNKHreAuxMq4nGy3oYE3I03+xyodQNvU8hH6BX6zGkHA==
X-Received: by 2002:a05:6000:1a86:b0:385:e4a7:df07 with SMTP id
 ffacd0b85a97d-3864cec38ddmr5207669f8f.42.1733992603982; 
 Thu, 12 Dec 2024 00:36:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625553208sm9569375e9.9.2024.12.12.00.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 00:36:43 -0800 (PST)
Message-ID: <6e0f1727-6712-4c5e-8ca2-68ecf002deb0@redhat.com>
Date: Thu, 12 Dec 2024 09:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,1/6] drm/panic: Move drawing functions to drm_draw
To: Kees Bakker <kees@ijzerbout.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241204160014.1171469-2-jfalempe@redhat.com>
 <90c892fe-e56c-49b0-b8a3-8a7d6d18fb41@ijzerbout.nl>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <90c892fe-e56c-49b0-b8a3-8a7d6d18fb41@ijzerbout.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ydGfP5bLkCKERppcFgj73lE7jWkm0pgrDftZmziawco_1733992606
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2024 22:34, Kees Bakker wrote:
> Op 04-12-2024 om 16:45 schreef Jocelyn Falempe:
>> Move the color conversions, blit and fill functions to drm_draw.c,
>> so that they can be re-used by drm_log.
>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>> gpu drivers.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>
>> v5:
>>   * Export drm_draw symbols, so they can be used if drm_client_lib is 
>> built as module.
>>
>> v6:
>>   * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"
>>
>> v9:
>>   * Rename drm_draw.h to drm_draw_internal.h (Jani Nikula)
>>
>>   drivers/gpu/drm/Kconfig             |   5 +
>>   drivers/gpu/drm/Makefile            |   1 +
>>   drivers/gpu/drm/drm_draw.c          | 233 +++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_draw_internal.h |  56 ++++++
>>   drivers/gpu/drm/drm_panic.c         | 257 +++-------------------------
>>   5 files changed, 318 insertions(+), 234 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_draw.c
>>   create mode 100644 drivers/gpu/drm/drm_draw_internal.h
>>
>> [...]
>> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
>> new file mode 100644
>> index 000000000000..cb2ad12bce57
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_draw.c
>> @@ -0,0 +1,233 @@
>> +[...]
>> +void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
>> +             unsigned int height, unsigned int width,
>> +             u16 color)
>> +{
>> +    unsigned int y, x;
>> +
>> +    for (y = 0; y < height; y++) {
>> +        for (x = 0; x < width; x++) {
>> +            unsigned int off = y * dpitch + x * 3;
>> +
>> +            /* write blue-green-red to output in little endianness */
>> +            iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
>> +            iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
>> +            iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
>> +        }
>> +    }
>> +}
>>
> u16 is not wide enough for a 24bit color

Good catch, I will send a fix when I get some time.

Best regards,

-- 

Jocelyn

