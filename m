Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095D1BE31
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 21:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269789229;
	Mon, 13 May 2019 19:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAC3891AC;
 Mon, 13 May 2019 19:49:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF36B4623E;
 Mon, 13 May 2019 19:49:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-22.rdu2.redhat.com [10.10.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E81C183A2;
 Mon, 13 May 2019 19:49:29 +0000 (UTC)
Date: Mon, 13 May 2019 15:49:26 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Message-ID: <20190513194925.GA31365@redhat.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>
 <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 13 May 2019 19:49:31 +0000 (UTC)
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmV3IGNhbiB3ZSBnZXQgdGhpcyAyIGZpeGVzIGxpbmUgdXAgZm9yIDUuMiA/CgpPbiBNb24s
IE1heSAxMywgMjAxOSBhdCAwNzozNjo0NFBNICswMDAwLCBLdWVobGluZywgRmVsaXggd3JvdGU6
Cj4gSGkgSmVyb21lLAo+IAo+IERvIHlvdSB3YW50IG1lIHRvIHB1c2ggdGhlIHBhdGNoZXMgdG8g
eW91ciBicmFuY2g/IE9yIGFyZSB5b3UgZ29pbmcgdG8gCj4gYXBwbHkgdGhlbSB5b3Vyc2VsZj8K
PiAKPiBJcyB5b3VyIGhtbS01LjItdjMgYnJhbmNoIGdvaW5nIHRvIG1ha2UgaXQgaW50byBMaW51
eCA1LjI/IElmIHNvLCBkbyB5b3UgCj4ga25vdyB3aGVuPyBJJ2QgbGlrZSB0byBjb29yZGluYXRl
IHdpdGggRGF2ZSBBaXJsaWUgc28gdGhhdCB3ZSBjYW4gYWxzbyAKPiBnZXQgdGhhdCB1cGRhdGUg
aW50byBhIGRybS1uZXh0IGJyYW5jaCBzb29uLgo+IAo+IEkgc2VlIHRoYXQgTGludXMgbWVyZ2Vk
IERhdmUncyBwdWxsIHJlcXVlc3QgZm9yIExpbnV4IDUuMiwgd2hpY2ggCj4gaW5jbHVkZXMgdGhl
IGZpcnN0IGNoYW5nZXMgaW4gYW1kZ3B1IHVzaW5nIEhNTS4gVGhleSdyZSBjdXJyZW50bHkgYnJv
a2VuIAo+IHdpdGhvdXQgdGhlc2UgdHdvIHBhdGNoZXMuCgpITU0gcGF0Y2ggZG8gbm90IGdvIHRo
cm91Z2ggYW55IGdpdCBicmFuY2ggdGhleSBnbyB0aHJvdWdoIHRoZSBtbW90bQpjb2xsZWN0aW9u
LiBTbyBpdCBpcyBub3Qgc29tZXRoaW5nIHlvdSBjYW4gZWFzaWx5IGNvb3JkaW5hdGUgd2l0aCBk
cm0KYnJhbmNoLgoKQnkgYnJva2VuIGkgZXhwZWN0IHlvdSBtZWFuIHRoYXQgaWYgbnVtYWJhbGFu
Y2UgaGFwcGVucyBpdCBicmVha3MgPwpPciBpdCBtaWdodCBzbGVlcCB3aGVuIHlvdSBhcmUgbm90
IGV4cGVjdGluZyBpdCB0b28gPwoKQ2hlZXJzLApKw6lyw7RtZQoKPiAKPiBUaGFua3MsCj4gIMKg
IEZlbGl4Cj4gCj4gT24gMjAxOS0wNS0xMCA0OjE0IHAubS4sIEplcm9tZSBHbGlzc2Ugd3JvdGU6
Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gPgo+ID4gT24gRnJpLCBNYXkgMTAsIDIw
MTkgYXQgMDc6NTM6MjRQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOgo+ID4+IERvbid0
IHNldCB0aGlzIGZsYWcgYnkgZGVmYXVsdCBpbiBobW1fdm1hX2RvX2ZhdWx0LiBJdCBpcyBzZXQK
PiA+PiBjb25kaXRpb25hbGx5IGp1c3QgYSBmZXcgbGluZXMgYmVsb3cuIFNldHRpbmcgaXQgdW5j
b25kaXRpb25hbGx5Cj4gPj4gY2FuIGxlYWQgdG8gaGFuZGxlX21tX2ZhdWx0IGRvaW5nIGEgbm9u
LWJsb2NraW5nIGZhdWx0LCByZXR1cm5pbmcKPiA+PiAtRUJVU1kgYW5kIHVubG9ja2luZyBtbWFw
X3NlbSB1bmV4cGVjdGVkbHkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlz
c2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+Cj4gPj4gLS0tCj4gPj4gICBtbS9obW0uYyB8IDIg
Ky0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiA+PiBpbmRleCBiNjVj
MjdkNWMxMTkuLjNjNGYxZDYyMjAyZiAxMDA2NDQKPiA+PiAtLS0gYS9tbS9obW0uYwo+ID4+ICsr
KyBiL21tL2htbS5jCj4gPj4gQEAgLTMzOSw3ICszMzksNyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxr
IHsKPiA+PiAgIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVsdChzdHJ1Y3QgbW1fd2FsayAqd2Fs
aywgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJv
b2wgd3JpdGVfZmF1bHQsIHVpbnQ2NF90ICpwZm4pCj4gPj4gICB7Cj4gPj4gLSAgICAgdW5zaWdu
ZWQgaW50IGZsYWdzID0gRkFVTFRfRkxBR19BTExPV19SRVRSWSB8IEZBVUxUX0ZMQUdfUkVNT1RF
Owo+ID4+ICsgICAgIHVuc2lnbmVkIGludCBmbGFncyA9IEZBVUxUX0ZMQUdfUkVNT1RFOwo+ID4+
ICAgICAgICBzdHJ1Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRl
Owo+ID4+ICAgICAgICBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+cmFu
Z2U7Cj4gPj4gICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gd2Fsay0+dm1hOwo+
ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
