Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2594336F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D780D89333;
	Thu, 13 Jun 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF10089339;
 Wed, 12 Jun 2019 11:52:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78BEC28;
 Wed, 12 Jun 2019 04:52:55 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E9883F246;
 Wed, 12 Jun 2019 04:54:33 -0700 (PDT)
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <d3dc2b1f-e8c9-c60d-f648-0bc9b08f20e4@arm.com>
 <20190612093158.GG10165@c02tf0j2hf1t.cambridge.arm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <c760f34a-1b99-17bb-8cc8-ea8b0d63fe90@arm.com>
Date: Wed, 12 Jun 2019 12:52:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612093158.GG10165@c02tf0j2hf1t.cambridge.arm.com>
Content-Language: en-US
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
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

SGkgQ2F0YWxpbiwKCk9uIDEyLzA2LzIwMTkgMTA6MzIsIENhdGFsaW4gTWFyaW5hcyB3cm90ZToK
PiBIaSBWaW5jZW56bywKPiAKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwNjowOToxMFBNICsw
MTAwLCBWaW5jZW56byBGcmFzY2lubyB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPj4+IGluZGV4
IDM3NjdmYjIxYTViOC4uNjlkMGJlMWZjNzA4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9r
ZXJuZWwvcHJvY2Vzcy5jCj4+PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPj4+
IEBAIC0zMCw2ICszMCw3IEBACj4+PiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4gICNp
bmNsdWRlIDxsaW51eC9tbS5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9zdGRkZWYuaD4KPj4+ICsj
aW5jbHVkZSA8bGludXgvc3lzY3RsLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgo+
Pj4gICNpbmNsdWRlIDxsaW51eC91c2VyLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
Cj4+PiBAQCAtMzIzLDYgKzMyNCw3IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCj4+PiAgCWZw
c2ltZF9mbHVzaF90aHJlYWQoKTsKPj4+ICAJdGxzX3RocmVhZF9mbHVzaCgpOwo+Pj4gIAlmbHVz
aF9wdHJhY2VfaHdfYnJlYWtwb2ludChjdXJyZW50KTsKPj4+ICsJY2xlYXJfdGhyZWFkX2ZsYWco
VElGX1RBR0dFRF9BRERSKTsKPj4KPj4gTml0OiBpbiBsaW5lIHdlIHRoZSBvdGhlciBmdW5jdGlv
bnMgaW4gdGhyZWFkX2ZsdXNoIHdlIGNvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UKPj4gInRhZ2dl
ZF9hZGRyX3RocmVhZF9mbHVzaCIsIG1heWJlIGlubGluZWQuCj4gCj4gVGhlIG90aGVyIGZ1bmN0
aW9ucyBkbyBhIGxvdCBtb3JlIHRoYW4gY2xlYXJpbmcgYSBUSUYgZmxhZywgc28gdGhleQo+IGRl
c2VydmVkIHRoZWlyIG93biBwbGFjZS4gV2UgY291bGQgZG8gdGhpcyB3aGVuIGFkZGluZyBNVEUg
c3VwcG9ydC4gSQo+IHRoaW5rIHdlIGFsc28gbmVlZCB0byBjaGVjayB3aGF0IG90aGVyIFRJRiBm
bGFncyB3ZSBtYXkgaW5hZHZlcnRlbnRseQo+IHBhc3Mgb24gZXhlY3ZlKCksIG1heWJlIGhhdmUg
YSBtYXNrIGNsZWFyaW5nLgo+IAoKQWdyZWVkLiBBbGwgdGhlIGNvbW1lbnRzIEkgcHJvdmlkZWQg
YXJlIG1lYW50IHRvIHNpbXBsaWZ5IHRoZSBhZGRpdGlvbiBvZiBNVEUKc3VwcG9ydC4KCj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggYi9pbmNsdWRlL3VhcGkvbGlu
dXgvcHJjdGwuaAo+Pj4gaW5kZXggMDk0YmIwM2I5Y2MyLi4yZTkyN2IzZTlkNmMgMTAwNjQ0Cj4+
PiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAo+Pj4gKysrIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ByY3RsLmgKPj4+IEBAIC0yMjksNCArMjI5LDkgQEAgc3RydWN0IHByY3RsX21tX21h
cCB7Cj4+PiAgIyBkZWZpbmUgUFJfUEFDX0FQREJLRVkJCQkoMVVMIDw8IDMpCj4+PiAgIyBkZWZp
bmUgUFJfUEFDX0FQR0FLRVkJCQkoMVVMIDw8IDQpCj4+PiAgCj4+PiArLyogVGFnZ2VkIHVzZXIg
YWRkcmVzcyBjb250cm9scyBmb3IgYXJtNjQgKi8KPj4+ICsjZGVmaW5lIFBSX1NFVF9UQUdHRURf
QUREUl9DVFJMCQk1NQo+Pj4gKyNkZWZpbmUgUFJfR0VUX1RBR0dFRF9BRERSX0NUUkwJCTU2Cj4+
PiArIyBkZWZpbmUgUFJfVEFHR0VEX0FERFJfRU5BQkxFCQkoMVVMIDw8IDApCj4+PiArCj4+PiAg
I2VuZGlmIC8qIF9MSU5VWF9QUkNUTF9IICovCj4+PiBkaWZmIC0tZ2l0IGEva2VybmVsL3N5cy5j
IGIva2VybmVsL3N5cy5jCj4+PiBpbmRleCAyOTY5MzA0YzI5ZmUuLmVjNDgzOTZiNDk0MyAxMDA2
NDQKPj4+IC0tLSBhL2tlcm5lbC9zeXMuYwo+Pj4gKysrIGIva2VybmVsL3N5cy5jCj4+PiBAQCAt
MTI0LDYgKzEyNCwxMiBAQAo+Pj4gICNpZm5kZWYgUEFDX1JFU0VUX0tFWVMKPj4+ICAjIGRlZmlu
ZSBQQUNfUkVTRVRfS0VZUyhhLCBiKQkoLUVJTlZBTCkKPj4+ICAjZW5kaWYKPj4+ICsjaWZuZGVm
IFNFVF9UQUdHRURfQUREUl9DVFJMCj4+PiArIyBkZWZpbmUgU0VUX1RBR0dFRF9BRERSX0NUUkwo
YSkJKC1FSU5WQUwpCj4+PiArI2VuZGlmCj4+PiArI2lmbmRlZiBHRVRfVEFHR0VEX0FERFJfQ1RS
TAo+Pj4gKyMgZGVmaW5lIEdFVF9UQUdHRURfQUREUl9DVFJMKCkJCSgtRUlOVkFMKQo+Pj4gKyNl
bmRpZgo+Pj4gIAo+Pj4gIC8qCj4+PiAgICogdGhpcyBpcyB3aGVyZSB0aGUgc3lzdGVtLXdpZGUg
b3ZlcmZsb3cgVUlEIGFuZCBHSUQgYXJlIGRlZmluZWQsIGZvcgo+Pj4gQEAgLTI0OTIsNiArMjQ5
OCwxNiBAQCBTWVNDQUxMX0RFRklORTUocHJjdGwsIGludCwgb3B0aW9uLCB1bnNpZ25lZCBsb25n
LCBhcmcyLCB1bnNpZ25lZCBsb25nLCBhcmczLAo+Pj4gIAkJCXJldHVybiAtRUlOVkFMOwo+Pj4g
IAkJZXJyb3IgPSBQQUNfUkVTRVRfS0VZUyhtZSwgYXJnMik7Cj4+PiAgCQlicmVhazsKPj4+ICsJ
Y2FzZSBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTDoKPj4+ICsJCWlmIChhcmczIHx8IGFyZzQgfHwg
YXJnNSkKPj4+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPj4+ICsJCWVycm9yID0gU0VUX1RBR0dFRF9B
RERSX0NUUkwoYXJnMik7Cj4+PiArCQlicmVhazsKPj4+ICsJY2FzZSBQUl9HRVRfVEFHR0VEX0FE
RFJfQ1RSTDoKPj4+ICsJCWlmIChhcmcyIHx8IGFyZzMgfHwgYXJnNCB8fCBhcmc1KQo+Pj4gKwkJ
CXJldHVybiAtRUlOVkFMOwo+Pj4gKwkJZXJyb3IgPSBHRVRfVEFHR0VEX0FERFJfQ1RSTCgpOwo+
Pj4gKwkJYnJlYWs7Cj4+Cj4+IFdoeSBkbyB3ZSBuZWVkIHR3byBwcmN0bCBoZXJlPyBXZSBjb3Vs
ZCBoYXZlIG9ubHkgb25lIGFuZCB1c2UgYXJnMiBhcyBzZXQvZ2V0Cj4+IGFuZCBhcmczIGFzIGEg
cGFyYW1ldGVyLiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKPiBUaGlzIGZvbGxvd3MgdGhlIG90aGVy
IFBSXyogb3B0aW9ucywgZS5nLiBQUl9TRVRfVkwvR0VUX1ZMLAo+IFBSXypfRlBfTU9ERS4gV2Ug
d2lsbCB1c2Ugb3RoZXIgYml0cyBpbiBhcmcyLCBmb3IgZXhhbXBsZSB0byBzZXQgdGhlCj4gcHJl
Y2lzZSB2cyBpbXByZWNpc2UgTVRFIHRyYXBwaW5nLgo+IAoKSW5kZWVkLiBJIHdhcyBub3QgcXVl
c3Rpb25pbmcgdGhlIHByZS1leGlzdGluZyBpbnRlcmZhY2UgZGVmaW5pdGlvbiwgYnV0IHRyeWlu
Zwptb3JlIHRvIHJlZHVjZSB0aGUgY2hhbmdlcyB0byB0aGUgQUJJIHRvIHRoZSBtaW5pbXVtIHNp
bmNlOgogLSBwcmN0bCBkb2VzIG5vdCBtYW5kYXRlIGhvdyB0byB1c2UgdGhlIGFyZ1syLTVdCiAt
IHByY3RsIGludGVyZmFjZSBpcyBmbGV4aWJsZSBlbm91Z2ggZm9yIHRoZSBwcm9ibGVtIHRvIGJl
IHNvbHZlZCB3aXRoIG9ubHkgb25lCiAgIFBSXyBjb21tYW5kLgoKSSBhZ3JlZSBvbiByZXVzaW5n
IHRoZSBpbnRlcmZhY2UgZm9yIE1URSBmb3IgdGhlIHB1cnBvc2VzIHlvdSBzcGVjaWZpZWQuCgot
LSAKUmVnYXJkcywKVmluY2Vuem8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
