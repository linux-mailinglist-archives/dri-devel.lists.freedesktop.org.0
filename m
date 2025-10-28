Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD197C161F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299710E127;
	Tue, 28 Oct 2025 17:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZlXZbQ+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF610E127
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761672254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAHpodRB3cMRxHnhnFZ1M8RIn3iF+beFWmCoJtFoPn0=;
 b=ZlXZbQ+TgCV/dN2yTMvIf27QDQ2XCXaPBLrMhsyio+sdnd6btXdQ9EhvTZiSCYxv8u3klS
 jfR+pbnsYnZsyTGsivIiVFagNtaT6xLvopF21NQBDOBf5nppqHKObuFGjCdSntAqrthDDh
 AtymYu06SKrA/zWgVO2v1ygG+a3L1hE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-xkdeO0b0MpuHZXce2xXXzA-1; Tue, 28 Oct 2025 13:24:12 -0400
X-MC-Unique: xkdeO0b0MpuHZXce2xXXzA-1
X-Mimecast-MFC-AGG-ID: xkdeO0b0MpuHZXce2xXXzA_1761672251
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f384f10762so3710390f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761672251; x=1762277051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XAHpodRB3cMRxHnhnFZ1M8RIn3iF+beFWmCoJtFoPn0=;
 b=n1cBIXn9le4G0eTkVbVNzmnkhvAXjaL13hIdxMTF3TgqdtvkV6fEclzSTLcNztqchy
 +rVZJBpAZCWFlVVz5fl5WUCKAT9tsYfIKXjGwmesHOy2vTmZO2wrdz0pp8LNZ0I0giSu
 EuVpa4VCXzEdMnoLGPNksuJgzzz+xmpLMJhUkCF3hEBNR/qejxV7atrzz+Z5Vqu97iEJ
 pvntopoZNWsmX25jQ+s9gXssGs5TEVcb55tugnfonyoZ2kx5Z4DEi6qgZPPvHgN38ECz
 mWZ5jr9RmUnrsdigOCShTwc151BGg0vOiGiLPSboA9ToDDx/fZzTD8tD1ac758iwU9J+
 bbZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Ba9GHIuHVXZgJ3s7RUU0sTZAIYqZaOB1bGQ1XDwYdPxv/MWePX0HH/8N4YPHOvD4rXFdKI5VN7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKFJl/1A8/l2i2hDkxDL+twLZ/GltQ2CDF6rTnqYQa+874cCnj
 ER3G1CHz6NlnVpIWvKbAAwDm4cm6H0QXQzT6UQkqHZEp/s+Rr8wLWzpeil3wRxrAq4IQC4blW/N
 Iv5ZI8PJqznQrU3rDKgpGMdo0S0xwNfuenEWTJBN5BbQUn/dT+EqhVJTI4cwJ14HMGMMkXw==
X-Gm-Gg: ASbGncu3ccfnOW0wZCR/QDQMHn4iyEAtX4zZLxTZ5CtprQO75x/BMVJ6blbr0SMHp7A
 R821g0Yr2cab6VQYma8+D+EVkogJVIsTx9ZqJwGntm9jZuOYH2DZipmpuyZCPrWV0yNcJELL9h9
 gHaRlZf8c+U5LYMBwpmePxnwjtWgUtFo9royYe9KDxv0oHMjKffaS94TLOAFrP+71oZA4ibI0cQ
 bUQ906eHnwUoINsvNKomEfGuYDOmVj6im3uZ+4UQYjfRQImsgrVx5IFe7N5VENo7bpw9hXDQ67n
 xP6mB7AbKy82KKalM0vadsT8JBl+H3nOR+E30vchEl6GMIbf1XAwQ/o2PaMK59dn88Oqc+5/mO7
 /lnWr3hgbD9tfudNsBS8eNKrTdvO+hgFkGSJ+VZk=
X-Received: by 2002:a05:6000:2506:b0:3e7:6418:247b with SMTP id
 ffacd0b85a97d-429a7e36f69mr3570534f8f.10.1761672251321; 
 Tue, 28 Oct 2025 10:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKEyP9bxKAgTIPIZk4R2FGzXN4epdlysKe1Wfzi3TjnYShdDgAU8jvfjsuhqGQCBoCN8u70Q==
X-Received: by 2002:a05:6000:2506:b0:3e7:6418:247b with SMTP id
 ffacd0b85a97d-429a7e36f69mr3570510f8f.10.1761672250914; 
 Tue, 28 Oct 2025 10:24:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5678sm21134679f8f.22.2025.10.28.10.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 10:24:10 -0700 (PDT)
Message-ID: <b28f58f6-ce30-4ac2-afa0-4b3849f0725d@redhat.com>
Date: Tue, 28 Oct 2025 18:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Handle framebuffer from dma-buf
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20251028144226.171593-1-jfalempe@redhat.com>
 <99f8a5f0-c650-485c-aef6-e8f1a89598fe@redhat.com>
 <26c7b1b5-cf9e-4d46-8796-b18329c46c61@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <26c7b1b5-cf9e-4d46-8796-b18329c46c61@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KwajzhyJPCUk-arrGuCgr5rliMh8jqHCzKCp19JilQk_1761672251
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

On 28/10/2025 17:01, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> Am 28.10.25 um 15:49 schrieb Jocelyn Falempe:
>> On 28/10/2025 15:42, Jocelyn Falempe wrote:
>>> In the atomic update callback, ast should call
>>> drm_gem_fb_begin_cpu_access() to make sure it can read the
>>> framebuffer from the CPU, otherwise the data might not be there due
>>> to cache, and synchronization.
>>>
>>> Tested on a Lenovo SE100, while rendering on the ArrowLake GPU with
>>> i915 driver, and using ast for display.
>>
>> I sent this patch a bit too fast, my mistake below:>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/ast/ast_mode.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ 
>>> ast_mode.c
>>> index 9ce874dba69c..68da4544d92d 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -556,11 +556,17 @@ static void 
>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>           ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state- 
>>> >vmode);
>>>       }
>>>   +    /* if the buffer comes from another device */
>>> +    if (!drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>>> +        return;
>>> +
>>
>> Sorry, there is a typo here, it should be:
>>
>> if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>>     return;
>>
>>> drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>>>       drm_atomic_for_each_plane_damage(&iter, &damage) {
>>>           ast_handle_damage(ast_plane, shadow_plane_state->data, fb, 
>>> &damage);
>>>       }
>>>   +    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>> +
> 
> Thanks for posting this. I know that you follow the common code from 
> other drivers, but I think we should change the pattern a bit. The code 
> in _begin_cpu_access() might fail for whatever reason, but that does not 
> affect the rest of the plane update.
> 
> How about
> 
> if (_begin_cpu_access() == 0)
>      for_each_damage {
>          handle_damage()
>      }
>      _end_cpu_access()
> }
> 
> and then continue with the rest of the helper? Even if the damage update 
> doesn't happen, the driver would still program changes of the 
> framebuffer pitch.
> 
> There's no easy way of keeping the damage information across display 
> updates AFAIK. But the problem might be transient, while a failed update 
> of the framebuffer pitch can be permanent.
> 

I'm unsure what is better, change the pitch while keeping the old buffer 
content, or keeping the last frame, and risking the next update to mess 
up. Anyway this shouldn't happen in practice, so I will sent your 
version in a v2.

Best regards,

-- 

Jocelyn



> Best regards
> Thomas
> 
>>>       /*
>>>        * Some BMCs stop scanning out the video signal after the driver
>>>        * reprogrammed the offset. This stalls display output for several
>>>
>>> base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c
>>
> 



