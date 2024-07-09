Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E864592B4A9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3019E10E4E0;
	Tue,  9 Jul 2024 10:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QNz928wQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156E10E4DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720519447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpy09mrz7GMKI4NSvK7MGNBVjEFB/bqkDusvYImFW+s=;
 b=QNz928wQ+5sJ46F00zP6itWt35+VRL4xjY1/z0vjjT24kksLR+U7E0hglcYAKAEMOGhNrh
 Oh5Uwcvo0mo9u3qVFoXTlOfgR4sFaDxIHfSNs6/4qHH4vWPvDGR6NdhhpZMRG4pOCbTjLs
 sw9SW27rSbVrecz1h3gWvjzFyqu7Kio=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-KNIMi1LmNXeAsI_5xnZFsg-1; Tue, 09 Jul 2024 06:04:05 -0400
X-MC-Unique: KNIMi1LmNXeAsI_5xnZFsg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-36787ba7ad4so3626569f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 03:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720519444; x=1721124244;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tpy09mrz7GMKI4NSvK7MGNBVjEFB/bqkDusvYImFW+s=;
 b=NujIHopbmsd33+YCZjhwxvToLNoZsaFf3PaSbP+qXwgacP5ujOR4EWCVk21KAc60qM
 WJu0+NCGuqTvlXOeFYpJnbZo1vhIlVHuHAQ+U0HHpCH6qUqSUUMZ+HZk8F7SXED4GluK
 eztrBp4nlvxJJN3cnrH4N557EcjSoXo/czyK1jxZrvOA02wHYsoZizWdDcuaxBKUziuU
 zXEeHMTd0cB8RtJeHKFpUdP3mq7z9e5IJKXteAOJ3nILTPwPw8Bsv59UK1JBZ+TyZWW3
 CQpU7eujeppg6YgcwDMBZrCNRyC6Rd7UBTVbKyCyqvvUTWXTWncrGaUfivjXJGyJ8Z+I
 ZwRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/T1GYYUD4OOkSisj8kl5JRnkXUm1f6x5RDZ7MGivWyXT6YLAALCGFGdu4XKzsUfCiGAWU6BR8yoj6kxgzBregHwuxYHULd5LBoAo6Kk4I
X-Gm-Message-State: AOJu0Yy1gYgsD3d0KwJ5sFUm4r2w8jLkhQavvHygtJla/pLsWzd22bVm
 X0YQO3/cMAsgEuknnADxvIj16iVrPyZYy1NYsWV7Ned1QSJCsZZI1sxEs3Cyksg2FtgZkUrqw3b
 L8aD3ppCwDkZxD4vbA5TSwTJ0X4ieJQF7pJFhtlakkqW+aKVefggOjk11mYDOKhmTWA==
X-Received: by 2002:a5d:5f48:0:b0:35f:1161:e1a3 with SMTP id
 ffacd0b85a97d-367cea46c6fmr1621673f8f.5.1720519444788; 
 Tue, 09 Jul 2024 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3iuKpr/2eO4/gcMobO6ZU2lCVEnjdpbfxjc4M2aoAaKUj61p40UKF3EXkfLoCHaXC2OhfCQ==
X-Received: by 2002:a5d:5f48:0:b0:35f:1161:e1a3 with SMTP id
 ffacd0b85a97d-367cea46c6fmr1621657f8f.5.1720519444402; 
 Tue, 09 Jul 2024 03:04:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367df88b1c5sm19168f8f.4.2024.07.09.03.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 03:04:03 -0700 (PDT)
Message-ID: <acd5c505-f058-46e7-9d92-620dea41d707@redhat.com>
Date: Tue, 9 Jul 2024 12:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <2024070951-tall-effective-c916@gregkh>
 <2024070947-exorcism-purchase-2f28@gregkh>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2024070947-exorcism-purchase-2f28@gregkh>
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



On 09/07/2024 11:12, Greg KH wrote:
> On Tue, Jul 09, 2024 at 11:11:35AM +0200, Greg KH wrote:
>> On Tue, Jul 09, 2024 at 10:40:10AM +0200, Jocelyn Falempe wrote:
>>> +config DRM_PANIC_SCREEN_QR_CODE_URL
>>> +	string "Base url of the QR code in the panic screen"
>>> +	depends on DRM_PANIC_SCREEN_QR_CODE
>>> +	help
>>> +	  This option sets the base url to report the kernel panic. If it's set
>>> +	  the qr code will contain the url and the kmsg compressed with zlib as
>>> +	  url parameter. If it's empty, the qr code will contain the kmsg as
>>> +	  uncompressed text only.
>>
>> meta-comment, should we by default do this on a kernel.org domain so
>> that no specific distro has to worry about hosing this type of web
>> service?
> 
> Also, do you have the backend source for this to show how anyone can
> host it themselves as well?  We can't add features to the kernel that no
> one but closed-source implementations will use for obvious reasons.

I've made a proof of concept backend here:
https://github.com/kdj0c/panic_report/

And the javascript to decode the kmsg trace is here (under MIT licence):
https://github.com/kdj0c/panic_report/blob/main/docs/panic_report.js

It uses the pako js library to uncompress the zlib data, which is also 
under MIT/Zlib licence https://github.com/nodeca/pako/

If kernel.org want to host a default service for that, that would be 
great. It can be linked with https://bugzilla.kernel.org to easily 
create a bug, or look for similar bugs.


Best regards,

-- 

Jocelyn


> 
> thanks,
> 
> greg k-h
> 

