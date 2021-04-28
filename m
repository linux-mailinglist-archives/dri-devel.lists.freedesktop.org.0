Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9936DD18
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38016E123;
	Wed, 28 Apr 2021 16:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BB86E123;
 Wed, 28 Apr 2021 16:33:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z5so38525705edr.11;
 Wed, 28 Apr 2021 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=6o4JpSzi1l7M1VvTaoZ10TNcYvkNLuDh25C6fc+4/bw=;
 b=LiIlMdlOwXUcSOLleNvAsCi/dGlIlqdBtGy/2Kfy67UYBfpkOgVsH9hU6Dp/Uy9fQb
 Q2SHml6h7hZBBctt7zVou0jAbfqBvfZVLEfZnAaI1UpifqQlPdvk5gEZS+KPivjihkon
 dAA9qTnujiss4/9ldZc4ztEsAIcJqrUXDR0kgA3EybL3vnk9SKwOR/Jj/g6+7fo67C/j
 +dxAamSO/RkkMhcTMCcCsZZelcsxmUek9CSI1EAGtzpxWARLvjv+5VqjandlLtXKQkFU
 4wajdCqk1/C9tiN4LETEvVbIvZqqLFHjIu4WlFisCSgMa4RPmgiYDvxJdqLzp4mfISxZ
 adsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6o4JpSzi1l7M1VvTaoZ10TNcYvkNLuDh25C6fc+4/bw=;
 b=Z8Jy2xDUbWTd8OPzXwBdMkhi183diWer/c3IqDcVoHyOUqW7sHX4IMIXMKviHNgw+f
 OnnGrgxQnhRxJRj6UKBDiKny5ztJR2CerquNfCs+rMnmVjalU6xvF2IHUWH3C2y1JeKC
 lWYVLn4SAVRr6asLGgi6ZB7mQM7qfqvz+fV7iLzJRz/KJToqpXF5jiC5AE8vKhNZLlt2
 qk3MMeKtZzWehfAvUOO1hYr5MhVXJ8GJCegxe9MCZmj+fgZdxJ6Rn53mHoqon+QJ5IlG
 md/gOFgk2ewAnScJDcUQeUCznf7Ip0XBBQy9qxpLGWa1Tg3xNx9BH3Y4LxoryDCM4EXf
 fjcg==
X-Gm-Message-State: AOAM530ErmIyIKJ+4Kw9hINoVM2UMiV2vBfZhHJmRr2x1rBveFNxWG1B
 EokmGRf/FU3A8tiNk30nSd32sHCiB5o=
X-Google-Smtp-Source: ABdhPJxkVN3beybGIVnIeWpo1r7GBhM1zrUmuGd8in2njyNxAY+iZXIfSDdJ7FO/qQ6GemU4e0qa9A==
X-Received: by 2002:a05:6402:309c:: with SMTP id
 de28mr12333788edb.191.1619627625535; 
 Wed, 28 Apr 2021 09:33:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c?
 ([2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c])
 by smtp.gmail.com with ESMTPSA id b6sm260883edd.18.2021.04.28.09.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:33:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
 <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
 <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0fba1262-8fbf-37f0-4d51-c4d74476894b@gmail.com>
