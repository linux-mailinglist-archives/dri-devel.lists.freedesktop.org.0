Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6741CB8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A39989268;
	Wed, 12 Jun 2019 06:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC68916B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:35:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c85so7680113pfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8h42m3mke7DA8ejB89qFnTkC5cX+aLshhHC5jTwYOa4=;
 b=T66yedFTYQKJnsDHwYISvS1fiWwrsmfaMCrPjAhAwuLHialpRaargfjfG3+kGWGvz8
 P8IXoblu8JXYGO3H8FxxJiCZEbss69HbgkUnBPZsovFufYxRXRWYd9UXpWLrl5sn3MYR
 L0LNP3YTarbwuLSeyj65o0m5iC63SGdKXPHMB6RDP5CN4AX/2WkxcYcU4ERd7/Zwildv
 WIhRjlEuS7dnuzMM6TWDtcrHt54E8mpgpt/CdKCX7LTlZ+uLxV68vX8jSGW4879vRfjG
 vOR1N6DZAEPqAdVb4CwLYgm7B4shQdXwbJxsfTcWG1SWgJaqXJSNEcuHL8OOpAr1nlhO
 Sc0g==
X-Gm-Message-State: APjAAAXir1YPryDHgHGVGnRxfhwVRVHcBbZ0EvxkN97I5LYBUNcukIKy
 iPosHxChilD7Bul89LEpqPQuBfVptDDK6KeuMY6BSQ==
X-Google-Smtp-Source: APXvYqwVttVVtet3fqIi0VnES8Ilb/p6V60nSXc7x8WFpoZ7Ynv9ahn+wWxWGukqfJnR2JBKBovfx92r2kGjPnyP20Q=
X-Received: by 2002:a63:1919:: with SMTP id z25mr21205093pgl.440.1560267342622; 
 Tue, 11 Jun 2019 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
 <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
In-Reply-To: <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 11 Jun 2019 17:35:31 +0200
Message-ID: <CAAeHK+zBDB6i+iEw+TJY14gZeccvWeOBEaU+otn1F+jzDLaRpA@mail.gmail.com>
Subject: Re: [PATCH v16 05/16] arm64: untag user pointers passed to memory
 syscalls
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8h42m3mke7DA8ejB89qFnTkC5cX+aLshhHC5jTwYOa4=;
 b=sLMq+bA6sOUYAuoQSdZze7aS/o01HRJh37fgBzOaTlULVRlgN1Pzky0WnEt9ggPhRi
 JH1qa8PI3fUsxopnA8vxXjk80emL0gwgHoi/kN+wCfZhW7CtGG3mN+/yxVY59EUBa1rS
 M4cxQ83xr93VSRZJzwzbUXprtAi+dT3meCk3L8KOZ/xZDFb/kZqFJzv63133Zz0lw9er
 v1LYil8+krDw44YMHLuvpYAB34RsEpHwQbuoHBJWYMzgMu6DfV6usjm0aFv9/2YjnuNW
 tz3JzLRCLMzdWSO9grr5tL4TPlHUr6KXqW3Th206n5IMIeoSFDjvZhgTeHCUKYHlgpUu
 bTiw==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgNDoyOCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2OjU1
OjA3UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0
bwo+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRv
IHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRz
Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBwb2ludGVycyB0byBiZSBwYXNzZWQg
dG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+IHN5c2NhbGxzOiBnZXRfbWVtcG9saWN5LCBtYWR2
aXNlLCBtYmluZCwgbWluY29yZSwgbWxvY2ssIG1sb2NrMiwgbXByb3RlY3QsCj4gPiBtcmVtYXAs
IG1zeW5jLCBtdW5sb2NrLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3Yg
PGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPgo+IEkgd291bGQgYWRkIGluIHRoZSBjb21taXQgbG9n
IChhbmQgcG9zc2libHkgaW4gdGhlIGNvZGUgd2l0aCBhIGNvbW1lbnQpCj4gdGhhdCBtcmVtYXAo
KSBhbmQgbW1hcCgpIGRvIG5vdCBjdXJyZW50bHkgYWNjZXB0IHRhZ2dlZCBoaW50IGFkZHJlc3Nl
cy4KPiBBcmNoaXRlY3R1cmVzIG1heSBpbnRlcnByZXQgdGhlIGhpbnQgdGFnIGFzIGEgYmFja2dy
b3VuZCBjb2xvdXIgZm9yIHRoZQo+IGNvcnJlc3BvbmRpbmcgdm1hLiBXaXRoIHRoaXM6CgpJJ2xs
IGNoYW5nZSB0aGUgY29tbWl0IGxvZy4gV2hlcmUgZG8geW91IHlvdSB0aGluayBJIHNob3VsZCBw
dXQgdGhpcwpjb21tZW50PyBCZWZvcmUgbW1hcCBhbmQgbXJlbWFwIGRlZmluaXRpb25zIGluIG1t
Lz8KClRoYW5rcyEKCj4KPiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KPgo+IC0tCj4gQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
