Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020551E7D0A
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 14:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FB66E8E2;
	Fri, 29 May 2020 12:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3AF76E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 12:20:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B80355D;
 Fri, 29 May 2020 05:20:29 -0700 (PDT)
Received: from [10.57.2.168] (unknown [10.57.2.168])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D81703F52E;
 Fri, 29 May 2020 05:20:26 -0700 (PDT)
Subject: Re: [PATCH 05/15] drm/panfrost: use spinlock instead of atomic
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-6-peron.clem@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <788ac664-e426-d307-f81e-9632de09887c@arm.com>
Date: Fri, 29 May 2020 13:20:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-6-peron.clem@gmail.com>
Content-Language: en-GB
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IENvbnZlcnQgYnVz
eV9jb3VudCB0byBhIHNpbXBsZSBpbnQgcHJvdGVjdGVkIGJ5IHNwaW5sb2NrLgoKQSBsaXR0bGUg
bW9yZSByZWFzb25pbmcgbWlnaHQgYmUgbmljZS4KCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
UMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiAtLS0KWy4uLl0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKPiBpbmRleCAwNjk3ZjhkNWFhMzQuLmU2
NjI5OTAwYTYxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuaAo+IEBAIC00LDYgKzQsNyBAQAo+ICAgI2lmbmRlZiBfX1BBTkZST1NUX0RFVkZSRVFf
SF9fCj4gICAjZGVmaW5lIF9fUEFORlJPU1RfREVWRlJFUV9IX18KPiAgIAo+ICsjaW5jbHVkZSA8
bGludXgvc3BpbmxvY2suaD4KPiAgICNpbmNsdWRlIDxsaW51eC9rdGltZS5oPgo+ICAgCj4gICBz
dHJ1Y3QgZGV2ZnJlcTsKPiBAQCAtMTQsMTAgKzE1LDE3IEBAIHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2U7Cj4gICBzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSB7Cj4gICAJc3RydWN0IGRldmZyZXEgKmRl
dmZyZXE7Cj4gICAJc3RydWN0IHRoZXJtYWxfY29vbGluZ19kZXZpY2UgKmNvb2xpbmc7Cj4gKwo+
ICAgCWt0aW1lX3QgYnVzeV90aW1lOwo+ICAgCWt0aW1lX3QgaWRsZV90aW1lOwo+ICAgCWt0aW1l
X3QgdGltZV9sYXN0X3VwZGF0ZTsKPiAtCWF0b21pY190IGJ1c3lfY291bnQ7Cj4gKwlpbnQgYnVz
eV9jb3VudDsKPiArCS8qCj4gKwkgKiBQcm90ZWN0IGJ1c3lfdGltZSwgaWRsZV90aW1lLCB0aW1l
X2xhc3RfdXBkYXRlIGFuZCBidXN5X2NvdW50Cj4gKwkgKiBiZWNhdXNlIHRoZXNlIGNhbiBiZSB1
cGRhdGVkIGNvbmN1cnJlbnRseSwgZm9yIGV4YW1wbGUgYnkgdGhlIEdQCj4gKwkgKiBhbmQgUFAg
aW50ZXJydXB0cy4KPiArCSAqLwoKTml0OiB0aGlzIGNvbW1lbnQgaXMgY2xlYXJseSB3cm9uZywg
c2luY2Ugd2Ugb25seSBoYXZlIEpvYiwgR1BVIGFuZCBNTVUgCmludGVycnVwdHMgaGVyZS4gSSBn
dWVzcyBpZiB0aGVyZSBpcyBhIHJhY2UgaXQgd291bGQgYmUgYmV0d2VlbiAKc3VibWlzc2lvbi9j
b21wbGV0aW9uL3RpbWVvdXQgb24gZGlmZmVyZW50IGpvYiBzbG90cy4KCkdpdmVuIHRoYXQsIHNo
b3VsZCB0aGlzIGFjdHVhbGx5IGJlIGNvbnNpZGVyZWQgYSBmaXggZm9yIDllNjJiODg1ZjcxNSAK
KCJkcm0vcGFuZnJvc3Q6IFNpbXBsaWZ5IGRldmZyZXEgdXRpbGlzYXRpb24gdHJhY2tpbmciKT8K
ClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
