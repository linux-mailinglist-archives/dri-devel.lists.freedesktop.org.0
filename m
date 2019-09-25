Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98BBDD77
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 13:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF370896B0;
	Wed, 25 Sep 2019 11:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B45896B0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 702FD3F7B1;
 Wed, 25 Sep 2019 13:55:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7waOiHL2yCl; Wed, 25 Sep 2019 13:55:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E896A3F6B2;
 Wed, 25 Sep 2019 13:55:48 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DCAD7360020;
 Wed, 25 Sep 2019 13:55:47 +0200 (CEST)
Subject: Re: [PATCH 1/3] drm/ttm: fix busy reference in ttm_mem_evict_first
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 kraxel@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20190925105530.2261-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <744cbbcd-f0e8-e6ba-b744-856f3b9b0d86@shipmail.org>
Date: Wed, 25 Sep 2019 13:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190925105530.2261-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569412547; bh=XY7i+LWBr1G51PJhH9ZzS4dI4ykOZv8D88NsQ8Ogj1I=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=YVvKCHFrfXVWRb3uOArgt/lw+ETMO8L/bzULt6gASIFb4VSd2l59YXDJrQoeRqfsE
 5JQ8gybdAzRrjBXGmd+zUZ5u8vWwISMEEOG63aHcMaQqSYq6UTL/fnxMCeGiFZig5Q
 cScWaHak0hToYxhNWlkfCe0xIYN9A9ORjU87xSm8=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YVvKCHFr; 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yNS8xOSAxMjo1NSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBUaGUgYnVzeSBC
TyBtaWdodCBhY3R1YWxseSBiZSBhbHJlYWR5IGRlbGV0ZWQsCj4gc28gZ3JhYiBvbmx5IGEgbGlz
dCByZWZlcmVuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggODgxY2YyNmQ2OThlLi4wMmYzMDFlMWZm
MjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtODc1LDExICs4NzUsMTEgQEAgc3RhdGlj
IGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAg
Cj4gICAJaWYgKCFibykgewo+ICAgCQlpZiAoYnVzeV9ibykKPiAtCQkJdHRtX2JvX2dldChidXN5
X2JvKTsKPiArCQkJa3JlZl9nZXQoJmJ1c3lfYm8tPmxpc3Rfa3JlZik7Cj4gICAJCXNwaW5fdW5s
b2NrKCZnbG9iLT5scnVfbG9jayk7Cj4gICAJCXJldCA9IHR0bV9tZW1fZXZpY3Rfd2FpdF9idXN5
KGJ1c3lfYm8sIGN0eCwgdGlja2V0KTsKPiAgIAkJaWYgKGJ1c3lfYm8pCj4gLQkJCXR0bV9ib19w
dXQoYnVzeV9ibyk7Cj4gKwkJCWtyZWZfcHV0KCZidXN5X2JvLT5saXN0X2tyZWYsIHR0bV9ib19y
ZWxlYXNlX2xpc3QpOwo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAoKbGd0bS4KClJldmll
d2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
