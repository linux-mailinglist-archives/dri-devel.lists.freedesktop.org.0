Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3F9E643
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE289AC6;
	Tue, 27 Aug 2019 11:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F43989AB9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:00:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03AA7360;
 Tue, 27 Aug 2019 04:00:21 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC443F762;
 Tue, 27 Aug 2019 04:00:19 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] drm/panfrost: Remove unnecessary mmu->lock mutex
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190826223317.28509-1-robh@kernel.org>
 <20190826223317.28509-4-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8ec90bee-69b4-16d4-d75b-fb6bfd6f004c@arm.com>
Date: Tue, 27 Aug 2019 12:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190826223317.28509-4-robh@kernel.org>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAyMzozMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gVGhlcmUncyBubyBuZWVk
IHRvIHNlcmlhbGl6ZSBpby1wZ3RhYmxlIGNhbGxzIGFuZCB0aGUgYXNfbG9jayBpcwo+IHN1ZmZp
Y2llbnQgdG8gc2VyaWFsaXplIGZsdXNoIG9wZXJhdGlvbnMsIHNvIHdlIGNhbiByZW1vdmUgdGhl
IHBlcgo+IHBhZ2UgdGFibGUgbG9jay4KClJldmlld2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmlu
Lm11cnBoeUBhcm0uY29tPgoKPiBGaXhlczogNzI4MmY3NjQ1ZDA2ICgiZHJtL3BhbmZyb3N0OiBJ
bXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mgc3BhY2VzIikKPiBTdWdnZXN0ZWQtYnk6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6
b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5j
b20+Cj4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+IC0tLQo+IHYzOgo+ICAgLSBuZXcgcGF0Y2gKPiAKPiAgIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8IDEgLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jICAgIHwgOSAtLS0tLS0tLS0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuaAo+IGluZGV4IGY1MDNjNTY2ZTk5Zi4uYjdmYTA4ZWQzYTIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAo+IEBAIC0xMDQs
NyArMTA0LDYgQEAgc3RydWN0IHBhbmZyb3N0X2RldmljZSB7Cj4gICBzdHJ1Y3QgcGFuZnJvc3Rf
bW11IHsKPiAgIAlzdHJ1Y3QgaW9fcGd0YWJsZV9jZmcgcGd0YmxfY2ZnOwo+ICAgCXN0cnVjdCBp
b19wZ3RhYmxlX29wcyAqcGd0Ymxfb3BzOwo+IC0Jc3RydWN0IG11dGV4IGxvY2s7Cj4gICAJaW50
IGFzOwo+ICAgCWF0b21pY190IGFzX2NvdW50Owo+ICAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gaW5kZXggODQyYmRkN2Nm
NmJlLi4zYThiY2ZhN2U3YjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X21tdS5jCj4gQEAgLTIyOCw4ICsyMjgsNiBAQCBzdGF0aWMgaW50IG1tdV9tYXBfc2coc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSwKPiAgIAlz
dHJ1Y3QgaW9fcGd0YWJsZV9vcHMgKm9wcyA9IG1tdS0+cGd0Ymxfb3BzOwo+ICAgCXU2NCBzdGFy
dF9pb3ZhID0gaW92YTsKPiAKPiAtCW11dGV4X2xvY2soJm1tdS0+bG9jayk7Cj4gLQo+ICAgCWZv
cl9lYWNoX3NnKHNndC0+c2dsLCBzZ2wsIHNndC0+bmVudHMsIGNvdW50KSB7Cj4gICAJCXVuc2ln
bmVkIGxvbmcgcGFkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZ2wpOwo+ICAgCQlzaXplX3QgbGVuID0g
c2dfZG1hX2xlbihzZ2wpOwo+IEBAIC0yNDksOCArMjQ3LDYgQEAgc3RhdGljIGludCBtbXVfbWFw
X3NnKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBzdHJ1Y3QgcGFuZnJvc3RfbW11ICpt
bXUsCj4gICAJbW11X2h3X2RvX29wZXJhdGlvbihwZmRldiwgbW11LCBzdGFydF9pb3ZhLCBpb3Zh
IC0gc3RhcnRfaW92YSwKPiAgIAkJCSAgICBBU19DT01NQU5EX0ZMVVNIX1BUKTsKPiAKPiAtCW11
dGV4X3VubG9jaygmbW11LT5sb2NrKTsKPiAtCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gCj4gQEAg
LTMwNCw4ICszMDAsNiBAQCB2b2lkIHBhbmZyb3N0X21tdV91bm1hcChzdHJ1Y3QgcGFuZnJvc3Rf
Z2VtX29iamVjdCAqYm8pCj4gICAJaWYgKHJldCA8IDApCj4gICAJCXJldHVybjsKPiAKPiAtCW11
dGV4X2xvY2soJmJvLT5tbXUtPmxvY2spOwo+IC0KPiAgIAl3aGlsZSAodW5tYXBwZWRfbGVuIDwg
bGVuKSB7Cj4gICAJCXNpemVfdCB1bm1hcHBlZF9wYWdlOwo+ICAgCQlzaXplX3QgcGdzaXplID0g
Z2V0X3Bnc2l6ZShpb3ZhLCBsZW4gLSB1bm1hcHBlZF9sZW4pOwo+IEBAIC0zMjEsOCArMzE1LDYg
QEAgdm9pZCBwYW5mcm9zdF9tbXVfdW5tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJv
KQo+ICAgCW1tdV9od19kb19vcGVyYXRpb24ocGZkZXYsIGJvLT5tbXUsIGJvLT5ub2RlLnN0YXJ0
IDw8IFBBR0VfU0hJRlQsCj4gICAJCQkgICAgYm8tPm5vZGUuc2l6ZSA8PCBQQUdFX1NISUZULCBB
U19DT01NQU5EX0ZMVVNIX1BUKTsKPiAKPiAtCW11dGV4X3VubG9jaygmYm8tPm1tdS0+bG9jayk7
Cj4gLQo+ICAgCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7Cj4gICAJcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7Cj4gICAJYm8tPmlzX21hcHBlZCA9
IGZhbHNlOwo+IEBAIC0zNTYsNyArMzQ4LDYgQEAgaW50IHBhbmZyb3N0X21tdV9wZ3RhYmxlX2Fs
bG9jKHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYgKnByaXYpCj4gICAJc3RydWN0IHBhbmZyb3N0
X21tdSAqbW11ID0gJnByaXYtPm1tdTsKPiAgIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
diA9IHByaXYtPnBmZGV2Owo+IAo+IC0JbXV0ZXhfaW5pdCgmbW11LT5sb2NrKTsKPiAgIAlJTklU
X0xJU1RfSEVBRCgmbW11LT5saXN0KTsKPiAgIAltbXUtPmFzID0gLTE7Cj4gCj4gLS0KPiAyLjIw
LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
