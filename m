Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4C730A7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7F6E571;
	Wed, 24 Jul 2019 14:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEAE6E571;
 Wed, 24 Jul 2019 14:02:22 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A09422BE8;
 Wed, 24 Jul 2019 14:02:15 +0000 (UTC)
Date: Wed, 24 Jul 2019 15:02:12 +0100
From: Will Deacon <will@kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563976942;
 bh=akL4t3WLQfvH/sx6baSCdRPzrJPet6bQ0ZZAPYisZi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGjiQdK87WShqPUCUDRg97LnVe6uyeIf9yy5HPpwultEhX+41Yn3D/DKXjIK8Af4f
 0ygT0V9wgzsE+RPZ4QFVtqujFkiagNZGrOWFPz6QtW3TCSySYN2+CMJ5pNSGE1vClG
 0S7ixJF2Qf9InXHgM9sSGPD0ag6vRkrIxQa7ibh4=
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
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDg6MDM6MjlQTSArMDIwMCwgQW5k
cmV5IEtvbm92YWxvdiB3cm90ZToKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCA3OjU5IFBNIEFu
ZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPT09
IE92ZXJ2aWV3Cj4gPgo+ID4gYXJtNjQgaGFzIGEgZmVhdHVyZSBjYWxsZWQgVG9wIEJ5dGUgSWdu
b3JlLCB3aGljaCBhbGxvd3MgdG8gZW1iZWQgcG9pbnRlcgo+ID4gdGFncyBpbnRvIHRoZSB0b3Ag
Ynl0ZSBvZiBlYWNoIHBvaW50ZXIuIFVzZXJzcGFjZSBwcm9ncmFtcyAoc3VjaCBhcwo+ID4gSFdB
U2FuLCBhIG1lbW9yeSBkZWJ1Z2dpbmcgdG9vbCBbMV0pIG1pZ2h0IHVzZSB0aGlzIGZlYXR1cmUg
YW5kIHBhc3MKPiA+IHRhZ2dlZCB1c2VyIHBvaW50ZXJzIHRvIHRoZSBrZXJuZWwgdGhyb3VnaCBz
eXNjYWxscyBvciBvdGhlciBpbnRlcmZhY2VzLgo+ID4KPiA+IFJpZ2h0IG5vdyB0aGUga2VybmVs
IGlzIGFscmVhZHkgYWJsZSB0byBoYW5kbGUgdXNlciBmYXVsdHMgd2l0aCB0YWdnZWQKPiA+IHBv
aW50ZXJzLCBkdWUgdG8gdGhlc2UgcGF0Y2hlczoKPiA+Cj4gPiAxLiA4MWNkZGQ2NSAoImFybTY0
OiB0cmFwczogZml4IHVzZXJzcGFjZSBjYWNoZSBtYWludGVuYW5jZSBlbXVsYXRpb24gb24gYQo+
ID4gICAgICAgICAgICAgIHRhZ2dlZCBwb2ludGVyIikKPiA+IDIuIDdkY2Q5ZGQ4ICgiYXJtNjQ6
IGh3X2JyZWFrcG9pbnQ6IGZpeCB3YXRjaHBvaW50IG1hdGNoaW5nIGZvciB0YWdnZWQKPiA+ICAg
ICAgICAgICAgICAgcG9pbnRlcnMiKQo+ID4gMy4gMjc2ZTkzMjcgKCJhcm02NDogZW50cnk6IGlt
cHJvdmUgZGF0YSBhYm9ydCBoYW5kbGluZyBvZiB0YWdnZWQKPiA+ICAgICAgICAgICAgICAgcG9p
bnRlcnMiKQo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQgZXh0ZW5kcyB0YWdnZWQgcG9pbnRlciBzdXBw
b3J0IHRvIHN5c2NhbGwgYXJndW1lbnRzLgoKWy4uLl0KCj4gRG8geW91IHRoaW5rIHRoaXMgaXMg
cmVhZHkgdG8gYmUgbWVyZ2VkPwo+IAo+IFNob3VsZCB0aGlzIGdvIHRocm91Z2ggdGhlIG1tIG9y
IHRoZSBhcm0gdHJlZT8KCkkgd291bGQgY2VydGFpbmx5IHByZWZlciB0byB0YWtlIGF0IGxlYXN0
IHRoZSBhcm02NCBiaXRzIHZpYSB0aGUgYXJtNjQgdHJlZQooaS5lLiBwYXRjaGVzIDEsIDIgYW5k
IDE1KS4gV2UgYWxzbyBuZWVkIGEgRG9jdW1lbnRhdGlvbiBwYXRjaCBkZXNjcmliaW5nCnRoZSBu
ZXcgQUJJLgoKV2lsbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
