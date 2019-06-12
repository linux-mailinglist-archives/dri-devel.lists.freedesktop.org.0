Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE443373
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E8E8934F;
	Thu, 13 Jun 2019 07:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87389263
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:13:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n2so8742776pgp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPH48pl3zgEAvx1ZV8NCaa+NrirZ7d55m0K/3ZW0DB4=;
 b=agGfkdGQ9dMugrwao8cr4WJcTBKLEyM7x82KqBjRmxClfwrCVk59l5fkmV7OwdI1pQ
 J5br2TRKFNEw5Fyip8Z72mkd2Spyj5sVb/CC5RHXJNOug9nPWdQj5JmWC1OI63z43ZhW
 BgTX0V78Pz9vh4RXpi/e8yTpipZCQnkY4/zEP5FlJkLK8U3NKaoutwNPbv4Jo+AOvKs+
 fgrF1ge18Vhy2rOa+8Pt3/1R0+9VUVrgeX+J0A83l1P4gKlnSRo1N5H0x9hf9VRm4H4a
 M5Xuib2lFoWlf6BPz1dDk+9Z6aITSKgwK6n+O++JucVBfGJFOqGCQ2KB3W50aEh7pxA2
 5J2A==
X-Gm-Message-State: APjAAAW5gjdCp9LTVFlquMTGHMAAn+uGMiAdqHWyMJA46wSRQTHJBx5T
 dcA/8SOgPMUmlGH+vO8Lbp5NvE/X440lEFuXoLEw8A==
X-Google-Smtp-Source: APXvYqwzlagi41UpMXh0yb3QZZS2gyEag7Dm2eoj6v2jESPsCD8f1MNuoUw/t7+/hDiqSvkq5q/rQO7JKsp+xiDho38=
X-Received: by 2002:a65:5845:: with SMTP id s5mr25017064pgr.286.1560337999517; 
 Wed, 12 Jun 2019 04:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
 <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
 <CAAeHK+zBDB6i+iEw+TJY14gZeccvWeOBEaU+otn1F+jzDLaRpA@mail.gmail.com>
 <20190611174448.exg2zycfqf4a2vea@mbp>
In-Reply-To: <20190611174448.exg2zycfqf4a2vea@mbp>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:13:08 +0200
Message-ID: <CAAeHK+wkA8PskRrdfJ7MMr+je+x71WW3yDgWajxPRPwPBRNVfA@mail.gmail.com>
Subject: Re: [PATCH v16 05/16] arm64: untag user pointers passed to memory
 syscalls
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CPH48pl3zgEAvx1ZV8NCaa+NrirZ7d55m0K/3ZW0DB4=;
 b=Wa+GrRiixuq08ZJy7YLBy/hw4N6KCGD4D0JGPHXeAhrhP7aYFGu2wrFVi/4U57v07h
 gabUfJpQMd/ZxixypJh6LG438zDMAFuaLmx1zNosW/bNS5e9DE+bfIpQfyXphO/5R37q
 J4BK+9faydCecf+zFNicytUzZ+34IwX2nZrUTbQwSG0d5Mwjsh+M/iy5iKaSTm2HU1Vc
 APJmA3gO7zhEVXs30R27Red8E5MuIvjfWVaZNPU7/jpeOCWo81HFfgpvxUE+snFq9nK5
 AQ9h1nAmh3KAeta7IGYJp8hdQcsOoF6BnZ35/+mA9Y0+45iTzl1SsN8NtN8M46KVCGVs
 tN2Q==
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzo0NSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA1OjM1
OjMxUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAxMCwg
MjAxOSBhdCA0OjI4IFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAwNjo1NTowN1BNICswMjAwLCBB
bmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEg
c2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRvCj4gPiA+ID4g
cGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0
aGluZyBlbHNlIG90aGVyCj4gPiA+ID4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4K
PiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBwb2ludGVycyB0byBiZSBw
YXNzZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+ID4gPiBzeXNjYWxsczogZ2V0X21lbXBv
bGljeSwgbWFkdmlzZSwgbWJpbmQsIG1pbmNvcmUsIG1sb2NrLCBtbG9jazIsIG1wcm90ZWN0LAo+
ID4gPiA+IG1yZW1hcCwgbXN5bmMsIG11bmxvY2suCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+Cj4gPiA+
IEkgd291bGQgYWRkIGluIHRoZSBjb21taXQgbG9nIChhbmQgcG9zc2libHkgaW4gdGhlIGNvZGUg
d2l0aCBhIGNvbW1lbnQpCj4gPiA+IHRoYXQgbXJlbWFwKCkgYW5kIG1tYXAoKSBkbyBub3QgY3Vy
cmVudGx5IGFjY2VwdCB0YWdnZWQgaGludCBhZGRyZXNzZXMuCj4gPiA+IEFyY2hpdGVjdHVyZXMg
bWF5IGludGVycHJldCB0aGUgaGludCB0YWcgYXMgYSBiYWNrZ3JvdW5kIGNvbG91ciBmb3IgdGhl
Cj4gPiA+IGNvcnJlc3BvbmRpbmcgdm1hLiBXaXRoIHRoaXM6Cj4gPgo+ID4gSSdsbCBjaGFuZ2Ug
dGhlIGNvbW1pdCBsb2cuIFdoZXJlIGRvIHlvdSB5b3UgdGhpbmsgSSBzaG91bGQgcHV0IHRoaXMK
PiA+IGNvbW1lbnQ/IEJlZm9yZSBtbWFwIGFuZCBtcmVtYXAgZGVmaW5pdGlvbnMgaW4gbW0vPwo+
Cj4gT24gYXJtNjQgd2UgdXNlIG91ciBvd24gc3lzX21tYXAoKS4gSSdkIHNheSBqdXN0IGFkZCBh
IGNvbW1lbnQgb24gdGhlCj4gZ2VuZXJpYyBtcmVtYXAoKSBqdXN0IGJlZm9yZSB0aGUgdW50YWdn
ZWRfYWRkcigpIGFsb25nIHRoZSBsaW5lcyB0aGF0Cj4gbmV3X2FkZHJlc3MgaXMgbm90IHVudGFn
Z2VkIGZvciBwcmVzZXJ2aW5nIHNpbWlsYXIgYmVoYXZpb3VyIHRvIG1tYXAoKS4KCldpbGwgZG8g
aW4gdjE3LCB0aGFua3MhCgo+Cj4gLS0KPiBDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
