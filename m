Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65D14525
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0C89274;
	Mon,  6 May 2019 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE0E46E826;
 Fri,  3 May 2019 16:51:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8229A15A2;
 Fri,  3 May 2019 09:51:22 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 1C9913F557; Fri,  3 May 2019 09:51:15 -0700 (PDT)
Date: Fri, 3 May 2019 17:51:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v14 08/17] mm, arm64: untag user pointers in
 get_vaddr_frames
Message-ID: <20190503165113.GJ55449@arrakis.emea.arm.com>
References: <cover.1556630205.git.andreyknvl@google.com>
 <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gZ2V0X3ZhZGRyX2ZyYW1lcyB1c2VzIHByb3Zp
ZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiBvbmx5IGJ5IGRv
bmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdp
bmcKPiBhbGwgY2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uLCBwZXJmb3JtIHVudGFnZ2luZyBpbiBp
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2ds
ZS5jb20+Cj4gLS0tCj4gIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIv
bW0vZnJhbWVfdmVjdG9yLmMKPiBpbmRleCBjNjRkY2E2ZTI3YzIuLmM0MzFjYTgxZGFkNSAxMDA2
NDQKPiAtLS0gYS9tbS9mcmFtZV92ZWN0b3IuYwo+ICsrKyBiL21tL2ZyYW1lX3ZlY3Rvci5jCj4g
QEAgLTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKPiAgCWlmIChXQVJOX09OX09OQ0UobnJfZnJhbWVz
ID4gdmVjLT5ucl9hbGxvY2F0ZWQpKQo+ICAJCW5yX2ZyYW1lcyA9IHZlYy0+bnJfYWxsb2NhdGVk
Owo+ICAKPiArCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJZG93bl9yZWFk
KCZtbS0+bW1hcF9zZW0pOwo+ICAJbG9ja2VkID0gMTsKPiAgCXZtYSA9IGZpbmRfdm1hX2ludGVy
c2VjdGlvbihtbSwgc3RhcnQsIHN0YXJ0ICsgMSk7CgpJcyB0aGlzIHNvbWUgYnVmZmVyIHRoYXQg
dGhlIHVzZXIgbWF5IGhhdmUgbWFsbG9jJ2VkPyBJIGdvdCBsb3N0IHdoZW4KdHJ5aW5nIHRvIHRy
YWNrIGRvd24gdGhlIHByb3ZlbmllbmNlIG9mIHRoaXMgYnVmZmVyLgoKLS0gCkNhdGFsaW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
