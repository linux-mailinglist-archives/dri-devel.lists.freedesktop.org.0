Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138592B292
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F0C893B9;
	Mon, 27 May 2019 10:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160E5893B9;
 Mon, 27 May 2019 10:56:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so16481415wrb.9;
 Mon, 27 May 2019 03:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NgHnGCvNMHq7295bMMDORWVKD+vXnKaZP5KT2iaVdZY=;
 b=BRcRKPJevmxRC0xDqy1Je9Kq15znWfvQAZpxn4eVQHz3bqmLrikmGc+QDYjlw7CuoH
 MOq+Hm2t3HlO/LCEixaAl/cIc2jcPxF/onYUf7XI32OtlA1GXw63FCNTbREqGXbL5/Op
 01gK0dEfsLYkRTpLI+k73Uf7/J2/AjlQiP1eCxS0QPk60z/egwVVRexkIJ2C6lk9/+k3
 6IF6S76J6dWLeglRkmTSvT2C3ZhSfo2yJdLVG2Wh7EH2BdkvKUyQVm+6ZpKa1/H3NlMh
 FFlNzAi58KHAhreODx5k9Cc+vyOF7fb76hlz/lA8klVgAGXQaxwCNfq3EdRsqKu5zbDt
 jSbw==
X-Gm-Message-State: APjAAAWYc4IkRaX5jtm95UQQa2kbvynv5YONm+ySFOQP/A+hz+wAeK0O
 U8jRWqOcqa7j7wxFg9RzwWwVfy8m
X-Google-Smtp-Source: APXvYqx8kZRC7ah5RK8wi+cmUjWfiwmMDV79Lnhar/TOLTyXGvi8+Fn5qTph5amrQFkilVRQv57vaA==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr14307927wru.44.1558954577790; 
 Mon, 27 May 2019 03:56:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y18sm12197618wmd.29.2019.05.27.03.56.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 03:56:17 -0700 (PDT)
Subject: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
To: Hillf Danton <hdanton@sina.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
 <20190416183841.1577-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <76bc8afb-8797-9057-ccb5-2d4f788d2f9e@gmail.com>
Date: Mon, 27 May 2019 12:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416183841.1577-3-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NgHnGCvNMHq7295bMMDORWVKD+vXnKaZP5KT2iaVdZY=;
 b=ZrQz6UlCjgLs4qFfhveSbG2qWpgslRMdcumRBd1vZyrGyK3X62/ebExfdZS9qaSW3b
 lUTRdvKC+MGVqkWr8SFd5tHgkcJqEww0wh2gHwn0RGLqJMHOHPSZ94EhIyhhDzzseQeU
 XdMPNhi6IqzLtvgzV1wLx3VVj7K0Pj7qakXufLIAmlJKHGqLW5zMPZM5UvNBftzzevgX
 j73eFMJulT+quE4aAi6YwXwKD2CjuLO2L7goUm35tzmlcxdQxURFLsk/Zn8ECR27thJ9
 4dxqHq24XvragiBP5vB1zJocE0E89M4bEkRsQ2EOqdjdJWblwZu8uCmv6gS9Zl5V7ZV+
 mu/g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgY29tbWVudHMsIGJ1dCB5b3UgYXJlIGxvb2tpbmcgYXQgYSBjb21wbGV0
