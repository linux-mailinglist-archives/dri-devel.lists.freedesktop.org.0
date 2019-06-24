Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F45245D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3E589F53;
	Tue, 25 Jun 2019 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CF8189148;
 Mon, 24 Jun 2019 17:50:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0CA2360;
 Mon, 24 Jun 2019 10:50:16 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 E5FBC3F718; Mon, 24 Jun 2019 10:50:11 -0700 (PDT)
Date: Mon, 24 Jun 2019 18:50:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 07/15] fs/namespace: untag user pointers in
 copy_mount_options
Message-ID: <20190624175009.GM29120@arrakis.emea.arm.com>
References: <cover.1561386715.git.andreyknvl@google.com>
 <41e0a911e4e4d533486a1468114e6878e21f9f84.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41e0a911e4e4d533486a1468114e6878e21f9f84.1561386715.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTJQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gSW4gY29weV9tb3VudF9vcHRpb25zIGEgdXNlciBhZGRy
ZXNzIGlzIGJlaW5nIHN1YnRyYWN0ZWQgZnJvbSBUQVNLX1NJWkUuCj4gSWYgdGhlIGFkZHJlc3Mg
aXMgbG93ZXIgdGhhbiBUQVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90Cj4g
YWxsb3cgdGhlIGV4YWN0X2NvcHlfZnJvbV91c2VyKCkgY2FsbCB0byBjcm9zcyBUQVNLX1NJWkUg
Ym91bmRhcnkuCj4gSG93ZXZlciBpZiB0aGUgYWRkcmVzcyBpcyB0YWdnZWQsIHRoZW4gdGhlIHNp
emUgd2lsbCBiZSBjYWxjdWxhdGVkCj4gaW5jb3JyZWN0bHkuCj4gCj4gVW50YWcgdGhlIGFkZHJl
c3MgYmVmb3JlIHN1YnRyYWN0aW5nLgo+IAo+IFJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hh
bGlkLmF6aXpAb3JhY2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZp
bmNlbnpvLmZyYXNjaW5vQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgZnMvbmFtZXNwYWNlLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9mcy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFjZS5jCj4gaW5kZXggNzY2MGMyNzQ5Yzk2Li5l
Yzc4ZjcyMjM5MTcgMTAwNjQ0Cj4gLS0tIGEvZnMvbmFtZXNwYWNlLmMKPiArKysgYi9mcy9uYW1l
c3BhY2UuYwo+IEBAIC0yOTk0LDcgKzI5OTQsNyBAQCB2b2lkICpjb3B5X21vdW50X29wdGlvbnMo
Y29uc3Qgdm9pZCBfX3VzZXIgKiBkYXRhKQo+ICAJICogdGhlIHJlbWFpbmRlciBvZiB0aGUgcGFn
ZS4KPiAgCSAqLwo+ICAJLyogY29weV9mcm9tX3VzZXIgY2Fubm90IGNyb3NzIFRBU0tfU0laRSAh
ICovCj4gLQlzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPiArCXNpemUg
PSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRhdGEpOwo+ICAJaWYg
KHNpemUgPiBQQUdFX1NJWkUpCj4gIAkJc2l6ZSA9IFBBR0VfU0laRTsKCkkgdGhpbmsgdGhpcyBw
YXRjaCBuZWVkcyBhbiBhY2sgZnJvbSBBbCBWaXJvIChjYydlZCkuCgotLSAKQ2F0YWxpbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
