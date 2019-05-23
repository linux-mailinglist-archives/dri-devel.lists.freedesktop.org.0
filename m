Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D028C55
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 23:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5910F89FDE;
	Thu, 23 May 2019 21:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6206E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 21:31:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y11so3936084pfm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RooTx4nZ0Zm8m1fxzq6UPxwDmwN2R9frxfJHiTxcRUE=;
 b=INX55PKbweIkZABHjfreJd0A6rPcmuydJ9r6Ko/i4JMOAIS+90zCwSTUlTxIN6GMVx
 JtUj0G5Vv/ugaKlbOJhUb4SfwDQfV5Iwk6O3b8Lbb0AxYfmwcnPmR/FyDjNdd4JooxsF
 QVbCAbBfU/kYo/XBuAmYrkoyNFklp80513tCzXImCZkTYBnT0Ly5EKXTVXAk9C5K7kvu
 7iAMyjaTB7l0D+RfAAnwu9NYKBmnth1AUs3IN9vxD9nHSuWedjUUD8p1bc0IQ2uMf8Rj
 rM0fJWIbzKSmsiJ6cmMZ7jS6bEcl4QP+A5htmtuGNeMrLsU4ahZTHML6v9wNwIRzEY64
 xxZA==
X-Gm-Message-State: APjAAAXUcU1qADOpE8o3MUNExdZ21UZP4ogPeOZbc8jf0dGyphyhPRgf
 I+LeWRS3uyMBFKho7WOOLY0Bcg==
X-Google-Smtp-Source: APXvYqw6NOt/dAzFGypTG6hDOH9RhK81m8D3qkjrLvBMN1nJLO77YhSc++d1DOA7/Z/CI2DiFH6JYA==
X-Received: by 2002:a63:2226:: with SMTP id i38mr5980879pgi.403.1558647079048; 
 Thu, 23 May 2019 14:31:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f186sm406654pfb.5.2019.05.23.14.31.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 14:31:17 -0700 (PDT)
