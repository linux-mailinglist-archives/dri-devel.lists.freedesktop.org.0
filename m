Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB42EE691
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEA16E512;
	Thu,  7 Jan 2021 20:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6C86E511;
 Thu,  7 Jan 2021 20:08:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t16so6865767wra.3;
 Thu, 07 Jan 2021 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cbsXkUE5/xAhX30+BkWSJfE/azN413SHz22foDWrET0=;
 b=hltFMKbfqdAGJ/Gv/8ua6xfoDLImUOSZMJL6nnqLifpb/KjDYlsfROSBEO+nEcqOvs
 T1gHLru+Xyoxc7td15arjK5W6ms0jFC+sf0R5p5hcPJKoJ+SitjKV091V8J75nR75FGG
 G0TlH0oApTLc/TtZikikRrnhiiAzMyKf/Dl5PYku/WcDeqzxTx0pAP4XLuA68UkfKU58
 bv0P5R9IBHaKFNofKyXphgeXdDbQGSGxyO1bGUnRIhdNyh9HJv9JB3toq9UZqW16nKjl
 Kah6DYMrrenya7UqAq/SoB1Eylo3srdlsT7tBDajDp0DSLR2aAf7zwMLe611rpGiH0Ce
 pfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=cbsXkUE5/xAhX30+BkWSJfE/azN413SHz22foDWrET0=;
 b=Cl5BO4al3QNh8Qx4Jen1e+/u1fzUrhGTwYA0lufh0Y7V8wwR2Kd9riyZU5JGcJbSiy
 NLkrS9NHkiM2Hj/B+I8v5OIXc8ZNDLv+e6HlRAi0Jnd7394ga+jOLeTDCJlqJfsHiGIZ
 +EGL9QBIOjejlFoXdhbQ/YXAWZPoX8r9A+NaVebAhIWbaIIg8BxQlxIPdpJp+ubdcBj7
 ByNBqGFE3ontn6Kj42oFKw+GeZk10lzD6ECQmLTxNVrC/nHu/LeU5/YKFfdMlw2VZKmk
 TRKSEoi97nbfPjFcKvyXpGk85EmIsmHz/KOUb2BjhuG9NYztHqsEG5GBQcKwKlQYVwRA
 Xz0w==
X-Gm-Message-State: AOAM531MR41vkJjoSt/vTBC3KL/HoKdLgJkthpoGmL/lbdgBZyKGmYML
 QMnEPoy0rceIrYZ9VeHMUkny4JBL2wI=
X-Google-Smtp-Source: ABdhPJxXr2t4g1B5tTgNEJoVb8TYUAssV1w30/0R3lpMn/exksuNga67eUKTKrVluFuyduQ4nO7IXw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr265457wrr.319.1610050112466; 
 Thu, 07 Jan 2021 12:08:32 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v20sm8955002wml.34.2021.01.07.12.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 12:08:31 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210105182309.1362-1-christian.koenig@amd.com>
 <X/dN/YFtnVAIllds@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
Date: Thu, 7 Jan 2021 21:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/dN/YFtnVAIllds@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: ray.huang@amd.com, bp@alien8.de, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjEgdW0gMTk6MDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSmFu
IDA1LCAyMDIxIGF0IDA3OjIzOjA4UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IERyaXZlcnMgYXJlIG5vdCBzdXBwb3NlZCB0byBpbml0IHRoZSBwYWdlIHBvb2wgZGlyZWN0bHkg
YW55IG1vcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBQbGVhc2UgaW5jbHVkZSByZXBvcnRlZC1ieSBjcmVkaXRzIGFu
ZCBsaW5rIHRvIHRoZSBidWcgcmVwb3J0cyBvbgo+IGxvcmUua2VybmVsLm9yZyB3aGVuIG1lcmdp
bmcgdGhpcy4gQWxzbyBJIGd1ZXNzIHRoaXMgc2hvdWxkIGhhdmUgYSBGaXhlczoKPiBsaW5lPwoK
SSdtIG5vdCBhd2FyZSBvZiBhIGJ1ZyByZXBvcnQsIGJ1dCB0aGUgcmVwb3J0ZWQtYnkvRml4ZXMg
bGluZXMgYXJlIAppbmRlZWQgbWlzc2luZy4KCkJUVzogQW55IGlkZWEgd2h5IGRpbSBhZGQtbGlu
ayBkb2Vzbid0IHdvcms/Cgo+IEFuZCBtYXliZSBzb21lIHdvcmRzIG9uIGhvdy93aHkgc3R1ZmYg
Ymxvd3MgdXAuCgpKdXN0IGEgdHlwby4gSSd2ZSBmb3Jnb3QgdG8gcmVtb3ZlIHR3byBsaW5lcyBp
biByYWRlb24gd2hpbGUgcmViYXNpbmcgCmFuZCBzdGlsbCBoYWQgdGhlIHN5bWJvbHMgZXhwb3J0
ZWQgc28gbmV2ZXIgbm90aWNlZCB0aGlzLgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPj4gLS0t
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAzIC0tLQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYwo+PiBpbmRleCBkNDMyOGZmNTc3NTcuLjM1YjcxNWY4MmVkOCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPj4gQEAgLTcyOSw5ICs3MjksNiBAQCBpbnQgcmFk
ZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+PiAgIAl9Cj4+ICAgCXJk
ZXYtPm1tYW4uaW5pdGlhbGl6ZWQgPSB0cnVlOwo+PiAgIAo+PiAtCXR0bV9wb29sX2luaXQoJnJk
ZXYtPm1tYW4uYmRldi5wb29sLCByZGV2LT5kZXYsIHJkZXYtPm5lZWRfc3dpb3RsYiwKPj4gLQkJ
ICAgICAgZG1hX2FkZHJlc3NpbmdfbGltaXRlZCgmcmRldi0+cGRldi0+ZGV2KSk7Cj4+IC0KPj4g
ICAJciA9IHJhZGVvbl90dG1faW5pdF92cmFtKHJkZXYpOwo+PiAgIAlpZiAocikgewo+PiAgIAkJ
RFJNX0VSUk9SKCJGYWlsZWQgaW5pdGlhbGl6aW5nIFZSQU0gaGVhcC5cbiIpOwo+PiAtLSAKPj4g
Mi4yNS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
