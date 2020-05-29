Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E51E7D8B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 14:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B856E8E4;
	Fri, 29 May 2020 12:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22EE36E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 12:47:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9113A55D;
 Fri, 29 May 2020 05:47:19 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B2F93F305;
 Fri, 29 May 2020 05:47:17 -0700 (PDT)
Subject: Re: [PATCH 05/15] drm/panfrost: use spinlock instead of atomic
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-6-peron.clem@gmail.com>
 <788ac664-e426-d307-f81e-9632de09887c@arm.com>
 <CAJiuCcemwM-11ZT5+-4JfyTgTRD-_JjWz=HDCme8743M5Epf0g@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <33b045d6-deb9-2c09-3f74-5ca13f4d2e46@arm.com>
Date: Fri, 29 May 2020 13:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcemwM-11ZT5+-4JfyTgTRD-_JjWz=HDCme8743M5Epf0g@mail.gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMDUvMjAyMCAxMzozNSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEhpIFJvYmluLAo+
IAo+IE9uIEZyaSwgMjkgTWF5IDIwMjAgYXQgMTQ6MjAsIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLTA1LTEwIDE3OjU1LCBDbMOpbWVudCBQ
w6lyb24gd3JvdGU6Cj4+PiBDb252ZXJ0IGJ1c3lfY291bnQgdG8gYSBzaW1wbGUgaW50IHByb3Rl
Y3RlZCBieSBzcGlubG9jay4KPj4KPj4gQSBsaXR0bGUgbW9yZSByZWFzb25pbmcgbWlnaHQgYmUg
bmljZS4KPiAKPiBJIGhhdmUgZm9sbG93IHRoZSBtb2RpZmljYXRpb24gcmVxdWVzdGVkIGZvciBs
aW1hIGRldmZyZXEgYW5kIGNsZWFybHkKPiBkb24ndCBoYXZlIGFueSBhcmd1bWVudCB0byBzd2l0
Y2ggdG8gc3BpbmxvY2suCj4gCj4gVGhlIExpbWEgTWFpbnRhaW5lciBhc2tlZCB0byBjaGFuZ2Ug
d2l0aHQgdGhlIGZvbGxvd2luZyByZWFzb24gOgo+ICJCZXR0ZXIgbWFrZSB0aGlzIGNvdW50IGEg
bm9ybWFsIGludCB3aGljaCBpcyBhbHNvIHByb3RlY3RlZCBieSB0aGUgc3BpbmxvY2ssCj4gYmVj
YXVzZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGNhbid0IHByb3RlY3QgYXRvbWljIG9wcyBmb3Ig
c3RhdGUgY2hhbmdlCj4gYW5kIGJ1c3kgaWRsZSBjaGVjayBhbmQgd2UgYXJlIHVzaW5nIHNwaW5s
b2NrIGFscmVhZHkiCj4gCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBl
cm9uLmNsZW1AZ21haWwuY29tPgo+Pj4gLS0tCj4+IFsuLi5dCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKPj4+IGluZGV4IDA2OTdmOGQ1YWEzNC4uZTY2
Mjk5MDBhNjE4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuaAo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuaAo+Pj4gQEAgLTQsNiArNCw3IEBACj4+PiAgICAjaWZuZGVmIF9fUEFORlJPU1Rf
REVWRlJFUV9IX18KPj4+ICAgICNkZWZpbmUgX19QQU5GUk9TVF9ERVZGUkVRX0hfXwo+Pj4KPj4+
ICsjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9rdGlt
ZS5oPgo+Pj4KPj4+ICAgIHN0cnVjdCBkZXZmcmVxOwo+Pj4gQEAgLTE0LDEwICsxNSwxNyBAQCBz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwo+Pj4gICAgc3RydWN0IHBhbmZyb3N0X2RldmZyZXEgewo+
Pj4gICAgICAgIHN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwo+Pj4gICAgICAgIHN0cnVjdCB0aGVy
bWFsX2Nvb2xpbmdfZGV2aWNlICpjb29saW5nOwo+Pj4gKwo+Pj4gICAgICAgIGt0aW1lX3QgYnVz
eV90aW1lOwo+Pj4gICAgICAgIGt0aW1lX3QgaWRsZV90aW1lOwo+Pj4gICAgICAgIGt0aW1lX3Qg
dGltZV9sYXN0X3VwZGF0ZTsKPj4+IC0gICAgIGF0b21pY190IGJ1c3lfY291bnQ7Cj4+PiArICAg
ICBpbnQgYnVzeV9jb3VudDsKPj4+ICsgICAgIC8qCj4+PiArICAgICAgKiBQcm90ZWN0IGJ1c3lf
dGltZSwgaWRsZV90aW1lLCB0aW1lX2xhc3RfdXBkYXRlIGFuZCBidXN5X2NvdW50Cj4+PiArICAg
ICAgKiBiZWNhdXNlIHRoZXNlIGNhbiBiZSB1cGRhdGVkIGNvbmN1cnJlbnRseSwgZm9yIGV4YW1w
bGUgYnkgdGhlIEdQCj4+PiArICAgICAgKiBhbmQgUFAgaW50ZXJydXB0cy4KPj4+ICsgICAgICAq
Lwo+Pgo+PiBOaXQ6IHRoaXMgY29tbWVudCBpcyBjbGVhcmx5IHdyb25nLCBzaW5jZSB3ZSBvbmx5
IGhhdmUgSm9iLCBHUFUgYW5kIE1NVQo+PiBpbnRlcnJ1cHRzIGhlcmUuIEkgZ3Vlc3MgaWYgdGhl
cmUgaXMgYSByYWNlIGl0IHdvdWxkIGJlIGJldHdlZW4KPj4gc3VibWlzc2lvbi9jb21wbGV0aW9u
L3RpbWVvdXQgb24gZGlmZmVyZW50IGpvYiBzbG90cy4KPiAKPiBJdCdzIGNvcHkvcGFzdGUgZnJv
bSBsaW1hIEkgd2lsbCB1cGRhdGUgaXQsCgpMaW1hICgnVXRnYXJkJykgaGFzIHNlcGFyYXRlIHVu
aXRzIGZvciBnZW9tZXRyeSBhbmQgcGl4ZWwgcHJvY2Vzc2luZyAKKEdQL1BQKS4gRm9yIFBhbmZy
b3N0ICgnTWlkZ2FyZCcvJ0JpZnJvc3QnKSB3ZSBkb24ndCBoYXZlIHRoYXQgCnNlcGFyYXRpb24s
IGhvd2V2ZXIgdGhlcmUgYXJlIG11bHRpcGxlIGpvYiBzbG90cy4gd2hpY2ggYXJlIGltcGxlbWVu
dGVkIAphcyBtdWx0aXBsZSBEUk0gc2NoZWR1bGVycy4gU28gdGhlIHNhbWUgZml4IGlzIGFwcHJv
cHJpYXRlLCBidXQgY2xlYXJseSAKSSBtaXNzZWQgdGhpcyBjb21tZW50IGJlY2F1c2UgaXQncyBy
ZWZlcnJpbmcgdG8gR1AvUFAgd2hpY2ggZG9uJ3QgZXhpc3QgCmZvciBNaWRnYXJkL0JpZnJvc3Qu
Cgo+Pgo+PiBHaXZlbiB0aGF0LCBzaG91bGQgdGhpcyBhY3R1YWxseSBiZSBjb25zaWRlcmVkIGEg
Zml4IGZvciA5ZTYyYjg4NWY3MTUKPj4gKCJkcm0vcGFuZnJvc3Q6IFNpbXBsaWZ5IGRldmZyZXEg
dXRpbGlzYXRpb24gdHJhY2tpbmciKT8KPiAKPiBJIGNhbid0IHNheSBpZiBpdCBjYW4gYmUgY29u
c2lkZXJlZCBhcyBhIGZpeCwgSSBkaWRuJ3Qgc2VlIGFueQo+IGltcHJvdmVtZW50IG9uIG15IGJv
YXJkIGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBwYXRjaC4KPiBJJ20gc3RpbGwgZmFjaW5nIHNvbWUg
aXNzdWUgYW5kIGRpZG4ndCBoYXZlIHRpbWUgdG8gZnVsbHkgaW52ZXN0aWdhdGUgaXQuCgpUZWNo
bmljYWxseSB0aGlzIGlzIGEgZml4IC0gdGhlcmUncyBhIHNtYWxsIHJhY2Ugd2hpY2ggY291bGQg
Y2F1c2UgdGhlIApkZXZmcmVxIGluZm9ybWF0aW9uIHRvIGJlY29tZSBjb3JydXB0ZWQuIEhvd2V2
ZXIgaXQgd291bGQgcmVzb2x2ZSBpdHNlbGYgCm9uIHRoZSBuZXh0IGRldmZyZXEgaW50ZXJ2YWwg
d2hlbiBwYW5mcm9zdF9kZXZmcmVxX3Jlc2V0KCkgaXMgY2FsbGVkLiBTbyAKdGhlIGltcGFjdCBp
cyB2ZXJ5IG1pbm9yIChkZXZmcmVxIGdldHMgc29tZSBib2d1cyBmaWd1cmVzKS4gVGhlIAppbXBv
cnRhbnQgdmFyaWFibGUgKGJ1c3lfY291bnQpIHdhcyBhbHJlYWR5IGFuIGF0b21pYyBzbyB3b24n
dCBiZSBhZmZlY3RlZC4KClN0ZXZlCgo+IFRoYW5rcyBmb3IgeW91IHJldmlldywKPiAKPiAKPj4K
Pj4gUm9iaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