Date: Thu, 23 May 2019 14:31:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <201905231327.77CA8D0A36@keescook>
References: <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <201905230917.DEE7A75EF0@keescook>
 <20190523174345.6sv3kcipkvlwfmox@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523174345.6sv3kcipkvlwfmox@mbp>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RooTx4nZ0Zm8m1fxzq6UPxwDmwN2R9frxfJHiTxcRUE=;
 b=SXshT/JWt4/VxFaxzUCPBis/uU7CKJhnvqILKuBvKuHgZM/0X3lQPlS9BrcA9GPwgN
 mNP52DBHjW70HoXLGw3kCTAML6GHF8r2zv6T7pohAbgiWS2GBzlP+CcIwmEuaO+qZxq4
 C2Jko0HEb2Ra0I9vlZLyIy+YOud56hz3nr/kE=
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDY6NDM6NDZQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDA5OjM4OjE5QU0gLTA3MDAsIEtlZXMg
Q29vayB3cm90ZToKPiA+IFdoYXQgb24gdGhpcyBmcm9udCB3b3VsZCB5b3UgYmUgY29tZm9ydGFi
bGUgd2l0aD8gR2l2ZW4gaXQncyBhIG5ldwo+ID4gZmVhdHVyZSBpc24ndCBpdCBzdWZmaWNpZW50
IHRvIGhhdmUgYSBDT05GSUcgKGFuZC9vciBib290IG9wdGlvbik/Cj4gCj4gSSdkIHJhdGhlciBh
dm9pZCByZS1idWlsZGluZyBrZXJuZWxzLiBBIGJvb3Qgb3B0aW9uIHdvdWxkIGRvLCB1bmxlc3Mg
d2UKPiBzZWUgdmFsdWUgaW4gYSBwZXItcHJvY2VzcyAoaW5oZXJpdGVkKSBwZXJzb25hbGl0eSBv
ciBwcmN0bC4gVGhlCgpJIHRoaW5rIEkndmUgY29udmluY2VkIG15c2VsZiB0aGF0IHRoZSBub3Jt
YWw8LT5UQkkgQUJJIGNvbnRyb2wgc2hvdWxkCmJlIGEgYm9vdCBwYXJhbWV0ZXIuIE1vcmUgYmVs
b3cuLi4KCj4gPiBXaGF0IGFib3V0IHRlc3RpbmcgdG9vbHMgdGhhdCBpbnRlbnRpb25hbGx5IGlu
c2VydCBoaWdoIGJpdHMgZm9yIHN5c2NhbGxzCj4gPiBhbmQgYXJlIF9leHBlY3RpbmdfIHRoZW0g
dG8gZmFpbD8gSXQgc2VlbXMgdGhlIFRCSSBzZXJpZXMgd2lsbCBicmVhayB0aGVtPwo+ID4gSW4g
dGhhdCBjYXNlLCBkbyB3ZSBuZWVkIHRvIG9wdCBpbnRvIFRCSSBhcyB3ZWxsPwo+IAo+IElmIHRo
ZXJlIGFyZSBzdWNoIHRvb2xzLCB0aGVuIHdlIG1heSBuZWVkIGEgcGVyLXByb2Nlc3MgY29udHJv
bC4gSXQncwo+IGJhc2ljYWxseSBhbiBBQkkgY2hhbmdlLgoKc3l6a2FsbGVyIGFscmVhZHkgYXR0
ZW1wdHMgdG8gcmFuZG9tbHkgaW5qZWN0IG5vbi1jYW5vbmljYWwgYW5kCjB4RkZGRi4uLi5GRkZG
IGFkZHJlc3NlcyBmb3IgdXNlciBwb2ludGVycyBpbiBzeXNjYWxscyBpbiBhbiBlZmZvcnQgdG8K
ZmluZCBidWdzIGxpa2UgQ1ZFLTIwMTctNTEyMyB3aGVyZSB3YWl0aWQoKSB2aWEgdW5jaGVja2Vk
IHB1dF91c2VyKCkgd2FzCmFibGUgdG8gd3JpdGUgZGlyZWN0bHkgdG8ga2VybmVsIG1lbW9yeVsx
XS4KCkl0IHNlZW1zIHRoYXQgdXNpbmcgVEJJIGJ5IGRlZmF1bHQgYW5kIG5vdCBhbGxvd2luZyBh
IHN3aXRjaCBiYWNrIHRvCiJub3JtYWwiIEFCSSB3aXRob3V0IGEgcmVib290IGFjdHVhbGx5IG1l
YW5zIHRoYXQgdXNlcnNwYWNlIGNhbm5vdCBpbmplY3QKa2VybmVsIHBvaW50ZXJzIGludG8gc3lz
Y2FsbHMgYW55IG1vcmUsIHNpbmNlIHRoZXknbGwgZ2V0IHVuaXZlcnNhbGx5CnN0cmlwcGVkIG5v
dy4gSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0LCBoZXJlPyBpLmUuIGV4cGxvaXRpbmcKQ1ZF
LTIwMTctNTEyMyB3b3VsZCBiZSBpbXBvc3NpYmxlIHVuZGVyIFRCST8KCklmIHNvLCB0aGVuIEkg
dGhpbmsgd2Ugc2hvdWxkIGNvbW1pdCB0byB0aGUgVEJJIEFCSSBhbmQgaGF2ZSBhIGJvb3QKZmxh
ZyB0byBkaXNhYmxlIGl0LCBidXQgTk9UIGhhdmUgYSBwcm9jZXNzIGZsYWcsIGFzIHRoYXQgd291
bGQgYWxsb3cKYXR0YWNrZXJzIHRvIGJ5cGFzcyB0aGUgbWFza2luZy4gVGhlIG9ubHkgZmxhZyBz
aG91bGQgYmUgIlRCSSBvciBNVEUiLgoKSWYgc28sIGNhbiBJIGdldCB0b3AgYnl0ZSBtYXNraW5n
IGZvciBvdGhlciBhcmNoaXRlY3R1cmVzIHRvbz8gTGlrZSwKanVzdCB0byBzdHJpcCBoaWdoIGJp
dHMgb2ZmIHVzZXJzcGFjZSBhZGRyZXNzZXM/IDspCgooT2gsIGluIGxvb2tpbmcgSSBzZWUgdGhp
cyBpcyBpbXBsZW1lbnRlZCB3aXRoIHNpZ24tZXh0ZW5zaW9uLi4uIHdoeQpub3QganVzdCBhIG1h
c2s/IFNvIGl0J2xsIGVpdGhlciBiZSB2YWxpZCB1c2Vyc3BhY2UgYWRkcmVzcyBvciBmb3JjZWQK
aW50byB0aGUgbm9uLWNhbm9uaWNhbCByYW5nZT8pCgpbMV0gaHR0cHM6Ly9zYWxscy5naXRodWIu
aW8vTGludXgtS2VybmVsLUNWRS0yMDE3LTUxMjMvCgo+ID4gQWxyaWdodCwgdGhlIHRsO2RyIGFw
cGVhcnMgdG8gYmU6Cj4gPiAtIHlvdSB3YW50IG1vcmUgYXNzdXJhbmNlcyB0aGF0IHdlIGNhbiBm
aW5kIF9fdXNlciBzdHJpcHBpbmcgaW4gdGhlCj4gPiAgIGtlcm5lbCBtb3JlIGVhc2lseS4gKEJ1
dCB0aGlzIHNlZW1zIGxpa2UgYSBwYXJhbGxlbCBwcm9ibGVtLikKPiAKPiBZZXMsIGFuZCB0aGF0
IHdlIGZvdW5kIGFsbCAobW9zdCkgY2FzZXMgbm93LiBUaGUgcmVhc29uIEkgZG9uJ3Qgc2VlIGl0
Cj4gYXMgYSBwYXJhbGxlbCBwcm9ibGVtIGlzIHRoYXQsIGFzIG1haW50YWluZXIsIEkgcHJvbWlz
ZSBhbiBBQkkgdG8gdXNlcgo+IGFuZCBJJ2QgcmF0aGVyIHN0aWNrIHRvIGl0LiBJIGRvbid0IHdh
bnQsIGZvciBleGFtcGxlLCBuY3Vyc2VzIHRvIHN0b3AKPiB3b3JraW5nIGJlY2F1c2Ugb2Ygc29t
ZSBpb2N0bCgpIHJlamVjdGluZyB0YWdnZWQgcG9pbnRlcnMuCgpCdXQgdGhpcyBpcyB3aGF0IEkg
ZG9uJ3QgdW5kZXJzdGFuZDogaXQgd291bGQgbmVlZCB0byBiZSBuY3Vyc2VzIF91c2luZwpUQklf
LCB0aGF0IHdvdWxkIHN0b3Agd29ya2luZyAoaGF2aW5nIHN0YXJ0ZWQgdG8gd29yayBiZWZvcmUs
IGJ1dCB0aGVuCnJlZ3Jlc3MgZHVlIHRvIGEgbmV3bHkgYWRkZWQgb25lLW9mZiBidWcpLiBSZWd1
bGFyIG5jdXJzZXMgd2lsbCBiZSBmaW5lCmJlY2F1c2UgaXQncyBub3QgdXNpbmcgVEJJLiBTbyBU
aGUgR29sZGVuIFJ1bGUgaXNuJ3QgdmlvbGF0ZWQsIGFuZCBieQpkZWZpbml0aW9uLCBpdCdzIGEg
c3BlY2lmaWMgcmVncmVzc2lvbiBjYXVzZWQgYnkgc29tZSBidWcgKHNpbmNlIFRCSQp3b3VsZCBo
YXZlIGhhZCB0byBoYXZlIHdvcmtlZCBfYmVmb3JlXyBpbiB0aGUgc2l0dWF0aW9uIHRvIGJlIGNv
bnNpZGVyZWQKYSByZWdyZXNzaW9uIG5vdykuIFdoaWNoIGRlc2NyaWJlcyB0aGUgbm9ybWFsIHBh
dGggZm9yIGtlcm5lbApkZXZlbG9wbWVudC4uLiBhZGQgZmVhdHVyZSwgZmluZCBjb3JuZXIgY2Fz
ZXMgd2hlcmUgaXQgZG9lc24ndCB3b3JrLApmaXggdGhlbSwgZW5jb3VudGVyIG5ldyByZWdyZXNz
aW9ucywgZml4IHRob3NlLCByZXBlYXQgZm9yZXZlci4KCj4gSWYgaXQncyBqdXN0IHRoZSBvY2Nh
c2lvbmFsIG9uZS1vZmYgYnVnIEknbSBmaW5lIHRvIGRlYWwgd2l0aCBpdC4gQnV0Cj4gbm8tb25l
IGNvbnZpbmNlZCBtZSB5ZXQgdGhhdCB0aGlzIGlzIHRoZSBjYXNlLgoKWW91IGJlbGlldmUgdGhl
cmUgc3RpbGwgdG8gYmUgc29tZSBzeXN0ZW1pYyBjYXNlcyB0aGF0IGhhdmVuJ3QgYmVlbgpmb3Vu
ZCB5ZXQ/IEFuZCBldmVuIGlmIHNvIC0tIGlzbid0IGl0IGJldHRlciB0byB3b3JrIG9uIHRoYXQK
aW5jcmVtZW50YWxseT8KCj4gQXMgZm9yIHRoZSBnZW5lcmljIGRyaXZlciBjb2RlIChmaWxlc3lz
dGVtcyBvciBvdGhlciBzdWJzeXN0ZW1zKSwKPiB3aXRob3V0IHNvbWUgY2xlYXIgZGlyZWN0aW9u
IGZvciBkZXZlbG9wZXJzLCB0b2dldGhlciB3aXRoIHN0YXRpYwo+IGNoZWNraW5nL3NwYXJzZSwg
b24gaG93IHVzZXIgcG9pbnRlcnMgYXJlIGNhc3QgdG8gbG9uZ3MgKG9uZSBleGFtcGxlKSwKPiBp
dCB3b3VsZCBiZWNvbWUgbXkgcmVzcG9uc2liaWxpdHkgdG8gaWRlbnRpZnkgYW5kIGZpeCB0aGVt
IHVwIHdpdGggYW55Cj4ga2VybmVsIHJlbGVhc2UuIFRoaXMgc2VyaWVzIGlzIG5vdCBwcm92aWRp
bmcgc3VjaCBndWlkYW5jZSwganVzdCBhZGRpbmcKPiB1bnRhZ2dlZF9hZGRyKCkgaW4gc29tZSBw
bGFjZXMgdGhhdCB3ZSB0aGluayBtYXR0ZXIuCgpXaGF0IGFib3V0IGFkZGluZyBhIG5pY2UgYml0
IG9mIC5yc3QgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyB0aGUKc2l0dWF0aW9uIGFuZCBz
aG93cyBob3cgdG8gdXNlIHVudGFnZ2VkX2FkZHIoKS4gVGhpcyBpcyB0aGUga2luZCBvZgprZXJu
ZWwtd2lkZSBjaGFuZ2UgdGhhdCAiZXZlcnlvbmUiIG5lZWRzIHRvIGtub3cgYWJvdXQsIGFuZCBz
aG91bGRuJ3QKYmUgdGhlIGFyY2ggbWFpbnRhaW5lcidzIHNvbGUgcmVzcG9uc2liaWxpdHkgdG8g
Zml4LgoKPiA+IC0gd2UgbWlnaHQgbmVlZCB0byBvcHQgaW4gdG8gVEJJIHdpdGggYSBwcmN0bCgp
Cj4gCj4gWWVzLCBhbHRob3VnaCBzdGlsbCB1cCBmb3IgZGlzY3Vzc2lvbi4KCkkgdGhpbmsgSSd2
ZSB0YWxrZWQgbXlzZWxmIG91dCBvZiBpdC4gSSBzYXkgYm9vdCBwYXJhbSBvbmx5ISA6KQoKClNv
IHdoYXQgZG8geW91IHNheSB0byB0aGVzZSBuZXh0IHN0ZXBzOgoKLSBjaGFuZ2UgdW50YWdnZWRf
YWRkcigpIHRvIHVzZSBhIHN0YXRpYyBicmFuY2ggdGhhdCBpcyBjb250cm9sbGVkIHdpdGgKICBh
IGJvb3QgcGFyYW1ldGVyLgotIGFkZCwgc2F5LCBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3VzZXIt
YWRkcmVzc2VzLnJzdCB0byBkZXNjcmliZQogIHByb3BlciBjYXJlIGFuZCBoYW5kbGluZyBvZiB1
c2VyIHNwYWNlIHBvaW50ZXJzIHdpdGggdW50YWdnZWRfYWRkcigpLAogIHdpdGggZXhhbXBsZXMg
YmFzZWQgb24gYWxsIHRoZSBjYXNlcyBzZWVuIHNvIGZhciBpbiB0aGlzIHNlcmllcy4KLSBjb250
aW51ZSB3b3JrIHRvIGltcHJvdmUgc3RhdGljIGFuYWx5c2lzLgoKVGhhbmtzIGZvciB3YWRpbmcg
dGhyb3VnaCB0aGlzIHdpdGggbWUhIDopCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
