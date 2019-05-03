Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9A14534
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FB089333;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7BDE6E82A;
 Fri,  3 May 2019 17:03:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B389915A2;
 Fri,  3 May 2019 10:03:19 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 2A5D43F557; Fri,  3 May 2019 10:03:13 -0700 (PDT)
Date: Fri, 3 May 2019 18:03:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v14 13/17] IB/mlx4, arm64: untag user pointers in
 mlx4_get_umem_mr
Message-ID: <20190503170310.GL55449@arrakis.emea.arm.com>
References: <cover.1556630205.git.andreyknvl@google.com>
 <05c0c078b8b5984af4cc3b105a58c711dcd83342.1556630205.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05c0c078b8b5984af4cc3b105a58c711dcd83342.1556630205.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Leon Romanovsky <leonro@mellanox.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuehling@google.com, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6MDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gbWx4NF9nZXRfdW1lbV9tcigpIHVzZXMgcHJv
dmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkg
ZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4g
dGhpcyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlb24gUm9tYW5vdnNreSA8bGVvbnJv
QG1lbGxhbm94LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyB8
IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIGIv
ZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwo+IGluZGV4IDM5NTM3OWE0ODBjYi4uOWEz
NWVkMmM2YTZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMK
PiArKysgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jCj4gQEAgLTM3OCw2ICszNzgs
NyBAQCBzdGF0aWMgc3RydWN0IGliX3VtZW0gKm1seDRfZ2V0X3VtZW1fbXIoc3RydWN0IGliX3Vk
YXRhICp1ZGF0YSwgdTY0IHN0YXJ0LAo+ICAJICogYWdhaW4KPiAgCSAqLwo+ICAJaWYgKCFpYl9h
Y2Nlc3Nfd3JpdGFibGUoYWNjZXNzX2ZsYWdzKSkgewo+ICsJCXVuc2lnbmVkIGxvbmcgdW50YWdn
ZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiAgCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYTsKPiAgCj4gIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+IEBA
IC0zODYsOSArMzg3LDkgQEAgc3RhdGljIHN0cnVjdCBpYl91bWVtICptbHg0X2dldF91bWVtX21y
KHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEsIHU2NCBzdGFydCwKPiAgCQkgKiBjb3ZlciB0aGUgbWVt
b3J5LCBidXQgZm9yIG5vdyBpdCByZXF1aXJlcyBhIHNpbmdsZSB2bWEgdG8KPiAgCQkgKiBlbnRp
cmVseSBjb3ZlciB0aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBwaW5ncy4KPiAgCQkgKi8KPiAtCQl2
bWEgPSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgc3RhcnQpOwo+IC0JCWlmICh2bWEgJiYgdm1hLT52
bV9lbmQgPj0gc3RhcnQgKyBsZW5ndGggJiYKPiAtCQkgICAgdm1hLT52bV9zdGFydCA8PSBzdGFy
dCkgewo+ICsJCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1bnRhZ2dlZF9zdGFydCk7Cj4g
KwkJaWYgKHZtYSAmJiB2bWEtPnZtX2VuZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxlbmd0aCAmJgo+
ICsJCSAgICB2bWEtPnZtX3N0YXJ0IDw9IHVudGFnZ2VkX3N0YXJ0KSB7Cj4gIAkJCWlmICh2bWEt
PnZtX2ZsYWdzICYgVk1fV1JJVEUpCj4gIAkJCQlhY2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNTX0xP
Q0FMX1dSSVRFOwo+ICAJCX0gZWxzZSB7CgpEaXNjdXNzaW9uIG9uZ29pbmcgb24gdGhlIHByZXZp
b3VzIHZlcnNpb24gb2YgdGhlIHBhdGNoIGJ1dCBJJ20gbW9yZQppbmNsaW5lZCB0byBkbyB0aGlz
IGluIGliX3V2ZXJic18ocmUpcmVnX21yKCkgb24gY21kLnN0YXJ0LgoKLS0gCkNhdGFsaW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
