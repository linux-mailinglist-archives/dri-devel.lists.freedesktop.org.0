Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EB3B5E2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADD189132;
	Mon, 10 Jun 2019 13:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3125E89132
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:20:51 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 858012089E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:20:50 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h21so10457583qtn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 06:20:50 -0700 (PDT)
X-Gm-Message-State: APjAAAWaNZYgKbvEcq6I0juYa7Vh2sWHQBf9XFJxNm1qMhl2Egn33r5k
 mo8d+MujJ6zRiMhHCLnpJHSb7iAbDY7l1mFLPA==
X-Google-Smtp-Source: APXvYqyZI6iNVmj7m0QfuiPMMUl6PUvpQnbJL2Gzuet15rO6RI3OoVzPY26mXwi9S8BcumEKr6RsGE9UE/t4xOOntjY=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr32449475qve.148.1560172849734; 
 Mon, 10 Jun 2019 06:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190513144012.17243-1-robh@kernel.org>
 <CAAObsKADkCLUDSJ9aAxQ_WAotFYTuUuVhifKA5Y+dWjOfmmP4w@mail.gmail.com>
 <deb3aa13-36ea-acdf-b3bd-3380cbe75fda@arm.com>
 <CAAObsKDOvnLU+k5jDbAibq58uh_6-Af4c1STw4Bd0AfDQrYOEw@mail.gmail.com>
