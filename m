Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793BE43380
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74FD89364;
	Thu, 13 Jun 2019 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B517895D7;
 Wed, 12 Jun 2019 14:40:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 373762B;
 Wed, 12 Jun 2019 07:40:22 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DE913F557;
 Wed, 12 Jun 2019 07:40:17 -0700 (PDT)
Subject: Re: [PATCH v17 08/15] userfaultfd, arm64: untag user pointers
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <e2f35a0400150594a39d9c3f4b3088601fd5dc30.1560339705.git.andreyknvl@google.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <48893efc-039a-f7e8-19f0-1bd7b188b2c1@arm.com>
Date: Wed, 12 Jun 2019 15:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e2f35a0400150594a39d9c3f4b3088601fd5dc30.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
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
 Felix Kuehling <Felix.Kuehling@amd.com>, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDYvMjAxOSAxMjo0MywgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiBUaGlzIHBhdGNo
IGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBh
bGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNl
dCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCj4gCj4gdXNlcmZhdWx0ZmQgY29kZSB1c2UgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Ig
dm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdmFsaWRhdGVfcmFuZ2UoKS4KPiAKPiBS
ZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBS
ZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoKUmV2aWV3ZWQt
Ynk6IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgoKPiAtLS0K
PiAgZnMvdXNlcmZhdWx0ZmQuYyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9mcy91c2VyZmF1bHRmZC5jIGIvZnMvdXNlcmZhdWx0ZmQuYwo+IGluZGV4IDNiMzAzMDFj
OTBlYy4uMjRkNjhjM2I1ZWUyIDEwMDY0NAo+IC0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKPiArKysg
Yi9mcy91c2VyZmF1bHRmZC5jCj4gQEAgLTEyNjMsMjEgKzEyNjMsMjMgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSB2b2lkIHdha2VfdXNlcmZhdWx0KHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0
eCwKPiAgfQo+ICAKPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgdmFsaWRhdGVfcmFuZ2Uo
c3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gLQkJCQkJICBfX3U2NCBzdGFydCwgX191NjQgbGVuKQo+
ICsJCQkJCSAgX191NjQgKnN0YXJ0LCBfX3U2NCBsZW4pCj4gIHsKPiAgCV9fdTY0IHRhc2tfc2l6
ZSA9IG1tLT50YXNrX3NpemU7Cj4gIAo+IC0JaWYgKHN0YXJ0ICYgflBBR0VfTUFTSykKPiArCSpz
dGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKPiArCj4gKwlpZiAoKnN0YXJ0ICYgflBBR0Vf
TUFTSykKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCWlmIChsZW4gJiB+UEFHRV9NQVNLKQo+ICAJ
CXJldHVybiAtRUlOVkFMOwo+ICAJaWYgKCFsZW4pCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLQlp
ZiAoc3RhcnQgPCBtbWFwX21pbl9hZGRyKQo+ICsJaWYgKCpzdGFydCA8IG1tYXBfbWluX2FkZHIp
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLQlpZiAoc3RhcnQgPj0gdGFza19zaXplKQo+ICsJaWYg
KCpzdGFydCA+PSB0YXNrX3NpemUpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLQlpZiAobGVuID4g
dGFza19zaXplIC0gc3RhcnQpCj4gKwlpZiAobGVuID4gdGFza19zaXplIC0gKnN0YXJ0KQo+ICAJ
CXJldHVybiAtRUlOVkFMOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiBAQCAtMTMyNyw3ICsxMzI5LDcg
QEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4
ICpjdHgsCj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2Uo
bW0sIHVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCwKPiArCXJldCA9IHZhbGlkYXRlX3Jhbmdl
KG1tLCAmdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0LAo+ICAJCQkgICAgIHVmZmRpb19yZWdp
c3Rlci5yYW5nZS5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiBAQCAtMTUxNiw3
ICsxNTE4LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0cnVjdCB1c2Vy
ZmF1bHRmZF9jdHggKmN0eCwKPiAgCWlmIChjb3B5X2Zyb21fdXNlcigmdWZmZGlvX3VucmVnaXN0
ZXIsIGJ1Ziwgc2l6ZW9mKHVmZmRpb191bnJlZ2lzdGVyKSkpCj4gIAkJZ290byBvdXQ7Cj4gIAo+
IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sIHVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAo+ICsJ
cmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKPiAgCQkJ
ICAgICB1ZmZkaW9fdW5yZWdpc3Rlci5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsK
PiBAQCAtMTY2Nyw3ICsxNjY5LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF93YWtlKHN0cnVj
dCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiAgCWlmIChjb3B5X2Zyb21fdXNlcigmdWZmZGlvX3dh
a2UsIGJ1Ziwgc2l6ZW9mKHVmZmRpb193YWtlKSkpCj4gIAkJZ290byBvdXQ7Cj4gIAo+IC0JcmV0
ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193YWtl
Lmxlbik7Cj4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uuc3Rh
cnQsIHVmZmRpb193YWtlLmxlbik7Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gb3V0Owo+ICAKPiBA
QCAtMTcwNyw3ICsxNzA5LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9jb3B5KHN0cnVjdCB1
c2VyZmF1bHRmZF9jdHggKmN0eCwKPiAgCQkJICAgc2l6ZW9mKHVmZmRpb19jb3B5KS1zaXplb2Yo
X19zNjQpKSkKPiAgCQlnb3RvIG91dDsKPiAgCj4gLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgt
Pm1tLCB1ZmZkaW9fY29weS5kc3QsIHVmZmRpb19jb3B5Lmxlbik7Cj4gKwlyZXQgPSB2YWxpZGF0
ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+ICAJ
aWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAgCS8qCj4gQEAgLTE3NjMsNyArMTc2NSw3IEBAIHN0
YXRpYyBpbnQgdXNlcmZhdWx0ZmRfemVyb3BhZ2Uoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4
LAo+ICAJCQkgICBzaXplb2YodWZmZGlvX3plcm9wYWdlKS1zaXplb2YoX19zNjQpKSkKPiAgCQln
b3RvIG91dDsKPiAgCj4gLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCB1ZmZkaW9femVy
b3BhZ2UucmFuZ2Uuc3RhcnQsCj4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZm
ZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAo+ICAJCQkgICAgIHVmZmRpb196ZXJvcGFnZS5yYW5n
ZS5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAKCi0tIApSZWdhcmRzLApWaW5j
ZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
