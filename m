Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE069B410
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432B76ECD5;
	Fri, 23 Aug 2019 15:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F36ECD5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:57:32 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BBA52339D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:57:32 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id i4so11619647qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:57:32 -0700 (PDT)
X-Gm-Message-State: APjAAAWNMI6/T9D+1j3D6h2xa+c2crg78HEaHNq7qaknawV3M/lBrKlI
 y2rrSl/aA8lf+DpcdJ5L2WaG1o3plogI492nBg==
X-Google-Smtp-Source: APXvYqzPgYMvVdtsVqf8z+jNNPAB7OGMlh+u5XF1txynQd8uit4N1+B61V295y8tgkik1FX24gcUDsldk6hilJahzlY=
X-Received: by 2002:aed:24f4:: with SMTP id u49mr5529187qtc.110.1566575851722; 
 Fri, 23 Aug 2019 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-8-robh@kernel.org>
 <0dc17539-99d0-d0ea-9b24-506f4dafef71@arm.com>
 <749c3430-9f35-84b4-9856-e43addf35f87@arm.com>
 <04c12d81-fb51-4123-02bc-28bbb97bfcd7@arm.com>
In-Reply-To: <04c12d81-fb51-4123-02bc-28bbb97bfcd7@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 10:57:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLHDcq0RXrhU0SCL24kV-r_wmiY8=xd42STO0Ha6hq8iA@mail.gmail.com>
Message-ID: <CAL_JsqLHDcq0RXrhU0SCL24kV-r_wmiY8=xd42STO0Ha6hq8iA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/panfrost: Rework page table flushing and
 runtime PM interaction
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566575852;
 bh=PCoJc/KULmKO2W6bhMLkEFh57sq6cu/BmxJG6vh+6zc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HLQrZj0WCGpd3w1tWMtvaDXOPcG0H2mjlc3uwurPqouHm9KrScIZHypPYjdxWnWdu
 z8WxM2gSjifaF56RLv5LohayAbLoylTUz3Vh6YzNd9Cch7G/Tx3FOvxEKF7Iv26L6k
 /IOlDz21i1KHt+K4HSrRttgowOQ5G4rwkk9FNMEo=
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6NDQgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMy8wOC8yMDE5IDE2OjA1LCBTdGV2ZW4gUHJpY2Ug
d3JvdGU6Cj4gPiBPbiAyMy8wOC8yMDE5IDEyOjExLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gPj4g
T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPj4+IFRoZXJlIGlzIG5v
IHBvaW50IGluIHJlc3VtaW5nIHRoZSBoL3cganVzdCB0byBkbyBmbHVzaCBvcGVyYXRpb25zIGFu
ZAo+ID4+PiBkb2luZyBzbyB0YWtlcyBzZXZlcmFsIGxvY2tzIHdoaWNoIGNhdXNlIGxvY2tkZXAg
aXNzdWVzIHdpdGggdGhlCj4gPj4+IHNocmlua2VyLgo+ID4+PiBSZXdvcmsgdGhlIGZsdXNoIG9w
ZXJhdGlvbnMgdG8gb25seSBoYXBwZW4gd2hlbiB0aGUgaC93IGlzIGFscmVhZHkKPiA+Pj4gYXdh
a2UuCj4gPj4+IFRoaXMgYXZvaWRzIHRha2luZyBhbnkgbG9ja3MgYXNzb2NpYXRlZCB3aXRoIHJl
c3VtaW5nLgo+ID4+Pgo+ID4+PiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFi
b3JhLmNvbT4KPiA+Pj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4g
Pj4+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNv
bT4KPiA+Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+Pj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+Pj4gLS0tCj4gPj4+IHYyOiBuZXcgcGF0Y2gKPiA+
Pj4KPiA+Pj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA0MSAr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gPj4+IGluZGV4IDg0MmJkZDdjZjZiZS4uY2NmNjcx
YTljM2ZiIDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMKPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21t
dS5jCj4gPj4+IEBAIC0yMjAsNiArMjIwLDIzIEBAIHN0YXRpYyBzaXplX3QgZ2V0X3Bnc2l6ZSh1
NjQgYWRkciwgc2l6ZV90IHNpemUpCj4gPj4+ICAgICAgIHJldHVybiBTWl8yTTsKPiA+Pj4gICB9
Cj4gPj4+ICt2b2lkIHBhbmZyb3N0X21tdV9mbHVzaF9yYW5nZShzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlICpwZmRldiwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUg
Km1tdSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgIHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSkKPiA+
Pj4gK3sKPiA+Pj4gKyAgICBpZiAobW11LT5hcyA8IDApCj4gPj4+ICsgICAgICAgIHJldHVybjsK
PiA+Pj4gKwo+ID4+PiArICAgIC8qIEZsdXNoIHRoZSBQVHMgb25seSBpZiB3ZSdyZSBhbHJlYWR5
IGF3YWtlICovCj4gPj4+ICsgICAgaWYgKCFwbV9ydW50aW1lX2dldF9pZl9pbl91c2UocGZkZXYt
PmRldikpCj4gPj4+ICsgICAgICAgIHJldHVybjsKPiA+Pgo+ID4+IElzIHRoZSBNTVUgZ3VhcmFu
dGVlZCB0byBiZSByZXNldCBvbiByZXN1bWUgc3VjaCB0aGF0IHRoZSBUTEJzIHdpbGwKPiA+PiBh
bHdheXMgY29tZSB1cCBjbGVhbj8gT3RoZXJ3aXNlIHRoZXJlIGFyZSBwb3RlbnRpYWxseSBjb3Ju
ZXJzIHdoZXJlCj4gPj4gc3RhbGUgZW50cmllcyB0aGF0IHdlIHNraXAgaGVyZSBtaWdodCBoYW5n
IGFyb3VuZCBpZiB0aGUgaGFyZHdhcmUgbGllcwo+ID4+IGFib3V0IHBvd2VyaW5nIHRoaW5ncyBk
b3duLgo+ID4KPiA+IEFzc3VtaW5nIHJ1bnRpbWUgUE0gaGFzIGFjdHVhbGx5IGNvbW1pdHRlZCB0
byB0aGUgcG93ZXIgb2ZmLCB0aGVuIG9uCj4gPiBwb3dlciBvbiBwYW5mcm9zdF9kZXZpY2VfcmVz
dW1lKCkgd2lsbCBiZSBjYWxsZWQgd2hpY2ggcGVyZm9ybXMgYSByZXNldAo+ID4gb2YgdGhlIEdQ
VSB3aGljaCB3aWxsIGNsZWFyIHRoZSBMMi9UTEJzIHNvIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkK
PiA+IHByb2JsZW0gdGhlcmUuCj4KPiBPSywgaWYgcGFuZnJvc3RfZ3B1X3NvZnRfcmVzZXQoKSBp
cyBzdWZmaWNpZW50IHRvIGd1YXJhbnRlZSBjbGVhbiBUTEJzCj4gdGhlbiB0aGlzIGxvb2tzIGVx
dWl2YWxlbnQgdG8gd2hhdCB3ZSBkaWQgZm9yIGFybS1zbW11LCBzbyBJJ3ZlIG5vCj4gY29tcGxh
aW50cyBpbiB0aGF0IHJlZ2FyZC4KPgo+IEhvd2V2ZXIgb24gc2Vjb25kIGxvb2sgSSd2ZSBub3cg
bm90aWNlZCB0aGUgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKCkKPiBjYWxscyBiZWluZyBtb3Zl
ZCBvdXRzaWRlIG9mIG1tdS0+bG9jayBwcm90ZWN0aW9uLiBGb3JnaXZlIG1lIGlmIHRoZXJlJ3MK
PiBiYXNpYyBEUk0ga25vd2xlZGdlIEknbSBtaXNzaW5nIGhlcmUsIGJ1dCBpcyB0aGVyZSBhbnkg
cG9zc2liaWxpdHkgZm9yCj4gbXVsdGlwbGUgdGhyZWFkcyB0byBjcmVhdGUvaW1wb3J0L2ZyZWUg
b2JqZWN0cyBzaW11bHRhbmVvdXNseSBvbiB0aGUKPiBzYW1lIEZEIHN1Y2ggdGhhdCB0d28gbW11
X2h3X2RvX29wZXJhdGlvbigpIGNhbGxzIGNvdWxkIHJhY2UgYW5kCj4gaW50ZXJmZXJlIHdpdGgg
ZWFjaCBvdGhlciBpbiB0ZXJtcyBvZiB0aGUKPiBBU19MT0NLQUREUi9BU19DT01NQU5EL0FTX1NU
QVRVUyBkYW5jZT8KClllcywgd2UgY291bGQgaGF2ZSBtdWx0aXBsZSB0aHJlYWRzLiBOb3QgcmVh
bGx5IGFueSBnb29kIHJlYXNvbiBpdCdzCm1vdmVkIG91dCBvZiB0aGUgbW11LT5sb2NrIG90aGVy
IHRoYW4ganVzdCB0byBhdm9pZCBhbnkgbmVzdGluZwoodGhvdWdoIHRoYXQgc2VlbWVkIGZpbmUg
aW4gdGVzdGluZykuIFRoZSBuZXdseSBhZGRlZCBhc19sb2NrIHdpbGwKc2VyaWFsaXplIG1tdV9o
d19kb19vcGVyYXRpb24oKS4gU28gdGhlIG1tdS0+bG9jayBpcyBqdXN0IHNlcmlhbGl6aW5nCnBh
Z2UgdGFibGUgd3JpdGVzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
