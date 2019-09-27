Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF56BFC2B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 02:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83C16EE29;
	Fri, 27 Sep 2019 00:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682756EE29;
 Fri, 27 Sep 2019 00:10:04 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q10so11465999iop.2;
 Thu, 26 Sep 2019 17:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6L/CSvXhR6SWzJcWgfYUnRJ5Wz0qsnbFHHXhYWcNv8=;
 b=nXRlpHo/rtgeieHefhz/pk1vvhg2CjobJGvD91v0TgoyOJgI7OXhY0LF4C8yDhUvLY
 1hFaPBi7ZP1yQU1+kxvb3mD35F1MGbCKiu/psUnUgQ7sFv/DTrNvjkj0v4q4TXtx8ZEq
 pyVSHqRwi7zCoTHUXOzyukjI03pLNPDlrDPRRipO+U6LqHE4Pw/6LSB0fL5RhBaQG5vz
 Ni+aMRMgbbqhwz0BfqT9p+wyzSuU3itPu5geiDjTeINH4V5sFAtJmygz9vOi+1ESqvYB
 9QBmlxbtdk5ePI6gqO7EwD2G15iPoiixAewo9UpBX2WBeoDWO/ngqyHFweyVcNtepHq1
 pcDA==
X-Gm-Message-State: APjAAAVHC8ckorC8qQahvMmUlQdMYyWcsiI1QJZ2OE7mrp7Js0pJK+NB
 IZug7yWdxBlTz5R+Fd7mejL69aqdKalyAzw2EmemD5+m
X-Google-Smtp-Source: APXvYqz2F4x8u5pBuSgi6uFhC4bYh0QSlnNo4VeYVA7p4zCzJRvhMHar7eLiHSBsK4vSWItXBqzYtuGwqHHpRY8PW9o=
X-Received: by 2002:a5e:c749:: with SMTP id g9mr4094701iop.7.1569543003722;
 Thu, 26 Sep 2019 17:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190926141046.30758-1-yuq825@gmail.com>
 <20190926141046.30758-3-yuq825@gmail.com>
 <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
