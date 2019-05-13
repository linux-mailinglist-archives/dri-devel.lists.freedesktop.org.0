Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040871B877
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDB289E26;
	Mon, 13 May 2019 14:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B95589E26
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:39:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b8so17898208edm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=ryZaZY36BnT6HZ57j2I8+zLgD4GPxPPgFaTeITzHIls=;
 b=cLVhoiYZPugqTkKsy6sEWmtoVV0ITV7rkM7tBBlDANgLNHKOK+pwYLLJznFbbGmlqr
 P5XmLhFLsDlvVpbMSryGm2kmx6zzr8H8Hvu9cHk6VI43JnBBF6/8GUYfQu5x5oj8aEow
 K8/bZFe/ejmTewUVX988EFQ52tAGLlyqPDdCO+eF5MIy9Ktjny2TSiII0W8wZ96BOqVr
 IgCbf1PJfCQBzAXwunanNOxoNkvEAFCmErFng1aC6toDY6f5srkeW+i1m7Ta1AtnvYcL
 bW3DXlRPJKZRfFQsysC3YSqe7iRqBkKBrL/UtbcpYPWtezxm4SB3MunLpYu7sm7UqoBm
 ijDw==
X-Gm-Message-State: APjAAAVqDNVWXGri1+z2yTvZbHWnG94cgqlJLLKZ+diTw/nit0PKzY2/
 R8Mf72qACjqfqQJ3ND5RiO0XOdvrs4E=
X-Google-Smtp-Source: APXvYqynBjsYVMKBelwmFg3AUdbFo/m1V+E7GiuAZWbZBkyClPMwGgY3y8iX8aW8uTI5W/6a7W+mKw==
X-Received: by 2002:aa7:c44e:: with SMTP id n14mr29429954edr.203.1557758366108; 
 Mon, 13 May 2019 07:39:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h8sm297691ejf.73.2019.05.13.07.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:39:25 -0700 (PDT)
Date: Mon, 13 May 2019 16:39:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Use drm_gem_dump_map_offset()
Message-ID: <20190513143921.GP17751@phenom.ffwll.local>
Mail-Followup-To: Steven Price <steven.price@arm.com>,
 Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20190513143244.16478-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513143244.16478-1-steven.price@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ryZaZY36BnT6HZ57j2I8+zLgD4GPxPPgFaTeITzHIls=;
 b=ArT0hy+5fBWwK4ahOW21BLqnpZkbJDOETktpPAUm+jqGy80Szxv7N+eI1QHQPWbsZi
 4yP6W7VIfG/chPd4gzRCxUvO6uFj3W66783FeGfyxGuF9IVnhKw9chexY4oD6GMGHCg+
 UuAHK1omaV8hjS0KOo6MEuP0umM1qY25gg12w=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDM6MzI6NDRQTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IHBhbmZyb3N0X2lvY3RsX21tYXBfYm8oKSBjb250YWlucyBhIHJlaW1wbGVtZW50YXRp
b24gb2YKPiBkcm1fZ2VtX2R1bXBfbWFwX29mZnNldCgpIGJ1dCB3aXRoIGEgYnVnIC0gaXQgYWxs
b3dzIG1hcHBpbmcgaW1wb3J0ZWQKPiBvYmplY3RzICh3aXRob3V0IGdvaW5nIHRocm91Z2ggdGhl
IGV4cG9ydGVyKS4gRml4IHRoaXMgYnkgc3dpdGNoaW5nIHRvCj4gdXNlIHRoZSBnZW5lcmljIGRy
bV9nZW1fZHVtcF9tYXBfb2Zmc2V0KCkgZnVuY3Rpb24gaW5zdGVhZCB3aGljaCBoYXMgdGhlCj4g
Ym9udXMgb2Ygc2ltcGxpZnlpbmcgdGhlIGNvZGUuCgpnZW1fZHVtYiBzdHVmZiBpcyBmb3Iga21z
IGRyaXZlcnMsIHBhbmZyb3N0IGlzIGEgcmVuZGVyIGRyaXZlci4gV2UncmUKZ2VuZXJhbGx5IHRy
eWluZyB0byBzZXBhcmF0ZSB0aGVzZSB0d28gd29ybGRzIHNvbWV3aGF0IGNsZWFubHkuCgpJIHRo
aW5rIGl0J2QgYmUgZ29vZCB0byBoYXZlIGEgbm9uLWR1bWIgdmVyc2lvbiBvZiB0aGlzIGluIHRo
ZSBjb3JlLCBhbmQKdXNlIHRoYXQuIE9yIHVwZ3JhZGUgdGhlIGR1bWIgdmVyc2lvbiB0byBiZSB0
aGF0IGhlbHBlciBmb3IgZXZlcnlvbmUgKGFuZApkcm9wIHRoZSBfZHVtYikuCi1EYW5pZWwKCj4g
Q0M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2FAcm9zZW56d2VpZy5pbz4KPiBTaWduZWQtb2Zm
LWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAxNiArKy0tLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBpbmRleCA5NGIwODE5YWQ1MGIu
LmQwNDgyNTBhZDhhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMKPiBAQCAtMjU0LDI2ICsyNTQsMTQgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9tbWFw
X2JvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAkJICAgICAgc3RydWN0
IGRybV9maWxlICpmaWxlX3ByaXYpCj4gIHsKPiAgCXN0cnVjdCBkcm1fcGFuZnJvc3RfbW1hcF9i
byAqYXJncyA9IGRhdGE7Cj4gLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7Cj4gLQlp
bnQgcmV0Owo+ICAKPiAgCWlmIChhcmdzLT5mbGFncyAhPSAwKSB7Cj4gIAkJRFJNX0lORk8oInVu
a25vd24gbW1hcF9ibyBmbGFnczogJWRcbiIsIGFyZ3MtPmZsYWdzKTsKPiAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiAgCX0KPiAgCj4gLQlnZW1fb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGVf
cHJpdiwgYXJncy0+aGFuZGxlKTsKPiAtCWlmICghZ2VtX29iaikgewo+IC0JCURSTV9ERUJVRygi
RmFpbGVkIHRvIGxvb2sgdXAgR0VNIEJPICVkXG4iLCBhcmdzLT5oYW5kbGUpOwo+IC0JCXJldHVy
biAtRU5PRU5UOwo+IC0JfQo+IC0KPiAtCXJldCA9IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0
KGdlbV9vYmopOwo+IC0JaWYgKHJldCA9PSAwKQo+IC0JCWFyZ3MtPm9mZnNldCA9IGRybV92bWFf
bm9kZV9vZmZzZXRfYWRkcigmZ2VtX29iai0+dm1hX25vZGUpOwo+IC0JZHJtX2dlbV9vYmplY3Rf
cHV0X3VubG9ja2VkKGdlbV9vYmopOwo+IC0KPiAtCXJldHVybiByZXQ7Cj4gKwlyZXR1cm4gZHJt
X2dlbV9kdW1iX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKPiArCQkJ
CSAgICAgICAmYXJncy0+b2Zmc2V0KTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBwYW5mcm9zdF9p
b2N0bF9nZXRfYm9fb2Zmc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4g
LS0gCj4gMi4yMC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
