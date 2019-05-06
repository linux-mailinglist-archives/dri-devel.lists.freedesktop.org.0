Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554DD15E13
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81189DB8;
	Tue,  7 May 2019 07:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15189115;
 Mon,  6 May 2019 07:48:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5F40AE27;
 Mon,  6 May 2019 07:48:09 +0000 (UTC)
Date: Mon, 6 May 2019 09:48:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: console: hack up console_trylock more
Message-ID: <20190506074809.huawsdaynyci5kwz@pathway.suse.cz>
References: <20190502141643.21080-1-daniel.vetter@ffwll.ch>
 <20190503151437.dc2ty2mnddabrz4r@pathway.suse.cz>
 <CAKMK7uF8AD6033_tJw1Y7VsAXb6OD_syZtG3a-JM2g9eEb-P9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF8AD6033_tJw1Y7VsAXb6OD_syZtG3a-JM2g9eEb-P9g@mail.gmail.com>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uIDIwMTktMDUtMDYgMDk6MTE6MzcsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJp
LCBNYXkgMywgMjAxOSBhdCA1OjE0IFBNIFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPiB3
cm90ZToKPiA+IE9uIFRodSAyMDE5LTA1LTAyIDE2OjE2OjQzLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gPiBjb25zb2xlX3RyeWxvY2ssIGNhbGxlZCBmcm9tIHdpdGhpbiBwcmludGssIGNhbiBi
ZSBjYWxsZWQgZnJvbSBwcmV0dHkKPiA+ID4gbXVjaCBhbnl3aGVyZS4gSW5jbHVkaW5nIHRyeV90
b193YWtlX3VwLiBOb3RlIHRoYXQgdGhpcyBpc24ndCBjb21tb24sCj4gPiA+IHVzdWFsbHkgdGhl
IGJveCBpcyBpbiBwcmV0dHkgYmFkIHNoYXBlIGF0IHRoYXQgcG9pbnQgYWxyZWFkeS4gQnV0IGl0
Cj4gPiA+IHJlYWxseSBkb2Vzbid0IGhlbHAgd2hlbiB0aGVuIGxvY2tkZXAganVtcHMgaW4gYW5k
IHNwYW1zIHRoZSBsb2dzLAo+ID4gPiBwb3RlbnRpYWxseSBvYnNjdXJpbmcgdGhlIHJlYWwgYmFj
a3RyYWNlIHdlJ3JlIHJlYWxseSBpbnRlcmVzdGVkIGluLgo+ID4gPiBPbmUgY2FzZSBJJ3ZlIHNl
ZW4gKHNsaWdodGx5IHNpbXBsaWZpZWQgYmFja3RyYWNlKToKPiA+ID4KPiA+ID4gIENhbGwgVHJh
Y2U6Cj4gPiA+ICAgPElSUT4KPiA+ID4gICBjb25zb2xlX3RyeWxvY2srMHhlLzB4NjAKPiA+ID4g
ICB2cHJpbnRrX2VtaXQrMHhmMS8weDMyMAo+ID4gPiAgIHByaW50aysweDRkLzB4NjkKPiA+ID4g
ICBfX3dhcm5fcHJpbnRrKzB4NDYvMHg5MAo+ID4gPiAgIG5hdGl2ZV9zbXBfc2VuZF9yZXNjaGVk
dWxlKzB4MmYvMHg0MAo+ID4gPiAgIGNoZWNrX3ByZWVtcHRfY3VycisweDgxLzB4YTAKPiA+ID4g
ICB0dHd1X2RvX3dha2V1cCsweDE0LzB4MjIwCj4gPiA+ICAgdHJ5X3RvX3dha2VfdXArMHgyMTgv
MHg1ZjAKPiA+ID4gICBwb2xsd2FrZSsweDZmLzB4OTAKPiA+ID4gICBjcmVkaXRfZW50cm9weV9i
aXRzKzB4MjA0LzB4MzEwCj4gPiA+ICAgYWRkX2ludGVycnVwdF9yYW5kb21uZXNzKzB4MThmLzB4
MjEwCj4gPiA+ICAgaGFuZGxlX2lycSsweDY3LzB4MTYwCj4gPiA+ICAgZG9fSVJRKzB4NWUvMHgx
MzAKPiA+ID4gICBjb21tb25faW50ZXJydXB0KzB4Zi8weGYKPiA+ID4gICA8L0lSUT4KPiA+ID4K
PiA+ID4gVGhpcyBhbG9uZSBpc24ndCBhIHByb2JsZW0sIGJ1dCB0aGUgc3BpbmxvY2sgaW4gdGhl
IHNlbWFwaG9yZSBpcyBhbHNvCj4gPiA+IHN0aWxsIGhlbGQgd2hpbGUgd2FraW5nIHVwIHdhaXRl
cnMgKHVwKCkgLT4gX191cCgpIC0+IHRyeV90b193YWtlX3VwKCkKPiA+ID4gY2FsbGNoYWluKSwg
d2hpY2ggdGhlbiBjbG9zZXMgdGhlIHJ1bnF1ZXVlIHZzLiBzZW1hcGhvcmUubG9jayBsb29wLAo+
ID4gPiBhbmQgdXBzZXRzIGxvY2tkZXAsIHdoaWNoIGlzc3VlcyBhIGNpcmN1bGFyIGxvY2tpbmcg
c3BsYXQgdG8gZG1lc2cuCj4gPiA+IFdvcnNlIGl0IHVwc2V0cyBkZXZlbG9wZXJzLCBzaW5jZSB3
ZSBkb24ndCB3YW50IHRvIHNwYW0gZG1lc2cgd2l0aAo+ID4gPiBjbHV0dGVyIHdoZW4gdGhlIG1h
Y2hpbmUgaXMgZHlpbmcgYWxyZWFkeS4KPiA+ID4KPiA+ID4gRml4IHRoaXMgYnkgY3JlYXRpbmcg
YSBfX2Rvd25fdHJ5bG9jayB3aGljaCBvbmx5IHRyeWxvY2tzIHRoZQo+ID4gPiBzZW1hcGhvcmUu
bG9jay4gVGhpcyBpc24ndCBjb3JyZWN0IGluIGZ1bGwgZ2VuZXJhbGl0eSwgYnV0IGdvb2QgZW5v
dWdoCj4gPiA+IGZvciBjb25zb2xlX2xvY2s6Cj4gPiA+Cj4gPiA+IC0gdGhlcmUncyBvbmx5IGV2
ZXIgb25lIGNvbnNvbGVfbG9jayBob2xkZXIsIHdlIHdvbid0IGZhaWwgc3B1cmlvdXNseQo+ID4g
PiAgIGJlY2F1c2Ugc29tZW9uZSBpcyBkb2luZyBhIGRvd24oKSBvciB1cCgpIHdoaWxlIHRoZXJl
J3Mgc3RpbGwgcm9vbQo+ID4gPiAgICh1bmxpa2Ugb3RoZXIgc2VtYXBob3JlcyB3aXRoIGNvdW50
ID4gMSkuCj4gPiA+Cj4gPiA+IC0gY29uc29sZV91bmxvY2soKSBoYXMgb25lIG1hc3NpdmUgcmV0
cnkgbG9vcCwgd2hpY2ggd2lsbCBjYXRjaCBhbnlvbmUKPiA+ID4gICB3aG8gcmFjZXMgdGhlIHRy
eWxvY2sgYWdhaW5zdCB0aGUgdXAoKS4gVGhpcyBtYWtlcyBzdXJlIHRoYXQgbm8KPiA+ID4gICBw
cmludGsgbGluZXMgd2lsbCBnZXQgbG9zdC4gTWFraW5nIHRoZSB0cnlsb2NrIG1vcmUgcmFjeSB0
aGVyZWZvcmUKPiA+ID4gICBoYXMgbm8gZnVydGhlciBpbXBhY3QuCj4gPgo+ID4gVG8gYmUgaG9u
ZXN0LCBJIGRvIG5vdCBzZWUgaG93IHRoaXMgY291bGQgc29sdmUgdGhlIHByb2JsZW0uCj4gPgo+
ID4gVGhlIGNpcmN1bGFyIGRlcGVuZGVuY3kgaXMgc3RpbGwgdGhlcmUuIElmIHRoZSBuZXcgX19k
b3duX3RyeWxvY2soKQo+ID4gc3VjY2VlZHMgdGhlbiBjb25zb2xlX3VubG9jaygpIHdpbGwgZ2V0
IGNhbGxlZCBpbiB0aGUgc2FtZSBjb250ZXh0Cj4gPiBhbmQgaXQgd2lsbCBzdGlsbCBuZWVkIHRv
IGNhbGwgdXAoKSAtPiB0cnlfdG9fd2FrZV91cCgpLgo+ID4KPiA+IE5vdGUgdGhhdCB0aGVyZSBh
cmUgbWFueSBvdGhlciBjb25zb2xlX2xvY2soKSBjYWxsZXJzIHRoYXQgbWlnaHQKPiA+IGhhcHBl
biBpbiBwYXJhbGxlbCBhbmQgbWlnaHQgYXBwZWFyIGluIHRoZSB3YWl0IHF1ZXVlLgo+IAo+IEht
IHJpZ2h0LiBJdCdzIHZlcnkgcmFyZSB3ZSBoaXQgdGhpcyBpbiBvdXIgQ0kgYW5kIEkgZG9uJ3Qg
a25vdyBob3cgdG8KPiByZXBybyBvdGhlcndpc2UsIHNvIGp1c3QgdGhyZXcgdGhpcyBvdXQgYXQg
dGhlIHdhbGwgdG8gc2VlIGlmIGl0Cj4gc3RpY2tzLiBJJ2xsIHRyeSBhbmQgY29tZSB1cCB3aXRo
IGEgbmV3IHRyaWNrIHRoZW4uCgpTaW5nbGUgbWVzc2FnZXMgYXJlIHByaW50ZWQgZnJvbSBzY2hl
ZHVsZXIgdmlhIHByaW50a19kZWZlcnJlZCgpLgpXQVJOKCkgbWlnaHQgYmUgc29sdmVkIGJ5IGlu
dHJvZHVjaW5nIHByaW50ayBkZWZlcnJlZCBjb250ZXh0LApzZWUgdGhlIHBlci1jcHUgdmFyaWFi
bGUgcHJpbnRrX2NvbnRleHQuCgpCZXN0IFJlZ2FyZHMsClBldHIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
