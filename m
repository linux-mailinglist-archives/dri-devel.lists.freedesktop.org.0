Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC52AD080
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 08:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DFB897F5;
	Tue, 10 Nov 2020 07:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062F897F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 07:30:26 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 940025FFC3;
 Tue, 10 Nov 2020 08:30:16 +0100 (CET)
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in the new page pool
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20201106141003.2535-1-christian.koenig@amd.com>
 <CADnq5_O80mQjQNP_vY5eVsCR8i0UeDVpT0GPQhj6nMjBFjvORg@mail.gmail.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <fcf7a913-dae4-41f4-b7b4-a7ccffe94ff1@free.fr>
Date: Tue, 10 Nov 2020 09:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_O80mQjQNP_vY5eVsCR8i0UeDVpT0GPQhj6nMjBFjvORg@mail.gmail.com>
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
Cc: andy.lavr@gmail.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMTEvMjAyMCAxNzo1NCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+IE9uIEZyaSwgTm92IDYs
IDIwMjAgYXQgOToxMCBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gVGhlIHBvb2wgcGFyYW1ldGVyIGNhbiBiZSBOVUxM
IGlmIHdlIGZyZWUgdGhyb3VnaCB0aGUgc2hyaW5rZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAKPiBEb2VzIHRoaXMg
Zml4Ogo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzEz
NjIKCkl0IGRvZXMhIFNvIHlvdSBjYW4gYWRkIG15OgoKVGVzdGVkLWJ5OiBNYXJ0aW4gUGVyZXMg
PG1hcnRpbi5wZXJlc0BtdXB1Zi5vcmc+CkFja2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5w
ZXJlc0BtdXB1Zi5vcmc+CgpUaGFua3MsCk1hcnRpbgoKPiAKPiBBY2tlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IAo+IAo+IAo+PiAtLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9wb29sLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPj4g
aW5kZXggNDRlYzQxYWE3OGQ2Li4xYjk2NzgwYjQ5ODkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9w
b29sLmMKPj4gQEAgLTEzNSw3ICsxMzUsNyBAQCBzdGF0aWMgdm9pZCB0dG1fcG9vbF9mcmVlX3Bh
Z2Uoc3RydWN0IHR0bV9wb29sICpwb29sLCBlbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmcsCj4+ICAg
ICAgICAgICAgICAgICAgc2V0X3BhZ2VzX3diKHAsIDEgPDwgb3JkZXIpOwo+PiAgICNlbmRpZgo+
Pgo+PiAtICAgICAgIGlmICghcG9vbC0+dXNlX2RtYV9hbGxvYykgewo+PiArICAgICAgIGlmICgh
cG9vbCB8fCAhcG9vbC0+dXNlX2RtYV9hbGxvYykgewo+PiAgICAgICAgICAgICAgICAgIF9fZnJl
ZV9wYWdlcyhwLCBvcmRlcik7Cj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+PiAgICAgICAg
ICB9Cj4+IC0tCj4+IDIuMjUuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
