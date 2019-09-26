Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE9BF56B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 17:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE7389D39;
	Thu, 26 Sep 2019 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE33989D39;
 Thu, 26 Sep 2019 15:01:42 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4D2C222C8;
 Thu, 26 Sep 2019 15:01:42 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c3so3201346qtv.10;
 Thu, 26 Sep 2019 08:01:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVmJPK5ooRGkRHpAGY0Wwwwj8aMoewk1r8V+O+88RyUch9D1Ipy
 Odz/OX0FHtG4rv9CucdeSaOoGkwjB2ydjabLWA==
X-Google-Smtp-Source: APXvYqx3iaLRLWCtX1wHL9WtEY/Gwe4kj+W6ZA5uFkXKzzxM5Pfm7NtEGPTQPl2gPlks1UH6Sz5xfEW1/ft82mKd7aQ=
X-Received: by 2002:ac8:6915:: with SMTP id e21mr4329728qtr.224.1569510101836; 
 Thu, 26 Sep 2019 08:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190926141046.30758-1-yuq825@gmail.com>
 <20190926141046.30758-3-yuq825@gmail.com>
In-Reply-To: <20190926141046.30758-3-yuq825@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Sep 2019 10:01:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
Message-ID: <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/gem: refine drm_gem_objects_lookup
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569510102;
 bh=0j1feZZjQJZmIAMB6pFCQcA5I58ipw0CHOXWCkmvmEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WvBLWC7E30WQQYieS3P090i82vhmLClz0Yz+/OYyJxFRTYRjXXyZMFmZFBgfctfrU
 oZqFRtIjne2blaWWFy4BQP+ZYQE+Amf3eXXWsHERBdnLrqR+vwP3gpLDxFbI3pKiMA
 bySgK2O7MIzlH5pRNhelJe0NscUL6VWytuY/M458=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgOToxMiBBTSBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBEbyBub3QgdXNlIHVzZXIgc3BhY2UgYm8gaGFuZGxlcyBkaXJlY3RseSBh
bmQgbGVmdCB0aGUgdXNlcgo+IHRvIGtlcm5lbCBjb3B5IHdvcmsgdG8gZHJpdmVycyBjYWxsaW5n
IHRoaXMgZnVuY3Rpb24uCj4KPiBUaGlzIGlzIGZvciBkcml2ZXIgbGlrZSBsaW1hIHdoaWNoIGRv
ZXMgbm90IHBhc3MgZ2VtIGJvCj4gaGFuZGxlcyBjb250aW5vdXNseSBpbiBhbiBhcnJheSBpbiBp
b2N0bCBhcmd1bWVudC4KPgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENj
OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBTdGV2ZW4g
UHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5
c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8
eXVxODI1QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAg
ICAgICAgICAgIHwgMjggKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAyMyArKysrKysrKysrKysrKysrKy0tLQoKUGxl
YXNlIGtlZXAgdGhlIGN1cnJlbnQgdmFyaWFudC4gV2hpbGUgb25seSBwYW5mcm9zdCBpcyBjb252
ZXJ0ZWQgQVRNLAp2YzQgYW5kIHYzZCB3aWxsIHVzZSB0aGlzIHRvby4KCj4gIGluY2x1ZGUvZHJt
L2RybV9nZW0uaCAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBpbmRleCA2
ODU0ZjU4NjdkNTEuLjlmNzNlNWYzYjUzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+IEBAIC02NzksMTEg
KzY3OSwxMSBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAqZmls
cCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwKPiAgLyoqCj4gICAqIGRybV9nZW1fb2JqZWN0c19s
b29rdXAgLSBsb29rIHVwIEdFTSBvYmplY3RzIGZyb20gYW4gYXJyYXkgb2YgaGFuZGxlcwo+ICAg
KiBAZmlscDogRFJNIGZpbGUgcHJpdmF0ZSBkYXRlCj4gLSAqIEBib19oYW5kbGVzOiB1c2VyIHBv
aW50ZXIgdG8gYXJyYXkgb2YgdXNlcnNwYWNlIGhhbmRsZQo+ICsgKiBAYm9faGFuZGxlczogYXJy
YXkgb2YgR0VNIG9iamVjdCBoYW5kbGVzCj4gICAqIEBjb3VudDogc2l6ZSBvZiBoYW5kbGUgYXJy
YXkKPiAgICogQG9ianNfb3V0OiByZXR1cm5lZCBwb2ludGVyIHRvIGFycmF5IG9mIGRybV9nZW1f
b2JqZWN0IHBvaW50ZXJzCj4gICAqCj4gLSAqIFRha2VzIGFuIGFycmF5IG9mIHVzZXJzcGFjZSBo
YW5kbGVzIGFuZCByZXR1cm5zIGEgbmV3bHkgYWxsb2NhdGVkIGFycmF5IG9mCj4gKyAqIFRha2Vz
IGFuIGFycmF5IG9mIEdFTSBvYmplY3QgaGFuZGxlcyBhbmQgcmV0dXJucyBhIG5ld2x5IGFsbG9j
YXRlZCBhcnJheSBvZgo+ICAgKiBHRU0gb2JqZWN0cy4KPiAgICoKPiAgICogRm9yIGEgc2luZ2xl
IGhhbmRsZSBsb29rdXAsIHVzZSBkcm1fZ2VtX29iamVjdF9sb29rdXAoKS4KPiBAQCAtNjk1LDEx
ICs2OTUsMTAgQEAgc3RhdGljIGludCBvYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bHAsIHUzMiAqaGFuZGxlLCBpbnQgY291bnQsCj4gICAqIGZhaWx1cmUuIDAgaXMgcmV0dXJuZWQg
b24gc3VjY2Vzcy4KPiAgICoKPiAgICovCj4gLWludCBkcm1fZ2VtX29iamVjdHNfbG9va3VwKHN0
cnVjdCBkcm1fZmlsZSAqZmlscCwgdm9pZCBfX3VzZXIgKmJvX2hhbmRsZXMsCj4gK2ludCBkcm1f
Z2VtX29iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAqZmlscCwgdTMyICpib19oYW5kbGVz
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjb3VudCwgc3RydWN0IGRybV9nZW1f
b2JqZWN0ICoqKm9ianNfb3V0KQoKRWl0aGVyIHNwbGl0IGludG8gZHJtX2dlbV9vYmplY3RzX2xv
b2t1cCgpIGFuZCBhCmRybV9nZW1fb2JqZWN0c19sb29rdXBfdXNlcigpIHdpdGggdGhlIGxhdHRl
ciBjYWxsaW5nIHRoZSBmb3JtZXIgb3IKanVzdCBtYWtlIHRoZSBoZWxwZXIgdGFrZSBib3RoIGEg
dXNlciBhbmQgdTMyKiBwdHIgd2l0aCB0aGUKZXhwZWN0YXRpb24gdGhhdCBvbmx5IG9uZSBvZiB0
aGVtIGlzIG5vbi1OVUxMLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
