Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B843359
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E737C892DE;
	Thu, 13 Jun 2019 07:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6614B894D4;
 Wed, 12 Jun 2019 09:32:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C99828;
 Wed, 12 Jun 2019 02:32:18 -0700 (PDT)
Received: from c02tf0j2hf1t.cambridge.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6AAD3F246;
 Wed, 12 Jun 2019 02:32:04 -0700 (PDT)
Date: Wed, 12 Jun 2019 10:32:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <20190612093158.GG10165@c02tf0j2hf1t.cambridge.arm.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <d3dc2b1f-e8c9-c60d-f648-0bc9b08f20e4@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3dc2b1f-e8c9-c60d-f648-0bc9b08f20e4@arm.com>
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

SGkgVmluY2Vuem8sCgpPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwNjowOToxMFBNICswMTAwLCBW
aW5jZW56byBGcmFzY2lubyB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5l
bC9wcm9jZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IDM3Njdm
YjIxYTViOC4uNjlkMGJlMWZjNzA4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwv
cHJvY2Vzcy5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+IEBAIC0z
MCw2ICszMCw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gICNpbmNsdWRl
IDxsaW51eC9tbS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zdGRkZWYuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgvc3lzY3RsLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC91c2VyLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gPiBA
QCAtMzIzLDYgKzMyNCw3IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCj4gPiAgCWZwc2ltZF9m
bHVzaF90aHJlYWQoKTsKPiA+ICAJdGxzX3RocmVhZF9mbHVzaCgpOwo+ID4gIAlmbHVzaF9wdHJh
Y2VfaHdfYnJlYWtwb2ludChjdXJyZW50KTsKPiA+ICsJY2xlYXJfdGhyZWFkX2ZsYWcoVElGX1RB
R0dFRF9BRERSKTsKPiAKPiBOaXQ6IGluIGxpbmUgd2UgdGhlIG90aGVyIGZ1bmN0aW9ucyBpbiB0
aHJlYWRfZmx1c2ggd2UgY291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZQo+ICJ0YWdnZWRfYWRkcl90
aHJlYWRfZmx1c2giLCBtYXliZSBpbmxpbmVkLgoKVGhlIG90aGVyIGZ1bmN0aW9ucyBkbyBhIGxv
dCBtb3JlIHRoYW4gY2xlYXJpbmcgYSBUSUYgZmxhZywgc28gdGhleQpkZXNlcnZlZCB0aGVpciBv
d24gcGxhY2UuIFdlIGNvdWxkIGRvIHRoaXMgd2hlbiBhZGRpbmcgTVRFIHN1cHBvcnQuIEkKdGhp
bmsgd2UgYWxzbyBuZWVkIHRvIGNoZWNrIHdoYXQgb3RoZXIgVElGIGZsYWdzIHdlIG1heSBpbmFk
dmVydGVudGx5CnBhc3Mgb24gZXhlY3ZlKCksIG1heWJlIGhhdmUgYSBtYXNrIGNsZWFyaW5nLgoK
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCBiL2luY2x1ZGUvdWFw
aS9saW51eC9wcmN0bC5oCj4gPiBpbmRleCAwOTRiYjAzYjljYzIuLjJlOTI3YjNlOWQ2YyAxMDA2
NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvbGludXgvcHJjdGwuaAo+ID4gQEAgLTIyOSw0ICsyMjksOSBAQCBzdHJ1Y3QgcHJjdGxf
bW1fbWFwIHsKPiA+ICAjIGRlZmluZSBQUl9QQUNfQVBEQktFWQkJCSgxVUwgPDwgMykKPiA+ICAj
IGRlZmluZSBQUl9QQUNfQVBHQUtFWQkJCSgxVUwgPDwgNCkKPiA+ICAKPiA+ICsvKiBUYWdnZWQg
dXNlciBhZGRyZXNzIGNvbnRyb2xzIGZvciBhcm02NCAqLwo+ID4gKyNkZWZpbmUgUFJfU0VUX1RB
R0dFRF9BRERSX0NUUkwJCTU1Cj4gPiArI2RlZmluZSBQUl9HRVRfVEFHR0VEX0FERFJfQ1RSTAkJ
NTYKPiA+ICsjIGRlZmluZSBQUl9UQUdHRURfQUREUl9FTkFCTEUJCSgxVUwgPDwgMCkKPiA+ICsK
PiA+ICAjZW5kaWYgLyogX0xJTlVYX1BSQ1RMX0ggKi8KPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwv
c3lzLmMgYi9rZXJuZWwvc3lzLmMKPiA+IGluZGV4IDI5NjkzMDRjMjlmZS4uZWM0ODM5NmI0OTQz
IDEwMDY0NAo+ID4gLS0tIGEva2VybmVsL3N5cy5jCj4gPiArKysgYi9rZXJuZWwvc3lzLmMKPiA+
IEBAIC0xMjQsNiArMTI0LDEyIEBACj4gPiAgI2lmbmRlZiBQQUNfUkVTRVRfS0VZUwo+ID4gICMg
ZGVmaW5lIFBBQ19SRVNFVF9LRVlTKGEsIGIpCSgtRUlOVkFMKQo+ID4gICNlbmRpZgo+ID4gKyNp
Zm5kZWYgU0VUX1RBR0dFRF9BRERSX0NUUkwKPiA+ICsjIGRlZmluZSBTRVRfVEFHR0VEX0FERFJf
Q1RSTChhKQkoLUVJTlZBTCkKPiA+ICsjZW5kaWYKPiA+ICsjaWZuZGVmIEdFVF9UQUdHRURfQURE
Ul9DVFJMCj4gPiArIyBkZWZpbmUgR0VUX1RBR0dFRF9BRERSX0NUUkwoKQkJKC1FSU5WQUwpCj4g
PiArI2VuZGlmCj4gPiAgCj4gPiAgLyoKPiA+ICAgKiB0aGlzIGlzIHdoZXJlIHRoZSBzeXN0ZW0t
d2lkZSBvdmVyZmxvdyBVSUQgYW5kIEdJRCBhcmUgZGVmaW5lZCwgZm9yCj4gPiBAQCAtMjQ5Miw2
ICsyNDk4LDE2IEBAIFNZU0NBTExfREVGSU5FNShwcmN0bCwgaW50LCBvcHRpb24sIHVuc2lnbmVk
IGxvbmcsIGFyZzIsIHVuc2lnbmVkIGxvbmcsIGFyZzMsCj4gPiAgCQkJcmV0dXJuIC1FSU5WQUw7
Cj4gPiAgCQllcnJvciA9IFBBQ19SRVNFVF9LRVlTKG1lLCBhcmcyKTsKPiA+ICAJCWJyZWFrOwo+
ID4gKwljYXNlIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMOgo+ID4gKwkJaWYgKGFyZzMgfHwgYXJn
NCB8fCBhcmc1KQo+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gKwkJZXJyb3IgPSBTRVRfVEFH
R0VEX0FERFJfQ1RSTChhcmcyKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIFBSX0dFVF9UQUdH
RURfQUREUl9DVFJMOgo+ID4gKwkJaWYgKGFyZzIgfHwgYXJnMyB8fCBhcmc0IHx8IGFyZzUpCj4g
PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCQllcnJvciA9IEdFVF9UQUdHRURfQUREUl9DVFJM
KCk7Cj4gPiArCQlicmVhazsKPiAKPiBXaHkgZG8gd2UgbmVlZCB0d28gcHJjdGwgaGVyZT8gV2Ug
Y291bGQgaGF2ZSBvbmx5IG9uZSBhbmQgdXNlIGFyZzIgYXMgc2V0L2dldAo+IGFuZCBhcmczIGFz
IGEgcGFyYW1ldGVyLiBXaGF0IGRvIHlvdSB0aGluaz8KClRoaXMgZm9sbG93cyB0aGUgb3RoZXIg
UFJfKiBvcHRpb25zLCBlLmcuIFBSX1NFVF9WTC9HRVRfVkwsClBSXypfRlBfTU9ERS4gV2Ugd2ls
bCB1c2Ugb3RoZXIgYml0cyBpbiBhcmcyLCBmb3IgZXhhbXBsZSB0byBzZXQgdGhlCnByZWNpc2Ug
dnMgaW1wcmVjaXNlIE1URSB0cmFwcGluZy4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
