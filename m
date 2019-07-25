Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F837595C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 23:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA816E833;
	Thu, 25 Jul 2019 21:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B166E833
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 21:12:07 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E516422C7B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 21:12:06 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d17so50439091qtj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:12:06 -0700 (PDT)
X-Gm-Message-State: APjAAAWrYIv7oU/vwxxtLv6zYUVzv/jN7VudaXB4x3sVZ9tF81iL3PN9
 WDvRFRvm5eaY3RaApXOSNyJwuNumJsNjEsEp9w==
X-Google-Smtp-Source: APXvYqz1MtclUL7H15hXFO+ZqCBy2cKyGEW/3o2LNZJa8esZr6z2iir5SzMeVayHUbLbAl7d+WYCxofxQTV/5rIYsuM=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr64864507qth.136.1564089126098; 
 Thu, 25 Jul 2019 14:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
In-Reply-To: <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Jul 2019 15:11:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
Message-ID: <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564089127;
 bh=Lela0jUgtzLODxwg6VrlCSvCAKK1HwYaqSJgKPu+EgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gigbwuhcjeEt8oawxXOCv9JrByJSpA4FyS5ScmzmDvwWz+1rfjH97iRI4RqcLqiso
 CDlyFUUD6rU19tNcGJbj6NOeObaootg7XapY4hy062PbpOKR58+SI96tKrCpD8QHI7
 yiZxThHOYUEVCtUvb0rr/soQh5JutF6eA+LTIpWE=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNzowOCBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIDI1LzA3LzIwMTkgMDI6MTAsIFJv
YiBIZXJyaW5nIHdyb3RlOgo+IFsuLi5dCj4gPiBAQCAtMzI4LDYgKzQyNywxOCBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEp
Cj4gPiAgICAgICAgICAgICAgIGFjY2Vzc190eXBlID0gKGZhdWx0X3N0YXR1cyA+PiA4KSAmIDB4
MzsKPiA+ICAgICAgICAgICAgICAgc291cmNlX2lkID0gKGZhdWx0X3N0YXR1cyA+PiAxNik7Cj4g
Pgo+ID4gKyAgICAgICAgICAgICAvKiBQYWdlIGZhdWx0IG9ubHkgKi8KPiA+ICsgICAgICAgICAg
ICAgaWYgKChzdGF0dXMgJiBtYXNrKSA9PSBCSVQoaSkpIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBXQVJOX09OKGV4Y2VwdGlvbl90eXBlIDwgMHhDMSB8fCBleGNlcHRpb25fdHlwZSA+IDB4
QzQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IHBhbmZyb3N0X21tdV9t
YXBfZmF1bHRfYWRkcihwZmRldiwgaSwgYWRkcik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKCFyZXQpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1tdV93cml0ZShw
ZmRldiwgTU1VX0lOVF9DTEVBUiwgQklUKGkpKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXR1cyAmPSB+bWFzazsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAg
fQo+ID4gKwo+ID4gICAgICAgICAgICAgICAvKiB0ZXJtaW5hbCBmYXVsdCwgcHJpbnQgaW5mbyBh
Ym91dCB0aGUgZmF1bHQgKi8KPiA+ICAgICAgICAgICAgICAgZGV2X2VycihwZmRldi0+ZGV2LAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICJVbmhhbmRsZWQgUGFnZSBmYXVsdCBpbiBBUyVkIGF0
IFZBIDB4JTAxNmxsWFxuIgo+ID4gQEAgLTM2OCw4ICs0NzksOSBAQCBpbnQgcGFuZnJvc3RfbW11
X2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gPiAgICAgICBpZiAoaXJxIDw9
IDApCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4KPiA+IC0gICAgIGVyciA9
IGRldm1fcmVxdWVzdF9pcnEocGZkZXYtPmRldiwgaXJxLCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRs
ZXIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfU0hBUkVELCAibW11Iiwg
cGZkZXYpOwo+ID4gKyAgICAgZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShwZmRldi0+
ZGV2LCBpcnEsIE5VTEwsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhbmZyb3N0X21tdV9pcnFfaGFuZGxlciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgSVJRRl9PTkVTSE9ULCAibW11IiwgcGZkZXYpOwo+Cj4gVGhlIGNoYW5nZSBv
ZiBmbGFncyBoZXJlIGJyZWFrcyBwbGF0Zm9ybXMgdXNpbmcgYSBzaW5nbGUgc2hhcmVkCj4gaW50
ZXJydXB0IGxpbmUuCgpEbyB0aGV5IGV4aXN0PyBJIHRoaW5rIHRoaXMgd2FzIGxhcmdlbHkgY29w
eS1uLXBhc3RlIGxlZnRvdmVyIGZyb20gdGhlCmxpbWEgZHJpdmVyIHdoZXJlIHV0Z2FyZCBoYXMg
YSBidW5jaCBvZiBpcnFzIGFuZCBzbyB0aGV5IGdldCBjb21iaW5lZC4KV2hpbGUgaXQncyBwb3Nz
aWJsZSBjZXJ0YWlubHksIEknZCBsaWtlIHRvIGF2b2lkIGhhdmluZyB0byBkbyBmdXJ0aGVyCnJl
d29yayBlaXRoZXIgdG8gdXNlIGEgd29ya3F1ZXVlIG9yIHdlIG5lZWQgYSBzaW5nbGUgZHJpdmVy
IGhhbmRsZXIKd2hpY2ggdGhlbiBkaXNwYXRjaGVzIHRoZSBzdWIgaGFuZGxlcnMuIFRoZSBwcm9i
bGVtIGlzIHRocmVhZGVkIGlycQpoYW5kbGVycyBkb24ndCB3b3JrIHdpdGggc2hhcmVkIGlycXMu
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
