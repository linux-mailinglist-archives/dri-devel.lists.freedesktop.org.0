Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CE9EE1CE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08AE10E2F8;
	Thu, 12 Dec 2024 08:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bSwpYVff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAA410E2F8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733993364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDKNyYk5xbG1WGP1ie3UeatyX+L09dpQr7TC13LoSgg=;
 b=bSwpYVffCSPQyX0nilbTakMEjp5412/HRj0D3DPMKeOXS8/B6OexJdOayJ/I34CP7oEXvf
 C/UbiWSssfDTZZQwcGEbt2mSey1Qb8x8n/+7i1z+QkZIDtialAW/gYWj4EMmkLH/KrmT4r
 yPm2A5fupp8L0YnGfdJuNjVWyNro65M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-erTZ1FbMM3eaboGhFXRnAQ-1; Thu, 12 Dec 2024 03:49:22 -0500
X-MC-Unique: erTZ1FbMM3eaboGhFXRnAQ-1
X-Mimecast-MFC-AGG-ID: erTZ1FbMM3eaboGhFXRnAQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436219070b4so2120485e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993361; x=1734598161;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tQG/d6LCdm5MnHjpzF5a9Rw3xf3uLuwTNQjfLc7RcAs=;
 b=qV5nitqPYCjPNlM6CrpiIprAHXGPSA2cSsQ/FBeTNdpQ7bJqN+lduE44u53NLsooyQ
 2EffCGCkc2mA5T2vya7gr9eNdUGFALbKOgYlbTHyPyFAvCyzFxZGhnki57xnASqAk7X3
 YXo4m/untp81VOicnkgBwZyKb1oiK2o949u0tFEZn1cGImtGVDjWnlb52OEE8UtxWeFe
 oZrllXfs6PC1Ps+ZEjftCYROTOYmVN5x5f2UXbj47nC9MaSKS2haxDmw7zIAgSZTY49N
 lx2FTYK6zYayU0WEPtswcEWLJb6OEC73ErVjp67JUUQu1/E8GND1sFiE6oN/xwHW6w2M
 eNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXNll+/YszU5lg2T8ZvM+aj0tyac9vDa6XX+/fb4a2z5iIiZaWhEJUYheBYtD3p9KhLUBdOvuqK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcULo/uXcA/csWSfKC6Utm0ET369adhLN/R8fCAp9Zu+Bguh1q
 cAwTZjKP4mSANLGB6xdqH4dyLayj+i7qxtsDbGkquJTfQNf1Hyx6LLNhimw3jRlt4QE53OgMQjU
 VO3NCgihG8FqaoacKk3r8QyNTNhBiUfRHjwq4JBUq2ZRvWO2jaLw/Qqgw6WmupQmOBA==
X-Gm-Gg: ASbGncunLZWB2lD3QB3XvbvvjWKVZdbdG/Xzl6RdGYtzAEpwF5YMLZphvRVyowrLxhI
 Td1Ob6UqaFhZw+d6SgPFZJKhOJRzRS6Ntv+ktHIyfi86zsmeof6sqFD5PndsHgTQKN8sYKmxwTl
 F9X8FvwfSQq55wyiWMV2E6fz4ylgcWhL/WGi8f6Uj7I708TxoifLDkRpFk6TtDTQCBCAjDfjEnq
 /RNjlszhlle6eQLBVZFTPv0vFLscW6vCLdIJR4YKBwQpMU1veDJSelVV7Pzi0e+hKkuTAvdKbww
 dsElmqyVQCQ5YAyhTGlQ
X-Received: by 2002:a05:600c:3b09:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-4361c3efb35mr42150555e9.21.1733993361251; 
 Thu, 12 Dec 2024 00:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6QdZdXrc112M0bqVQaI5blGw1L3V/M9+BdeTOSPDeyEKt8uVRKpOiPA28hR1LdRdi1BaKQ==
