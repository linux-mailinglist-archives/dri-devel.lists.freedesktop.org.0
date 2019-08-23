Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38269B4CC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 18:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B396ECEF;
	Fri, 23 Aug 2019 16:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF5F6ECEF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 16:45:47 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E858233A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 16:45:47 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id u190so8734730qkh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:45:47 -0700 (PDT)
X-Gm-Message-State: APjAAAV9pdvOkuRyGeWLfRC+N2oiqsztbbPpHmjLibHWNXpkTPzzsO9a
 ns3c1Gd5xu/OshZmJZhX6SOGvPAWdbX47m2EOA==
X-Google-Smtp-Source: APXvYqwYMJECPuaBcUhRgru1ta6wD72y+6eAA8Z7AWpkOJJ00pQzKTj+oVp9UFvjgaVMhj3Pmny4Vi4QK7Zc+mNdcL0=
X-Received: by 2002:a37:a010:: with SMTP id j16mr5107732qke.152.1566578746313; 
 Fri, 23 Aug 2019 09:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
 <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
 <04c12d81-fb51-4123-02bc-28bbb97bfcd7@arm.com>
 <CAL_JsqLHDcq0RXrhU0SCL24kV-r_wmiY8=xd42STO0Ha6hq8iA@mail.gmail.com>
 <6dfd4619-9779-80a5-6868-315dec73b4f4@arm.com>
