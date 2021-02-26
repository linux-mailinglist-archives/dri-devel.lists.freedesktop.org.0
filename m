Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82B325E54
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 08:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC56ED98;
	Fri, 26 Feb 2021 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4E6EDA4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 07:37:07 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id f33so8261233otf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 23:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VQgZEeHJdf6Bfk1LIoWC2HIkTuWyVFZe6jHDYc9nISE=;
 b=MTOO3T/7o4+Kk3jwJNeTNrbRnWQRL6blOAlspjkX9zFyM6aHksKTw5L9lX8ZhG//Ke
 MRbs9dmfhRppCWYeENEHFnKToI3YNcFN0GTIaqMRgzaxHF+ARvRFMEEGLbEG7gIWgJyn
 82/AghDRLileNUQNudm9qZHISDiEwDDqdF4Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VQgZEeHJdf6Bfk1LIoWC2HIkTuWyVFZe6jHDYc9nISE=;
 b=nVaWL2zzD2N/stgntFydDepQV5adhR9A+EXish8i0fg2sOp+lJfbQwXLabWEY9BX9w
 xTx6iVNEKvhMNu561SMlZ1nXXdnH0dwAR1c2S4Y6ejfnjbJ60s7exrDbInfbgBCBhpJn
 mxAHgYK8+xAt+wpfNt9ebAWWezWp2OeHmHzvYcer9VzI/P5sz2WkDiQt/8ZZW/G97fmF
 tcAYtkLlPVAnCrvObiMLZpd42Iyop5yhA3qgiocrMrfc4+sewII7vvBbphPrU9+d5lMT
 vQZ2ULYl0+EPL28vcVxuc8m+nsknEvleqOR1AWUK5KhBKOsQ8EWYnpyBqkFOifEmDrgW
 uEjA==
X-Gm-Message-State: AOAM5333LGASNTki57mmFj4X1BOjEOgp2MYrfY1hq0iKSJEuKL9uqF8I
 tGEE1W9zqA5JZd1Dn1bks13cuqXPrwYYBi451q5dnw==
X-Google-Smtp-Source: ABdhPJzr069PMRWNCVN2fwP3STHObwlwny7T1Jhy/pGm0WViCqvjVbehuOse2fxwPjKBXt2Y8wHFc/jl2bd+sCABeoI=
X-Received: by 2002:a9d:46e:: with SMTP id 101mr1053650otc.303.1614325026472; 
 Thu, 25 Feb 2021 23:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20210226040908.3274666-1-john.stultz@linaro.org>
In-Reply-To: <20210226040908.3274666-1-john.stultz@linaro.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Feb 2021 08:36:55 +0100
Message-ID: <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma
 heaps
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMjYsIDIwMjEgYXQgNTowOSBBTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBQZXIgZGlzY3Vzc2lvbiBhbmQgcGF0Y2hlcyBoZXJlOgo+
ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjEwMjIzMTA1OTUxLjkxMjU3
Ny0xLWRhbmllbC52ZXR0ZXJAZmZ3bGwuY2gvCj4KPiBEYW5pZWwgaXMgcGxhbm5pbmcgb24gbWFr
aW5nIFZNX1BGTk1BUCByZXF1aXJlZCBvbiBkbWFidWZzLgo+Cj4gVGh1cyB0byBhdm9pZCB0aGUg
d2Fybl9vbiBub2lzZSwgc2V0IHRoZSBWTV9QRk5NQVAgaW4gdGhlCj4gc3lzdGVtIGFuZCBjbWEg
aGVhcCdzIG1tYXAgaGFuZGxlci4KPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+IENjOiBDaHJpc3RpYW4g
S29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3Vt
aXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5v
cmc+Cj4gQ2M6IENocmlzIEdvbGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KPiBD
YzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkg
PEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KPiBDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdv
b2dsZS5jb20+Cj4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4g
Q2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KPiBDYzogRGFuaWVsIE1lbnR6
IDxkYW5pZWxtZW50ekBnb29nbGUuY29tPgo+IENjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBh
cm0uY29tPgo+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IENjOiBF
emVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFNpbW9uIFNlciA8
Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlhLmNv
bT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVs
dHpAbGluYXJvLm9yZz4KClN5c3RlbSBoZWFwIHVzZXMgcmVtYXBfcGZuX3JhbmdlIHNvIGxvb2tz
IGZpbmUsIGJ1dCBjbWEgaGVhcCBpbnNlcnRzCnBhZ2VzLCBhbmQgdGhhdCdzIG5vdCBmaW5lIGZv
ciBWTV9QRk5NQVAuIFlvdSBuZWVkIHRvIHVzZQp2bV9pbnNlcnRfcGZuIG9yIHJlbWFwX3Bmbl9y
YW5nZSBvciBvbmUgb2YgdGhlIHJlbGF0ZWQgcGZuIG1hcHBpbmcKZnVuY3Rpb25zIGZvciB0aGF0
IHRvby4gSSB0aGluayB0aGlzIHNob3VsZCBzcGxhdCB3aGVuIHlvdSBydW4gaXQuCgpBbHNvIG5v
dGUgdGhhdCByZW1hcF9wZm5fcmFuZ2UgdXBkYXRlcyB0aGUgdm1hIGZsYWdzIGFscmVhZHkgY29y
cmVjdGx5CmZvciB5b3UsIHNvIHlvdSBwcm9iYWJseSBkb24ndCB3YW50IHRvIGRvIHRoYXQuCgpB
bHNvIGdpdmVuIHRoYXQgYm90aCBkZWFsIHdpdGggc3RydWN0IHBhZ2UgdGhlcmUncyBhIHRvbiBv
ZiBkaXZlcmdlbmNlCmJldHdlZW4gdGhlc2UgdHdvIHRoYXQgZG9lc24ndCBtYWtlIG11Y2ggc2Vu
c2UuIE1heWJlIGNvdWxkIGV2ZW4gc2hhcmUKdGhlIGNvZGUgZnVsbHksIGFzaWRlIGZyb20gaG93
IHlvdSBhbGxvY2F0ZSB0aGUgc3RydWN0IHBhZ2VzLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyAgICB8IDEgKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVh
cHMvc3lzdGVtX2hlYXAuYyB8IDQgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiBpbmRleCAz
NjRmYzJmM2U0OTkuLjM0YmMzOTg3Zjk0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvY21hX2hlYXAuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5j
Cj4gQEAgLTE4NSw2ICsxODUsNyBAQCBzdGF0aWMgaW50IGNtYV9oZWFwX21tYXAoc3RydWN0IGRt
YV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4KPiAgICAgICAgIHZt
YS0+dm1fb3BzID0gJmRtYV9oZWFwX3ZtX29wczsKPiAgICAgICAgIHZtYS0+dm1fcHJpdmF0ZV9k
YXRhID0gYnVmZmVyOwo+ICsgICAgICAgdm1hLT52bV9mbGFncyB8PSBWTV9QRk5NQVA7Cj4KPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKPiBp
bmRleCAzNTQ4YjIwY2I5OGMuLjg5OTVlM2NiZmNhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Rt
YS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9z
eXN0ZW1faGVhcC5jCj4gQEAgLTIyOCw4ICsyMjgsMTAgQEAgc3RhdGljIGludCBzeXN0ZW1faGVh
cF9tbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICAgICAgICAg
IGFkZHIgKz0gUEFHRV9TSVpFOwo+ICAgICAgICAgICAgICAgICBpZiAoYWRkciA+PSB2bWEtPnZt
X2VuZCkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICB2bWEtPnZtX2ZsYWdz
IHw9IFZNX1BGTk1BUDsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuMjUuMQo+
CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
