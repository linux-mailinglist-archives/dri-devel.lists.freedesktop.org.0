Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645194336D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8428889330;
	Thu, 13 Jun 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCC2A891E2;
 Wed, 12 Jun 2019 14:42:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6763C2B;
 Wed, 12 Jun 2019 07:42:04 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF8A33F557;
 Wed, 12 Jun 2019 07:41:58 -0700 (PDT)
Subject: Re: [PATCH v17 14/15] vfio/type1, arm64: untag user pointers in
 vaddr_get_pfn
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <e86d8cd6bd0ade9cce6304594bcaf0c8e7f788b0.1560339705.git.andreyknvl@google.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <b7408e72-aa18-21ef-aa80-76b65cbac7cb@arm.com>
Date: Wed, 12 Jun 2019 15:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e86d8cd6bd0ade9cce6304594bcaf0c8e7f788b0.1560339705.git.andreyknvl@google.com>
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
dHMuCj4gCj4gdmFkZHJfZ2V0X3BmbigpIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Ig
dm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4KPiAKPiBSZXZp
ZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBSZXZp
ZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6
IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgoKPiAtLS0KPiAg
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21t
dV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+IGluZGV4IDNkZGMz
NzVlNzA2My4uNTI4ZTM5YTFjMmRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMKPiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gQEAg
LTM4NCw2ICszODQsOCBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAo+ICAJZG93bl9yZWFkKCZtbS0+bW1hcF9z
ZW0pOwo+ICAKPiArCXZhZGRyID0gdW50YWdnZWRfYWRkcih2YWRkcik7Cj4gKwo+ICAJdm1hID0g
ZmluZF92bWFfaW50ZXJzZWN0aW9uKG1tLCB2YWRkciwgdmFkZHIgKyAxKTsKPiAgCj4gIAlpZiAo
dm1hICYmIHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKPiAKCi0tIApSZWdhcmRzLApWaW5j
ZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
