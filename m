Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E9700FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 15:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CE989C48;
	Mon, 22 Jul 2019 13:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5086C89C48
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:25:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4658344;
 Mon, 22 Jul 2019 06:25:30 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113E83F71A;
 Mon, 22 Jul 2019 06:25:29 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/panfrost: Add a no execute flag for BO allocations
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-3-robh@kernel.org>
 <ecde43d2-45cc-d00a-9635-cb56a67263d4@arm.com>
 <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
 <896cada5-580a-7637-2884-f0c616314ea4@arm.com>
 <CAL_Jsq+ygY64WP6GP2LB4WRt2_BCXMMWxQSyhazY=jWfCyOkLg@mail.gmail.com>
 <4b7fc0b4-aa5b-06ba-ad4a-5b959e265e67@arm.com>
 <d52430aa-972e-f730-ee5a-44137f87e066@arm.com>
 <0bf616f7-023a-e1e3-dbf6-9a98155f6bf9@arm.com>
 <07a47ad9-cda9-b8dc-8bab-e9f065ae7229@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <76670d13-0292-1fa1-9e20-f193c01c14c6@arm.com>
Date: Mon, 22 Jul 2019 14:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <07a47ad9-cda9-b8dc-8bab-e9f065ae7229@arm.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDcvMjAxOSAxMzoxOSwgU3RldmVuIFByaWNlIHdyb3RlOgpbLi4uXQo+IEluZGVlZCwg
dGhhdCBjYXNlIHdhcyBqdXN0IG9jY3VycmluZyB0byBtZSB0b28hIEhvdyBhYm91dDoKPiAKPiAJ
dTY0IG5leHRfc2VnID0gQUxJR04oKnN0YXJ0LCBQRk5fNEcpOwo+IAo+IAlpZiAobmV4dF9zZWcg
LSAqc3RhcnQgPD0gUEZOXzE2TSkKPiAJCSpzdGFydCA9IG5leHRfc2VnICsgMTsKPiAKPiAJKmVu
ZCA9IG1pbigqZW5kLCBBTElHTigqc3RhcnQsIFBGTl80RykgLSAxKTsKPiAKPiBTbyBhbHdheXMg
YWxsb2NhdGUgYXQgdGhlIGJlZ2lubmluZywgYnV0IHNraXAgcGFzdCB0aGUgbmV4dCA0R0IgYm91
bmRhcnkKPiBpZiB0aGVyZSdzIGxlc3MgdGhhbiAxNk1CIGxlZnQgKG9yIGVxdWFsIHRvIGF2b2lk
IHRoZSA0R0IgYm91bmRhcnkpLgoKQWgsIHRoZXJlIGl0IGlzISBJIHRoaW5rIGl0IGdlbmVyYWxp
c2VzIGV2ZW4gZnVydGhlciBieSBqdXN0IGNoYW5naW5nIAp0aGUgY29uZGl0aW9uIHRvICJpZiAo
bmV4dF9zZWcgLSAqc3RhcnQgPCAqZW5kIC0gbmV4dF9zZWcpIiwgYWx0aG91Z2ggCndlJ2QgbmVl
ZCB0byBlbnN1cmUgYSBzaWduZWQgY29tcGFyaXNvbiB0byBjb3ZlciB0aGUgY2FzZSB3aGVyZSBz
dGFydCAKYW5kIGVuZCBhcmUgYWxyZWFkeSBpbiB0aGUgc2FtZSBzZWdtZW50LgoKUm9iaW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
