Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DA7B3F3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 22:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EDE89E26;
	Tue, 30 Jul 2019 20:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E152A89E26
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 20:03:25 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9642B2171F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 20:03:25 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id a27so47524191qkk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:03:25 -0700 (PDT)
X-Gm-Message-State: APjAAAU7pPT0fOk2pjUVWCzmAieBDcIbPaNLmNQr+8LLHVeel3SXv1vr
 HBbUDm/gRSpqptzRlSYuM2NigCgk452jp3TvFg==
X-Google-Smtp-Source: APXvYqzj5rF+kj/DrrZdzJeBDiB7KxQRnWqPE/NFS2I/DhRDO6bLui0rYvvE/zupK86+jEQKUwhQyDNnUyrNwJXSlAw=
X-Received: by 2002:a37:6944:: with SMTP id e65mr71771842qkc.119.1564517004725; 
 Tue, 30 Jul 2019 13:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
In-Reply-To: <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jul 2019 14:03:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DuZUZf27ybY=XstV_9AT1Fi=Hm+h2P_ajMyyHiBiELg@mail.gmail.com>
Message-ID: <CAL_Jsq+DuZUZf27ybY=XstV_9AT1Fi=Hm+h2P_ajMyyHiBiELg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564517005;
 bh=5qMVwk4ZEgaBZ3unrI9jr9w0vtP8kT+/OyYZv1NXxvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=asQdu/cK0b7V038gItxZ9zqFY/k3FnIKmU2qIImMjZzBVjq1QKaI3a/PG8ca15O4r
 OOsVxrFrbCLlN9E1lskDgAysPa/eSiI4XU9J4OFLNyBir+9pyeV2QBfOkeSAw9a2AJ
 xsmEsZ0Ct6nSzDb3y6PkMXdegJBWbLJwGQZaLNdo=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgOTozNSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDI1LzA3LzIwMTkgMTU6NTksIFN0ZXZlbiBQcmljZSB3
