Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365A34D85D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 21:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879F46E506;
	Mon, 29 Mar 2021 19:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BD76E503;
 Mon, 29 Mar 2021 19:36:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id j3so15465087edp.11;
 Mon, 29 Mar 2021 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HXb5EXzJ9acUERimB6ho5NVSB8Y8VyVg4M94D5L/HOM=;
 b=CofKSEonRZOnXxo6VoPfMdSdBQidCfltrWE4tINepx7+9oG3jTSKS2XIYruNZU+dLU
 VIaoSTgJyyFpzOmD4yi2WpPWJuc6qnbiJskzA2tDWfyOfStKsJ33lgeKkIjbArwjgnfx
 9XWwx41n/7BBkVk6e83DLQAsB0y5rGhqAj8uOT8ZsGU7L5JbBamH6oY3ZWzBLGh+YOe5
 ne+axUl4l6dDWgI3seBjFfgqP5JSpMjY3VSBwMEjbNnLw3ZjtDyiReasRpaFokNwNzcP
 kM2EMgP+JJWjrrVMAcVHFnJSIBrChZSI6zC0JcKjP2qcrdALC/aPcdKoYbW64iNWoyq2
 w73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HXb5EXzJ9acUERimB6ho5NVSB8Y8VyVg4M94D5L/HOM=;
 b=pLG7p83m5UyeDLBFaiMdQjKMyne1gMwt6/uhF0hM+q/nIBhnmE2jo8UsBAD/EZVDVk
 hL8qdJjSkZAQ8E309HwEHnyjWe9Z3+2oTcpPtk4CCoUgelULNRA3k+zo8qkRVo55PpSa
 AWlPwDsVFTZDhtly6ZDC7/rQ9zmofhHLUROsRjmswifVusj7XJ2iZEbGV3E6BZGLWAOF
 2GoqW6bx5MMnPgCmmYjSKCCPj2UInSyDLr/FG6fE6c1wLyQdwaL8UdlHkUV2/jSxEdcy
 HomDp9VSaRc7zRSGBwqiWMyHMVRQBzw7hsP2f6meoKR9Po/UDgQrSr44gfhB6nkNeVDD
 Cy4w==
X-Gm-Message-State: AOAM531mVODJv/Iif1+5oaQjzm1OkZAx0nkFAxNkX+HmsC4y7/YVl2w9
 PMgZE48Dj2gWuIfq5W8e7+k=
X-Google-Smtp-Source: ABdhPJwLSDAEF398fF1iUjClkbrtBHM+UjKBBKiBdnEtSAk0hMf0CEzHf12psHWT9y9vxfYZsxYCBQ==
X-Received: by 2002:aa7:d813:: with SMTP id v19mr30086149edq.213.1617046608196; 
 Mon, 29 Mar 2021 12:36:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd?
 ([2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd])
 by smtp.gmail.com with ESMTPSA id u14sm8747191ejx.60.2021.03.29.12.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 12:36:47 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
