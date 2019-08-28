Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42901A01DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 14:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77AD89B61;
	Wed, 28 Aug 2019 12:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEE389B61
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 12:36:00 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF9E722DA7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 12:35:59 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id s14so2210234qkm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 05:35:59 -0700 (PDT)
X-Gm-Message-State: APjAAAWX8Zt+sLCuyOQkgDXj1BmmvCf7WQ7TfzLbKmjTJwuiPh6kQTdU
 RuXG12noLx89XUUyr/nLDDSMf0YlrAo3OJCKgg==
X-Google-Smtp-Source: APXvYqzIXBb0H8hfU0RUgvdeGkYST7OEIhjbzs2ddQi84LLEHsiZxSTgpM2XzrL1Mk8Wkw5+QA47oXNkLIFAY7Sj5yw=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr3596129qke.223.1566995759124; 
 Wed, 28 Aug 2019 05:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190826223317.28509-1-robh@kernel.org>
 <20190826223317.28509-8-robh@kernel.org>
 <4ec2e7c9-f6e1-b4b8-4274-f63065a56cc2@arm.com>
In-Reply-To: <4ec2e7c9-f6e1-b4b8-4274-f63065a56cc2@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Aug 2019 07:35:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+7QG7z4GQD0OMCaUhG_pnvd7k7F0FhOfcRJE_1USdAXg@mail.gmail.com>
Message-ID: <CAL_Jsq+7QG7z4GQD0OMCaUhG_pnvd7k7F0FhOfcRJE_1USdAXg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] drm/panfrost: Flush and disable address space when
 freeing page tables
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566995760;
 bh=6MREoqBgUny/HGhBR5kZp6y8eH8wwgOl0SJwBgfuPZU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fWbG7PvLu5PWB8LvOwN0PXBHNTMhg9uGG8FR1apbRwe/hji70EGLWFWKTqTEVF7Iw
 76EVKiQ7Ik4peIlImvUbFbfrjzs3UHMp/aVW/DVic+DDtD5a1CfdvvufuIgVtFRYNK
 FmVx/FYRp74s5Ng3iQJU66vGfEMdP2Uwjav6zFH0=
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgNTo1NSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDI2LzA4LzIwMTkgMjM6MzMsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gQ3VycmVudGx5LCBwYWdlIHRhYmxlcyBhcmUgZnJlZWQgd2l0aG91dCBkaXNhYmxp
bmcgdGhlIGFkZHJlc3Mgc3BhY2UgZmlyc3QuCj4gPiBUaGlzIHByb2JhYmx5IGlzIGZpbmUgYXMg
d2UnbGwgc3dpdGNoIHRvIG5ldyBwYWdlIHRhYmxlcyB3aGVuIHRoZSBhZGRyZXNzCj4gPiBzcGFj
ZSBpcyBhbGxvY2F0ZWQgYWdhaW4gYW5kIHJ1bnRpbWUgUE0gc3VzcGVuZCB3aWxsIHJlc2V0IHRo
ZSBHUFUKPiA+IGNsZWFyaW5nIHRoZSByZWdpc3RlcnMuIEhvd2V2ZXIsIGl0J3MgYmV0dGVyIHRv
IGNsZWFuIHVwIGFmdGVyIG91cnNlbHZlcy4KPiA+IFRoZXJlIGlzIGFsc28gYSBwcm9ibGVtIHRo
YXQgd2UgY291bGQgYmUgYWNjZXNzaW5nIHRoZSBoL3cgaW4KPiA+IHRsYl9pbnZfY29udGV4dCgp
IHdoZW4gc3VzcGVuZGVkLgo+ID4KPiA+IFJld29yayB0aGUgZGlzYWJsZSBjb2RlIHRvIG1ha2Ug
c3VyZSB3ZSBmbHVzaCBjYWNoZXMvVExCcyBhbmQgZGlzYWJsZSB0aGUKPiA+IGFkZHJlc3Mgc3Bh
Y2UgYmVmb3JlIGZyZWVpbmcgdGhlIHBhZ2UgdGFibGVzIGlmIHdlIGFyZSBub3Qgc3VzcGVuZGVk
LiBBcwo+ID4gdGhlIHRsYl9pbnZfY29udGV4dCgpIGhvb2sgaXMgb25seSBjYWxsZWQgd2hlbiBm
cmVlaW5nIHRoZSBwYWdlIHRhYmxlcyBhbmQKPiA+IHdlIGRvIGEgZmx1c2ggYmVmb3JlIGRpc2Fi
bGluZyB0aGUgQVMsIGxldHMgcmVtb3ZlIHRoZSBmbHVzaCBmcm9tCj4gPiB0bGJfaW52X2NvbnRl
eHQgYW5kIGF2b2lkIGFueSBydW50aW1lIFBNIGlzc3Vlcy4KPiA+Cj4gPiBGaXhlczogNzI4MmY3
NjQ1ZDA2ICgiZHJtL3BhbmZyb3N0OiBJbXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mgc3BhY2VzIikK
PiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gQ2M6
IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gPiBDYzogQWx5c3NhIFJvc2Vu
endlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4g
PiAtLS0KPiA+IHYzOgo+ID4gIC0gTmV3IHBhdGNoIHJlcGxhY2luZyAiZHJtL3BhbmZyb3N0OiBS
ZW1vdmUgdW5uZWNlc3NhcnkgZmx1c2hpbmcgZnJvbSB0bGJfaW52X2NvbnRleHQiCj4gPgo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDE2ICsrKysrKysrKy0t
LS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
bW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiA+IGluZGV4
IGQxZWJkZTMzMjdmZS4uMzg3ZDgzMGNiN2NmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKPiA+IEBAIC0xMjksOCArMTI5LDEwIEBAIHN0YXRpYyB2b2lk
IHBhbmZyb3N0X21tdV9lbmFibGUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHN0cnVj
dCBwYW5mcm9zdF9tCj4gPiAgICAgICB3cml0ZV9jbWQocGZkZXYsIGFzX25yLCBBU19DT01NQU5E
X1VQREFURSk7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgdm9pZCBtbXVfZGlzYWJsZShzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldiwgdTMyIGFzX25yKQo+ID4gK3N0YXRpYyB2b2lkIHBhbmZy
b3N0X21tdV9kaXNhYmxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCB1MzIgYXNfbnIp
Cj4gPiAgewo+ID4gKyAgICAgbW11X2h3X2RvX29wZXJhdGlvbl9sb2NrZWQocGZkZXYsIGFzX25y
LCAwLCB+MFVMLCBBU19DT01NQU5EX0ZMVVNIX01FTSk7Cj4gPiArCj4gPiAgICAgICBtbXVfd3Jp
dGUocGZkZXYsIEFTX1RSQU5TVEFCX0xPKGFzX25yKSwgMCk7Cj4gPiAgICAgICBtbXVfd3JpdGUo
cGZkZXYsIEFTX1RSQU5TVEFCX0hJKGFzX25yKSwgMCk7Cj4gPgo+Cj4gQXQgdGhlIGVuZCBvZiB0
aGlzIGZ1bmN0aW9uIHdlIGhhdmU6Cj4KPiB8ICAgICAgIHdyaXRlX2NtZChwZmRldiwgYXNfbnIs
IEFTX0NPTU1BTkRfVVBEQVRFKTsKPgo+IHdoaWNoIHNob3VsZCBuZWdhdGUgdGhlIG5lZWQgZm9y
IEFTX0NPTU1BTkRfRkxVU0hfTUVNIGFzIHdlbGwuIEhvd2V2ZXIKPiBvbmUgdGhpbmcgSSBoYXZl
IGp1c3Qgbm90aWNlZCBpcyB0aGF0IHdyaXRlX2NtZCgpIGRvZXNuJ3Qgd2FpdCBmb3IKPiBBU19B
Q1RJVkUgdG8gYmUgY2xlYXJlZC4gVGhpcyBtZWFucyB0aGF0IHRoZSBHUFUgaGFzIGFjY2VwdGVk
IHRoZQo+IGNvbW1hbmQgYnV0IG1pZ2h0IG5vdCBoYXZlIGZpbmlzaGVkIHRoZSBmbHVzaC4KPgo+
IFdoZW4gZnJlZWluZyBwYWdlIHRhYmxlcyB3ZSBvYnZpb3VzbHkgbmVlZCB0byB3YWl0IGZvciB0
aGUgTU1VIGZsdXNoIHRvCj4gY29tcGxldGUuIFRoZSBleHRyYSBtbXVfaHdfZG9fb3BlcmF0aW9u
X2xvY2tlZCgpICdmaXhlcycgdGhpcyBwYXJ0bHkKPiBiZWNhdXNlIHRoZXJlJ3MgYSBiYWNrLXRv
LWJhY2sgc2V0IG9mIE1NVSBjb21tYW5kcyBzbyB0aGUgc2Vjb25kIG9uZQo+IHdpbGwgYmUgYmxv
Y2tlZCB1bnRpbCBBU19DT01NQU5EX0ZMVVNIX01FTSBoYXMgY29tcGxldGVkLCBidXQgYWxzbwo+
IG1tdV9od19kb19vcGVyYXRpb24oKSB3YWl0cyBmb3IgdGhlIGZsdXNoIHRvIGNvbXBsZXRlLgoK
SSd2ZSBjb3BpZWQgd2hhdCdzIGluIGtiYXNlIHdoaWNoIGRvZXNuJ3Qgd2FpdCBBRkFJQ1QuCgo+
IEknbSBub3QgcmVhbGx5IHN1cmUgd2h5IG1tdV9lbmFibGUoKS9tbXVfZGlzYWJsZSgpIGhhdmUg
YmFyZSBjYWxscyB0bwo+IHdyaXRlX2NtZCAtIGNvdWxkIHRoZXkgdXNlIG1tdV9od19kb19vcGVy
YXRpb25fbG9ja2VkKCkgaW5zdGVhZD8KCm1tdV9od19kb19vcGVyYXRpb25fbG9ja2VkKCkgYWxz
byBkb2VzIGEgbG9ja19yZWdpb24uIEkgZ3Vlc3MgdGhhdAp3b3VsZCBiZSBoYXJtbGVzcz8KClJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