In-Reply-To: <CAAObsKDOvnLU+k5jDbAibq58uh_6-Af4c1STw4Bd0AfDQrYOEw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Jun 2019 07:20:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLqZ-R+bkEkqsyn1ir9KQ14FwR=uATJJZFRs_t1dkOgLg@mail.gmail.com>
Message-ID: <CAL_JsqLqZ-R+bkEkqsyn1ir9KQ14FwR=uATJJZFRs_t1dkOgLg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add AArch64 page table format support
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560172850;
 bh=T+sbv+eiMBXOkp1eDotI9kQ7kuXxxq9B4OKXmMxhuzk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bINMWVwxuGyUxN/gDfe1jUIwTqLTOhTYPJ/wHsfc4B1tmMQlO+lQJqcfPbIq82es8
 BQNQe7PtLKH47IC2ZCDNj2CGA7PMT3ysazfLjkf9aliGOnfivPftOMmHr8omGBQfZR
 MOrEr0HDz+spEoUKojHwPWdddbwvoNrNR/h8SIBY=
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
Cc: Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MzggQU0gVG9tZXUgVml6b3NvIDx0b21ldUB0b21l
dXZpem9zby5uZXQ+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOSBNYXkgMjAxOSBhdCAxNTowMCwgUm9i
aW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgVG9tZXUs
IFJvYiwKPiA+Cj4gPiBPbiAyOC8wNS8yMDE5IDA4OjAzLCBUb21ldSBWaXpvc28gd3JvdGU6Cj4g
PiA+IFJvYmluLCBTdGV2ZW4sCj4gPiA+Cj4gPiA+IHdvdWxkIHlvdSBvciBzb21lb25lIGVsc2Ug
YXQgQXJtIGJlIGFibGUgdG8gcnVuIHRoZSBJR1QgdGVzdHMgWzBdIG9uCj4gPiA+IDUuMi1yYzIg
d2l0aCB0aGlzIHBhdGNoIG9uIHRvcD8KPiA+ID4KPiA+ID4gSSBkb24ndCBoYXZlIGFueSBodyB3
aXRoIEJpZnJvc3QgYW5kIGFtIG5vdCBwbGFubmluZyB0byB3b3JrIG9uIHRoZQo+ID4gPiB1c2Vy
c3BhY2UgYW55IHRpbWUgc29vbiwgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBhdCBs
ZWFzdAo+ID4gPiBjaGVjayB0aGF0IHRoZSBrZXJuZWwgZG9lc24ndCBoYXZlIGFueSBvYnZpb3Vz
IGJ1Z3MuCj4gPgo+ID4gSSd2ZSBtYW5hZ2VkIHRvIGNvYmJsZSBzb21ldGhpbmcgdG9nZXRoZXIg
d2hpY2ggYXBwZWFycyB0byBzb3J0LW9mLXdvcmssCj4gPiBhbHRob3VnaCBJIGRvbid0IGhhdmUg
dGhlIGtub3dsZWRnZSwgdGltZSBvciBwYXRpZW5jZSB0byBkaXZlIGRvd24gdGhlCj4gPiByYWJi
aXQtaG9sZSBvZiBnZXR0aW5nIGEgd29ya2luZyBBcm0gRERLIGRyaXZlciB0byBhY3R1YWxseSBw
cm92ZSB0aGUKPiA+IHNldHVwLiBUaGUgaW1tZWRpYXRlIG9ic2VydmF0aW9uIGlzIHRoYXQgSSBn
ZXQgYSBsb3Qgb2YgdGhpczoKPiA+Cj4gPiBbICAzMDUuNjAyMDAxXSBwYW5mcm9zdCA2ZTAwMDAw
MC5ncHU6IGVycm9yIHBvd2VyaW5nIHVwIGdwdQo+ID4KPiA+IFdoaWNoIGFwcGVhcnMgdG8gc3Rl
bSBmcm9tIHRoZSBwb2tpbmcgb2YgU1RBQ0tfUFdST05fTE8uIEp1ZGdpbmcgYnkKPiA+IENPTkZJ
R19NQUxJX0NPUkVTVEFDSyBpbiBrYmFzZSwgbWF5YmUgd2Ugc2hvdWxkbid0IGFsd2F5cyBiZSBn
b2luZyB0aGVyZQo+ID4gYW55d2F5IChTdGV2ZSBwcm9iYWJseSBrbm93cyBtb3JlLCBidXQgaXMg
YXdheSBmb3IgYSBmZXcgd2Vla3MgQVRNKS4KPiA+Cj4gPiBJIGNhbid0IG1ha2UgbXVjaCBzZW5z
ZSBvZiB0aGUgSUdUIG91dHB1dCwgYnV0IHRyeWluZwo+ID4gInNjcmlwdHMvcnVuLXRlc3RzLnNo
IC10IHBhbmZyb3N0IiAoYmVjYXVzZSBJIGFsc28gZG9uJ3QgaGF2ZSB0aGUKPiA+IHBhdGllbmNl
IHRvIHdhdGNoIGl0IHNraXAgdGhyb3VnaCBhbGwgfjYzLDAwMCB0ZXN0cy4uLikgc2VlbXMgcHJl
dHR5Cj4gPiBtdWNoIGNvbnNpc3RlbnQgd2l0aCBvciB3aXRob3V0IHRoaXMgcGF0Y2guCj4KPiBP
b3BzLCBzb3JyeSBhYm91dCB0aGF0LiBJdCB3b3VsZCBoYXZlIGJlZW4gc3VmZmljaWVudCB0byBk
aXJlY3RseSBydW4KPiB0aGVzZSBleGVjdXRhYmxlczoKPgo+IHRlc3RzL3BhbmZyb3N0X2dlbV9u
ZXcKPiB0ZXN0cy9wYW5mcm9zdF9nZXRfcGFyYW0KPiB0ZXN0cy9wYW5mcm9zdF9wcmltZQo+IHRl
c3RzL3BhbmZyb3N0X3N1Ym1pdAo+Cj4gPiBTYW1lIGZvciB0cnlpbmcga21zY3ViZSB3aXRoCj4g
PiBtZXNhL21hc3RlcjsgdGhhdCBwcm9kdWNlcyBsb3RzIG9mIGpvYiBlcnJvcnM6Cj4gPgo+ID4g
WyAgIDQyLjQwOTU2OF0gcGFuZnJvc3QgNmUwMDAwMDAuZ3B1OiBqcyBmYXVsdCwganM9MCwKPiA+
IHN0YXR1cz1EQVRBX0lOVkFMSURfRkFVTFQsIGhlYWQ9MHgyNDAwYjAwLCB0YWlsPTB4MjQwMGIw
MAo+ID4gWyAgIDQyLjQxOTM4MF0gcGFuZnJvc3QgNmUwMDAwMDAuZ3B1OiBncHUgc2NoZWQgdGlt
ZW91dCwganM9MCwKPiA+IHN0YXR1cz0weDU4LCBoZWFkPTB4MjQwMGIwMCwgdGFpbD0weDI0MDBi
MDAsIHNjaGVkX2pvYj0wMDAwMDAwMGQxN2I5MQo+ID4KPiA+IHJhdGhlciB0aGFuIE1NVSBmYXVs
dHMgZWl0aGVyIHdheSwgc28gYXQgbGVhc3QgdGhpcyBjaGFuZ2UgZG9lc24ndCBzZWVtCj4gPiB0
byBwcmVzZW50IGFueSBzaWduaWZpY2FudCByZWdyZXNzaW9uLgo+Cj4gVGhhdCBzb3VuZHMgcHJl
dHR5IGdvb2QgdG8gbWUuIFdlIGtub3cgdGhhdCB0aGUgY21kc3RyZWFtIGFuZCBjb21waWxlcgo+
IGFyZW4ndCByZWFkeSB5ZXQgZm9yIEJpZnJvc3QuCj4KPiA+IEl0IGxvb2tzIGxpa2Ugd2l0aG91
dCB0aGlzIHBhdGNoCj4gPiB3ZSBlbmQgdXAgdXNpbmcgQVNfVFJBTlNDRkdfQURSTU9ERV9MRUdB
Q1ksIHdoaWNoIHByZXN1bWFibHkgbWVhbnMKPiA+IGV4YWN0bHkgd2hhdCBpdCBzb3VuZHMgbGlr
ZSwgYWx0aG91Z2ggd2hldGhlciB0aGF0J3Mgc3VmZmljaWVudGx5Cj4gPiByZWxpYWJsZSBJIGRv
bid0IGtub3c7IHRob3NlIGtpbmRzIG9mIGJhY2t3YXJkcy1jb21wYXRpYmlsaXR5IGZlYXR1cmVz
Cj4gPiBkbyBoYXZlIGEgaGFiaXQgb2YgZXZlbnR1YWxseSBkaXNhcHBlYXJpbmcsIGFuZCB3aGF0
IEkndmUgdHJpZWQgc28gZmFyCj4gPiBpcyBjZXJ0YWlubHkgbm90IHRoZSBsYXRlc3QgYW5kIGdy
ZWF0ZXN0Lgo+Cj4gT25lIGZvciBSb2Igd2hlbiBoZSdzIGJhY2ssIEkgdGhpbmsgIDopCgpJIHdv
dWxkbid0IGhhdmUgZXhwZWN0ZWQgQVNfVFJBTlNDRkdfQURSTU9ERV9MRUdBQ1kgdG8gd29yayBh
bmQgaWYgaXQKZGlkIGl0IHdhcyBieSBjaGFuY2UuIFNvIEkgZG9uJ3QgdGhpbmsgaXQgaXMgc29t
ZXRoaW5nIHdlIHdhbnQgdG8Kc3VwcG9ydC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
