Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A9B41681
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E22710E0C2;
	Wed,  3 Sep 2025 07:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IIvdlpq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EB710E3E2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756884628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXmaQRePHfDReiwofqlEfi0BOpZUaSKRj4v6EH2Y820=;
 b=IIvdlpq7ejhepj0j0C9Z0v5pv0v2PA0pY+fCQfuKUPF6aNYWBaIRy+HdtWYp+h1312wKf7
 ThMZNvn7JPBUvbugWejiJmDWPFQhsw2QdaFvy7Cs3tqTvU7/JGSQNGTbmhQb5QiKZKIzX9
 LeQujyIrRjQB5hfU9ikdRDGQjqAVE0Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-1wD0-NqSPOuyZfbq-6oZCA-1; Wed, 03 Sep 2025 03:30:26 -0400
X-MC-Unique: 1wD0-NqSPOuyZfbq-6oZCA-1
X-Mimecast-MFC-AGG-ID: 1wD0-NqSPOuyZfbq-6oZCA_1756884626
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b8f4c2f7fso20844935e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884626; x=1757489426;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXmaQRePHfDReiwofqlEfi0BOpZUaSKRj4v6EH2Y820=;
 b=W/jD0lpTVOfc+cDgYNG4nz01SoLGEJhBHsgypBzX7kxXsjSYgKoXcKOkq8NBetk9z0
 kNLwHlEjD5ansas4+rsjHKYG20M7gM8lEmUhI9L84q81qOPpqV3zNVXd889DkM6AxxSY
 VL7s/sCGjJKZHhyBwC4lN5kNAcWV4MYZOrTgmVtwe6ol6TS45UELPSiOPQfXIRmcMx78
 VKkQmkfqwCrlfDyJo5676KCAl3IpIXb51OSndPW1ESnLXKFXFUMVA3xrmtzeg8PlkFFm
 RdnwNTu6FviZwbuLiHquUF1COQY+jiPdVmN6JhEeZIAH94FuKHKXTvF8/5M8RVK/2DGu
 VALw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVApykten9h3lALK52NoAwFm7R4HvPaxsuuyv6+V+Ygxy2ZH1HO8fbYpxo77KehRkp9YwkOqwv7fA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzStnsEamaCdRzpfre4gu/qls+qrX/8aXsGmwBazk9jlzXRP/i5
 kaUSNIMdCoAl1+7bab7Q03NY1V7fxgbmZVPKcBKyngSHekPtjLmmsGDTqBUFoUDbqLP4muZTEg0
 i5qlErE7ABMj73+kyL2rtsg4M1YhLO/eqEfH2PhOM/lqSsAaJ/C1plxIN5evYcFDG8VwW3Q==
X-Gm-Gg: ASbGncv+TBtI9c5NSKMC0jBU3zZJgHoijbCapPrhF3My1ar+pcON12tVHXfDDHrMaDI
 dJnW9neSpuDZc75VBOdjUXX6xLvPAuQ9Earo9qf2pJldvMNTdBZzr86KlUywtgnIcayMycJVGUr
 o4VGWZUIQXWDHHFqwKUfg0BonBzku9kxHKl+/wJQB4NCsxKW1UjB4kBl2NJoEgmgCLb19UB9A6W
 HocZaVH+ij3UnfovXLRMwpTq6A+wk1hrHMg22nE5hDqCVPbHuj8fYNIgTeduLkagqcPIj42F0xV
 6OPx6DApO1ovQQqquBel5JjWL2XCPLIec1JH1qxtTR7wXc9urljyBGfGhia6mTEIwdKU+Z0TwZN
 J7iI=
X-Received: by 2002:a05:600c:1914:b0:45b:8ac2:9759 with SMTP id
 5b1f17b1804b1-45b8ac29906mr91627905e9.23.1756884625599; 
 Wed, 03 Sep 2025 00:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaVr+3Y4NDc+K+0OyYUG0bUKRoYgq+8faNbeSCpPYw+Mg8KIRDjAtneuQoDPGA1D39j0MUBQ==
X-Received: by 2002:a05:600c:1914:b0:45b:8ac2:9759 with SMTP id
 5b1f17b1804b1-45b8ac29906mr91627565e9.23.1756884625164; 
 Wed, 03 Sep 2025 00:30:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b66bbcf19sm183497005e9.4.2025.09.03.00.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:30:24 -0700 (PDT)
Message-ID: <533c2197-d7bb-4294-a094-c4f993a5893c@redhat.com>
Date: Wed, 3 Sep 2025 09:30:23 +0200
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <pucvcimuuyz7f7ih7hx7l6bmutarlryvzwiqh7a26bk65ya5sf@uj7agoqm4lm3>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wM43fZIqHX7blJEFT2iVr-tV0IXiSs3WpCTfWfaTUHU_1756884626
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

On 02/09/2025 18:58, Maxime Ripard wrote:
> On Mon, Sep 01, 2025 at 03:04:26PM +0200, Jocelyn Falempe wrote:
>> On 27/08/2025 12:45, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
>>>> This is a bit hacky, but very handy if you want to customize the
>>>> panic screen.
>>>> It allows to dump the generated images to the logs, and then a python
>>>> script can convert it to .png files. It makes it easy to check how
>>>> the panic screen will look on different resolutions, without having
>>>> to crash a VM.
>>>> To not pollute the logs, it uses a monochrome framebuffer, compress
>>>> it with zlib, and base64 encode it.
>>>
>>> May I suggest to export the raw image via debugfs? Debugfs can also
>>> export additional information in additional files, such as width/height/
>>> stride/format. This could provide the real/last image on the fly, simply
>>> by reading the files. No workarounds or encodings needed.
>>
>> I'm looking into that. The difficulty is to get the debugfs content outside
>> of the test kernel. As I'm using a uml kernel for testing, I will need a
>> special initrd, and a way to share files with the host.
> 
> Yeah, I agree that it's not very practical. If only because the test
> context doesn't stick around once it's been executed, so you would
> effectively leak an arbritrarily long buffer with no hope of getting
> back its memory.

I've made a prototype with debugfs, a small ramdisk with busybox, and 
using hostfs to mount the host filesystem in the uml kernel, and it 
allows to dump the raw panic buffer easily.
Even if it's a bit more complex to setup, I think this use case is not 
really a kunit test, so it's probably better that way.

Let me a few days to clean that up, and I will send a v2 of the kunit 
tests, and a new series to add a debugfs interface.

Thanks for your reviews,

-- 

Jocelyn

> 
> Maxime

