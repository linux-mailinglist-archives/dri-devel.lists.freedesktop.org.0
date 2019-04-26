Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0537DCD6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF045891CC;
	Mon, 29 Apr 2019 07:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6482489307;
 Fri, 26 Apr 2019 14:50:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E922A80D;
 Fri, 26 Apr 2019 07:50:35 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D44B83F5C1; Fri, 26 Apr 2019 07:50:27 -0700 (PDT)
Date: Fri, 26 Apr 2019 15:50:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v13 10/20] kernel, arm64: untag user pointers in
 prctl_set_mm*
Message-ID: <20190426145024.GC54863@arrakis.emea.arm.com>
References: <cover.1553093420.git.andreyknvl@google.com>
 <76f96eb9162b3a7fa5949d71af38bf8fdf6924c4.1553093421.git.andreyknvl@google.com>
 <20190322154136.GP13384@arrakis.emea.arm.com>
 <CAAeHK+yHp27eT+wTE3Uy4DkN8XN3ZjHATE+=HgjgRjrHjiXs3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+yHp27eT+wTE3Uy4DkN8XN3ZjHATE+=HgjgRjrHjiXs3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Eric Dumazet <edumazet@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Lee Smith <Lee.Smith@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 netdev <netdev@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDY6NDQ6MzRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBGcmksIE1hciAyMiwgMjAxOSBhdCA0OjQxIFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gV2VkLCBNYXIgMjAsIDIw
