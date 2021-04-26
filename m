Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C336B23D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 13:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8D6E820;
	Mon, 26 Apr 2021 11:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F596E81C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 11:15:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id zg3so2210727ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hnjr3dCi4hCFH0E2IT+UC1Sw0LW27btik6EgV4fSASY=;
 b=ZK79hNDuTPAnQIcmy5yhMTe1JdyE3pgZxy+8e4WrhCvOmTkDcp9Wt0XowrgUI2TWiM
 m5eBSeNk0jxFBpCicqW9NSea2ed3Brwl/7gd7uAdsAsDfFqycfEAWtBR8v2tI69eF2fC
 PcIkBpTFoEWhbrkA5mQkHrZITQfhdgbP8oDls+uQklmfnayKurg7mSze6YRXn6j0Kp3q
 nNkdKJOKRK5UYMSVgK9QDgFy4TvE2dBnYMwg6lEpkxL06FLR4oA9guRfnAla3+QGX4DF
 QbeqfX6sAwRS0UIlUYK5MjFPMbeezJrv+sRg1xmudHzEkB8yrqigyp/33ncOddhNwEj/
 uaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hnjr3dCi4hCFH0E2IT+UC1Sw0LW27btik6EgV4fSASY=;
 b=JvCwnDOgplMUdOh/ZxA8NhN5xIHag1qNSd6Si7w7xQIW5gY3Xc+SSO2Ji4do4D+ZZT
 GGbwrTJfNKCZtFG3rm4/FkBGJ+gQMJv1ZjaSnFJLg4Z5o+cp/HJ02y5xGQUvJCNCx3gO
 vv678XgeSsYwCEPnhJOPkMabGwp0X0tluyZx8rQ0cyYcNv9EXvCyll30fJr+1/7Vue0G
 +DfYUyd/2XQ4l2Nc3OMnXD724qMGpw6il9im5Zo4/fyZ6GHiw+LPHsKLXNtx/YbRmS7F
 boomrRjqpIfxs+Ed1fxa/LomPVLAz7jPPb31w5hc8e2fPjw3tx5bnB3M3s6JgxNlcnzm
 1+Cw==
X-Gm-Message-State: AOAM532rwUqQxfA/g/DgKxhLWdEPxGijjesQgrlz/rj7xoDHjmeCRHq6
 yS61xHInBEt9/dyuB94TMiA=
X-Google-Smtp-Source: ABdhPJx81PB9/OFPNLuSjgtYtafdOJTkTTVUWd+LMl4HPtM9iy8wWrNpPZQPwBImYgWHf5jqhZ6V7Q==
X-Received: by 2002:a17:907:c0b:: with SMTP id
 ga11mr17789045ejc.545.1619435716310; 
 Mon, 26 Apr 2021 04:15:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ddf1:e741:577e:9eb2?
 ([2a02:908:1252:fb60:ddf1:e741:577e:9eb2])
 by smtp.gmail.com with ESMTPSA id r25sm13611385edv.78.2021.04.26.04.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 04:15:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: optimize the pool shrinker a bit v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210415115624.2904-1-christian.koenig@amd.com>
 <20210415115624.2904-2-christian.koenig@amd.com>
 <20210415133310.1ee9df70a9eb887be937c3a3@linux-foundation.org>
 <57572373-d68c-80de-7f9e-c04239d1b050@gmail.com>
