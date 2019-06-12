Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD8433A1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43F98936C;
	Thu, 13 Jun 2019 07:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4999B895C4;
 Wed, 12 Jun 2019 14:28:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFE382B;
 Wed, 12 Jun 2019 07:28:21 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45733F557;
 Wed, 12 Jun 2019 07:28:16 -0700 (PDT)
Subject: Re: [PATCH v17 02/15] lib, arm64: untag user pointers in strn*_user
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <a76c014f9b12a082d31ef1459907cabdab78491e.1560339705.git.andreyknvl@google.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <0bbc5f4f-9812-463c-48c1-4929bef801da@arm.com>
Date: Wed, 12 Jun 2019 15:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a76c014f9b12a082d31ef1459907cabdab78491e.1560339705.git.andreyknvl@google.com>
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
dHMuCj4gCj4gc3RybmNweV9mcm9tX3VzZXIgYW5kIHN0cm5sZW5fdXNlciBhY2NlcHQgdXNlciBh
ZGRyZXNzZXMgYXMgYXJndW1lbnRzLCBhbmQKPiBkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKPiBuZWVkIHRvIGhh
bmRsZSB0aGUgY2FzZSBvZiB0YWdnZWQgdXNlciBhZGRyZXNzZXMgc2VwYXJhdGVseS4KPiAKPiBV
bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCj4gCj4gTm90ZSwg
dGhhdCB0aGlzIHBhdGNoIG9ubHkgdGVtcG9yYXJpbHkgdW50YWdzIHRoZSBwb2ludGVycyB0byBw
ZXJmb3JtCj4gdmFsaWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVy
Zm9ybSB1c2VyIG1lbW9yeSBhY2Nlc3Nlcy4KPiAKPiBSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXog
PGtoYWxpZC5heml6QG9yYWNsZS5jb20+Cj4gQWNrZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8u
ZnJhc2Npbm9AYXJtLmNvbT4KCj4gLS0tCj4gIGxpYi9zdHJuY3B5X2Zyb21fdXNlci5jIHwgMyAr
Ky0KPiAgbGliL3N0cm5sZW5fdXNlci5jICAgICAgfCAzICsrLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL3N0
cm5jcHlfZnJvbV91c2VyLmMgYi9saWIvc3RybmNweV9mcm9tX3VzZXIuYwo+IGluZGV4IDAyM2Jh
OWYzYjk5Zi4uZGNjYjk1YWY2MDAzIDEwMDY0NAo+IC0tLSBhL2xpYi9zdHJuY3B5X2Zyb21fdXNl
ci5jCj4gKysrIGIvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMKPiBAQCAtNiw2ICs2LDcgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+
ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gIAo+
ICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgo+ICAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10
aW1lLmg+Cj4gQEAgLTEwOCw3ICsxMDksNyBAQCBsb25nIHN0cm5jcHlfZnJvbV91c2VyKGNoYXIg
KmRzdCwgY29uc3QgY2hhciBfX3VzZXIgKnNyYywgbG9uZyBjb3VudCkKPiAgCQlyZXR1cm4gMDsK
PiAgCj4gIAltYXhfYWRkciA9IHVzZXJfYWRkcl9tYXgoKTsKPiAtCXNyY19hZGRyID0gKHVuc2ln
bmVkIGxvbmcpc3JjOwo+ICsJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRy
KHNyYyk7Cj4gIAlpZiAobGlrZWx5KHNyY19hZGRyIDwgbWF4X2FkZHIpKSB7Cj4gIAkJdW5zaWdu
ZWQgbG9uZyBtYXggPSBtYXhfYWRkciAtIHNyY19hZGRyOwo+ICAJCWxvbmcgcmV0dmFsOwo+IGRp
ZmYgLS1naXQgYS9saWIvc3Rybmxlbl91c2VyLmMgYi9saWIvc3Rybmxlbl91c2VyLmMKPiBpbmRl
eCA3ZjJkYjNmZTMxMWYuLjI4ZmY1NTRhMWJlOCAxMDA2NDQKPiAtLS0gYS9saWIvc3Rybmxlbl91
c2VyLmMKPiArKysgYi9saWIvc3Rybmxlbl91c2VyLmMKPiBAQCAtMiw2ICsyLDcgQEAKPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gICNp
bmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ICAKPiAg
I2luY2x1ZGUgPGFzbS93b3JkLWF0LWEtdGltZS5oPgo+ICAKPiBAQCAtMTA5LDcgKzExMCw3IEBA
IGxvbmcgc3Rybmxlbl91c2VyKGNvbnN0IGNoYXIgX191c2VyICpzdHIsIGxvbmcgY291bnQpCj4g
IAkJcmV0dXJuIDA7Cj4gIAo+ICAJbWF4X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Cj4gLQlzcmNf
YWRkciA9ICh1bnNpZ25lZCBsb25nKXN0cjsKPiArCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcp
dW50YWdnZWRfYWRkcihzdHIpOwo+ICAJaWYgKGxpa2VseShzcmNfYWRkciA8IG1heF9hZGRyKSkg
ewo+ICAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIgLSBzcmNfYWRkcjsKPiAgCQlsb25n
IHJldHZhbDsKPiAKCi0tIApSZWdhcmRzLApWaW5jZW56bwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
