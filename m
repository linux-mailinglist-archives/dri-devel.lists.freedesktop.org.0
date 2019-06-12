Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE643382
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530C689453;
	Thu, 13 Jun 2019 07:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1021E895B9;
 Wed, 12 Jun 2019 14:27:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1BAA2B;
 Wed, 12 Jun 2019 07:27:04 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DCE73F557;
 Wed, 12 Jun 2019 07:26:59 -0700 (PDT)
Subject: Re: [PATCH v17 01/15] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <9ed583c1a3acf014987e3aef12249506c1c69146.1560339705.git.andreyknvl@google.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <52e93b24-3302-e890-5799-6502042ea5c9@arm.com>
Date: Wed, 12 Jun 2019 15:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9ed583c1a3acf014987e3aef12249506c1c69146.1560339705.git.andreyknvl@google.com>
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
dHMuCj4gCj4gY29weV9mcm9tX3VzZXIgKGFuZCBhIGZldyBvdGhlciBzaW1pbGFyIGZ1bmN0aW9u
cykgYXJlIHVzZWQgdG8gY29weSBkYXRhCj4gZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJu
ZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KPiBwcm92aWRlZCBhIHRh
Z2dlZCBwb2ludGVyIHRvIG9uZSBvZiB0aGUgc3lzY2FsbHMgdGhhdCB1c2UgY29weV9mcm9tX3Vz
ZXIsCj4gd2UgbmVlZCB0byBjb3JyZWN0bHkgaGFuZGxlIHN1Y2ggcG9pbnRlcnMuCj4gCj4gRG8g
dGhpcyBieSB1bnRhZ2dpbmcgdXNlciBwb2ludGVycyBpbiBhY2Nlc3Nfb2sgYW5kIGluIF9fdWFj
Y2Vzc19tYXNrX3B0ciwKPiBiZWZvcmUgcGVyZm9ybWluZyBhY2Nlc3MgdmFsaWRpdHkgY2hlY2tz
Lgo+IAo+IE5vdGUsIHRoYXQgdGhpcyBwYXRjaCBvbmx5IHRlbXBvcmFyaWx5IHVudGFncyB0aGUg
cG9pbnRlcnMgdG8gcGVyZm9ybSB0aGUKPiBjaGVja3MsIGJ1dCB0aGVuIHBhc3NlcyB0aGVtIGFz
IGlzIGludG8gdGhlIGtlcm5lbCBpbnRlcm5hbHMuCj4gCj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29v
ayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMg
PGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFs
b3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lu
byA8dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KCj4gLS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oIHwgMTAgKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4g
aW5kZXggZTVkNWYzMWM2ZDM2Li5kZjcyOWFmY2EwYmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaAo+IEBAIC03Myw2ICs3Myw4IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBf
X3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpCj4gIHsK
PiAgCXVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9IGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRk
cl9saW1pdDsKPiAgCj4gKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKPiArCj4gIAlfX2No
a191c2VyX3B0cihhZGRyKTsKPiAgCWFzbSB2b2xhdGlsZSgKPiAgCS8vIEEgKyBCIDw9IEMgKyAx
IGZvciBhbGwgQSxCLEMsIGluIGZvdXIgZWFzeSBzdGVwczoKPiBAQCAtMjI2LDcgKzIyOCw4IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCB1YWNjZXNzX2VuYWJsZV9ub3RfdWFvKHZvaWQpCj4gIAo+ICAv
Kgo+ICAgKiBTYW5pdGlzZSBhIHVhY2Nlc3MgcG9pbnRlciBzdWNoIHRoYXQgaXQgYmVjb21lcyBO
VUxMIGlmIGFib3ZlIHRoZQo+IC0gKiBjdXJyZW50IGFkZHJfbGltaXQuCj4gKyAqIGN1cnJlbnQg
YWRkcl9saW1pdC4gSW4gY2FzZSB0aGUgcG9pbnRlciBpcyB0YWdnZWQgKGhhcyB0aGUgdG9wIGJ5
dGUgc2V0KSwKPiArICogdW50YWcgdGhlIHBvaW50ZXIgYmVmb3JlIGNoZWNraW5nLgo+ICAgKi8K
PiAgI2RlZmluZSB1YWNjZXNzX21hc2tfcHRyKHB0cikgKF9fdHlwZW9mX18ocHRyKSlfX3VhY2Nl
c3NfbWFza19wdHIocHRyKQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgX191c2VyICpfX3VhY2Nlc3Nf
bWFza19wdHIoY29uc3Qgdm9pZCBfX3VzZXIgKnB0cikKPiBAQCAtMjM0LDEwICsyMzcsMTEgQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAqX191YWNjZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQg
X191c2VyICpwdHIpCj4gIAl2b2lkIF9fdXNlciAqc2FmZV9wdHI7Cj4gIAo+ICAJYXNtIHZvbGF0
aWxlKAo+IC0JIgliaWNzCXh6ciwgJTEsICUyXG4iCj4gKwkiCWJpY3MJeHpyLCAlMywgJTJcbiIK
PiAgCSIJY3NlbAklMCwgJTEsIHh6ciwgZXFcbiIKPiAgCTogIj0mciIgKHNhZmVfcHRyKQo+IC0J
OiAiciIgKHB0ciksICJyIiAoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRyX2xpbWl0KQo+ICsJ
OiAiciIgKHB0ciksICJyIiAoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRyX2xpbWl0KSwKPiAr
CSAgInIiICh1bnRhZ2dlZF9hZGRyKHB0cikpCj4gIAk6ICJjYyIpOwo+ICAKPiAgCWNzZGIoKTsK
PiAKCi0tIApSZWdhcmRzLApWaW5jZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
