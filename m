Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B110D84A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 17:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1AA6E92B;
	Fri, 29 Nov 2019 16:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 772B16E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 16:12:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E247830E;
 Fri, 29 Nov 2019 08:12:12 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 323A23F68E;
 Fri, 29 Nov 2019 08:12:12 -0800 (PST)
Subject: Re: [PATCH 8/8] drm/panfrost: Make sure the shrinker does not reclaim
 referenced BOs
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-9-boris.brezillon@collabora.com>
 <64a6a09a-e83a-05be-8576-79a74f971286@arm.com>
 <20191129170734.50bb02ad@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7250d8a9-ff65-4e18-cc92-3ef645c3be31@arm.com>
Date: Fri, 29 Nov 2019 16:12:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129170734.50bb02ad@collabora.com>
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxNjowNywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIEZyaSwgMjkg
Tm92IDIwMTkgMTU6NDg6MTUgKzAwMDAKPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPiB3cm90ZToKPiAKPj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdy
b3RlOgo+Pj4gVXNlcnNwYWNlIG1pZ2h0IHRhZyBhIEJPIHB1cmdlYWJsZSB3aGlsZSBpdCdzIHN0
aWxsIHJlZmVyZW5jZWQgYnkgR1BVCj4+PiBqb2JzLiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUg
c2hyaW5rZXIgZG9lcyBub3QgcHVyZ2Ugc3VjaCBCT3MgdW50aWwKPj4+IGFsbCBqb2JzIHJlZmVy
ZW5jaW5nIGl0IGFyZSBmaW5pc2hlZC4KPj4+Cj4+PiBGaXhlczogMDEzYjY1MTAxMzE1ICgiZHJt
L3BhbmZyb3N0OiBBZGQgbWFkdmlzZSBhbmQgc2hyaW5rZXIgc3VwcG9ydCIpCj4+PiBDYzogPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24g
PGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiAgCj4+Cj4+IEknbSBoYXBweSB3aXRoIHRo
aXMsIGJ1dCBJIHdvdWxkIGFsc28gYXJndWUgdGhhdCBpdCB3YXMgcHJldmlvdXNseSB1c2VyCj4+
IHNwYWNlJ3Mgam9iIG5vdCB0byBtYXJrIGEgQk8gcHVyZ2VhYmxlIHdoaWxlIGl0J3MgaW4gdXNl
IGJ5IHRoZSBHUFUuCj4gCj4gSSB3YXMgbm90IGF3YXJlIG9mIHRoaXMgZGVzaWduIGNob2ljZS4K
CldoZW4gSSB3YXMgbWFpbnRhaW5pbmcgbWFsaV9rYmFzZSBJIHdvdWxkIGhhdmUgc2FpZCBubyB0
byB0aGlzIDspIEJ1dAp0aGFua2Z1bGx5IEkndmUgbW92ZWQgb24hIEknbSBub3Qgc3VyZSB3aGV0
aGVyIGFueW9uZSBhY3R1YWxseSBtYWRlIGEKZGVzaWduIGNob2ljZSBmb3IgUGFuZnJvc3QgaGVy
ZS4KCj4+IFRoaXMgaXMgaW4gc29tZSB3YXlzIGFuIEFCSSBjaGFuZ2Ugc28gd2Ugc2hvdWxkIGJl
IHN1cmUgdGhpcyBpcwo+PiBzb21ldGhpbmcgdGhhdCB3ZSB3YW50IHRvIHN1cHBvcnQgImZvcmV2
ZXIiIG1vcmUuCj4gCj4gV2VsbCwgaW4gdGhhdCBjYXNlLCB0aGUgQUJJIGNoYW5nZSBpcyBicmlu
Z2luZyBleHRyYSByb2J1c3RuZXNzLCB3aXRoCj4gQUZBSUNULCBubyBkb3duc2lkZSBmb3IgdGhv
c2UgdGhhdCB3ZXJlIHRha2luZyBjYXJlIG9mIHRoYXQgaW4KPiB1c2Vyc3BhY2UuCgpZZXMsIHRo
ZXJlJ3Mgbm8gZG93bnNpZGUgZm9yIHVzZXIgc3BhY2UgLSB0aGlzIGlzIGp1c3QgZ2l2aW5nIHVz
ZXIgc3BhY2UKZXh0cmEgZnJlZWRvbS4KCj4+IEJ1dCBpZiBNZXNhIGhhcwo+PiAnYWx3YXlzJyBi
ZWVuIGFzc3VtaW5nIHRoaXMgYmVoYXZpb3VyIHdlIG1pZ2h0IGFzIHdlbGwgbWF0Y2guCj4gCj4g
SSB0aGluayBzbywgYW5kIFZDNCBzZWVtcyB0byBoYXZlIHRoZSBzYW1lIGV4cGVjdGF0aW9ucy4K
ClRoaXMgc2VlbXMgbGlrZSBlbm91Z2gganVzdGlmaWNhdGlvbiB0byBtZS4KClN0ZXZlCgo+Pgo+
PiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiAKPiBU
aGFua3MgZm9yIHRoZSByZXZpZXcuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
