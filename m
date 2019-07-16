Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227786A4C3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB296E0EE;
	Tue, 16 Jul 2019 09:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA9A6E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:21:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so18937139edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=7kcxkE7b2qRiLgZ4OILWSKZ4Ie6ZeH2B7E3GySpoAk0=;
 b=GYh8zuiv96D1lJq1/NqPhBlo4uUwkDdLNRlOsAIeDeVDRYccjy8sCIgk0m37bgZ7LB
 TaOdR+NCEgGfoWie3+9I3kdInWOhCF71pmDFQFCeeD0krRMwJbsyZDKACp/NCwa7udu5
 Zyyun9dr/0p8RWgmFIMQgN+tE02E+CatBAxZblzHN3RsDC+yKfX1g8T5H/+8gzsjs0t6
 FHtiLbORPjDexuHWLjUxyuwVd3ZAVx3auEtqiCGdXWKJS1Yqwwa5ROXKwhlXwjHHQwF+
 mCH3EtsZqLLJ5ufWUt3rnHn20T+l5P7bq3m2feESFX3pvsEwDYiS5Tl+vLQuZ9FPcC0j
 fg/A==
X-Gm-Message-State: APjAAAUssMTi7A+Hr/HxFN2lhvCuoKJ7LVSJJtg7YaZX+UmpCAXm1r0j
 Up8tE5EpYvCcauqEIZwY85Q=
X-Google-Smtp-Source: APXvYqyxGM5IiEz0C53dP+I+u3IaYRdq0KhJ6UCNw7IBeK+6txLUdJUFoMeoMmVPIv0xP96+jplW7w==
X-Received: by 2002:a50:8934:: with SMTP id e49mr28198583ede.156.1563268916879; 
 Tue, 16 Jul 2019 02:21:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e29sm5458028eda.51.2019.07.16.02.21.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 02:21:56 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:21:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] dma-buf: Relax the write-seqlock for reallocating
 the shared fence list
Message-ID: <20190716092154.GZ15868@phenom.ffwll.local>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
 <20190712080314.21018-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712080314.21018-2-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=7kcxkE7b2qRiLgZ4OILWSKZ4Ie6ZeH2B7E3GySpoAk0=;
 b=gjsJPejq5+7XtWkI90nISeZr8z1PFw4VKKfIjWJehIu4n9KHwgiEwt8jTdovWcIURo
 h717aTnbShxWCrAmlSnLPyVjPDbCdpTiq0Aak81o3GPxnNXjG/drsfdkXvjRnw/TuQnx
 zOojMTsHl91jrcBSKXS7lZn60aef0eMqJn148=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDk6MDM6MTRBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEFzIHRoZSBzZXQgb2Ygc2hhcmVkIGZlbmNlcyBpcyBub3QgYmVpbmcgY2hhbmdlZCBk
dXJpbmcgcmVhbGxvY2F0aW9uIG9mCj4gdGhlIHJlc2VydmF0aW9uIGxpc3QsIHdlIGNhbiBza2lw
IHVwZGF0aW5nIHRoZSB3cml0ZV9zZXFsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cgpzb3VuZHMgbGVnaXQuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCk1vcmUgc2VyaW91c2x5LCBJIHRoaW5rIEkgY29udmlu
Y2VkIG15c2VsZiB0aGF0IHdlIGNhbnQgc2VlIGEgbWVzcyBvZiBvbGQKYW5kIG5ldyBmZW5jZSBh
cnJheXMgYW55d2hlcmUsIGV2ZW4gd2l0aG91dCB0aGUgc2VxbG9jayByZXRyeSwgc28gSSB0aGlu
awp3ZSBzaG91bGQgYmUgYWxsIGdvb2QuCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1
Zi9yZXNlcnZhdGlvbi5jIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEtYnVmL3Jlc2VydmF0aW9uLmMgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwo+IGlu
ZGV4IDgwZWNjMTI4M2QxNS4uYzcxYjg1YzhjMTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9yZXNlcnZhdGlvbi5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMK
PiBAQCAtMTU3LDE1ICsxNTcsMTUgQEAgaW50IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3No
YXJlZChzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpvYmosCj4gIAkJKGtzaXplKG5ldykgLSBv
ZmZzZXRvZih0eXBlb2YoKm5ldyksIHNoYXJlZCkpIC8KPiAgCQlzaXplb2YoKm5ldy0+c2hhcmVk
KTsKPiAgCj4gLQlwcmVlbXB0X2Rpc2FibGUoKTsKPiAtCXdyaXRlX3NlcWNvdW50X2JlZ2luKCZv
YmotPnNlcSk7Cj4gIAkvKgo+IC0JICogUkNVX0lOSVRfUE9JTlRFUiBjYW4gYmUgdXNlZCBoZXJl
LAo+IC0JICogc2VxY291bnQgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBiYXJyaWVycwo+ICsJICog
V2UgYXJlIG5vdCBjaGFuZ2luZyB0aGUgZWZmZWN0aXZlIHNldCBvZiBmZW5jZXMgaGVyZSBzbyBj
YW4KPiArCSAqIG1lcmVseSB1cGRhdGUgdGhlIHBvaW50ZXIgdG8gdGhlIG5ldyBhcnJheTsgYm90
aCBleGlzdGluZwo+ICsJICogcmVhZGVycyBhbmQgbmV3IHJlYWRlcnMgd2lsbCBzZWUgZXhhY3Rs
eSB0aGUgc2FtZSBzZXQgb2YKPiArCSAqIGFjdGl2ZSAodW5zaWduYWxlZCkgc2hhcmVkIGZlbmNl
cy4gSW5kaXZpZHVhbCBmZW5jZXMgYW5kIHRoZQo+ICsJICogb2xkIGFycmF5IGFyZSBwcm90ZWN0
ZWQgYnkgUkNVIGFuZCBzbyB3aWxsIG5vdCB2YW5pc2ggdW5kZXIKPiArCSAqIHRoZSBnYXplIG9m
IHRoZSByY3VfcmVhZF9sb2NrKCkgcmVhZGVycy4KPiAgCSAqLwo+IC0JUkNVX0lOSVRfUE9JTlRF
UihvYmotPmZlbmNlLCBuZXcpOwo+IC0Jd3JpdGVfc2VxY291bnRfZW5kKCZvYmotPnNlcSk7Cj4g
LQlwcmVlbXB0X2VuYWJsZSgpOwo+ICsJcmN1X2Fzc2lnbl9wb2ludGVyKG9iai0+ZmVuY2UsIG5l
dyk7Cj4gIAo+ICAJaWYgKCFvbGQpCj4gIAkJcmV0dXJuIDA7Cj4gLS0gCj4gMi4yMi4wCj4gCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
