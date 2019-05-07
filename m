Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8D15D6C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 08:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3389D86;
	Tue,  7 May 2019 06:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA843891C7;
 Tue,  7 May 2019 06:33:42 +0000 (UTC)
Received: from localhost (unknown [37.142.3.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6C092087F;
 Tue,  7 May 2019 06:33:41 +0000 (UTC)
Date: Tue, 7 May 2019 09:33:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v15 13/17] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190507063337.GP6938@mtr-leonro.mtl.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
 <20190506195020.GD6201@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506195020.GD6201@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557210822;
 bh=oBFyk7fpihJdB0jCxegQVyX+6vGmLC1DK9IvU35itFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RyPsl6lmqvcCnKl41VkY/GHW2+ETy7nDPo8Tpqc6bp7gDCBLdqWePFxG5B2Wa9vwT
 R3/WlBSqCc8Bj3KtWz9uGTPPZS6ordaRPlQ/fveMibMSWfgfc4tq1AglaAlmwW4kMa
 oMxOIvxG2cStHRR+RV/gLi/uVrPbQ27CrKcpR2aA=
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDQ6NTA6MjBQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDA2OjMwOjU5UE0gKzAyMDAsIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0
aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4gcGFzcyB0YWdnZWQg
dXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90
aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4KPiA+IGliX3V2ZXJi
c18ocmUpcmVnX21yKCkgdXNlIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBz
ICh0aHJvdWdoCj4gPiBlLmcuIG1seDRfZ2V0X3VtZW1fbXIoKSksIHdoaWNoIGNhbiBvbmx5IGJ5
IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KPiA+Cj4gPiBVbnRhZyB1c2VyIHBvaW50ZXJz
IGluIHRoZXNlIGZ1bmN0aW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3Zh
bG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2luZmluaWJh
bmQvY29yZS91dmVyYnNfY21kLmMgfCA0ICsrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4KPiBJIHRoaW5rIHRoaXMgaXMgT0suLiBXZSBzaG91bGQgcmVhbGx5IGdldCBp
dCB0ZXN0ZWQgdGhvdWdoLi4gTGVvbj8KCkl0IGNhbiBiZSBkb25lIGFmdGVyIHY1LjItcmMxLgoK
VGhhbmtzCgo+Cj4gSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
