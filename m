Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C578F651F65
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 12:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025210E3A3;
	Tue, 20 Dec 2022 11:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7571110E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671534251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3KWrAZUKWWKn05Ua3R8yYQYMAKo0DuDGOgKZgnfSJo=;
 b=JNjHA/3+E/jSTAgiHO7FJlWyD5Qjh2e4Cbty3x6YuziO/UT5uWFedXKGi/NPjsWiKtF7VS
 uOYr0Xqyx5dktr1RBjwIPOHkeGh9qJd9fwAqqUIcO5k10V5J6Wy68ohgIE6ZKrfEIf3u7X
 MzK50GGUubgL6ui21c7bo5gzGYX4f7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-3KHOsRuLMBe08hEpySzqMQ-1; Tue, 20 Dec 2022 06:04:00 -0500
X-MC-Unique: 3KHOsRuLMBe08hEpySzqMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so7895137wmb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 03:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3KWrAZUKWWKn05Ua3R8yYQYMAKo0DuDGOgKZgnfSJo=;
 b=GeAupCvl1vCrU9nSRZzsAUDK7AJg20eomuy+hx9kt/feNp0rixDopzrgVr+gRkAMg4
 UOlZjk7wmyQkClQFw6H56kVRBIDxrDLe3rdVjCGjn5GWR7/FCYp1R72ITeULLqTbbmf4
 Qb7OYasais/40xIhV+Q9wJIR2Lp+U36GyGA0HnZ4IilV0A5QkyAmnlsOZLHBchsYr9b4
 BaY9Y08UMndAh+vyCqUlIvQh8Mi7hTZNQuAQvqGixzOJMm4IU6RMS1WrG73H+4Qo7mg0
 qQvSUUTC7RhRm48V9CcuaQUpeYDtoPdPWldQyslFophxCJ08LXcy1NbJQoijkU2mQxN0
 oKDQ==
X-Gm-Message-State: ANoB5plqTc3eAQQYPSi8NqtSl4/ledFeGfusvph1uZIDzKIMDme2ilWk
 Z/JxPfwYpuBsFPAUMhmYMmmKEO9/q0InNQne+3Uxhblql//6B65BmWjcRKOg3IVU9S+SHJbJnVG
 LorSCFL0jSRaRLfEAX/a1IZLEBYEP
X-Received: by 2002:a7b:c40c:0:b0:3d2:392b:3169 with SMTP id
 k12-20020a7bc40c000000b003d2392b3169mr18262259wmi.28.1671534239759; 
 Tue, 20 Dec 2022 03:03:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50Pjdh4vTH9k6QzKeK/GSfNi8YdA5Y5MxT4eys4/tU50JoyfD9xCr4pc7EFEF1bLi2EtpUvw==
X-Received: by 2002:a7b:c40c:0:b0:3d2:392b:3169 with SMTP id
 k12-20020a7bc40c000000b003d2392b3169mr18262247wmi.28.1671534239570; 
 Tue, 20 Dec 2022 03:03:59 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm29814399wmq.27.2022.12.20.03.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:03:59 -0800 (PST)
Message-ID: <58767692-274f-0ff1-f537-6f96788f457a@redhat.com>
Date: Tue, 20 Dec 2022 12:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 8/9] drm/format-helper: Simplify drm_fb_build_fourcc_list()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-9-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 21:12, Thomas Zimmermann wrote:
> The DRM helper drm_fb_build_fourcc_list() creates a list of color
> formats for primary planes of the generic drivers. Simplify the helper:
> 
>  - It used to mix and filter native and emulated formats as provided
>    by the driver. Now the only emulated format is XRGB8888, which is
>    required as fallback by legacy software. Drop support for emulating
>    any other formats.
>  - Also convert alpha formats to their non-alpha counterparts. Generic
>    drivers don't support primary planes with alpha formats and some
>    DTs incorrectly advertise alpha channels for non-alpha hardware. So
>    only export non-alpha formats for primary planes.
> 
> With the simplified helper, scrap format lists of the affected generic
> drivers. All they need is the firmware buffer's native format, from which
> the helper creates the list of color formats.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

