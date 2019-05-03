Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EF14530
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CCE8932B;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 352AD6E829;
 Fri,  3 May 2019 16:56:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091DE15A2;
 Fri,  3 May 2019 09:56:56 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 7F2813F557; Fri,  3 May 2019 09:56:49 -0700 (PDT)
Date: Fri, 3 May 2019 17:56:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v14 10/17] fs, arm64: untag user pointers in
 fs/userfaultfd.c
Message-ID: <20190503165646.GK55449@arrakis.emea.arm.com>
References: <cover.1556630205.git.andreyknvl@google.com>
 <7d3b28689d47c0fa1b80628f248dbf78548da25f.1556630205.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d3b28689d47c0fa1b80628f248dbf78548da25f.1556630205.git.andreyknvl@google.com>
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6MDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoKSBhbmQg
dXNlcmZhdWx0ZmRfdW5yZWdpc3RlcigpIHVzZSBwcm92aWRlZCB1c2VyCj4gcG9pbnRlcnMgZm9y
IHZtYSBsb29rdXBzLCB3aGljaCBjYW4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQgcG9pbnRl
cnMuCj4gCj4gVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGVzZSBmdW5jdGlvbnMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+IC0t
LQo+ICBmcy91c2VyZmF1bHRmZC5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3VzZXJmYXVsdGZkLmMgYi9mcy91c2VyZmF1
bHRmZC5jCj4gaW5kZXggZjVkZTFlNzI2MzU2Li5mZGVlMGRiMGU4NDcgMTAwNjQ0Cj4gLS0tIGEv
ZnMvdXNlcmZhdWx0ZmQuYwo+ICsrKyBiL2ZzL3VzZXJmYXVsdGZkLmMKPiBAQCAtMTMyNSw2ICsx
MzI1LDkgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0
ZmRfY3R4ICpjdHgsCj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gIAo+ICsJdWZmZGlvX3JlZ2lzdGVy
LnJhbmdlLnN0YXJ0ID0KPiArCQl1bnRhZ2dlZF9hZGRyKHVmZmRpb19yZWdpc3Rlci5yYW5nZS5z
dGFydCk7Cj4gKwo+ICAJcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sIHVmZmRpb19yZWdpc3Rlci5y
YW5nZS5zdGFydCwKPiAgCQkJICAgICB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2UubGVuKTsKPiAgCWlm
IChyZXQpCj4gQEAgLTE1MTQsNiArMTUxNyw4IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfdW5y
ZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gIAlpZiAoY29weV9mcm9tX3Vz
ZXIoJnVmZmRpb191bnJlZ2lzdGVyLCBidWYsIHNpemVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQo+
ICAJCWdvdG8gb3V0Owo+ICAKPiArCXVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0ID0gdW50YWdnZWRf
YWRkcih1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCk7Cj4gKwo+ICAJcmV0ID0gdmFsaWRhdGVfcmFu
Z2UobW0sIHVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAo+ICAJCQkgICAgIHVmZmRpb191bnJlZ2lz
dGVyLmxlbik7Cj4gIAlpZiAocmV0KQoKV291bGRuJ3QgaXQgYmUgZWFzaWVyIHRvIGRvIHRoaXMg
aW4gdmFsaWRhdGVfcmFuZ2UoKT8gVGhlcmUgYXJlIGEgZmV3Cm1vcmUgY2FsbHMgaW4gdGhpcyBm
aWxlLCB0aG91Z2ggSSBkaWRuJ3QgY2hlY2sgd2hldGhlciBhIHRhZ2dlZCBhZGRyZXNzCndvdWxk
IGNhdXNlIGlzc3Vlcy4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