X-Received: by 2002:a05:600c:3b09:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-4361c3efb35mr42150255e9.21.1733993360853; 
 Thu, 12 Dec 2024 00:49:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec97d13sm23140765e9.1.2024.12.12.00.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 00:49:20 -0800 (PST)
Message-ID: <88abb273-13e3-4969-96c3-c7d677a082d4@redhat.com>
Date: Thu, 12 Dec 2024 09:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <20241204160014.1171469-3-jfalempe@redhat.com>
 <816f862e-762d-4880-9285-5a803e657e66@stanley.mountain>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <816f862e-762d-4880-9285-5a803e657e66@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZupcdBlbqIQStAzoHtxllnTd4Y2YVjk4DSMALkuNPI_1733993361
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------ZU9FrtAleaOJic9fVaCBFZ4I"
Content-Language: en-US, fr
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

This is a multi-part message in MIME format.
--------------ZU9FrtAleaOJic9fVaCBFZ4I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 08:41, Dan Carpenter wrote:
> This patch breaks "make oldconfig" for me.  It just gets into an endless
> loop of:
> 
>    Default DRM Client
>    choice[1-0?]: 0
>    Default DRM Client
>    choice[1-0?]: 0
>    Default DRM Client
>    choice[1-0?]: 0
>    Default DRM Client
>    choice[1-0?]: 0
>    ...
> 
> I don't have to type anything, it just spams that forever.  It's weird
> that it's 1-0 instead of 0-1.  Does that means something?  I don't know
> much about Kconfig.

I can reproduce it with your provided config.

It looks like it happens if DRM_CLIENT_SELECTION is enabled, but none of 
the client is.
The attached patch should fix it, can you try it ?

I will submit that shortly.

Thanks for reporting it.

Best regards,

-- 

Jocelyn


> 
> I'm using this arm64 randconfig as a base.  I type "make oldconfig" and
> press enter until it gets to "Default DRM Client" and then it starts
> scrolling endlessly.
> https://download.01.org/0day-ci/archive/20241212/202412121555.Fp663tyH-lkp@intel.com/config
> 
> regards,
> dan carpenter
> 

--------------ZU9FrtAleaOJic9fVaCBFZ4I
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Fix-endless-Kconfig-loop.patch"
Content-Disposition: attachment;
 filename="0001-Fix-endless-Kconfig-loop.patch"
Content-Transfer-Encoding: base64

RnJvbSBlNGQxOTdkZWJkMmMxOTljOWYyZDhlMzVlNDFlMzZjMjgzNjkyNmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+
CkRhdGU6IFRodSwgMTIgRGVjIDIwMjQgMDk6NDM6NTAgKzAxMDAKU3ViamVjdDogW1BBVENIXSBG
aXggZW5kbGVzcyBLY29uZmlnIGxvb3AKClNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8
amZhbGVtcGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2xpZW50cy9LY29uZmln
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vY2xpZW50cy9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2NsaWVudHMvS2Nv
bmZpZwppbmRleCBjMThkZWNjOTAyMDAuLjgyYTdkNGU1ODRkZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2NsaWVudHMvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vY2xpZW50cy9L
Y29uZmlnCkBAIC04Nyw2ICs4Nyw3IEBAIGNvbmZpZyBEUk1fQ0xJRU5UX0xPRwogY2hvaWNlCiAJ
cHJvbXB0ICJEZWZhdWx0IERSTSBDbGllbnQiCiAJZGVwZW5kcyBvbiBEUk1fQ0xJRU5UX1NFTEVD
VElPTgorCWRlcGVuZHMgb24gRFJNX0ZCREVWX0VNVUxBVElPTiB8fCBEUk1fQ0xJRU5UX0xPRwog
CWRlZmF1bHQgRFJNX0NMSUVOVF9ERUZBVUxUX0ZCREVWCiAJaGVscAogCSAgU2VsZWN0cyB0aGUg
ZGVmYXVsdCBkcm0gY2xpZW50LgotLSAKMi40Ny4xCgo=
--------------ZU9FrtAleaOJic9fVaCBFZ4I--