In-Reply-To: <6dfd4619-9779-80a5-6868-315dec73b4f4@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 11:45:33 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+44--CoRAT+nWebFxQwT-awiTkohYjTMaRHg_d78oUYA@mail.gmail.com>
Message-ID: <CAL_Jsq+44--CoRAT+nWebFxQwT-awiTkohYjTMaRHg_d78oUYA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566578747;
 bh=LtIUuudWqC7RJv27UjugVGvudLy5kjrRZc5GYMpZgvg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PaMNoXsbOrlRtLjuBcq6mnyzPb93Q/XHt/le4MK0U5lynQvQE1DgqjOSos/FIUiwb
 YkhA+10a3cDuuVmnHMqFaV7zWjMakrQyRHojy2dV8Lj3NJuPHTkg/0rx6Z2vUnWHEY
 hnmIWkfLs7cpv3avfkWzo/c6C/6K9GAxFZAsywMw=
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTE6MTYgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMy8wOC8yMDE5IDE2OjU3LCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDEwOjQ0IEFNIFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjMvMDgvMjAxOSAxNjow
NSwgU3RldmVuIFByaWNlIHdyb3RlOgo+ID4+PiBPbiAyMy8wOC8yMDE5IDEyOjExLCBSb2JpbiBN
dXJwaHkgd3JvdGU6Cj4gPj4+PiBPbiAyMy8wOC8yMDE5IDAzOjEyLCBSb2IgSGVycmluZyB3cm90
ZToKPiA+Pj4+PiBUaGVyZSBpcyBubyBwb2ludCBpbiByZXN1bWluZyB0aGUgaC93IGp1c3QgdG8g
ZG8gZmx1c2ggb3BlcmF0aW9ucyBhbmQKPiA+Pj4+PiBkb2luZyBzbyB0YWtlcyBzZXZlcmFsIGxv
Y2tzIHdoaWNoIGNhdXNlIGxvY2tkZXAgaXNzdWVzIHdpdGggdGhlCj4gPj4+Pj4gc2hyaW5rZXIu
Cj4gPj4+Pj4gUmV3b3JrIHRoZSBmbHVzaCBvcGVyYXRpb25zIHRvIG9ubHkgaGFwcGVuIHdoZW4g
dGhlIGgvdyBpcyBhbHJlYWR5Cj4gPj4+Pj4gYXdha2UuCj4gPj4+Pj4gVGhpcyBhdm9pZHMgdGFr
aW5nIGFueSBsb2NrcyBhc3NvY2lhdGVkIHdpdGggcmVzdW1pbmcuCj4gPj4+Pj4KPiA+Pj4+PiBD
YzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiA+Pj4+PiBDYzog
U3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiA+Pj4+PiBDYzogQWx5c3NhIFJv
c2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gPj4+Pj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+Pj4+PiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPj4+Pj4gLS0tCj4gPj4+Pj4gdjI6IG5ldyBwYXRjaAo+ID4+Pj4+Cj4g
Pj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgNDEgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLQo+ID4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiA+Pj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ID4+Pj4+IGluZGV4IDg0MmJkZDdjZjZi
ZS4uY2NmNjcxYTljM2ZiIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9tbXUuYwo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9tbXUuYwo+ID4+Pj4+IEBAIC0yMjAsNiArMjIwLDIzIEBAIHN0YXRpYyBzaXpl
X3QgZ2V0X3Bnc2l6ZSh1NjQgYWRkciwgc2l6ZV90IHNpemUpCj4gPj4+Pj4gICAgICAgIHJldHVy
biBTWl8yTTsKPiA+Pj4+PiAgICB9Cj4gPj4+Pj4gK3ZvaWQgcGFuZnJvc3RfbW11X2ZsdXNoX3Jh
bmdlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LAo+ID4+Pj4+ICsgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUsCj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAg
IHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSkKPiA+Pj4+PiArewo+ID4+Pj4+ICsgICAgaWYgKG1tdS0+
YXMgPCAwKQo+ID4+Pj4+ICsgICAgICAgIHJldHVybjsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAv
KiBGbHVzaCB0aGUgUFRzIG9ubHkgaWYgd2UncmUgYWxyZWFkeSBhd2FrZSAqLwo+ID4+Pj4+ICsg
ICAgaWYgKCFwbV9ydW50aW1lX2dldF9pZl9pbl91c2UocGZkZXYtPmRldikpCj4gPj4+Pj4gKyAg
ICAgICAgcmV0dXJuOwo+ID4+Pj4KPiA+Pj4+IElzIHRoZSBNTVUgZ3VhcmFudGVlZCB0byBiZSBy
ZXNldCBvbiByZXN1bWUgc3VjaCB0aGF0IHRoZSBUTEJzIHdpbGwKPiA+Pj4+IGFsd2F5cyBjb21l
IHVwIGNsZWFuPyBPdGhlcndpc2UgdGhlcmUgYXJlIHBvdGVudGlhbGx5IGNvcm5lcnMgd2hlcmUK
PiA+Pj4+IHN0YWxlIGVudHJpZXMgdGhhdCB3ZSBza2lwIGhlcmUgbWlnaHQgaGFuZyBhcm91bmQg
aWYgdGhlIGhhcmR3YXJlIGxpZXMKPiA+Pj4+IGFib3V0IHBvd2VyaW5nIHRoaW5ncyBkb3duLgo+
ID4+Pgo+ID4+PiBBc3N1bWluZyBydW50aW1lIFBNIGhhcyBhY3R1YWxseSBjb21taXR0ZWQgdG8g
dGhlIHBvd2VyIG9mZiwgdGhlbiBvbgo+ID4+PiBwb3dlciBvbiBwYW5mcm9zdF9kZXZpY2VfcmVz
dW1lKCkgd2lsbCBiZSBjYWxsZWQgd2hpY2ggcGVyZm9ybXMgYSByZXNldAo+ID4+PiBvZiB0aGUg
R1BVIHdoaWNoIHdpbGwgY2xlYXIgdGhlIEwyL1RMQnMgc28gdGhlcmUgc2hvdWxkbid0IGJlIGFu
eQo+ID4+PiBwcm9ibGVtIHRoZXJlLgo+ID4+Cj4gPj4gT0ssIGlmIHBhbmZyb3N0X2dwdV9zb2Z0
X3Jlc2V0KCkgaXMgc3VmZmljaWVudCB0byBndWFyYW50ZWUgY2xlYW4gVExCcwo+ID4+IHRoZW4g
dGhpcyBsb29rcyBlcXVpdmFsZW50IHRvIHdoYXQgd2UgZGlkIGZvciBhcm0tc21tdSwgc28gSSd2
ZSBubwo+ID4+IGNvbXBsYWludHMgaW4gdGhhdCByZWdhcmQuCj4gPj4KPiA+PiBIb3dldmVyIG9u
IHNlY29uZCBsb29rIEkndmUgbm93IG5vdGljZWQgdGhlIHBhbmZyb3N0X21tdV9mbHVzaF9yYW5n
ZSgpCj4gPj4gY2FsbHMgYmVpbmcgbW92ZWQgb3V0c2lkZSBvZiBtbXUtPmxvY2sgcHJvdGVjdGlv
bi4gRm9yZ2l2ZSBtZSBpZiB0aGVyZSdzCj4gPj4gYmFzaWMgRFJNIGtub3dsZWRnZSBJJ20gbWlz
c2luZyBoZXJlLCBidXQgaXMgdGhlcmUgYW55IHBvc3NpYmlsaXR5IGZvcgo+ID4+IG11bHRpcGxl
IHRocmVhZHMgdG8gY3JlYXRlL2ltcG9ydC9mcmVlIG9iamVjdHMgc2ltdWx0YW5lb3VzbHkgb24g
dGhlCj4gPj4gc2FtZSBGRCBzdWNoIHRoYXQgdHdvIG1tdV9od19kb19vcGVyYXRpb24oKSBjYWxs
cyBjb3VsZCByYWNlIGFuZAo+ID4+IGludGVyZmVyZSB3aXRoIGVhY2ggb3RoZXIgaW4gdGVybXMg
b2YgdGhlCj4gPj4gQVNfTE9DS0FERFIvQVNfQ09NTUFORC9BU19TVEFUVVMgZGFuY2U/Cj4gPgo+
ID4gWWVzLCB3ZSBjb3VsZCBoYXZlIG11bHRpcGxlIHRocmVhZHMuIE5vdCByZWFsbHkgYW55IGdv
b2QgcmVhc29uIGl0J3MKPiA+IG1vdmVkIG91dCBvZiB0aGUgbW11LT5sb2NrIG90aGVyIHRoYW4g
anVzdCB0byBhdm9pZCBhbnkgbmVzdGluZwo+ID4gKHRob3VnaCB0aGF0IHNlZW1lZCBmaW5lIGlu
IHRlc3RpbmcpLiBUaGUgbmV3bHkgYWRkZWQgYXNfbG9jayB3aWxsCj4gPiBzZXJpYWxpemUgbW11
X2h3X2RvX29wZXJhdGlvbigpLiBTbyB0aGUgbW11LT5sb2NrIGlzIGp1c3Qgc2VyaWFsaXppbmcK
PiA+IHBhZ2UgdGFibGUgd3JpdGVzLgo+Cj4gVXJnaCwgc29ycnksIG9uY2UgYWdhaW4gSSdkIHN0
b3BwZWQgbG9va2luZyBhdCAtbmV4dCBhbmQgd2FzCj4gY3Jvc3MtcmVmZXJlbmNpbmcgbXkgY3Vy
cmVudCByYzMtYmFzZWQgd29ya2luZyB0cmVlIDooCj4KPiBJbiB0aGF0IGNhc2UsIHlvdSBtYXkg
ZXZlbiBiZSBhYmxlIHRvIHJlbW92ZSBtbXUtPmxvY2sgZW50aXJlbHksIHNpbmNlCj4gaW8tcGd0
YWJsZS1hcm0gZG9lc24ndCBuZWVkIGV4dGVybmFsIGxvY2tpbmcgaXRzZWxmLiBBbmQgZm9yIHRo
aXMgcGF0Y2gsCgpJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhhdCwgYnV0IGhhZG4ndCBnb3R0ZW4g
YXJvdW5kIHRvIGludmVzdGlnYXRpbmcuCgo+Cj4gUmV2aWV3ZWQtYnk6IFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+Cj4KPiBDaGVlcnMsCj4gUm9iaW4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