Date: Wed, 28 Apr 2021 18:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDQuMjEgdW0gMTc6MTkgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTA0
LTI4IHVtIDU6MDUgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gW1NOSVBdCj4gSG1t
LCBJIHdhcyBtaXNzaW5nIHNvbWV0aGluZy4gVGhlIGFtZGdwdV9ndHRfbWdyIGRvZXNuJ3QgYWN0
dWFsbHkKPiBhbGxvY2F0ZSBzcGFjZSBmb3IgbWFueSBCT3M6Cj4KPiAgICAgICAgICBpZiAoIXBs
YWNlLT5scGZuKSB7Cj4gICAgICAgICAgICAgICAgICBtZW0tPm1tX25vZGUgPSBOVUxMOwo+ICAg
ICAgICAgICAgICAgICAgbWVtLT5zdGFydCA9IEFNREdQVV9CT19JTlZBTElEX09GRlNFVDsKPiAg
ICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgIH0KPgo+IEkgdGhpbmsgb3VyIHVz
ZXJwdHIgQk9zIGRvbid0IGhhdmUgbW1fbm9kZXMgYW5kIGRvbid0IHVzZSBHVFQgc3BhY2UuIFNv
Cj4gSSBjb3VsZCBhZGQgYSBjaGVjayBmb3IgdGhhdCB0byBhbWRncHVfdHRtX2JvX2V2aWN0aW9u
X3ZhbHVhYmxlLgoKVGhhdCdzIGZvciBhbGxvY2F0aW5nIEdBUlQgc3BhY2UgYW5kIGNvbXBsZXRl
bHkgdW5yZWxhdGVkIGhlcmUuCgpbU05JUF0KPj4+IEZhaWxpbmcgdGhhdCwgSSdkIHByb2JhYmx5
IGhhdmUgdG8gYWJhbmRvbiB1c2VycHRyIEJPcyBhbHRvZ2V0aGVyIGFuZAo+Pj4gc3dpdGNoIHN5
c3RlbSBtZW1vcnkgbWFwcGluZ3Mgb3ZlciB0byB1c2luZyB0aGUgbmV3IFNWTSBBUEkgb24gc3lz
dGVtcwo+Pj4gd2hlcmUgaXQgaXMgYXZhbGlhYmxlLgo+PiBXZWxsIGFzIGxvbmcgYXMgdGhhdCBw
cm92aWRlcyB0aGUgbmVjZXNzYXJ5IGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBITU0KPj4gaXQgd291
bGQgYmUgYW4gb3B0aW9uLgo+IEp1c3QgYW5vdGhlciB3YXkgb2YgY2lyY3VtdmVudGluZyAiSXQg
c2hvdWxkIGxpbWl0IHRoZSBhbW91bnQgb2Ygc3lzdGVtCj4gbWVtb3J5IHRoZSBHUFUgY2FuIGFj
Y2VzcyBhdCB0aGUgc2FtZSB0aW1lLCIgYSBwcmVtaXNlIEkgZGlzYWdyZWUgd2l0aAo+IGluIGNh
c2Ugb2YgdXNlcnB0cnMgYW5kIEhNTS4gQm90aCB1c2UgcGFnZWFibGUsIHVucGlubmVkIG1lbW9y
eS4KCj4gQm90aCBjYW4gY2F1c2UgdGhlIEdQVSB0byBiZSBwcmVlbXB0ZWQgaW4gY2FzZSBvZiBN
TVUgaW50ZXJ2YWwgbm90aWZpZXJzLgoKV2VsbCB0aGF0J3MgdGhlIGtleSBwb2ludC4gR0ZYIHVz
ZXJwdHJzIGFuZCBETUEtYnVmIGltcG9ydHMgY2FuJ3QgYmUgCnByZWVtcHRlZC4KClNvIHRoZXkg
YmFzaWNhbGx5IGxvY2sgdGhlIGJhY2tpbmcgbWVtb3J5IHVudGlsIHRoZSBsYXN0IHN1Ym1pc3Np
b24gaXMgCmNvbXBsZXRlZCBhbmQgdGhhdCBpcyBjYXVzaW5nIHByb2JsZW1zIGlmIGl0IGhhcHBl
bnMgZm9yIHRvIG11Y2ggbWVtb3J5IAphdCB0aGUgc2FtZSB0aW1lLgoKV2hhdCB3ZSBjb3VsZCBk
byBpcyB0byBmaWd1cmUgb3V0IGluIHRoZSB2YWx1YWJsZSBjYWxsYmFjayBpZiB0aGUgQk8gaXMg
CnByZWVtcHQtYWJsZSBvciBub3QuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+IFN0YXRpY2FsbHkg
bGltaXRpbmcgdGhlIGFtb3VudCBvZiBwYWdlYWJsZSBtZW1vcnkgYWNjZXNzaWJsZSB0byBHVFQg
aXMKPiByZWR1bmRhbnQgYW5kIG92ZXJseSBsaW1pdGluZy4KPgo+IFJlZ2FyZHMsCj4gIMKgIEZl
bGl4Cj4KPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gIMKg
wqAgRmVsaXgKPj4+Cj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+
ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA0ICsrKysKPj4+Pj4gIMKgwqAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPj4+Pj4gaW5kZXggZGUxZWM4MzhjZjhiLi4wYjk1MzY1NGZkYmYgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+PiBAQCAtNjU1LDYgKzY1NSwxMCBAQCBpbnQgdHRt
X21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZtYW4tPmxydVtpXSwgbHJ1KSB7
Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgYnVzeTsKPj4+Pj4gIMKg
wqAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3QgZXZpY3QgU0cgQk9zICovCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChiby0+dHRtICYmIGJvLT50dG0tPnNnKQo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+PiArCj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdHRtX2JvX2V2aWN0X3N3YXBvdXRf
YWxsb3dhYmxlKGJvLCBjdHgsICZsb2NrZWQsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYnVzeSkpIHsK
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYnVzeSAmJiAh
YnVzeV9ibyAmJiB0aWNrZXQgIT0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
