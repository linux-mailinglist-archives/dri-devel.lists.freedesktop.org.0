Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520DB487A1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C374210E494;
	Mon,  8 Sep 2025 08:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F4gEtbuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F3E10E494
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757321722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNfR+0QhjgvaYk/b7nG+gvPpjX04LiJCblG/QpBq/XQ=;
 b=F4gEtbuEy+WooXAsF2BcKuyclGW0aHYlQAj54P8j/b1zwBi7hvG9t5Kiv3PqAgMvlKRrmN
 AU0L4ZWkbZbalo4trRUueUltXwKxW7BWeT3MJNz4+BKN7GvDx/pNZlAT+J9SiMF5vlaISi
 e0wr0Km/bXEiS9pEXeiTO1LNhLRscm4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-Qbq32t2fNLqX1JHRKDYtWg-1; Mon, 08 Sep 2025 04:55:20 -0400
X-MC-Unique: Qbq32t2fNLqX1JHRKDYtWg-1
X-Mimecast-MFC-AGG-ID: Qbq32t2fNLqX1JHRKDYtWg_1757321719
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45de13167aaso11896875e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757321719; x=1757926519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNfR+0QhjgvaYk/b7nG+gvPpjX04LiJCblG/QpBq/XQ=;
 b=wVkG1qlEuUMySbiSYcMCYgPLBwID417Wqj6e9jhuWewF+DizgajiQUYCcrzsdMvovs
 2QTRsuxL/vNB98xm2qeWNUPtAEx2rmeTq8mAvG2UpfJWerkixeKtc5A99iyYOycy6M7i
 IJoxBynDpMuKLoRdrzYfbYde1NXQbQhzw8RzHys3cH5ziXV3HbVQQQYJ4hB8aWcJ+sI4
 53dnn14zSPmTRzst8MPnu2Y8XkJybbMiqaG7VzIJXDl1w9YnRd67qj37uzRrSvM451q2
 7KAYRpoBRlchHtMaZfDhx9aJnUAwV9jMybd8AX9qp6mPrSR8q6ET27yA0U3nEBt+Qn4l
 2EPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6dueUnXnLCi/LYF0RnAT0lKXFsf+Cfko4Xy7zV0pULO8rOwneVNPuH2N+maxYzWIWc2LPGjVHV94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDeCKOE6EIQ4VCxNmGnzXNUCNBIXScCTewcKbbDNrF7TvDzLhc
 8wicNlpcgfHEHhdwihXZcGQY5yDQrSV8pdrYB/CnaFP94NkAkJtszU08Jxdfnpy8WLOf8woUP+8
 ikSGh4tGZ0NoeCxfX2F+B9jjp1Pi4lXPW6iEnNOqgQ6Kr9EO+wKWFdpYvuScl3L99prKqJg==
X-Gm-Gg: ASbGncvf+Drc7FfXchJ+MKx7NHuN/Uk0WiJkY7CWG2eS+j670vetinFrNBDJNCfzMTn
 rLv9edOVfLCde5gRhzbOqii9eaaNlewYqal8l8Sth1EBuafIeRSVgMItZhXghB57TEth5u5TAOq
 WpQfRuV68jdG2uiP3L8m7o+QWBJyilHomvRcNCLK1Hc3W9EoPIFqrXrM7J/0m845WQ4UIyhAuon
 KODGVTRr+gMjKdxiOSzu3brt1/+MS49pmmiWgUVJ3Sb4dZK13BzMg8VYvd4MMR+YUjXZ+N6CziF
 7NXndLHy+JRlXvcBaR6FZ7t3qMLeX6FBXr/ptdM7tnP9LgRkGhhbeIYw2kiQx24WqumVws1U2cD
 EwPg=
X-Received: by 2002:a05:600c:46ca:b0:45d:d197:fecf with SMTP id
 5b1f17b1804b1-45ddde31722mr59274765e9.0.1757321719486; 
 Mon, 08 Sep 2025 01:55:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6XSLL6N3kyaYsfSJrygSaFMVrRxBumfGrLU36La1GPURRAo/SfoPxGhuX7H1KyprlrrFQTw==
