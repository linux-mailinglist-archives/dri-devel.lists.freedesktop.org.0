Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09D43392
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818A189483;
	Thu, 13 Jun 2019 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 979A3895C4;
 Wed, 12 Jun 2019 14:33:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A462B;
 Wed, 12 Jun 2019 07:33:45 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1F953F557;
 Wed, 12 Jun 2019 07:33:39 -0700 (PDT)
Subject: Re: [PATCH v17 05/15] mm, arm64: untag user pointers in mm/gup.c
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <8f65548bef8544d49980a92d221b74440d544c1e.1560339705.git.andreyknvl@google.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <8b74a24e-4fe0-3fdd-e66a-d04c359b6104@arm.com>
Date: Wed, 12 Jun 2019 15:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8f65548bef8544d49980a92d221b74440d544c1e.1560339705.git.andreyknvl@google.com>
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
dHMuCj4gCj4gbW0vZ3VwLmMgcHJvdmlkZXMgYSBrZXJuZWwgaW50ZXJmYWNlIHRoYXQgYWNjZXB0
cyB1c2VyIGFkZHJlc3NlcyBhbmQKPiBtYW5pcHVsYXRlcyB1c2VyIHBhZ2VzIGRpcmVjdGx5IChm
b3IgZXhhbXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1c2VkCj4gYnkgdGhlIGZ1dGV4IHN5
c2NhbGwpLiBTaW5jZSBhIHVzZXIgY2FuIHByb3ZpZGVkIHRhZ2dlZCBhZGRyZXNzZXMsIHdlIG5l
ZWQKPiB0byBoYW5kbGUgdGhpcyBjYXNlLgo+IAo+IEFkZCB1bnRhZ2dpbmcgdG8gZ3VwLmMgZnVu
Y3Rpb25zIHRoYXQgdXNlIHVzZXIgYWRkcmVzc2VzIGZvciB2bWEgbG9va3Vwcy4KPiAKPiBSZXZp
ZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6
IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6
IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgoKPiAtLS0KPiAg
bW0vZ3VwLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggZGRkZTA5N2NmOWU0Li5j
MzdkZjNkNDU1YTIgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBA
IC04MDIsNiArODAyLDggQEAgc3RhdGljIGxvbmcgX19nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gIAlpZiAoIW5yX3BhZ2VzKQo+
ICAJCXJldHVybiAwOwo+ICAKPiArCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+
ICAJVk1fQlVHX09OKCEhcGFnZXMgIT0gISEoZ3VwX2ZsYWdzICYgRk9MTF9HRVQpKTsKPiAgCj4g
IAkvKgo+IEBAIC05NjQsNiArOTY2LDggQEAgaW50IGZpeHVwX3VzZXJfZmF1bHQoc3RydWN0IHRh
c2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICAJc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWE7Cj4gIAl2bV9mYXVsdF90IHJldCwgbWFqb3IgPSAwOwo+ICAKPiArCWFkZHJl
c3MgPSB1bnRhZ2dlZF9hZGRyKGFkZHJlc3MpOwo+ICsKPiAgCWlmICh1bmxvY2tlZCkKPiAgCQlm
YXVsdF9mbGFncyB8PSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZOwo+ICAKPiAKCi0tIApSZWdhcmRz
LApWaW5jZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
