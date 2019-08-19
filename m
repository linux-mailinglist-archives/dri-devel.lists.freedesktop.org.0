Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D2948A1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE386E1DE;
	Mon, 19 Aug 2019 15:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9346E1DE;
 Mon, 19 Aug 2019 15:39:06 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 665E8206BB;
 Mon, 19 Aug 2019 15:39:00 +0000 (UTC)
Date: Mon, 19 Aug 2019 16:38:57 +0100
From: Will Deacon <will@kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH ARM] selftests, arm64: fix uninitialized symbol in
 tags_test.c
Message-ID: <20190819153856.odtneqxfxva2wjgu@willie-the-truck>
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
 <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566229146;
 bh=mU4ouJkj7NaS3vquiJ3mn2kEexO3/gSWokZg7nn5uQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QRXT896qGq/WiHyf17lxsprNRQAfPEOU3Z+5CjXNL2fEnpIDD7ajhOWUK4biSQh33
 2ijToYzNGWeRrOdqqSLtcBmrSdl9BJssStybtDcjEQR6fHT1uFfB6cz07Uv9ONyRWy
 ioL0yg4XhRdRVMfY281I2aZx/KgI2/YhO+Z/GTZc=
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDU6MTY6MzdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCA1OjAzIFBNIFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDAz
OjE0OjQyUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+IEZpeCB0YWdnZWRf
cHRyIG5vdCBiZWluZyBpbml0aWFsaXplZCB3aGVuIFRCSSBpcyBub3QgZW5hYmxlZC4KPiA+ID4K
PiA+ID4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+ID4KPiA+IEd1
ZXNzaW5nIHRoaXMgd2FzIFJlcG9ydGVkLWJ5LCBvciBoYXMgRGFuIGludHJvZHVjZWQgaGlzIG93
biB0YWcgbm93PyA7KQo+IAo+IE9vcHMsIHllcywgUmVwb3J0ZWQtYnkgOikKPiAKPiA+Cj4gPiBH
b3QgYSBsaW5rIHRvIHRoZSByZXBvcnQ/Cj4gCj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlz
dHMvbGludXgta3NlbGZ0ZXN0L21zZzA5NDQ2Lmh0bWwKClRoYW5rcywgSSdsbCBmaXggdXAgdGhl
IGNvbW1pdCBtZXNzYWdlIGFuZCBwdXNoIHRoaXMgb3V0IGxhdGVyIG9uLiBJZiB5b3UKZ2V0IGEg
Y2hhbmNlLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBsb29rIGF0IHRoZSBwZW5kaW5nIGNoYW5nZXMg
ZnJvbQpDYXRhbGluWzFdLCBwbGVhc2U/CgpXaWxsCgpbMV0gaHR0cHM6Ly9sa21sLmtlcm5lbC5v
cmcvci8yMDE5MDgxNTE1NDQwMy4xNjQ3My0xLWNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