To: Xi Ruoyao <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
Date: Mon, 29 Mar 2021 21:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDMuMjEgdW0gMjE6Mjcgc2NocmllYiBYaSBSdW95YW86Cj4gSGkgQ2hyaXN0aWFuLAo+
Cj4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgY29uc3RyYWludCBpbXBsZW1lbnRlZCB0byBl
bnN1cmUgYG51bV9lbnRyaWVzICUKPiBBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFID09IDBg
LiAgRm9yIGV4YW1wbGUsIGluIGBhbWRncHVfdm1fYm9fbWFwKClgOgo+Cj4gICAgICAgICAgLyog
dmFsaWRhdGUgdGhlIHBhcmFtZXRlcnMgKi8KPiAgICAgICAgICBpZiAoc2FkZHIgJiBBTURHUFVf
R1BVX1BBR0VfTUFTSyB8fCBvZmZzZXQgJiBBTURHUFVfR1BVX1BBR0VfTUFTSyB8fAo+ICAgICAg
ICAgICAgICBzaXplID09IDAgfHwgc2l6ZSAmIEFNREdQVV9HUFVfUEFHRV9NQVNLKQo+ICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAvKiBzbmlwICovCj4KPiAgICAgICAgICBz
YWRkciAvPSBBTURHUFVfR1BVX1BBR0VfU0laRTsKPiAgICAgICAgICBlYWRkciAvPSBBTURHUFVf
R1BVX1BBR0VfU0laRTsKPgo+IC8qIHNuaXAgKi8KPgo+ICAgICAgICAgIG1hcHBpbmctPnN0YXJ0
ID0gc2FkZHI7Cj4gICAgICAgICAgbWFwcGluZy0+bGFzdCA9IGVhZGRyOwo+Cj4KPiBJZiB3ZSBy
ZWFsbHkgd2FudCB0byBlbnN1cmUgKG1hcHBpbmctPmxhc3QgLSBtYXBwaW5nLT5zdGFydCArIDEp
ICUKPiBBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFID09IDAsIHRoZW4gd2Ugc2hvdWxkIHJl
cGxhY2UgIkFNREdQVV9HUFVfUEFHRV9NQVNLIgo+IGluICJ2YWxpZGF0ZSB0aGUgcGFyYW1ldGVy
cyIgd2l0aCAiUEFHRV9NQVNLIi4KClllYWgsIGdvb2QgcG9pbnQuCgo+IEkgdHJpZWQgaXQgYW5k
IGl0IGJyb2tlIHVzZXJzcGFjZTogWG9yZyBzdGFydHVwIGZhaWxzIHdpdGggRUlOVkFMIHdpdGgg
dGhpcwo+IGNoYW5nZS4KCldlbGwgaW4gdGhlb3J5IGl0IGlzIHBvc3NpYmxlIHRoYXQgd2UgYWx3
YXlzIGZpbGwgdGhlIEdQVVZNIG9uIGEgNGsgCmJhc2lzIHdoaWxlIHRoZSBuYXRpdmUgcGFnZSBz
aXplIG9mIHRoZSBDUFUgaXMgbGFyZ2VyLiBMZXQgbWUgZG91YmxlIApjaGVjayB0aGUgY29kZS4K
CkJUVzogV2hhdCBjb2RlIGJhc2UgYXJlIHlvdSBiYXNlZCBvbj8gVGhlIGNvZGUgeW91ciBwb3N0
IGhlcmUgaXMgcXVpdGUgCm91dGRhdGVkLgoKQ2hyaXN0aWFuLgoKPgo+IE9uIDIwMjEtMDMtMzAg
MDI6MzAgKzA4MDAsIFhpIFJ1b3lhbyB3cm90ZToKPj4gT24gMjAyMS0wMy0zMCAwMjoyMSArMDgw
MCwgWGkgUnVveWFvIHdyb3RlOgo+Pj4gT24gMjAyMS0wMy0yOSAyMDoxMCArMDIwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBZb3UgbmVlZCB0byBpZGVudGlmeSB0aGUgcm9vdCBjYXVz
ZSBvZiB0aGlzLCBtb3N0IGxpa2VseSBzdGFydCBvciBsYXN0Cj4+Pj4gYXJlIG5vdCBhIG11bHRp
cGxlIG9mIEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0UuCj4+PiBJIHByaW50aydlZCB0aGUg
dmFsdWUgb2Ygc3RhcnQgJiBsYXN0LCB0aGV5IGFyZSBhbGwgYSBtdWx0aXBsZSBvZiA0Cj4+PiAo
QU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSkuCj4+Pgo+Pj4gSG93ZXZlci4uLiBgbnVtX2Vu
dHJpZXMgPSBsYXN0IC0gc3RhcnQgKyAxYCBzbyBpdCBiZWNhbWUgc29tZSBpcnJhdGlvbmFsCj4+
PiB0aGluZy4uLsKgIEVpdGhlciB0aGlzIGxpbmUgaXMgd3JvbmcsIG9yIHNvbWVvbmUgY2FsbGVk
Cj4+PiBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcgd2l0aCBbc3RhcnQsIGxhc3QpIGluc3Rl
YWQgb2YgW3N0YXJ0LCBsYXN0XSwgd2hpY2gKPj4+IGlzIHVuZXhwZWN0ZWQuCj4+IEkgYWRkZWQg
QlVHX09OKG51bV9lbnRyaWVzICUgQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSAhPSAwKSwg
Z2V0Ogo+Pgo+Pj4gTWFyIDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBrZXJuZWw6IFs8ZmZmZmZm
ZmY4M2M5MDc1MD5dCj4+PiBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcuY29uc3Rwcm9wLjAr
MHgyMTgvMHhhZTgKPj4+IE1hciAzMCAwMjoyODoyNyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZm
ZmZmZmZmODNjOTIyYjg+XQo+Pj4gYW1kZ3B1X3ZtX2JvX3VwZGF0ZSsweDI3MC8weDRjMAo+Pj4g
TWFyIDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBrZXJuZWw6IFs8ZmZmZmZmZmY4M2M4MjNlYz5d
Cj4+PiBhbWRncHVfZ2VtX3ZhX2lvY3RsKzB4NDBjLzB4NDMwCj4+PiBNYXIgMzAgMDI6Mjg6Mjcg
eHJ5MTExLUExOTAxIGtlcm5lbDogWzxmZmZmZmZmZjgzYzFjYWU0Pl0KPj4+IGRybV9pb2N0bF9r
ZXJuZWwrMHhjYy8weDEyMAo+Pj4gTWFyIDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBrZXJuZWw6
IFs8ZmZmZmZmZmY4M2MxY2ZkOD5dCj4+PiBkcm1faW9jdGwrMHgyMjAvMHg0MDgKPj4+IE1hciAz
MCAwMjoyODoyNyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNjNWVhNDg+XQo+Pj4g
YW1kZ3B1X2RybV9pb2N0bCsweDU4LzB4OTgKPj4+IE1hciAzMCAwMjoyODoyNyB4cnkxMTEtQTE5
MDEga2VybmVsOiBbPGZmZmZmZmZmODM4ZmVhYzQ+XSBzeXNfaW9jdGwrMHhjYy8weGU4Cj4+PiBN
YXIgMzAgMDI6Mjg6MjcgeHJ5MTExLUExOTAxIGtlcm5lbDogWzxmZmZmZmZmZjgzNmU3NGYwPl0K
Pj4+IHN5c2NhbGxfY29tbW9uKzB4MzQvMHg1OAo+Pj4KPj4+Pj4+PiBCdWdMaW5rOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8xNTQ5Cj4+Pj4+Pj4gRml4
ZXM6IGEzOWYyYThkNzA2NiAoImRybS9hbWRncHU6IG51a2UgYW1kZ3B1X3ZtX2JvX3NwbGl0X21h
cHBpbmcgdjIiKQo+Pj4+Pj4+IFJlcG9ydGVkLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFu
MTIyMy53YW5nPgo+Pj4+Pj4+IFJlcG9ydGVkLWJ5OiBEYW4gSG9yw6FrIDxkYW5AZGFubnkuY3o+
Cj4+Pj4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+
ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiArLQo+Pj4+
Pj4+ICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
Ywo+Pj4+Pj4+IGluZGV4IGFkOTFjMGMzYzQyMy4uY2VlMGNjOWM4MDg1IDEwMDY0NAo+Pj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4+Pj4+PiBAQCAtMTcw
Nyw3ICsxNzA3LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoc3Ry
dWN0Cj4+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0KPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHN0YXJ0ID0gdG1wOwo+Pj4+Pj4+ICAgICAKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqB9
IHdoaWxlICh1bmxpa2VseShzdGFydCAhPSBsYXN0ICsgMSkpOwo+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoH0gd2hpbGUgKHVubGlrZWx5KHN0YXJ0IDwgbGFzdCArIDEpKTsKPj4+Pj4+PiAgICAgCj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoHIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBh
cmFtcywgZmVuY2UpOwo+Pj4+Pj4+ICAgICAKPj4+Pj4+Pgo+Pj4+Pj4+IGJhc2UtY29tbWl0OiBh
NWUxM2M2ZGYwZTQxNzAyZDJiMmM3N2M4YWQ0MTY3N2ViYjA2NWIzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
