Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F99E35B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7446E421;
	Thu, 24 Oct 2019 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9F6E421
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:39:55 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA46120679
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:39:54 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id f18so23021509qkm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 07:39:54 -0700 (PDT)
X-Gm-Message-State: APjAAAVy9kkAWFlO+p4CGkUcTHxZy4cQWKUKrlwEJKjeigW/6A+TVGdS
 2Z1IMYBhkM2pkoN080BgV0KVFbLJPoL+ijeh1w==
X-Google-Smtp-Source: APXvYqxCYVUxIYJjjY33V4y8bvPAs2oDsvmuv6M/lK7PhmtFWtte6PHvEYDuYJCbSbx46GhTgPGS6RxuDN3idrEmbIw=
X-Received: by 2002:a05:620a:12b4:: with SMTP id
 x20mr14313879qki.254.1571927994022; 
 Thu, 24 Oct 2019 07:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191023222226.9064-1-robh@kernel.org>
 <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
 <20191024123214.GE11828@phenom.ffwll.local>
In-Reply-To: <20191024123214.GE11828@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2019 09:39:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+4N8iNjTLkh5BvcGQ4YaSe=atXs4TZrMEJ1hreQn=pQA@mail.gmail.com>
Message-ID: <CAL_Jsq+4N8iNjTLkh5BvcGQ4YaSe=atXs4TZrMEJ1hreQn=pQA@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Fix mmap fake offset for
 drm_gem_object_funcs.mmap
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571927995;
 bh=7gVRUifsHpIMkVGOOnxBV7spBnCv+oqseKzOLZa0NFM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qX7Q4bdKuQDRiE2WHAx8OKCX2MIxU3gr8OdYfdaECUKV7+e2/e3Iz32swbcojCBfv
 cNWFwmRBnbSQF+4+ZyR6jWqywQvUIhBOBZH6bDfy2POYz4W3Ldr5r9h1KiLw9PpJr0
 lQVBj2yOq82cZlotbpSj/nhPSDz9kNRDYtairWiU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNzozMiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTE6MDI6NDBBTSArMDIw
MCwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDA1OjIy
OjI2UE0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPiBDb21taXQgYzQwMDY5Y2I3YmQ2
ICgiZHJtOiBhZGQgbW1hcCgpIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzIikKPiA+ID4gaW50cm9k
dWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2ggaXMgZXhwZWN0ZWQgdG8gc3VidHJh
Y3QgdGhlCj4gPiA+IGZha2Ugb2Zmc2V0IGZyb20gdm1fcGdvZmYuCj4gPgo+ID4gTG9uZy10ZXJt
IGl0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGp1c3QgcmVtb3ZlIHRoZSBmYWtlIG9mZnNl
dAo+ID4gaGFuZGxpbmcgZnJvbSBkcml2ZXJzLiAgQnV0IHRoYXQnbGwgb25seSB3b3JrIG9uY2Ug
YWxsIGRyaXZlcnMgc3dpdGNoZWQKPiA+IGF3YXkgZnJvbSBjdXN0b20gZm9wcy0+bW1hcCBoYW5k
bGVycyBzbyB3ZSBjYW4gaGFuZGxlIHRoZSBvZmZzZXQgLT4gb2JqCj4gPiBsb29rdXAgaW4gdGhl
IGRybSBjb3JlIGZvciBldmVyeWJvZHkuCj4gPgo+ID4gU28gbGV0J3MgZ28gdGhpcyB3YXkgZm9y
IG5vdy4KPiA+Cj4gPiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Cj4KPiBVaCB0aGlzIHNvdW5kcyBsaWtlIGRvdWJsaW5nIGRvd24gb24gcmF0aGVyIGhvcnJpYmxl
IHNlbWFudGljcy4gQ2FuIHdlIGF0Cj4gbGVhc3Qgc3RvcCB0aGUgbWVzcyBpbnN0ZWFkIG9mIGJh
a2luZyBpdCBpbiBmb3IgcmVhbD8gVGhlIGhvb2sgaXMgdmVyeQo+IHZlcnkgbmV3IGFmdGVyIGFs
bC4gSS5lLgo+IC0gRG9jdW1lbnQgdGhhdCBvYmotPmZ1bmNzLT5tbWFwIHdpbGwgaGF2ZSAwIG9m
ZnNldCBpbiB0aGUga2VybmVsZG9jLgo+IC0gUmVtb3ZlIHRoZSBzdWJ0cmFjdGluZyBmcm9tIHRo
ZSBzaG1lbSBoZWxwZXIKPiAtIEluIHR0bV9ib19tbWFwX29iaiByZS1hZGQgdGhlIG9mZnNldCB3
aXRoIGEgaHVnZSBGSVhNRSBjb21tZW50Lgo+IC0gQWRqdXN0IGRybV9nZW1fbW1hcF9vYmogdG8g
ZG8gdGhhdCBzYW1lIGZvciBvYmotPmZ1bmNzLT5tbWFwIGFuZCBhbHNvCj4gICBkb2N1bWVudCB0
aGUgZXhwZWN0YXRpb24gdGhlcmUgdG9vLgoKT2theS4KCj4gVGhpcyBmZWVscyBsaWtlIHZlcnkg
bXVjaCBnb2luZyB0aGUgd3JvbmcgZGlyZWN0aW9uIC4uLgo+Cj4gQWxzbyBJIGd1ZXNzIEdlcmQg
ZGlkbid0IHJlYWxseSB0ZXN0IHRoaXMgcHJpbWUgbW1hcCBzdXBwb3J0PwoKUGVyaGFwcyBiZWNh
dXNlIGF0IGxlYXN0IHBhcnRzIG9mIHRoZSBJR1QgInZnZW0iIHRlc3RzIHJlYWxseSBoYXZlCm5v
dGhpbmcgc3BlY2lmaWMgZm9yICJ2Z2VtIiBhbmQgdGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGFu
b3RoZXIgdGVzdApjYXNlIHRoYXQgZG9lcyBydW4gZG9pbmcgdGhlIHNhbWUgdGhpbmcuIEFuZCBu
b25lIG9mIHRoZSBJR1QgcHJpbWUKdGVzdHMgcnVuIHdpdGhvdXQgYW4gSW50ZWwgZHJpdmVyLiBM
b29raW5nIGF0IElHVCBhbHdheXMgbWFrZXMgbWUgc2FkLAphbmQgdGhlbiBJIG1vdmUgb24gdG8g
b3RoZXIgdGhpbmdzLi4uIDwvcmFudD4KCkJUVywgYXJlIHRoZXJlIElHVCB0ZXN0IHJlc3VsdHMg
Zm9yIHZnZW0vdmttcyBzb21ld2hlcmU/IEkgZGlkbid0IGhhdmUKYW55IGx1Y2sgZmluZGluZyBh
bnl0aGluZy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