Message-ID: <51fe2c43-4f05-5727-1680-b6907d652630@gmail.com>
Date: Mon, 26 Apr 2021 13:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <57572373-d68c-80de-7f9e-c04239d1b050@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, ray.huang@amd.com, vbabka@suse.cz
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGdlbnRsZSBwaW5nPwoKQXJlIHlvdSBvayB3aXRoIHRoaXMgZXhwbGFuYXRpb24gQW5k
cmV3IG9yIHNob3VsZCBJIGxvb2sgZm9yIGEgZGlmZmVyZW50IAphcHByb2FjaD8KClRoYW5rcywK
Q2hyaXN0aWFuLgoKQW0gMTYuMDQuMjEgdW0gMDk6MDggc2NocmllYiBDaHJpc3RpYW4gS8O2bmln
Ogo+IEFtIDE1LjA0LjIxIHVtIDIyOjMzIHNjaHJpZWIgQW5kcmV3IE1vcnRvbjoKPj4gT24gVGh1
LCAxNSBBcHIgMjAyMSAxMzo1NjoyNCArMDIwMCAiQ2hyaXN0aWFuIEvDtm5pZyIgCj4+IDxja29l
bmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+PiBAQCAtNTMwLDYgKzUy
NSwxMSBAQCB2b2lkIHR0bV9wb29sX2Zpbmkoc3RydWN0IHR0bV9wb29sICpwb29sKQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQo+
Pj4gdHRtX3Bvb2xfdHlwZV9maW5pKCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSk7Cj4+PiDC
oMKgwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgLyogV2UgcmVtb3ZlZCB0aGUgcG9vbCB0eXBl
cyBmcm9tIHRoZSBMUlUsIGJ1dCB3ZSBuZWVkIHRvIGFsc28gCj4+PiBtYWtlIHN1cmUKPj4+ICvC
oMKgwqDCoCAqIHRoYXQgbm8gc2hyaW5rZXIgaXMgY29uY3VycmVudGx5IGZyZWVpbmcgcGFnZXMg
ZnJvbSB0aGUgcG9vbC4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBzeW5jX3Nocmlua2Vy
cygpOwo+PiBJdCBpc24ndCBpbW1lZGlhdGVseSBjbGVhciB0byBtZSBob3cgdGhpcyB3b3Jrcy4g
dHRtX3Bvb2xfZmluaSgpIGhhcwo+PiBhbHJlYWR5IGZyZWVkIGFsbCB0aGUgcGFnZXMgaGFzbid0
IGl0P8KgIFNvIHdoeSB3b3VsZCBpdCBjYXJlIGlmIHNvbWUKPj4gc2hyaW5rZXJzIGFyZSBzdGls
bCBwbGF5aW5nIHdpdGggdGhlIHBhZ2VzPwo+Cj4gWWVzIHR0bV9wb29sX2ZpbmkoKSBoYXMgZnJl
ZWQgdXAgYWxsIHBhZ2VzIHdoaWNoIGhhZCBiZWVuIGluIHRoZSBwb29sIAo+IHdoZW4gdGhlIGZ1
bmN0aW9uIHdhcyBjYWxsZWQuCj4KPiBCdXQgdGhlIHByb2JsZW0gaXMgaXQgaXMgcG9zc2libGUg
dGhhdCBhIHBhcmFsbGVsIHJ1bm5pbmcgc2hyaW5rZXIgaGFzIAo+IHRha2VuIGEgcGFnZSBmcm9t
IHRoZSBwb29sIGFuZCBpcyBpbiB0aGUgcHJvY2VzcyBvZiBmcmVlaW5nIGl0IHVwLgo+Cj4gV2hl
biBJIHJldHVybiBoZXJlIHRoZSBwb29sIHN0cnVjdHVyZSBhbmQgZXNwZWNpYWxseSB0aGUgZGV2
aWNlIAo+IHN0cnVjdHVyZSBhcmUgZnJlZWQgd2hpbGUgdGhlIHBhcmFsbGVsIHJ1bm5pbmcgc2hy
aW5rZXIgaXMgc3RpbGwgdXNpbmcgCj4gdGhlbS4KPgo+IEkgY291bGQgZ28gZm9yIGEgZGVzaWdu
IHdoZXJlIHdlIGhhdmUgb25lIHNocmlua2VyIHBlciBkZXZpY2UgaW5zdGVhZCwgCj4gYnV0IHRo
YXQgd291bGQgcHV0IGEgYml0IHRvIG11Y2ggcHJlc3N1cmUgb24gdGhlIHBvb2wgaW4gbXkgb3Bp
bmlvbi4KPgo+PiBPciBpcyBpdCB0aGUgY2FzZSB0aGF0IHR0bV9wb29sX2ZpbmkoKSBpcyBhc3N1
bWluZyB0aGF0IHRoZXJlIHdpbGwgYmUKPj4gc29tZSBmdXJ0aGVyIGFjdGlvbiBhZ2FpbnN0IHRo
ZXNlIHBhZ2VzLCB3aGljaCByZXF1aXJlcyB0aGF0IHNocmlua2Vycwo+PiBubyBsb25nZXIgYmUg
YWNjZXNzaW5nIHRoZSBwYWdlcyBhbmQgd2hpY2ggZnVydGhlciBhc3N1bWVzIHRoYXQgZnV0dXJl
Cj4+IHNocmlua2VyIGludm9jYXRpb25zIHdpbGwgbm90IGJlIGFibGUgdG8gbG9vayB1cCB0aGVz
ZSBwYWdlcz8KPj4KPj4gSU9XLCBhIGJpdCBtb3JlIGV4cGxhbmF0aW9uIGFib3V0IHRoZSBkeW5h
bWljcyBoZXJlIHdvdWxkIGhlbHAhCj4KPiBTb3JyeSwgSSdtIG5vdCBhIG5hdGl2ZSBzcGVha2Vy
IG9mIEVuZ2xpc2ggYW5kIHNvbWV0aW1lcyBzdGlsbCBoYXZlIGEgCj4gaGFyZCB0aW1lIGV4cGxh
aW5pbmcgdGhpbmdzLgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