MTkgYXQgMDM6NTE6MjRQTSArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gQEAg
LTIxMjAsMTMgKzIxMzUsMTQgQEAgc3RhdGljIGludCBwcmN0bF9zZXRfbW0oaW50IG9wdCwgdW5z
aWduZWQgbG9uZyBhZGRyLAo+ID4gPiAgICAgICBpZiAob3B0ID09IFBSX1NFVF9NTV9BVVhWKQo+
ID4gPiAgICAgICAgICAgICAgIHJldHVybiBwcmN0bF9zZXRfYXV4dihtbSwgYWRkciwgYXJnNCk7
Cj4gPiA+Cj4gPiA+IC0gICAgIGlmIChhZGRyID49IFRBU0tfU0laRSB8fCBhZGRyIDwgbW1hcF9t
aW5fYWRkcikKPiA+ID4gKyAgICAgaWYgKHVudGFnZ2VkX2FkZHIoYWRkcikgPj0gVEFTS19TSVpF
IHx8Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB1bnRhZ2dlZF9hZGRyKGFkZHIpIDwgbW1h
cF9taW5fYWRkcikKPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4KPiA+
ID4gICAgICAgZXJyb3IgPSAtRUlOVkFMOwo+ID4gPgo+ID4gPiAgICAgICBkb3duX3dyaXRlKCZt
bS0+bW1hcF9zZW0pOwo+ID4gPiAtICAgICB2bWEgPSBmaW5kX3ZtYShtbSwgYWRkcik7Cj4gPiA+
ICsgICAgIHZtYSA9IGZpbmRfdm1hKG1tLCB1bnRhZ2dlZF9hZGRyKGFkZHIpKTsKPiA+ID4KPiA+
ID4gICAgICAgcHJjdGxfbWFwLnN0YXJ0X2NvZGUgICAgPSBtbS0+c3RhcnRfY29kZTsKPiA+ID4g
ICAgICAgcHJjdGxfbWFwLmVuZF9jb2RlICAgICAgPSBtbS0+ZW5kX2NvZGU7Cj4gPgo+ID4gRG9l
cyB0aGlzIG1lYW4gdGhhdCB3ZSBhcmUgbGVmdCB3aXRoIHRhZ2dlZCBhZGRyZXNzZXMgZm9yIHRo
ZQo+ID4gbW0tPnN0YXJ0X2NvZGUgZXRjLiB2YWx1ZXM/IEkgcmVhbGx5IGRvbid0IHRoaW5rIHdl
IHNob3VsZCBhbGxvdyB0aGlzLAo+ID4gSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGltcGxpY2F0aW9u
cyBhcmUgaW4gb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbC4KPiA+Cj4gPiBBcmd1YWJseSwgdGhl
c2UgYXJlIG5vdCBldmVuIHBvaW50ZXIgdmFsdWVzIGJ1dCBzb21lIGFkZHJlc3MgcmFuZ2VzLiBJ
Cj4gPiBrbm93IHdlIGRlY2lkZWQgdG8gcmVsYXggdGhpcyBub3Rpb24gZm9yIG1tYXAvbXByb3Rl
Y3QvbWFkdmlzZSgpIHNpbmNlCj4gPiB0aGUgdXNlciBmdW5jdGlvbiBwcm90b3R5cGVzIHRha2Ug
cG9pbnRlciBhcyBhcmd1bWVudHMgYnV0IGl0IGZlZWxzIGxpa2UKPiA+IHdlIGFyZSBvdmVyZG9p
bmcgaXQgaGVyZSAoc3RydWN0IHByY3RsX21tX21hcCBkb2Vzbid0IGV2ZW4gaGF2ZQo+ID4gcG9p
bnRlcnMpLgo+ID4KPiA+IFdoYXQgaXMgdGhlIHVzZS1jYXNlIGZvciBhbGxvd2luZyB0YWdnZWQg
YWRkcmVzc2VzIGhlcmU/IENhbiB1c2VyIHNwYWNlCj4gPiBoYW5kbGUgdW50YWdnaW5nPwo+IAo+
IEkgZG9uJ3Qga25vdyBhbnkgdXNlIGNhc2VzIGZvciB0aGlzLiBJIGRpZCBpdCBiZWNhdXNlIGl0
IHNlZW1zIHRvIGJlCj4gY292ZXJlZCBieSB0aGUgcmVsYXhlZCBBQkkuIEknbSBub3QgZW50aXJl
bHkgc3VyZSB3aGF0IHRvIGRvIGhlcmUsCj4gc2hvdWxkIEkganVzdCBkcm9wIHRoaXMgcGF0Y2g/
CgpJZiB3ZSBhbGxvdyB0YWdnZWQgYWRkcmVzc2VzIHRvIGJlIHBhc3NlZCBoZXJlLCB3ZSdkIGhh
dmUgdG8gdW50YWcgdGhlbQpiZWZvcmUgdGhleSBlbmQgdXAgaW4gdGhlIG1tLT5zdGFydF9jb2Rl
IGV0Yy4gbWVtYmVycy4KCkkga25vdyB3ZSBhcmUgdHJ5aW5nIHRvIHJlbGF4IHRoZSBBQkkgaGVy
ZSB3LnIudC4gYWRkcmVzcyByYW5nZXMgYnV0Cm1vc3RseSBiZWNhdXNlIHdlIGNvdWxkbid0IGZp
Z3VyZSBvdXQgYSB3YXkgdG8gZG9jdW1lbnQgdW5hbWJpZ3VvdXNseQp0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIGEgdXNlciBwb2ludGVyIHRoYXQgbWF5IGJlIGRlcmVmZXJlbmNlZCBieSB0aGUKa2Vy
bmVsICh0YWdzIGFsbG93ZWQpIGFuZCBhbiBhZGRyZXNzIHR5cGljYWxseSB1c2VkIGZvciBtYW5h
Z2luZyB0aGUKYWRkcmVzcyBzcGFjZSBsYXlvdXQuIFN1Z2dlc3Rpb25zIHdlbGNvbWVkLgoKSSdk
IHNheSBqdXN0IGRyb3AgdGhpcyBwYXRjaCBhbmQgY2FwdHVyZSBpdCBpbiB0aGUgQUJJIGRvY3Vt
ZW50LgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