X-Received: by 2002:a05:600c:46ca:b0:45d:d197:fecf with SMTP id
 5b1f17b1804b1-45ddde31722mr59274465e9.0.1757321718972; 
 Mon, 08 Sep 2025 01:55:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45de229238fsm67095045e9.16.2025.09.08.01.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 01:55:18 -0700 (PDT)
Message-ID: <a8af8630-043f-4bdf-af77-8f02f992f221@redhat.com>
Date: Mon, 8 Sep 2025 10:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
 <923276d2-9240-48bd-95df-13b4e9e23dcd@suse.de>
 <7ff51c5b-939e-47d9-8c3b-3c596565d114@redhat.com>
 <pucvcimuuyz7f7ih7hx7l6bmutarlryvzwiqh7a26bk65ya5sf@uj7agoqm4lm3>
 <533c2197-d7bb-4294-a094-c4f993a5893c@redhat.com>
 <20250903-benevolent-boobook-of-wholeness-e631f9@penduick>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250903-benevolent-boobook-of-wholeness-e631f9@penduick>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TFVzedhADo2LnNrJLCmL4FEfJ_9_Dz0wPSy2zbW3iV0_1757321719
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

On 03/09/2025 10:19, Maxime Ripard wrote:
> On Wed, Sep 03, 2025 at 09:30:23AM +0200, Jocelyn Falempe wrote:
>> On 02/09/2025 18:58, Maxime Ripard wrote:
>>> On Mon, Sep 01, 2025 at 03:04:26PM +0200, Jocelyn Falempe wrote:
>>>> On 27/08/2025 12:45, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
>>>>>> This is a bit hacky, but very handy if you want to customize the
>>>>>> panic screen.
>>>>>> It allows to dump the generated images to the logs, and then a python
>>>>>> script can convert it to .png files. It makes it easy to check how
>>>>>> the panic screen will look on different resolutions, without having
>>>>>> to crash a VM.
>>>>>> To not pollute the logs, it uses a monochrome framebuffer, compress
>>>>>> it with zlib, and base64 encode it.
>>>>>
>>>>> May I suggest to export the raw image via debugfs? Debugfs can also
>>>>> export additional information in additional files, such as width/height/
>>>>> stride/format. This could provide the real/last image on the fly, simply
>>>>> by reading the files. No workarounds or encodings needed.
>>>>
>>>> I'm looking into that. The difficulty is to get the debugfs content outside
>>>> of the test kernel. As I'm using a uml kernel for testing, I will need a
>>>> special initrd, and a way to share files with the host.
>>>
>>> Yeah, I agree that it's not very practical. If only because the test
>>> context doesn't stick around once it's been executed, so you would
>>> effectively leak an arbritrarily long buffer with no hope of getting
>>> back its memory.
>>
>> I've made a prototype with debugfs, a small ramdisk with busybox, and using
>> hostfs to mount the host filesystem in the uml kernel, and it allows to dump
>> the raw panic buffer easily.
>> Even if it's a bit more complex to setup, I think this use case is not
>> really a kunit test, so it's probably better that way.
>>
>> Let me a few days to clean that up, and I will send a v2 of the kunit tests,
>> and a new series to add a debugfs interface.
>>
>> Thanks for your reviews,
> 
> We also have to think about how it's going to be shipped and used. If
> your debugfs integration has to be disabled everytime we're running
> kunit through uml, qemu, and in CI (because we can't retrieve the
> result), on a live system (because it would leak memory indefinitely),
> how is it useful?

There is already a kconfig for this:
CONFIG_DRM_PANIC_DEBUG

Also I have an implementation that doesn't leak memory. (memory is freed 
when the debugfs file is closed).
It's also more flexible, as you can change the parameters, and test any 
color format, and check the binary result.

I think the goal of this is not to test for regression, but to help 
building a new panic screen.

> 
> The diagnostic lines are part of the test result, are in the logs, and
> can be distributed. You're having all those problems solved already,
> without having any additional work to do.

I feel sending an image through log is not really efficient, and I don't 
want to pollute all the CI with that.
I will send the v2 soon.

Best regards,

-- 

Jocelyn

> 
> Maxime