ZWx5IG91dGRhdGVkIApwYXRjaHNldC4KCklmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgbmV3
ZXN0IG9uZSBwbGVhc2UgcGluZyBtZSBhbmQgSSdtIGdvaW5nIHRvIApDQyB5b3Ugd2hlbiBJIHNl
bmQgb3V0IHRoZSBuZXh0IHZlcnNpb24uCgpDaHJpc3RpYW4uCgpBbSAyNS4wNS4xOSB1bSAwMzow
NCBzY2hyaWViIEhpbGxmIERhbnRvbjoKPiBPbiBUdWUsIDE2IEFwciAyMDE5IDIwOjM4OjMxICsw
MjAwIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFkZCBmdW5jdGlvbiB2YXJpYW50cyB3aGlj
aCBjYW4gYmUgY2FsbGVkIHdpdGggdGhlIHJlc2VydmF0aW9uIGxvY2sKPj4gYWxyZWFkeSBoZWxk
Lgo+Pgo+PiB2MjogcmVvcmRlcmVkLCBhZGQgbG9ja2RlcCBhc3NlcnRzLCBmaXgga2VybmVsZG9j
Cj4+IHYzOiByZWJhc2VkIG9uIHNndCBjYWNoaW5nCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAgfCAgNSArKysrCj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+PiBpbmRleCA2
NTE2MWE4MmQ0ZDUuLmVmNDgwZTVmYjIzOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYwo+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4+IEBAIC02MjMs
NiArNjIzLDQzIEBAIHZvaWQgZG1hX2J1Zl9kZXRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwg
c3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+PiAgIH0KPj4gICBFWFBPUlRfU1lN
Qk9MX0dQTChkbWFfYnVmX2RldGFjaCk7Cj4+ICAgCj4+ICsvKioKPj4gKyAqIGRtYV9idWZfbWFw
X2F0dGFjaG1lbnRfbG9ja2VkIC0gTWFwcyB0aGUgYnVmZmVyIGludG8gX2RldmljZV8gYWRkcmVz
cyBzcGFjZQo+PiArICogd2l0aCB0aGUgcmVzZXJ2YXRpb24gbG9jayBoZWxkLiBJcyBhIHdyYXBw
ZXIgZm9yIG1hcF9kbWFfYnVmKCkgb2YgdGhlCj4gU29tZXRoaW5nIGlzIG1pc3Npbmc7IHNlZW1z
IHRvIGJlIHMvb2YgdGhlL29mIHRoZSBkbWFfYnVmX29wcy4vCj4+ICsgKgo+PiArICogUmV0dXJu
cyB0aGUgc2NhdHRlcmxpc3QgdGFibGUgb2YgdGhlIGF0dGFjaG1lbnQ7Cj4+ICsgKiBkbWFfYnVm
X29wcy4KPiBPaCBpdCBpcyBzaXR0aW5nIGhlcmUhCj4KPj4gKyAqIEBhdHRhY2g6CVtpbl0JYXR0
YWNobWVudCB3aG9zZSBzY2F0dGVybGlzdCBpcyB0byBiZSByZXR1cm5lZAo+PiArICogQGRpcmVj
dGlvbjoJW2luXQlkaXJlY3Rpb24gb2YgRE1BIHRyYW5zZmVyCj4+ICsgKgo+PiArICogUmV0dXJu
cyBzZ190YWJsZSBjb250YWluaW5nIHRoZSBzY2F0dGVybGlzdCB0byBiZSByZXR1cm5lZDsgcmV0
dXJucyBFUlJfUFRSCj4+ICsgKiBvbiBlcnJvci4gTWF5IHJldHVybiAtRUlOVFIgaWYgaXQgaXMg
aW50ZXJydXB0ZWQgYnkgYSBzaWduYWwuCj4+ICsgKgo+IEVJTlRSIGxvb2tzIGltcG9zc2libGUg
aW4gdGhlIGNvZGUuCj4KPj4gKyAqIEEgbWFwcGluZyBtdXN0IGJlIHVubWFwcGVkIGJ5IHVzaW5n
IGRtYV9idWZfdW5tYXBfYXR0YWNobWVudF9sb2NrZWQoKS4gTm90ZQo+PiArICogdGhhdCB0aGUg
dW5kZXJseWluZyBiYWNraW5nIHN0b3JhZ2UgaXMgcGlubmVkIGZvciBhcyBsb25nIGFzIGEgbWFw
cGluZwo+PiArICogZXhpc3RzLCB0aGVyZWZvcmUgdXNlcnMvaW1wb3J0ZXJzIHNob3VsZCBub3Qg
aG9sZCBvbnRvIGEgbWFwcGluZyBmb3IgdW5kdWUKPj4gKyAqIGFtb3VudHMgb2YgdGltZS4KPj4g
KyAqLwo+PiArc3RydWN0IHNnX3RhYmxlICoKPj4gK2RtYV9idWZfbWFwX2F0dGFjaG1lbnRfbG9j
a2VkKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKPj4gKwkJCSAgICAgIGVudW0g
ZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKPj4gK3sKPj4gKwlzdHJ1Y3Qgc2dfdGFibGUg
KnNnX3RhYmxlOwo+PiArCj4+ICsJbWlnaHRfc2xlZXAoKTsKPj4gKwlyZXNlcnZhdGlvbl9vYmpl
Y3RfYXNzZXJ0X2hlbGQoYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+PiArCj4+ICsJaWYgKGF0dGFj
aC0+c2d0KQo+PiArCQlyZXR1cm4gYXR0YWNoLT5zZ3Q7Cj4+ICsKPj4gKwlzZ190YWJsZSA9IGF0
dGFjaC0+ZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgZGlyZWN0aW9uKTsKPj4gKwlp
ZiAoIXNnX3RhYmxlKQo+PiArCQlzZ190YWJsZSA9IEVSUl9QVFIoLUVOT01FTSk7Cj4+ICsKPj4g
KwlyZXR1cm4gc2dfdGFibGU7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX21h
cF9hdHRhY2htZW50X2xvY2tlZCk7Cj4+ICsKPiBCZXN0IFJlZ2FyZHMKPiBIaWxsZgo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
