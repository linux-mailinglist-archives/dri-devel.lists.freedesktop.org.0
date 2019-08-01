Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E617EEE0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8F46ED1A;
	Fri,  2 Aug 2019 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E5A86E5BB;
 Thu,  1 Aug 2019 12:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8AC1570;
 Thu,  1 Aug 2019 05:38:12 -0700 (PDT)
Received: from [10.1.194.48] (e123572-lin.cambridge.arm.com [10.1.194.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E84103F575;
 Thu,  1 Aug 2019 05:38:07 -0700 (PDT)
Subject: Re: [PATCH v19 02/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Dave Hansen <dave.hansen@intel.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1563904656.git.andreyknvl@google.com>
 <1c05651c53f90d07e98ee4973c2786ccf315db12.1563904656.git.andreyknvl@google.com>
 <7a34470c-73f0-26ac-e63d-161191d4b1e4@intel.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Message-ID: <2b274c6f-6023-8eb8-5a86-507e6000e13d@arm.com>
Date: Thu, 1 Aug 2019 13:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a34470c-73f0-26ac-e63d-161191d4b1e4@intel.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzEvMDcvMjAxOSAxODowNSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gNy8yMy8xOSAxMDo1
OCBBTSwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPj4gK2xvbmcgc2V0X3RhZ2dlZF9hZGRyX2N0
cmwodW5zaWduZWQgbG9uZyBhcmcpCj4+ICt7Cj4+ICsJaWYgKCF0YWdnZWRfYWRkcl9wcmN0bF9h
bGxvd2VkKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwlpZiAoaXNfY29tcGF0X3Rhc2soKSkK
Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJaWYgKGFyZyAmIH5QUl9UQUdHRURfQUREUl9FTkFC
TEUpCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICsJdXBkYXRlX3RocmVhZF9mbGFnKFRJ
Rl9UQUdHRURfQUREUiwgYXJnICYgUFJfVEFHR0VEX0FERFJfRU5BQkxFKTsKPj4gKwo+PiArCXJl
dHVybiAwOwo+PiArfQo+IEluc3RlYWQgb2YgYSBwbGFpbiBlbmFibGUvZGlzYWJsZSwgYSBtb3Jl
IGZsZXhpYmxlIEFCSSB3b3VsZCBiZSB0byBoYXZlCj4gdGhlIHRhZyBtYXNrIGJlIHBhc3NlZCBp
bi4gIFRoYXQgd2F5LCBhbiBpbXBsZW1lbnRhdGlvbiB0aGF0IGhhcyBhCj4gZmxleGlibGUgdGFn
IHNpemUgY2FuIHNlbGVjdCBpdC4gIEl0IGFsc28gZW5zdXJlcyB0aGF0IHVzZXJzcGFjZQo+IGFj
dHVhbGx5IGtub3dzIHdoYXQgdGhlIHRhZyBzaXplIGlzIGFuZCBpc24ndCBzdXJwcmlzZWQgaWYg
YSBoYXJkd2FyZQo+IGltcGxlbWVudGF0aW9uIGNoYW5nZXMgdGhlIHRhZyBzaXplIG9yIHBvc2l0
aW9uLgo+Cj4gQWxzbywgdGhpcyB3aG9sZSBzZXQgZGVhbHMgd2l0aCB0YWdnaW5nL3VudGFnZ2lu
ZywgYnV0IHRoZXJlJ3MgYW4KPiBlZmZlY3RpdmUgbG9zcyBvZiBhZGRyZXNzIHNwYWNlIHdoZW4g
eW91IGRvIHRoaXMuICBJcyB0aGF0IGRlYWx0IHdpdGgKPiBhbnl3aGVyZT8gIEhvdyBkbyB3ZSBl
bnN1cmUgdGhhdCBhbGxvY2F0aW9ucyBkb24ndCBnZXQgcGxhY2VkIGF0IGEKPiB0YWdnZWQgYWRk
cmVzcyBiZWZvcmUgdGhpcyBnZXRzIHR1cm5lZCBvbj8gIFdoZXJlJ3MgdGhhdCBjaGVja2luZz8K
ClRoaXMgcGF0Y2ggc2VyaWVzIG9ubHkgY2hhbmdlcyB3aGF0IGlzIGFsbG93ZWQgb3Igbm90IGF0
IHRoZSBzeXNjYWxsIGludGVyZmFjZS4gSXQgCmRvZXMgbm90IGNoYW5nZSB0aGUgYWRkcmVzcyBz
cGFjZSBzaXplLiBPbiBhcm02NCwgVEJJIChUb3AgQnl0ZSBJZ25vcmUpIGhhcyBhbHdheXMgCmJl
ZW4gZW5hYmxlZCBmb3IgdXNlcnNwYWNlLCBzbyBpdCBoYXMgbmV2ZXIgYmVlbiBwb3NzaWJsZSB0
byB1c2UgdGhlIHVwcGVyIDggYml0cyBvZiAKdXNlciBwb2ludGVycyBmb3IgYWRkcmVzc2luZy4K
CklmIG90aGVyIGFyY2hpdGVjdHVyZXMgd2VyZSB0byBzdXBwb3J0IGEgc2ltaWxhciBmdW5jdGlv
bmFsaXR5LCB0aGVuIEkgYWdyZWUgdGhhdCBhIApjb21tb24gYW5kIG1vcmUgZ2VuZXJpYyBpbnRl
cmZhY2UgKGlmIG5lZWRlZCkgd291bGQgYmUgaGVscGZ1bCwgYnV0IGFzIGl0IHN0YW5kcyB0aGlz
IAppcyBhbiBhcm02NC1zcGVjaWZpYyBwcmN0bCwgYW5kIG9uIGFybTY0IHRoZSBhZGRyZXNzIHRh
ZyBpcyBkZWZpbmVkIGJ5IHRoZSAKYXJjaGl0ZWN0dXJlIGFzIGJpdHMgWzYzOjU2XS4KCktldmlu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
