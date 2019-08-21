Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5E97F9B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 18:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B5F6E347;
	Wed, 21 Aug 2019 16:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8D36E347
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 16:04:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A21223401
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 16:04:09 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id p13so2251530qkg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:04:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWFMJoYk21DyALXor2XI13hXssYK2LgbRe1gXd7nEh0s9FRIq8c
 7Y28nShy5ie5FYSK21izyfEoGfnVgHtptSx2OQ==
X-Google-Smtp-Source: APXvYqy6gSA/TsWV0Z+DFcyyPJO/4+X0DcIa045Is8r++DI2zU4OhvAZt7R+iFdn0GN6J3r0YSsMskY7bdVvanqAtTw=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr32905143qke.223.1566403448186; 
 Wed, 21 Aug 2019 09:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190819161204.3106-1-robh@kernel.org>
 <20190819161204.3106-3-robh@kernel.org>
 <20190820090543.GE11147@phenom.ffwll.local>
 <CAL_JsqL5JsFbQAe1DJ1AbtYjZjVv1++ooH4hxEhiQUzw3MVjXA@mail.gmail.com>
 <20190821082343.GJ11147@phenom.ffwll.local>
In-Reply-To: <20190821082343.GJ11147@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Aug 2019 11:03:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL01_fLEkZgsmynWLw+fT-HQ-bfUhHO5mcmN0wMOCxZSw@mail.gmail.com>
Message-ID: <CAL_JsqL01_fLEkZgsmynWLw+fT-HQ-bfUhHO5mcmN0wMOCxZSw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/shmem: Use mutex_trylock in drm_gem_shmem_purge
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566403449;
 bh=NFgCQC71m4K7Do2t8fVZ/CY6b3oat/Hx7ibkPRssLlU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uqGIQfU/cSSeGnyEhw8Ds4e/BAz8lEbFx/mZ+Yr1FvOpOwXlbU7+5+lE/OmFOiosf
 HgHEOGdvgxlHr9OExyypTsp0Himtw9KuSk9egy7Md63Gko0IwTlXNnH/OvBfvcI040
 bHiYh6NNo4iSXYHiigMHLfkxTv59q8RkO+/fsWKU=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMzoyMyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDc6MzU6NDdBTSAtMDUw
MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCA0OjA1IEFN
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1v
biwgQXVnIDE5LCAyMDE5IGF0IDExOjEyOjAyQU0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+
ID4gPiA+IExvY2tkZXAgcmVwb3J0cyBhIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSB3aXRo
IHBhZ2VzX2xvY2sgdGFrZW4gaW4KPiA+ID4gPiB0aGUgc2hyaW5rZXIgY2FsbGJhY2suIFRoZSBk
ZWFkbG9jayBjYW4ndCBhY3R1YWxseSBoYXBwZW4gd2l0aCBjdXJyZW50Cj4gPiA+ID4gdXNlcnMg
YXQgbGVhc3QgYXMgYSBCTyB3aWxsIG5ldmVyIGJlIHB1cmdlYWJsZSB3aGVuIHBhZ2VzX2xvY2sg
aXMgaGVsZC4KPiA+ID4gPiBUbyBiZSBzYWZlLCBsZXQncyB1c2UgbXV0ZXhfdHJ5bG9jaygpIGlu
c3RlYWQgYW5kIGJhaWwgaWYgYSBCTyBpcyBsb2NrZWQKPiA+ID4gPiBhbHJlYWR5LgoKWy4uLl0K
Cj4gPiA+ID4gLXZvaWQgZHJtX2dlbV9zaG1lbV9wdXJnZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKPiA+ID4gPiArYm9vbCBkcm1fZ2VtX3NobWVtX3B1cmdlKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqKQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgc3RydWN0IGRybV9nZW1fc2htZW1f
b2JqZWN0ICpzaG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7Cj4gPiA+ID4KPiA+ID4g
PiAtICAgICBtdXRleF9sb2NrKCZzaG1lbS0+cGFnZXNfbG9jayk7Cj4gPiA+ID4gKyAgICAgaWYg
KCFtdXRleF90cnlsb2NrKCZzaG1lbS0+cGFnZXNfbG9jaykpCj4gPiA+Cj4gPiA+IERpZCB5b3Ug
c2VlIG15IHBpbmcgYWJvdXQgY3V0dGluZyBhbGwgdGhlIGxvY2tpbmcgb3ZlciB0byBkbWFfcmVz
dj8KPiA+Cj4gPiBZZXMsIGJ1dCB5b3UgZGlkbid0IHJlcGx5IHRvIFJvYiBDLiBhYm91dCBpdC4g
SSBndWVzcyBJJ2xsIGhhdmUgdG8gZ28KPiA+IGZpZ3VyZSBvdXQgaG93IHJlc2VydmF0aW9uIG9i
amVjdHMgd29yay4uLgo+Cj4gbXNtIHdhcyB0aGUgbGFzdCBkcml2ZXIgdGhhdCBzdGlsbCB1c2Vk
IHN0cnVjdF9tdXRleC4gSXQncyBhIGxvbmctdGVybQo+IGRlYWQtZW5kLCBhbmQgSSB0aGluayB3
aXRoIGFsbCB0aGUgZWZmb3J0IHJlY2VudGx5IHRvIGNyZWF0ZSBoZWxwZXJzIGZvcgo+IHJlbmRl
cmluZyBkcml2ZXJzIChzaG1lbSwgdnJhbSwgdHRtIHJlZmFjdG9yaW5nKSB3ZSBzaG91bGQgbWFr
ZSBhIHNvbGlkCj4gYXR0ZW1wdCB0byBnZXQgYWxpZ25lZC4gT3IgZGlkIHlvdSBtZWFuIHRoYXQg
Um9iIENsYXJrIGhhZCBzb21lCj4gcmVwbHkvcXVlc3Rpb25zIHRoYXQgSSBkaWRuJyByZXNwb25k
IHRvIGJlY2F1c2UgaXQgZmVsbCB0aHJvdWdoIGNyYWNrcz8KCkknbSBub3QgdXNpbmcgc3RydWN0
X211dGV4LCBzbyBJJ20gY29uZnVzZWQgYXMgdG8gd2h5IHlvdSBrZWVwCm1lbnRpb25pbmcgaXQu
IFRoZSBsaXN0IG9mIEJPcyBmb3IgdGhlIHNocmlua2VyIGlzIHByb3RlY3RlZCB3aXRoIGEKbXV0
ZXggZm9yIHRoZSBsaXN0LiBUaGF0IGxpc3QgaGVhZCwgbGlzdCBtdXRleCwgYW5kIHRoZSBzaHJp
bmtlcgppbnN0YW5jZSBhbGwgaGF2ZSB0byBsaXZlIGF0IHRoZSBkcml2ZXIgbGV2ZWwsIHNvIHRo
ZXkgY2FuJ3QgYmUgbW92ZWQKaW50byBzaG1lbSBhcyB5b3Ugc3VnZ2VzdGVkLiBBZ3JlZWQ/CgpU
aGVuIHRoZXJlIGlzIHRoZSBwYWdlc19sb2NrIHdpdGhpbiB0aGUgc2htZW0gQk8uIEkgYXNzdW1l
IHRoYXQgaXMKd2hhdCB5b3UgYXJlIHN1Z2dlc3RpbmcgY29udmVydGluZyB0byBkbWFfcmVzdj8g
SSdtIG5vdCByZWFsbHkgc3VyZQp3aGF0IHRoYXQgd291bGQgbG9vayBsaWtlLiBZb3UncmUgZ29p
bmcgdG8gaGF2ZSB0byBzcGVsbCBpdCBvdXQgZm9yCm1lLiBJbiBteSBicmllZiBsb29rIGF0IGl0
LCBpdCBzZWVtcyBsaWtlIGFkZGVkIGNvbXBsZXhpdHkgYW5kIGl0J3MKbm90IGNsZWFyIHRvIG1l
IHdoYXQgdGhhdCBidXlzLiBBbHNvLCBJIHRoaW5rIGl0IHdvdWxkIG1vc3RseSBiZSBhbgppbnRl
cm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2Ygc2htZW0gaGVscGVycywgdGhvdWdoIHRoZXJl
IGlzIG9uZQpzcG90IGluIHBhbmZyb3N0IHRoYXQgdGFrZXMgdGhlIGxvY2sgKDIgYmVmb3JlIHRo
aXMgc2VyaWVzKS4gU28gaXQncwpraW5kIG9mIG9ydGhvZ29uYWwgdG8gdGhpcyBzZXJpZXMuCgpB
bHNvLCBJIHRoaW5rIGdldHRpbmcgbW9yZSBkcml2ZXJzIHVzaW5nIHNobWVtIGlzIG1vcmUgYmVu
ZWZpY2lhbCB0aGFuCmFsaWduaW5nIHRoZSBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEdFTSBoZWxw
ZXJzLiBXZSBzaG91bGQgYXQgbGVhc3QgYmUKYWJsZSB0byBjb252ZXJ0IHZnZW0gYW5kIHZrbXMg
SSB3b3VsZCB0aGluay4gVmFyaW91cyBLTVMgZHJpdmVycyB0b28sCmJ1dCB0aGVyZSdzIGFuIGlz
c3VlIGFyb3VuZCBrZXJuZWwgbWFwcGluZ3MgKG9yIGxhY2sgb2YpLiBUaGVyZSByZWFsbHkKc2hv
dWxkIGJlIGxpdHRsZSByZWFzb24gZm9yIG1vc3QgS01TIGRyaXZlcnMgdG8gaGF2ZSBhIGN1c3Rv
bSBCTyBhcwpDTUEgb3Igc2htZW0gaGVscGVycyBzaG91bGQgd29yay4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
