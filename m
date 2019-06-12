Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94843371
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFF78935C;
	Thu, 13 Jun 2019 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88E1889487;
 Wed, 12 Jun 2019 11:02:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E16528;
 Wed, 12 Jun 2019 04:02:11 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04CA33F246;
 Wed, 12 Jun 2019 04:03:23 -0700 (PDT)
Date: Wed, 12 Jun 2019 12:01:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190612110129.GC28951@C02TF0J2HF1T.local>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
 <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
 <20190604130207.GD15385@ziepe.ca>
 <CAAeHK+xBxDB-OBuzPDcNaTHCNJqu6djHwqoVGSYpxG33w-YR9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xBxDB-OBuzPDcNaTHCNJqu6djHwqoVGSYpxG33w-YR9g@mail.gmail.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDM6MDk6MjZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDM6MDIgUE0gSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDI6NDU6
MzJQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gT24gVHVlLCBKdW4gNCwg
MjAxOSBhdCAyOjI3IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+
ID4gPiBPbiBUdWUsIEp1biAwNCwgMjAxOSBhdCAwMjoxODoxOVBNICswMjAwLCBBbmRyZXkgS29u
b3ZhbG92IHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBKdW4gMywgMjAxOSBhdCA3OjQ2IFBNIEph
c29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBK
dW4gMDMsIDIwMTkgYXQgMDY6NTU6MTRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
PiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVu
ZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4gPiA+ID4gPiA+IHBhc3MgdGFnZ2Vk
IHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBv
dGhlcgo+ID4gPiA+ID4gPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBpYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBwcm92aWRl
ZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAo+ID4gPiA+ID4gPiA+IGUu
Zy4gbWx4NF9nZXRfdW1lbV9tcigpKSwgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFn
Z2VkIHBvaW50ZXJzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVW50YWcgdXNlciBwb2lu
dGVycyBpbiB0aGVzZSBmdW5jdGlvbnMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+
ID4gPiA+ID4gIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyB8IDQgKysrKwo+
ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZl
cmJzX2NtZC5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jCj4gPiA+ID4g
PiA+ID4gaW5kZXggNWEzYTE3ODBjZWVhLi5mODhlZTczM2U2MTcgMTAwNjQ0Cj4gPiA+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jCj4gPiA+ID4gPiA+
ID4gQEAgLTcwOSw2ICs3MDksOCBAQCBzdGF0aWMgaW50IGliX3V2ZXJic19yZWdfbXIoc3RydWN0
IHV2ZXJic19hdHRyX2J1bmRsZSAqYXR0cnMpCj4gPiA+ID4gPiA+ID4gICAgICAgaWYgKHJldCkK
PiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiArICAgICBjbWQuc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKGNtZC5zdGFydCk7Cj4g
PiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICAgICAgIGlmICgoY21kLnN0YXJ0ICYgflBBR0Vf
TUFTSykgIT0gKGNtZC5oY2FfdmEgJiB+UEFHRV9NQVNLKSkKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGZlZWwgbGlr
ZSB3ZSBzaG91bGRuJ3QgdGhhdmUgdG8gZG8gdGhpcyBoZXJlLCBzdXJlbHkgdGhlIGNtZC5zdGFy
dAo+ID4gPiA+ID4gPiBzaG91bGQgZmxvdyB1bm1vZGlmaWVkIHRvIGdldF91c2VyX3BhZ2VzLCBh
bmQgZ3VwIHNob3VsZCB1bnRhZyBpdD8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gaWUsIHRoaXMg
c29ydCBvZiBkaXJlY3Rpb24gZm9yIHRoZSBJQiBjb2RlICh0aGlzIHdvdWxkIGJlIGEgZ2lhbnQK
PiA+ID4gPiA+ID4gcGF0Y2gsIHNvIEkgZGlkbid0IGhhdmUgdGltZSB0byB3cml0ZSBpdCBhbGws
IGJ1dCBJIHRoaW5rIGl0IGlzIG11Y2gKPiA+ID4gPiA+ID4gc2FuZXIpOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IGliX3V2ZXJic19yZWdfbXIoKSBwYXNzZXMgY21kLnN0YXJ0IHRvIG1seDRfZ2V0X3Vt
ZW1fbXIoKSwgd2hpY2ggY2FsbHMKPiA+ID4gPiA+IGZpbmRfdm1hKCksIHdoaWNoIG9ubHkgYWNj
ZXB0cyB1bnRhZ2dlZCBhZGRyZXNzZXMuIENvdWxkIHlvdSBleHBsYWluCj4gPiA+ID4gPiBob3cg
eW91ciBwYXRjaCBoZWxwcz8KPiA+ID4gPgo+ID4gPiA+IFRoYXQgbWx4NCBpcyBqdXN0IGEgJ3dl
aXJkIGR1Y2snLCBpdCBpcyBub3QgdGhlIG5vcm1hbCBmbG93LCBhbmQgSQo+ID4gPiA+IGRvbid0
IHRoaW5rIHRoZSBjb3JlIGNvZGUgc2hvdWxkIGJlIG1ha2luZyBzcGVjaWFsIGNvbnNpZGVyYXRp
b24gZm9yCj4gPiA+ID4gaXQuCj4gPiA+Cj4gPiA+IEhvdyBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxk
IGRvIHVudGFnZ2luZyAob3Igc29tZXRoaW5nIGVsc2UpIHRvIGRlYWwKPiA+ID4gd2l0aCB0aGlz
ICd3ZWlyZCBkdWNrJyBjYXNlPwo+ID4KPiA+IG1seDQgc2hvdWxkIGhhbmRsZSBpdCBhcm91bmQg
dGhlIGNhbGwgdG8gZmluZF92bWEgbGlrZSBvdGhlciBwYXRjaGVzCj4gPiBkbywgaWRlYWxseSBh
cyBwYXJ0IG9mIHRoZSBjYXN0IGZyb20gYSB2b2lkIF9fdXNlciAqIHRvIHRoZSB1bnNpZ25lZAo+
ID4gbG9uZyB0aGF0IGZpbmRfdm1hIG5lZWRzCj4gCj4gU28gZXNzZW50aWFsbHkgd2hhdCB3ZSBo
YWQgYSBmZXcgdmVyc2lvbnMgYWdvCj4gKGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzQvMzAv
Nzg1KSBwbHVzIGNoYW5naW5nIHVuc2lnbmVkIGxvbmdzIHRvCj4gX191c2VyICogYWNyb3NzIGFs
bCBJQiBjb2RlPyBJIHRoaW5rIHRoZSBzZWNvbmQgcGFydCBpcyBzb21ldGhpbmcKPiB0aGF0J3Mg
bm90IHJlbGF0ZWQgdG8gdGhpcyBzZXJpZXMgYW5kIG5lZWRzIHRvIGJlIGRvbmUgc2VwYXJhdGVs
eS4gSQo+IGNhbiBtb3ZlIHVudGFnZ2luZyBiYWNrIHRvIG1seDRfZ2V0X3VtZW1fbXIoKSB0aG91
Z2guCj4gCj4gQ2F0YWxpbiwgeW91J3ZlIGluaXRpYWxseSBhc2tlZCB0byB0byBtb3ZlIHVudGFn
Z2luZyBvdXQgb2YKPiBtbHg0X2dldF91bWVtX21yKCksIGRvIHlvdSBoYXZlIGFueSBjb21tZW50
cyBvbiB0aGlzPwoKSXQncyBmaW5lIGJ5IG1lIGVpdGhlciB3YXkuIE15IG9yaWdpbmFsIHJlYXNv
bmluZyB3YXMgdG8gdW50YWcgdGhpcyBhdAp0aGUgaGlnaGVyIGxldmVsIGFzIHRhZ3MgbWF5IG5v
dCBiZSByZWxldmFudCB0byB0aGUgbWx4NCBjb2RlLiBJZiB0aGF0J3MKd2hhdCBKYXNvbiBwcmVm
ZXJzLCBnbyBmb3IgaXQuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
