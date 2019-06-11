Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6441CEE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7CE88F1E;
	Wed, 12 Jun 2019 06:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2592B8910E;
 Tue, 11 Jun 2019 17:39:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF6D337;
 Tue, 11 Jun 2019 10:39:11 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B7793F73C;
 Tue, 11 Jun 2019 10:39:06 -0700 (PDT)
Date: Tue, 11 Jun 2019 18:39:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <20190611173903.4icrfmoyfvms35cy@mbp>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <CAAeHK+z5nSOOaGfehETzznNcMq5E5U+Eb1rZE16UVsT8FWT0Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+z5nSOOaGfehETzznNcMq5E5U+Eb1rZE16UVsT8FWT0Vg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDc6MDk6NDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCA0OjU3IFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDEw
LCAyMDE5IGF0IDA2OjUzOjI3UE0gKzAxMDAsIENhdGFsaW4gTWFyaW5hcyB3cm90ZToKPiA+ID4g
T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNj
ZXNzLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gPiA+IGluZGV4IGU1
ZDVmMzFjNmQzNi4uOTE2NGVjYjVmZWNhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS91YWNjZXNzLmgKPiA+ID4gPiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2ln
bmVkIGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9u
ZyBzaQo+ID4gPiA+ICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAt
I2RlZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6ZSkgICAgICBfX3JhbmdlX29rKGFkZHIsIHNpemUp
Cj4gPiA+ID4gKyNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUpICAgICAgX19yYW5nZV9vayh1
bnRhZ2dlZF9hZGRyKGFkZHIpLCBzaXplKQo+ID4gPgo+ID4gPiBJJ20gZ29pbmcgdG8gcHJvcG9z
ZSBhbiBvcHQtaW4gbWV0aG9kIGhlcmUgKFJGQyBmb3Igbm93KS4gV2UgY2FuJ3QgaGF2ZQo+ID4g
PiBhIGNoZWNrIGluIHVudGFnZ2VkX2FkZHIoKSBzaW5jZSB0aGlzIGlzIGFscmVhZHkgdXNlZCB0
aHJvdWdob3V0IHRoZQo+ID4gPiBrZXJuZWwgZm9yIGJvdGggdXNlciBhbmQga2VybmVsIGFkZHJl
c3NlcyAoa2h3YXNhbikgYnV0IHdlIGNhbiBhZGQgb25lCj4gPiA+IGluIF9fcmFuZ2Vfb2soKS4g
VGhlIHNhbWUgcHJjdGwoKSBvcHRpb24gd2lsbCBiZSB1c2VkIGZvciBjb250cm9sbGluZwo+ID4g
PiB0aGUgcHJlY2lzZS9pbXByZWNpc2UgbW9kZSBvZiBNVEUgbGF0ZXIgb24uIFdlIGNhbiB1c2Ug
YSBUSUZfIGZsYWcgaGVyZQo+ID4gPiBhc3N1bWluZyB0aGF0IHRoaXMgd2lsbCBiZSBjYWxsZWQg
ZWFybHkgb24gYW5kIGFueSBjbG9uZWQgdGhyZWFkIHdpbGwKPiA+ID4gaW5oZXJpdCB0aGlzLgo+
ID4KPiA+IFVwZGF0ZWQgcGF0Y2gsIGlubGluaW5nIGl0IGJlbG93LiBPbmNlIHdlIGFncmVlZCBv
biB0aGUgYXBwcm9hY2gsIEkKPiA+IHRoaW5rIEFuZHJleSBjYW4gaW5zZXJ0IGluIGluIHRoaXMg
c2VyaWVzLCBwcm9iYWJseSBhZnRlciBwYXRjaCAyLiBUaGUKPiA+IGRpZmZlcmVuY2VzIGZyb20g
dGhlIG9uZSBJIHBvc3RlZCB5ZXN0ZXJkYXk6Cj4gPgo+ID4gLSByZW5hbWVkIFBSXyogbWFjcm9z
IHRvZ2V0aGVyIHdpdGggZ2V0L3NldCB2YXJpYW50cyBhbmQgdGhlIHBvc3NpYmlsaXR5Cj4gPiAg
IHRvIGRpc2FibGUgdGhlIHJlbGF4ZWQgQUJJCj4gPgo+ID4gLSBzeXNjdGwgb3B0aW9uIC0gL3By
b2Mvc3lzL2FiaS90YWdnZWRfYWRkciB0byBkaXNhYmxlIHRoZSBBQkkgZ2xvYmFsbHkKPiA+ICAg
KGp1c3QgdGhlIHByY3RsKCkgb3B0LWluLCB0YXNrcyBhbHJlYWR5IHVzaW5nIGl0IHdvbid0IGJl
IGFmZmVjdGVkKQo+ID4KPiA+IEFuZCwgb2YgY291cnNlLCBpdCBuZWVkcyBtb3JlIHRlc3Rpbmcu
Cj4gCj4gU3VyZSwgSSdsbCBhZGQgaXQgdG8gdGhlIHNlcmllcy4KPiAKPiBTaG91bGQgSSBkcm9w
IGFjY2Vzc19vaygpIGNoYW5nZSBmcm9tIG15IHBhdGNoLCBzaW5jZSB5b3VycyBqdXN0IHJldmVy
dHMgaXQ/CgpOb3QgbmVjZXNzYXJ5LCB5b3VyIHBhdGNoIGp1c3QgcmVsYXhlcyB0aGUgQUJJIGZv
ciBhbGwgYXBwcywgbWluZQp0aWdodGVucyBpdC4gWW91IGNvdWxkIGluc3RlYWQgbW92ZSB0aGUg
dW50YWdnaW5nIHRvIF9fcmFuZ2Vfb2soKSBhbmQKcmViYXNlIG15IHBhdGNoIGFjY29yZGluZ2x5
LgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
