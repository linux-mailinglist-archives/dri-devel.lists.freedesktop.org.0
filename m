Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44271153263
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AC789650;
	Wed,  5 Feb 2020 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 459E789650
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 14:01:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB65731B;
 Wed,  5 Feb 2020 06:01:48 -0800 (PST)
Received: from [10.1.195.32] (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27F733F68E;
 Wed,  5 Feb 2020 06:01:48 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Don't try to map on error faults
To: Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
References: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
 <3500c501-b166-6a1e-267b-31a4e5c62619@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <565bac84-9e3c-21de-9043-f508e98ae6bf@arm.com>
Date: Wed, 5 Feb 2020 14:01:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3500c501-b166-6a1e-267b-31a4e5c62619@arm.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDIvMjAyMCAxMzoyNSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDA1LzAyLzIwMjAg
MTA6MDcgYW0sIFRvbWV1IFZpem9zbyB3cm90ZToKPj4gSWYgdGhlIGV4Y2VwdGlvbiB0eXBlIGlz
bid0IG9uZSBvZiB0aGUgbm9ybWFsIGZhdWx0cywgZG9uJ3QgdHJ5IHRvIG1hcAo+PiBhbmQgaW5z
dGVhZCBnbyBzdHJhaWdodCB0byBhIHRlcm1pbmFsIGZhdWx0Lgo+IAo+ICJPbmUgb2YgdGhlIHRo
ZSBub3JtYWwgZmF1bHRzIiBzZWVtcyBhIHJhdGhlciB2YWd1ZSB3YXkgb2Ygc2F5aW5nICJhCj4g
dHJhbnNsYXRpb24gZmF1bHQiLCB3aGljaCBpcyB3aGF0IHdlJ3JlIHNwZWNpZmljYWxseSBoYW5k
bGluZyBoZXJlLCBhbmQKPiBsb2dpY2FsbHkgdGhlIG9ubHkgZmF1bHQgcmVmbGVjdGluZyBzb21l
dGhpbmcgbm90IHlldCBtYXBwZWQgcmF0aGVyIHRoYW4KPiBtYXBwZWQgaW5hcHByb3ByaWF0ZWx5
IDspCj4gCj4gKFdobyBrbm93cyBob3cgdGhlIGxldmVsIGVuZGVkIHVwIGFzIDEtNCByYXRoZXIg
dGhhbiAwLTMgYXMgaXQgcmVhbGx5Cj4gc2hvdWxkIGJlIC0gYW5vdGhlciBNYWxpIE15c3Rlcnko
VE0pLi4uKQoKQWgsIGJ1dCB5b3UncmUgdGhpbmtpbmcgb2YgTFBBRSBub3QgTWFsaSBNYWdpYyBQ
YWdlIFRhYmxlcyAoJ2luc3BpcmVkCmJ5JyBMUEFFIGJ1dCBub3QgYWN0dWFsbHkgY29tcGF0aWJs
ZS4uLi4pIDspIEhvd2V2ZXIgSSBkbyB3b25kZXIgd2hhdAp3aWxsIGhhcHBlbiB3aGVuIHdlIGVu
YWJsZSBhYXJjaDY0IHBhZ2UgdGFibGVzIGluIEJpZnJvc3QuCgo+PiBPdGhlcndpc2UsIHdlIGNh
biBnZXQgZmxvb2RlZCBieSBrZXJuZWwgd2FybmluZ3MgYW5kIGZ1cnRoZXIgZmF1bHRzLgo+IAo+
IEVpdGhlciB3YXksCj4gCj4gUmV2aWV3ZWQtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5
QGFybS5jb20+Cj4gCj4+IFNpZ25lZC1vZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMgfCA1ICsrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMKPj4gaW5kZXggNzYzY2ZjYTg4NmE3Li44MGFiZGRiNDU0NGMgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPj4gQEAgLTU5Niw4ICs1OTYsOSBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QKPj4gcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyX3RocmVhZChp
bnQgaXJxLCB2b2lkICpkYXRhKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc291cmNlX2lkID0gKGZh
dWx0X3N0YXR1cyA+PiAxNik7Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBQYWdlIGZhdWx0
IG9ubHkgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIGlmICgoc3RhdHVzICYgbWFzaykgPT0gQklUKGkp
KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdBUk5fT04oZXhjZXB0aW9uX3R5cGUgPCAw
eEMxIHx8IGV4Y2VwdGlvbl90eXBlID4gMHhDNCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoKHN0
YXR1cyAmIG1hc2spID09IEJJVChpKSAmJgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4
Y2VwdGlvbl90eXBlID49IDB4QzEgJiYKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGNl
cHRpb25fdHlwZSA8PSAweEM0KSB7CgpJIHdvdWxkIHN1Z2dlc3QgdGhlIGJlc3Qgb3B0aW9uIGhl
cmUgaXMgdG8gY29weSBtYWxpX2tiYXNlIGFuZCBjaGVjawphZ2FpbnN0IGEgbWFzaywgaW4ga2Jh
c2VbMV0gd2UgaGF2ZToKCglzd2l0Y2ggKGZhdWx0X3N0YXR1cyAmIEFTX0ZBVUxUU1RBVFVTX0VY
Q0VQVElPTl9DT0RFX01BU0spIHsKCgljYXNlIEFTX0ZBVUxUU1RBVFVTX0VYQ0VQVElPTl9DT0RF
X1RSQU5TTEFUSU9OX0ZBVUxUOgoKWzFdCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9w
YW5mcm9zdC9saW51eC1wYW5mcm9zdC9ibG9iL2E4NjRlNmI5ZmJkMDkzYTAzM2E5MGQ1YmJkZDZk
Y2M3OWEwNjY3YjIvbWFsaV9rYmFzZV9tbXUuYyNMMTA4CgpXaGVyZToKCiNkZWZpbmUgQVNfRkFV
TFRTVEFUVVNfRVhDRVBUSU9OX0NPREVfTUFTSyAgICAgICAgICAgICAgICAgICAgICAoMHg3PDwz
KQojZGVmaW5lIEFTX0ZBVUxUU1RBVFVTX0VYQ0VQVElPTl9DT0RFX1RSQU5TTEFUSU9OX0ZBVUxU
ICAgICAgICAgKDB4MDw8MykKClN0ZXZlCgo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXQgPSBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0X2FkZHIocGZkZXYsIGksIGFkZHIpOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXJldCkgewo+Pgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
