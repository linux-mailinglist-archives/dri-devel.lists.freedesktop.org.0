Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038EBB1BF5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39B26EF14;
	Fri, 13 Sep 2019 11:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC826EF14
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 11:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A11963F67D;
 Fri, 13 Sep 2019 13:07:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdGv7SH7wAuk; Fri, 13 Sep 2019 13:07:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E58713F269;
 Fri, 13 Sep 2019 13:07:07 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1B733360195;
 Fri, 13 Sep 2019 13:07:07 +0200 (CEST)
Subject: Re: [PATCH] drm/ttm: Restore ttm prefaulting
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190912183854.28194-1-thomas_os@shipmail.org>
 <0b4ef153-535d-593f-48ef-b0fb90b85096@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <fea9cb69-7dd9-d068-6603-8b59849e16c5@shipmail.org>
Date: Fri, 13 Sep 2019 13:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0b4ef153-535d-593f-48ef-b0fb90b85096@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568372827; bh=HW9qp4mY5cJl+1Wj9NRt/OfbFApL5IwKCYCAKKQY6QQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BZPem3BZBf4goTjbGxBDfSyhnq3pqj7+GvqNxhAUbEamNsP63JC9PqmKM595IlVjm
 9oXkqCxHCYjDplk8IZlw983aPHB8E9cn+aPHr2NIxBGN1tw3zyk5OltLCnHbJaIGAp
 9ZuK/s8y2OR/3h/GIjwPfsapy0UrOAQHpC9Ua0vE=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="BZPem3BZ";
 dkim-atps=neutral
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMy8xOSAxMjo1MyBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTIuMDku
MTkgdW0gMjA6Mzggc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToKPj4gRnJvbTog
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pgo+PiBDb21taXQgNGRh
YTRmYmEzYTM4ICgiZ3B1OiBkcm06IHR0bTogQWRkaW5nIG5ldyByZXR1cm4gdHlwZSB2bV9mYXVs
dF90IikKPj4gYnJva2UgVFRNIHByZWZhdWx0aW5nLiBTaW5jZSB2bWZfaW5zZXJ0X21peGVkKCkg
dHlwaWNhbGx5IGFsd2F5cyByZXR1cm5zCj4+IFZNX0ZBVUxUX05PUEFHRSwgcHJlZmF1bHRpbmcg
c3RvcHMgYWZ0ZXIgdGhlIHNlY29uZCBQVEUuCj4+Cj4+IFJlc3RvcmUgKGFsbW9zdCkgdGhlIG9y
aWdpbmFsIGJlaGF2aW91ci4gVW5mb3J0dW5hdGVseSB3ZSBjYW4gbm8gbG9uZ2VyCj4+IHdpdGgg
dGhlIG5ldyB2bV9mYXVsdF90IHJldHVybiB0eXBlIGRldGVybWluZSB3aGV0aGVyIGEgcHJlZmF1
bHRpbmcKPj4gUFRFIGluc2VydGlvbiBoaXQgYW4gYWxyZWFkeSBwb3B1bGF0ZWQgUFRFLCBhbmQg
dGVybWluYXRlIHRoZSBpbnNlcnRpb24KPj4gbG9vcC4gSW5zdGVhZCB3ZSBjb250aW51ZSB3aXRo
IHRoZSBwcmUtZGV0ZXJtaW5lZCBudW1iZXIgb2YgcHJlZmF1bHRzLgo+Pgo+PiBGaXhlczogNGRh
YTRmYmEzYTM4ICgiZ3B1OiBkcm06IHR0bTogQWRkaW5nIG5ldyByZXR1cm4gdHlwZSB2bV9mYXVs
dF90IikKPj4gQ2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+PiBD
YzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEdv
aW5nIHRvIHBpY2sgdGhhdCB1cCB3aGVuIEFsZXggcmViYXNlcyBvdXIgdXBzdHJlYW0gYnJhbmNo
Lgo+Cj4gQ2hyaXN0aWFuLgo+Cj4+IC0tLQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jIHwgMTYgKysrKysrKy0tLS0tLS0tLQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4g
aW5kZXggNWE1ODBhZGViOWQxLi5hYTE4ZThhNTM3MjcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYwo+PiBAQCAtMjkwLDE1ICsyOTAsMTMgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1
bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4+ICAgIAkJZWxzZQo+PiAgICAJCQly
ZXQgPSB2bWZfaW5zZXJ0X3BmbigmY3ZtYSwgYWRkcmVzcywgcGZuKTsKPj4gICAgCj4+IC0JCS8q
Cj4+IC0JCSAqIFNvbWVib2R5IGJlYXQgdXMgdG8gdGhpcyBQVEUgb3IgcHJlZmF1bHRpbmcgdG8K
Pj4gLQkJICogYW4gYWxyZWFkeSBwb3B1bGF0ZWQgUFRFLCBvciBwcmVmYXVsdGluZyBlcnJvci4K
Pj4gLQkJICovCj4+IC0KPj4gLQkJaWYgKHVubGlrZWx5KChyZXQgPT0gVk1fRkFVTFRfTk9QQUdF
ICYmIGkgPiAwKSkpCj4+IC0JCQlicmVhazsKPj4gLQkJZWxzZSBpZiAodW5saWtlbHkocmV0ICYg
Vk1fRkFVTFRfRVJST1IpKQo+PiAtCQkJZ290byBvdXRfaW9fdW5sb2NrOwo+PiArCQkvKiBOZXZl
ciBlcnJvciBvbiBwcmVmYXVsdGVkIFBURXMgKi8KPj4gKwkJaWYgKHVubGlrZWx5KChyZXQgJiBW
TV9GQVVMVF9FUlJPUikpKSB7Cj4+ICsJCQlpZiAoaSA9PSAwKQo+PiArCQkJCWdvdG8gb3V0X2lv
X3VubG9jazsKPj4gKwkJCWVsc2UKCldlIGNvdWxkIHBlcmhhcHMgc2tpcCB0aGF0IGVsc2UuIExl
dCBtZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvIHJlc3Bpbi4KCi9UaG9tYXMKCgoKPj4gKwkJCQli
cmVhazsKPj4gKwkJfQo+PiAgICAKPj4gICAgCQlhZGRyZXNzICs9IFBBR0VfU0laRTsKPj4gICAg
CQlpZiAodW5saWtlbHkoKytwYWdlX29mZnNldCA+PSBwYWdlX2xhc3QpKQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