cm90ZToKPiBbLi4uXQo+ID4gSXQgd291bGQgYXBwZWFyIHRoYXQgaW4gdGhlIGZvbGxvd2luZyBj
YWxsIHNndD09TlVMTDoKPiA+PiAgICAgIHJldCA9IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMo
c2d0LCBwYWdlcyArIHBhZ2Vfb2Zmc2V0LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVU1fRkFVTFRfUEFHRVMsIDAsIFNaXzJNLCBHRlBfS0VSTkVMKTsKPiA+Cj4g
PiBXaGljaCBtZWFucyB3ZSd2ZSBlbmRlZCB1cCB3aXRoIGEgQk8gd2l0aCBiby0+c2d0PT1OVUxM
LCBiby0+cGFnZXMgc2V0Cj4gPiBhbmQgYm8tPmlzX2hlYXA9dHJ1ZS4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGlzIHNob3VsZCBiZSBpbXBvc3NpYmxlLgo+ID4KPiA+IEkgaGF2ZW4ndCB5ZXQgZmln
dXJlZCBvdXQgaG93IHRoaXMgaGFwcGVucyAtIGl0IHNlZW1zIHRvIGJlIGp1c3QgYmVmb3JlCj4g
PiB0ZXJtaW5hdGlvbiwgc28gaXQgbWlnaHQgYmUgYSByYWNlIHdpdGggY2xlYW51cD8KPgo+IFRo
YXQgd2FzIGEgcmVkIGhlcnJpbmcgLSBpdCdzIHBhcnRseSBteSB0ZXN0IGNhc2UgZG9pbmcgc29t
ZXRoaW5nIGEgYml0Cj4gd2VpcmQuIFRoaXMgY3Jhc2ggaXMgY2F1c2VkIGJ5IGRvaW5nIGFuIG1t
YXAgb2YgYSBIRUFQIG9iamVjdCBiZWZvcmUgYW55Cj4gZmF1bHQgaGFzIG9jY3VycmVkLgo+Cj4g
ZHJtX2dlbV9zaG1lbV9tbWFwKCkgY2FsbHMgZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXMoKSB3aGlj
aCB3aWxsIHBvcHVsYXRlCj4gYm8tPmJhc2UucGFnZXMgKGV2ZW4gaWYgYm8tPmlzX2hlYXApLgo+
Cj4gRWl0aGVyIHdlIHNob3VsZCBwcmV2ZW50IG1hcHBpbmcgb2YgSEVBUCBvYmplY3RzLCBvciBh
bHRlcm5hdGl2ZWx5Cj4gYm8tPmJhc2UucGFnZXMgY291bGQgYmUgYWxsb2NhdGVkIHVwZnJvbnQg
aW5zdGVhZCBvZiBkdXJpbmcgdGhlIGZpcnN0Cj4gZmF1bHQuIE15IHByZWZlcmVuY2Ugd291bGQg
YmUgYWxsb2NhdGluZyBpdCB1cGZyb250IGJlY2F1c2Ugb3B0aW1pc2luZwo+IGZvciB0aGUgY2Fz
ZSBvZiBhIEhFQVAgQk8gd2hpY2ggaXNuJ3QgdXNlZCBzZWVtcyBhIGJpdCB3ZWlyZC4gQWx0aG91
Z2gKPiB0aGVyZSdzIHN0aWxsIHRoZSBxdWVzdGlvbiBvZiBleGFjdGx5IHdoYXQgdGhlIGJlaGF2
aW91ciBzaG91bGQgYmUgb2YKPiBhY2Nlc3NpbmcgdGhyb3VnaCB0aGUgQ1BVIHBhZ2VzIHdoaWNo
IGhhdmVuJ3QgYmVlbiBhbGxvY2F0ZWQgeWV0LgoKQXMgcHJldmVudGluZyBnZXR0aW5nIHRoZSBt
bWFwIGZha2Ugb2Zmc2V0IHNob3VsZCBiZSBzdWZmaWNpZW50LCBJJ20KcGxhbm5pbmcgb24gZG9p
bmcgdGhpcyBjaGFuZ2U6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jCmIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmlu
ZGV4IDc0NmViNDYwM2JjMi4uMTg2ZDVkYjg5MmE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2Rydi5jCkBAIC0yNzAsNiArMjcwLDEwIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3Rf
aW9jdGxfbW1hcF9ibyhzdHJ1Y3QKZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAgICAgICAgfQoKKyAgICAgICAvKiBEb24ndCBhbGxv
dyBtbWFwcGluZyBvZiBoZWFwIG9iamVjdHMgYXMgcGFnZXMgYXJlIG5vdCBwaW5uZWQuICovCisg
ICAgICAgaWYgKHRvX3BhbmZyb3N0X2JvKGdlbV9vYmopLT5pc19oZWFwKSkKKyAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOworCiAgICAgICAgcmV0ID0gZHJtX2dlbV9jcmVhdGVfbW1hcF9v
ZmZzZXQoZ2VtX29iaik7CiAgICAgICAgaWYgKHJldCA9PSAwKQogICAgICAgICAgICAgICAgYXJn
cy0+b2Zmc2V0ID0gZHJtX3ZtYV9ub2RlX29mZnNldF9hZGRyKCZnZW1fb2JqLT52bWFfbm9kZSk7
CgoKPiBBbHNvIHNobWVtLT5wYWdlc191c2VfY291bnQgbmVlZHMgaW5jcmVtZW50aW5nIHRvIHN0
b3AKPiBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcygpIHJlcGxhY2luZyBiby0+YmFzZS5wYWdlcy4g
SSBoYXZlbid0IHRlc3RlZAo+IHdoYXQgaGFwcGVucyBpZiB5b3UgbW1hcCAqYWZ0ZXIqIHRoZSBm
aXJzdCBmYXVsdC4KCkkgc2V0IHBhZ2VzX3VzZV9jb3VudCB0byAxIHdoZW4gd2UgYWxsb2NhdGUg
cGFnZXMgb24gdGhlIGZpcnN0IGZhdWx0LgpPciBkbyB5b3UgbWVhbiB3ZSBuZWVkIHRvIHNldCBp
dCBvbiBjcmVhdGlvbiBpbiBjYXNlCmRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKCkgaXMgY2FsbGVk
IGJlZm9yZSBhbnkgR1BVIGZhdWx0cz8KCkVpdGhlciB3YXksIHRoYXQganVzdCBzaGlmdHMgaG93
L3doZXJlIHdlIGNyYXNoIEkgdGhpbmsuIFdlIG5lZWQgdG8KcHJldmVudCBkcm1fZ2VtX3NobWVt
X2dldF9wYWdlcygpIGZyb20gYmVpbmcgY2FsbGVkLiBCZXNpZGVzIG1tYXAsIHRoZQpvdGhlciBj
YXNlcyBhcmUgdm1hcCBhbmQgZXhwb3J0aW5nLiBJIGRvbid0IHRoaW5rIHdlIGhhdmUgYW55IHBh
dGhzCnRoYXQgd2lsbCBjYXVzZSB2bWFwIHRvIGdldCBjYWxsZWQgaW4gb3VyIGNhc2UuIEZvciBl
eHBvcnRpbmcsIHBlcmhhcHMKd2UgbmVlZCBhIHdyYXBwZXIgYXJvdW5kIGRybV9nZW1fc2htZW1f
cGluKCkgdG8gcHJldmVudCBpdC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
