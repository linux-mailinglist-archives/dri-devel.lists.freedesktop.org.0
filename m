Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8895B8D3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EA510EAFE;
	Thu, 22 Aug 2024 14:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SZ6h4Z/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6010EAFE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724337969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PgDdjBoF4JblXtgGjeuWjO8887IujC2mbPadvbkarU=;
 b=SZ6h4Z/owJ3C6RrRRaztH0fLkfZ0bfnuGni1P+LDKlSLKTjtG0+cvSt5uhnLcq7tBCKAcb
 sXPjx5tot6Smg+DtadQvIi3of+MKyT+13vceSWhIzAVKQ/VuiJ4S/brXMLUIgBz+5Gu5EQ
 EvUwwX7XOS7KOGpnDyNTJTGdrUBMHsQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-P2MKBww9NYCSK4zxOC1TTQ-1; Thu, 22 Aug 2024 10:46:08 -0400
X-MC-Unique: P2MKBww9NYCSK4zxOC1TTQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-428e48612acso9425795e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724337967; x=1724942767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PgDdjBoF4JblXtgGjeuWjO8887IujC2mbPadvbkarU=;
 b=LFs1zIT1d3AZP3v8FLayeiSYk4WbfpKLt2Sav/MMPhZY4O6qOc6Ik5Ugmw+d0iWA2P
 2bmkOM01xyNn51/Agk11Ky9z/VgfAv2yca3BmjVaOaGs1a6MceuQhRsmrxkvTff7hs8y
 rdLOPhcYTK3khR3sVe/RRJF4iaqHxgtwWnljQZ2oV99smlrkpBluxL58HoYFy2Z6mN7H
 1aKTLMkeHWfC41jt1ZLfiHi+63pd/+0PSxyAYiejoeLfAtWWRP4Fc65AmGM6WmkGP/cj
 s2/t9EOgOpvdZXCo1dpiEy43kEvCMqPNanVFOo3XDb+jdCHfcrrlT22vwjPcfuxwrNCL
 TtTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKrvtIpnOG3g6M8hw0yaWign32FXZ+JGWvbccYegnIO4h1ie/tnpf67lNuO3HH7POETR6ZlTcAI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlI32WNPrHtgfcSht/nLyDtBhsE0y/OwQfjZS4NZsxzBUULbfb
 iVLzlkTqHvZbYHZ0+insqe9ZQCOsyEtIj7yr9bX1FsV3qpGEahY38NfTuPcZIUepx/XeP242tR6
 Vu79gG0ssLQgC0tyq5m1OlvfNJimQHRRQcn8THInbDfoN6jgQeiZu2bPCDZeA8epoIQ==
X-Received: by 2002:a05:600c:3c97:b0:428:29e:8c42 with SMTP id
 5b1f17b1804b1-42ac55cababmr22017805e9.9.1724337967183; 
 Thu, 22 Aug 2024 07:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuLJzrR9+0Fk/xHqiEDPcjVZlaqCd+ihtEn7Tv4wCKVbCZaYnuqG4WIXNLVH5okrCjSI5r3g==
X-Received: by 2002:a05:600c:3c97:b0:428:29e:8c42 with SMTP id
 5b1f17b1804b1-42ac55cababmr22017335e9.9.1724337966687; 
 Thu, 22 Aug 2024 07:46:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e088sm27643235e9.8.2024.08.22.07.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 07:46:06 -0700 (PDT)
Message-ID: <85f934ea-9c5a-4adb-8c6d-6c82beab41b1@redhat.com>
Date: Thu, 22 Aug 2024 16:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/virtio: Use XRGB8888 also for big endian
 systems
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>
References: <20240820090908.151042-1-jfalempe@redhat.com>
 <2734s7h2c4tbtwzdlijbf7u3fvdcqtlcdipamsf4pf6jgx2slt@aq5bm3fuqgkz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2734s7h2c4tbtwzdlijbf7u3fvdcqtlcdipamsf4pf6jgx2slt@aq5bm3fuqgkz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/08/2024 13:12, Gerd Hoffmann wrote:
> On Tue, Aug 20, 2024 at 11:07:40AM GMT, Jocelyn Falempe wrote:
>> Mesa doesn't support BGRX8888, that means most wayland compositors
>> don't work on big endian guests.
> 
> So you are doing a hard switch from native endian to little endian.
> 
> While this should be fine for modern userspace API (aka ADDFB2 ioctl) it
> is not for older APIs (ADDFB ioctl, also fbdev emulation) where only
> depth=32 is specified and userspace typically expects a framebuffer in
> native byte order.
> 
> Ideally virtio-gpu would support both big endian and little endian
> framebuffer formats (simliar to bochs drm driver).  That probably is a
> somewhat more invasive change because the DRM_IOCTL_MODE_CREATE_DUMB
> doesn't tell use the format which will be used.  Possible options I see:
> 
>    (1) Be lazy on creating host resources, i.e. call
>        virtio_gpu_cmd_create_resource() not at DRM_IOCTL_MODE_CREATE_DUMB
>        time but later when the resource will be actually be used (and
>        specifically after DRM_IOCTL_MODE_ADDFB(2) ioctl so we know the
>        format).  Needs additional state tracking (whenever the resource
>        has been created or not) in possibly lots of places.
> 
>    (2) Support changing the resource format, i.e. in case
>        DRM_IOCTL_MODE_ADDFB(2) is called with a format different from the
>        current one go through a destroy-and-recreate cycle for the host
>        resource.  Might have tricky corner cases (resource being in use
>        when DRM_IOCTL_MODE_ADDFB(2) is called).

I've implemented (1), I will send a new series soon.

Thanks for your advice.

-- 

Jocelyn

> 
> HTH & take care,
>    Gerd
> 

