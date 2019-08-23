Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9E9B3D9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5476ECD2;
	Fri, 23 Aug 2019 15:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB06ECD2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:49:28 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02755233A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:49:28 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id d79so8511252qke.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:49:27 -0700 (PDT)
X-Gm-Message-State: APjAAAWpAkJXP2HEbM8CQd1exi576SIrIgdka7fb/Q/DKWS43y84PWj+
 RwBaw2irAgRZg7AvvPT7roMbdx45oIfRfIbjaA==
X-Google-Smtp-Source: APXvYqxxAdvTDlK2k7ZO7fKZGXrr9ngDULWF5/jEKBVYP/Nr6jOHD4IoW0ZWgJyU8W/YZxY0hylRK42oiYbtlHHJ0/g=
X-Received: by 2002:a37:a010:: with SMTP id j16mr4815213qke.152.1566575367182; 
 Fri, 23 Aug 2019 08:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <586cea9a-ff79-5842-f485-64129fa53b68@arm.com>
In-Reply-To: <586cea9a-ff79-5842-f485-64129fa53b68@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 10:49:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJr=8=N5HZOmQ3T3nw5ZVb4fcLFqeVpBJ1XZBXzBwz=7w@mail.gmail.com>
Message-ID: <CAL_JsqJr=8=N5HZOmQ3T3nw5ZVb4fcLFqeVpBJ1XZBXzBwz=7w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566575368;
 bh=TRjgT9aX/nY9yd+8kspY6ShV91KwexloZYLwuzWJTmA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i5cpHhXlvgWszV5/3uMlwFmUkkDNakGCrxDH3u4DcGRxFCfxNHCs08KlAhTBq50sc
 pbDGpczwUv+kKfl2sNRgOAZI+l1uANcOLwkCw8aOCIhUp5n/r2bst+AU1CWj8VV3t1
 KS1lDSxD4IdxA+JUbwTzne9Y+gKBC2X1LJJ9EFfU=
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MDkgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMy8wOC8yMDE5IDAzOjEyLCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IFRoZXJlIGlzIG5vIHBvaW50IGluIHJlc3VtaW5nIHRoZSBoL3cganVzdCB0byBk
byBmbHVzaCBvcGVyYXRpb25zIGFuZAo+ID4gZG9pbmcgc28gdGFrZXMgc2V2ZXJhbCBsb2NrcyB3
aGljaCBjYXVzZSBsb2NrZGVwIGlzc3VlcyB3aXRoIHRoZSBzaHJpbmtlci4KPiA+IFJld29yayB0
aGUgZmx1c2ggb3BlcmF0aW9ucyB0byBvbmx5IGhhcHBlbiB3aGVuIHRoZSBoL3cgaXMgYWxyZWFk
eSBhd2FrZS4KPiA+IFRoaXMgYXZvaWRzIHRha2luZyBhbnkgbG9ja3MgYXNzb2NpYXRlZCB3aXRo
IHJlc3VtaW5nLgo+ID4KPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJv
cmEuY29tPgo+ID4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gPiBD
YzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4g
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KPgo+IEJ1dCBvbmUgY29tbWVudCBiZWxvdy4uLgo+Cj4gPiAtLS0KPiA+IHYyOiBu
ZXcgcGF0Y2gKPiA+Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUu
YyB8IDQxICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKPiA+IGluZGV4IDg0MmJkZDdjZjZiZS4uY2NmNjcxYTljM2Zi
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiA+IEBA
IC0yMjAsNiArMjIwLDIzIEBAIHN0YXRpYyBzaXplX3QgZ2V0X3Bnc2l6ZSh1NjQgYWRkciwgc2l6
ZV90IHNpemUpCj4gPiAgICAgICByZXR1cm4gU1pfMk07Cj4gPiAgIH0KPiA+Cj4gPiArdm9pZCBw
YW5mcm9zdF9tbXVfZmx1c2hfcmFuZ2Uoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBhbmZyb3N0X21tdSAqbW11LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSkKPiA+
ICt7Cj4gPiArICAgICBpZiAobW11LT5hcyA8IDApCj4gPiArICAgICAgICAgICAgIHJldHVybjsK
PiA+ICsKPiA+ICsgICAgIC8qIEZsdXNoIHRoZSBQVHMgb25seSBpZiB3ZSdyZSBhbHJlYWR5IGF3
YWtlICovCj4gPiArICAgICBpZiAoIXBtX3J1bnRpbWVfZ2V0X2lmX2luX3VzZShwZmRldi0+ZGV2
KSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgbW11X2h3X2RvX29w
ZXJhdGlvbihwZmRldiwgbW11LCBpb3ZhLCBzaXplLCBBU19DT01NQU5EX0ZMVVNIX1BUKTsKPiA+
ICsKPiA+ICsgICAgIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7Cj4KPiBU
aGlzIGlzbid0IHJlYWxseSBhIGNoYW5nZSwgYnV0OiBJJ20gbm90IHN1cmUgd2h5IHdlIHdhbnQg
dG8gc2lnbmFsIHdlCj4gd2VyZSBidXN5IGp1c3QgYmVjYXVzZSB3ZSBoYWQgdG8gZG8gc29tZSBj
YWNoZSBtYWludGVuYW5jZT8gV2UgbWlnaHQKPiBhY3R1YWxseSBiZSBmYXN0ZXIgbGVhdmluZyB0
aGUgR1BVIG9mZiBzbyB0aGVyZSdzIG5vIG5lZWQgdG8gZG8gZXh0cmEKPiBmbHVzaGVzIG9uIHRo
ZSBHUFU/CgpJIGRvbid0IGtub3csIGdvb2QgcXVlc3Rpb24uIFBvd2VyaW5nIHVwIGFuZCBkb3du
IGhhcyBpdHMgY29zdCB0b28uIFdlCm9ubHkgZ2V0IGhlcmUgaWYgd2Ugd2VyZSBhbHJlYWR5IGFj
dGl2ZS4gQSBmbHVzaCBvbiBhIG1hcCBwcm9iYWJseSBpcwpnb2luZyB0byBiZSBmb2xsb3dlZCBi
eSBhIGpvYi4gQW4gdW5tYXAgbWF5IGJlIHRoZSBlbmQgb2YgYWN0aXZpdHkgb3IKbm90LgoKSWYg
d2UgZG9uJ3QgY2FsbCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5LCB0aGVuIG1heWJlIHdlIGFs
c28gd2FudCB0bwpkbyBhIHBtX3J1bnRpbWVfcHV0X3N1c3BlbmQgKGkuZS4gc3VzcGVuZCBpbW1l
ZGlhdGVseSkgaW5zdGVhZC4gVGhhdAptYXkgb25seSBtYXR0ZXIgaWYgd2UncmUgdGhlIGxhc3Qg
b25lIHdoaWNoIGNvdWxkIG9ubHkgaGFwcGVuIGR1cmluZwp0aGlzIGdldC9wdXQuIEknbSBub3Qg
c3VyZSB3aGF0IGhhcHBlbnMgaWYgYSBzdXNwZW5kIGlzIHJlcXVlc3RlZApmb2xsb3dlZCBieSBh
biBhdXRvc3VzcGVuZC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