In-Reply-To: <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 27 Sep 2019 08:09:52 +0800
Message-ID: <CAKGbVbs7ZN=gTkRhY0YqMfUd1=_Rux3WjsDcxbKA9SUaH5F-iw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/gem: refine drm_gem_objects_lookup
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Q6L/CSvXhR6SWzJcWgfYUnRJ5Wz0qsnbFHHXhYWcNv8=;
 b=RxwfiGx9n6z6Ad0P+KkaoWEDUV27eLWKPnihXL6cabeJRApQ3PRDaZ46Tp9hQaeUaP
 4/uUFa4BeKlyoARGnWxigjoRUlgbNlkTgr/4d0gEztz0L05QYbm/V3skQwflaZV444zQ
 l4I8k6Nh7vtRn66ltxhC46XBYdZ/y1hKTou0E2kGkUGCsnsy/1B+AYe3xv/s/hunosfE
 txg1uXRdnltyWQadOhz6XQfFfsAu5SNQZlxslf65rzVKLZB+gWsE76TeTN00Uli1J6bX
 XM3wRPKgxzxoa5lf0WbvYSiHDwPwatOpY1i19JN+owjkhIfbtwUCJgR4wKi68B96P5Zu
 YA3A==
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDEgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCA5OjEyIEFNIFFpYW5nIFl1
IDx5dXE4MjVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBEbyBub3QgdXNlIHVzZXIgc3BhY2Ug
Ym8gaGFuZGxlcyBkaXJlY3RseSBhbmQgbGVmdCB0aGUgdXNlcgo+ID4gdG8ga2VybmVsIGNvcHkg
d29yayB0byBkcml2ZXJzIGNhbGxpbmcgdGhpcyBmdW5jdGlvbi4KPiA+Cj4gPiBUaGlzIGlzIGZv
ciBkcml2ZXIgbGlrZSBsaW1hIHdoaWNoIGRvZXMgbm90IHBhc3MgZ2VtIGJvCj4gPiBoYW5kbGVz
IGNvbnRpbm91c2x5IGluIGFuIGFycmF5IGluIGlvY3RsIGFyZ3VtZW50Lgo+ID4KPiA+IENjOiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUu
dml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gPiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KPiA+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29s
bGFib3JhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgIHwg
MjggKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyB8IDIzICsrKysrKysrKysrKysrKysrLS0tCj4KPiBQbGVhc2Uga2Vl
cCB0aGUgY3VycmVudCB2YXJpYW50LiBXaGlsZSBvbmx5IHBhbmZyb3N0IGlzIGNvbnZlcnRlZCBB
VE0sCj4gdmM0IGFuZCB2M2Qgd2lsbCB1c2UgdGhpcyB0b28uCj4KPiA+ICBpbmNsdWRlL2RybS9k
cm1fZ2VtLmggICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gPiBp
bmRleCA2ODU0ZjU4NjdkNTEuLjlmNzNlNWYzYjUzZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiA+
IEBAIC02NzksMTEgKzY3OSwxMSBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0cnVjdCBk
cm1fZmlsZSAqZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwKPiA+ICAvKioKPiA+ICAgKiBk
cm1fZ2VtX29iamVjdHNfbG9va3VwIC0gbG9vayB1cCBHRU0gb2JqZWN0cyBmcm9tIGFuIGFycmF5
IG9mIGhhbmRsZXMKPiA+ICAgKiBAZmlscDogRFJNIGZpbGUgcHJpdmF0ZSBkYXRlCj4gPiAtICog
QGJvX2hhbmRsZXM6IHVzZXIgcG9pbnRlciB0byBhcnJheSBvZiB1c2Vyc3BhY2UgaGFuZGxlCj4g
PiArICogQGJvX2hhbmRsZXM6IGFycmF5IG9mIEdFTSBvYmplY3QgaGFuZGxlcwo+ID4gICAqIEBj
b3VudDogc2l6ZSBvZiBoYW5kbGUgYXJyYXkKPiA+ICAgKiBAb2Jqc19vdXQ6IHJldHVybmVkIHBv
aW50ZXIgdG8gYXJyYXkgb2YgZHJtX2dlbV9vYmplY3QgcG9pbnRlcnMKPiA+ICAgKgo+ID4gLSAq
IFRha2VzIGFuIGFycmF5IG9mIHVzZXJzcGFjZSBoYW5kbGVzIGFuZCByZXR1cm5zIGEgbmV3bHkg
YWxsb2NhdGVkIGFycmF5IG9mCj4gPiArICogVGFrZXMgYW4gYXJyYXkgb2YgR0VNIG9iamVjdCBo
YW5kbGVzIGFuZCByZXR1cm5zIGEgbmV3bHkgYWxsb2NhdGVkIGFycmF5IG9mCj4gPiAgICogR0VN
IG9iamVjdHMuCj4gPiAgICoKPiA+ICAgKiBGb3IgYSBzaW5nbGUgaGFuZGxlIGxvb2t1cCwgdXNl
IGRybV9nZW1fb2JqZWN0X2xvb2t1cCgpLgo+ID4gQEAgLTY5NSwxMSArNjk1LDEwIEBAIHN0YXRp
YyBpbnQgb2JqZWN0c19sb29rdXAoc3RydWN0IGRybV9maWxlICpmaWxwLCB1MzIgKmhhbmRsZSwg
aW50IGNvdW50LAo+ID4gICAqIGZhaWx1cmUuIDAgaXMgcmV0dXJuZWQgb24gc3VjY2Vzcy4KPiA+
ICAgKgo+ID4gICAqLwo+ID4gLWludCBkcm1fZ2VtX29iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1f
ZmlsZSAqZmlscCwgdm9pZCBfX3VzZXIgKmJvX2hhbmRsZXMsCj4gPiAraW50IGRybV9nZW1fb2Jq
ZWN0c19sb29rdXAoc3RydWN0IGRybV9maWxlICpmaWxwLCB1MzIgKmJvX2hhbmRsZXMsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY291bnQsIHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqKipvYmpzX291dCkKPgo+IEVpdGhlciBzcGxpdCBpbnRvIGRybV9nZW1fb2JqZWN0c19sb29r
dXAoKSBhbmQgYQo+IGRybV9nZW1fb2JqZWN0c19sb29rdXBfdXNlcigpIHdpdGggdGhlIGxhdHRl
ciBjYWxsaW5nIHRoZSBmb3JtZXIgb3IKPiBqdXN0IG1ha2UgdGhlIGhlbHBlciB0YWtlIGJvdGgg
YSB1c2VyIGFuZCB1MzIqIHB0ciB3aXRoIHRoZQo+IGV4cGVjdGF0aW9uIHRoYXQgb25seSBvbmUg
b2YgdGhlbSBpcyBub24tTlVMTC4KPgpPSywgSSBwcmVmZXIgdGhlIGZpcnN0IHdheSwgd2lsbCBz
ZW5kIHYyIGZvciBpdC4KClRoYW5rcywKUWlhbmcKCj4gUm9iCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
