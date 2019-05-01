Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC61145F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 09:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AFD8928B;
	Thu,  2 May 2019 07:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E930892CF;
 Wed,  1 May 2019 14:43:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8729EA78;
 Wed,  1 May 2019 07:43:26 -0700 (PDT)
Received: from [192.168.1.18] (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 CE1D23F719; Wed,  1 May 2019 07:43:15 -0700 (PDT)
Subject: Re: [PATCH v13 10/20] kernel, arm64: untag user pointers in
 prctl_set_mm*
To: Andrey Konovalov <andreyknvl@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1553093420.git.andreyknvl@google.com>
 <76f96eb9162b3a7fa5949d71af38bf8fdf6924c4.1553093421.git.andreyknvl@google.com>
 <20190322154136.GP13384@arrakis.emea.arm.com>
 <CAAeHK+yHp27eT+wTE3Uy4DkN8XN3ZjHATE+=HgjgRjrHjiXs3Q@mail.gmail.com>
 <20190426145024.GC54863@arrakis.emea.arm.com>
 <CAAeHK+ww=6-fTnHN_33EEiKdMqXq5bNU4oW9oOMcfz1N_+Kisw@mail.gmail.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <c00bde00-3026-7c01-df0e-b374582b5825@arm.com>
Date: Wed, 1 May 2019 15:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAeHK+ww=6-fTnHN_33EEiKdMqXq5bNU4oW9oOMcfz1N_+Kisw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 May 2019 07:42:58 +0000
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
 Chintan Pandya <cpandya@codeaurora.org>, Shuah Khan <shuah@kernel.org>,
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJIGNhbWUgYmFjayBmcm9tIGhv
bGlkYXkgYW5kIHRyeSB0byBjYXRjaCB1cCB3aXRoIHRoZQplbWFpbHMuCgpPbiA0LzI5LzE5IDM6
MjMgUE0sIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gT24gRnJpLCBBcHIgMjYsIDIwMTkgYXQg
NDo1MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiB3cm90ZToK
Pj4KPj4gT24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDY6NDQ6MzRQTSArMDIwMCwgQW5kcmV5IEtv
bm92YWxvdiB3cm90ZToKPj4+IE9uIEZyaSwgTWFyIDIyLCAyMDE5IGF0IDQ6NDEgUE0gQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gV2VkLCBN
YXIgMjAsIDIwMTkgYXQgMDM6NTE6MjRQTSArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pj4+Pj4gQEAgLTIxMjAsMTMgKzIxMzUsMTQgQEAgc3RhdGljIGludCBwcmN0bF9zZXRfbW0oaW50
IG9wdCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+Pj4+PiAgICAgICBpZiAob3B0ID09IFBSX1NFVF9N
TV9BVVhWKQo+Pj4+PiAgICAgICAgICAgICAgIHJldHVybiBwcmN0bF9zZXRfYXV4dihtbSwgYWRk
ciwgYXJnNCk7Cj4+Pj4+Cj4+Pj4+IC0gICAgIGlmIChhZGRyID49IFRBU0tfU0laRSB8fCBhZGRy
IDwgbW1hcF9taW5fYWRkcikKPj4+Pj4gKyAgICAgaWYgKHVudGFnZ2VkX2FkZHIoYWRkcikgPj0g
VEFTS19TSVpFIHx8Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICB1bnRhZ2dlZF9hZGRyKGFk
ZHIpIDwgbW1hcF9taW5fYWRkcikKPj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
Pj4+Pj4KPj4+Pj4gICAgICAgZXJyb3IgPSAtRUlOVkFMOwo+Pj4+Pgo+Pj4+PiAgICAgICBkb3du
X3dyaXRlKCZtbS0+bW1hcF9zZW0pOwo+Pj4+PiAtICAgICB2bWEgPSBmaW5kX3ZtYShtbSwgYWRk
cik7Cj4+Pj4+ICsgICAgIHZtYSA9IGZpbmRfdm1hKG1tLCB1bnRhZ2dlZF9hZGRyKGFkZHIpKTsK
Pj4+Pj4KPj4+Pj4gICAgICAgcHJjdGxfbWFwLnN0YXJ0X2NvZGUgICAgPSBtbS0+c3RhcnRfY29k
ZTsKPj4+Pj4gICAgICAgcHJjdGxfbWFwLmVuZF9jb2RlICAgICAgPSBtbS0+ZW5kX2NvZGU7Cj4+
Pj4KPj4+PiBEb2VzIHRoaXMgbWVhbiB0aGF0IHdlIGFyZSBsZWZ0IHdpdGggdGFnZ2VkIGFkZHJl
c3NlcyBmb3IgdGhlCj4+Pj4gbW0tPnN0YXJ0X2NvZGUgZXRjLiB2YWx1ZXM/IEkgcmVhbGx5IGRv
bid0IHRoaW5rIHdlIHNob3VsZCBhbGxvdyB0aGlzLAo+Pj4+IEknbSBub3Qgc3VyZSB3aGF0IHRo
ZSBpbXBsaWNhdGlvbnMgYXJlIGluIG90aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwuCj4+Pj4KPj4+
PiBBcmd1YWJseSwgdGhlc2UgYXJlIG5vdCBldmVuIHBvaW50ZXIgdmFsdWVzIGJ1dCBzb21lIGFk
ZHJlc3MgcmFuZ2VzLiBJCj4+Pj4ga25vdyB3ZSBkZWNpZGVkIHRvIHJlbGF4IHRoaXMgbm90aW9u
IGZvciBtbWFwL21wcm90ZWN0L21hZHZpc2UoKSBzaW5jZQo+Pj4+IHRoZSB1c2VyIGZ1bmN0aW9u
IHByb3RvdHlwZXMgdGFrZSBwb2ludGVyIGFzIGFyZ3VtZW50cyBidXQgaXQgZmVlbHMgbGlrZQo+
Pj4+IHdlIGFyZSBvdmVyZG9pbmcgaXQgaGVyZSAoc3RydWN0IHByY3RsX21tX21hcCBkb2Vzbid0
IGV2ZW4gaGF2ZQo+Pj4+IHBvaW50ZXJzKS4KPj4+Pgo+Pj4+IFdoYXQgaXMgdGhlIHVzZS1jYXNl
IGZvciBhbGxvd2luZyB0YWdnZWQgYWRkcmVzc2VzIGhlcmU/IENhbiB1c2VyIHNwYWNlCj4+Pj4g
aGFuZGxlIHVudGFnZ2luZz8KPj4+Cj4+PiBJIGRvbid0IGtub3cgYW55IHVzZSBjYXNlcyBmb3Ig
dGhpcy4gSSBkaWQgaXQgYmVjYXVzZSBpdCBzZWVtcyB0byBiZQo+Pj4gY292ZXJlZCBieSB0aGUg
cmVsYXhlZCBBQkkuIEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHRvIGRvIGhlcmUsCj4+PiBz
aG91bGQgSSBqdXN0IGRyb3AgdGhpcyBwYXRjaD8KPj4KPj4gSWYgd2UgYWxsb3cgdGFnZ2VkIGFk
ZHJlc3NlcyB0byBiZSBwYXNzZWQgaGVyZSwgd2UnZCBoYXZlIHRvIHVudGFnIHRoZW0KPj4gYmVm
b3JlIHRoZXkgZW5kIHVwIGluIHRoZSBtbS0+c3RhcnRfY29kZSBldGMuIG1lbWJlcnMuCj4+Cj4+
IEkga25vdyB3ZSBhcmUgdHJ5aW5nIHRvIHJlbGF4IHRoZSBBQkkgaGVyZSB3LnIudC4gYWRkcmVz
cyByYW5nZXMgYnV0Cj4+IG1vc3RseSBiZWNhdXNlIHdlIGNvdWxkbid0IGZpZ3VyZSBvdXQgYSB3
YXkgdG8gZG9jdW1lbnQgdW5hbWJpZ3VvdXNseQo+PiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGEg
dXNlciBwb2ludGVyIHRoYXQgbWF5IGJlIGRlcmVmZXJlbmNlZCBieSB0aGUKPj4ga2VybmVsICh0
YWdzIGFsbG93ZWQpIGFuZCBhbiBhZGRyZXNzIHR5cGljYWxseSB1c2VkIGZvciBtYW5hZ2luZyB0
aGUKPj4gYWRkcmVzcyBzcGFjZSBsYXlvdXQuIFN1Z2dlc3Rpb25zIHdlbGNvbWVkLgo+Pgo+PiBJ
J2Qgc2F5IGp1c3QgZHJvcCB0aGlzIHBhdGNoIGFuZCBjYXB0dXJlIGl0IGluIHRoZSBBQkkgZG9j
dW1lbnQuCj4gCj4gT0ssIHdpbGwgZG8gaW4gdjE0Lgo+IAo+IFZpbmNlbnpvLCBjb3VsZCB5b3Ug
YWRkIGEgbm90ZSBhYm91dCB0aGlzIGludG8gdG91ciBwYXRjaHNldD8KPgoKT2ssIEkgd2lsbCBh
ZGQgYSBub3RlIHRoYXQgY292ZXJzIHRoaXMgY2FzZSBpbiB2MyBvZiBteSBkb2N1bWVudC4KCj4+
Cj4+IC0tCj4+IENhdGFsaW4KCi0tIApSZWdhcmRzLApWaW5jZW56bwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
