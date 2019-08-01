Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739627DF8A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 17:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597146E70E;
	Thu,  1 Aug 2019 15:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3186E70D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 15:57:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so69613419eds.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 08:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8bv7pMvKKkwIVkPngNqkQL32dHUrGECTsk1mbuiRZ6Y=;
 b=uJsn7HGHDY/klml68GFzM/ibI8dTXKIktIHQctZ+14LRfPBPk/uiN5CTVcfgSqJfMF
 U5r+DIEH4IY/QwpV2lmkYb8/g94WtWSx7N3+aGRw76mop7jkHvmicltD1vN4ZIkSliQ5
 pM5L7FgMVuvFQU9YF2RJ/UBKpCKJue1u6ptbxjMPIZ5GVjcOq8p23kK+nUbcnq/svnSg
 zvO6MzV8kZ9/mSfkIwdd/V9fhc0gdqsiJ7M+BwnZT+TErbyYsV3jfRDBl3He5tXiWges
 M+AzuHC1cWPIJvEXKRXZfUgFl7dtYfIomcFJ0hdYp9vynAI5HV7oAatrZabQmP0PcBWj
 s4Bg==
X-Gm-Message-State: APjAAAVJV1PG/ycGhlPHyhH0Bhp0NW8ojnyUNp2z5LJQUIpiKCXglTF5
 EU/+FUYD9Czlyh0pgDi11M/N69odXEqTjAxgyk4=
X-Google-Smtp-Source: APXvYqyGeWsq0Dm8RWkVsJdPxFY3QFmMuo8dBAKnYybjIiTjJZ5h1AzW8BLjHa9mjAuOwTiw16GRr4MzNTZoOO8pVdU=
X-Received: by 2002:a17:906:6bc4:: with SMTP id
 t4mr103366912ejs.256.1564675074054; 
 Thu, 01 Aug 2019 08:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190717211542.30482-1-robdclark@gmail.com>
 <20190719092153.GJ15868@phenom.ffwll.local>
 <20190731192331.GT104440@art_vandelay>
 <156466322613.6045.7313079853087889718@skylake-alporthouse-com>
 <CAF6AEGu8K+PwRyY738aFyv+fdZ_UZDhY3XcFY-w4uLMW+w6X9Q@mail.gmail.com>
 <156467364918.6045.9820603183181141608@skylake-alporthouse-com>
In-Reply-To: <156467364918.6045.9820603183181141608@skylake-alporthouse-com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 1 Aug 2019 08:57:42 -0700
Message-ID: <CAF6AEGvZMxnvzBgzXTzgcJpuzGOE=YTt1-H09L2qSD==pBcPXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vgem: fix cache synchronization on arm/arm64
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8bv7pMvKKkwIVkPngNqkQL32dHUrGECTsk1mbuiRZ6Y=;
 b=cpQYBnfEwZGYGSuEI2Ta4BNuagzeeveyUz78G9FTN/tEe0rihxa0KsOcTqnGSxQNRf
 dj4Cf9pzh7oWs8AYlaBz0ofguT7UGDU7TtKIT+WpbHaYXrC9s89pSKJ2WGlYdnQ7lOY/
 KRAOd4GNhuLR+xbgjoWetjCgl//kZ55tckwtc0oHXCm8GCu7b+fG5t//mOtL5IrAb1bC
 0LfUCA691M+CFnBBDYy48eNc4LflS+Oxz5WO4h4mO40KGl8daErq80zimXP8vyo65gox
 FDvsLqNFNUo6YlMFC+Vke9U3nG6yVZBhdofiu2gdUP5cpecifP7ZOsqxar3TS2/rS9qK
 Onlw==
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
Cc: Deepak Sharma <deepak.sharma@amd.com>, Rob Clark <robdclark@chromium.org>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA4OjM0IEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFF1b3RpbmcgUm9iIENsYXJrICgyMDE5LTA4LTAxIDE2
OjE4OjQ1KQo+ID4gT24gVGh1LCBBdWcgMSwgMjAxOSBhdCA1OjQwIEFNIENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPiA+ID4KPiA+ID4gUXVvdGluZyBTZWFu
IFBhdWwgKDIwMTktMDctMzEgMjA6MjM6MzEpCj4gPiA+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkg
YXQgMTE6MjE6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+IE9uIFdl
ZCwgSnVsIDE3LCAyMDE5IGF0IDAyOjE1OjM3UE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+
ID4gPiA+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBkcm1fY2ZsdXNoX3BhZ2VzKCkgaXMgbm8tb3Agb24gYXJtL2FybTY0
LiAgQnV0IGluc3RlYWQgd2UgY2FuIHVzZQo+ID4gPiA+ID4gPiBkbWFfc3luYyBBUEkuCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IEZpeGVzIGZhaWx1cmVzIHcvIHZnZW1fdGVzdC4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gQW4gYWx0ZXJuYXRpdmUgYXBwcm9h
Y2ggdG8gdGhlIHNlcmllc1sxXSBJIHNlbnQgeWVzdGVyZGF5Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IE9uIHRoZSBwbHVzIHNpZGUsIGl0IGtlZXBzIHRoZSBXQyBidWZmZXJzIGFuZCBhdm9pZHMg
YW55IGRybSBjb3JlCj4gPiA+ID4gPiA+IGNoYW5nZXMuICBPbiB0aGUgbWludXMgc2lkZSwgSSBk
b24ndCB0aGluayBpdCB3aWxsIHdvcmsgKGF0IGxlYXN0Cj4gPiA+ID4gPiA+IG9uIGFybTY0KSBw
cmlvciB0byB2NS4wWzJdLCBzbyB0aGUgZml4IGNhbid0IGJlIGJhY2twb3J0ZWQgdmVyeQo+ID4g
PiA+ID4gPiBmYXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVhaCBzZWVtcyBhIGxvdCBtb3JlIHJl
YXNvbmFibGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiA+ID4KPiA+ID4gPiBBcHBsaWVkIHRvIGRybS1taXNj
LWZpeGVzLCB0aGFua3MhCj4gPiA+Cj4gPiA+IEJ1dCBpdCBkaWRuJ3QgYWN0dWFsbHkgZml4IHRo
ZSBmYWlsdXJlcyBpbiBDSS4KPiA+Cj4gPiBIbW0sIHRoYXQgaXMgdW5mb3J0dW5hdGUsIEknZCBh
c3N1bWVkIHRoYXQgc2lsZW5jZSBtZWFudCBsYXRlc3QKPiA+IHZlcnNpb24gd2FzIHdvcmtpbmcg
aW4gQ0kuLgo+Cj4gQWgsIHRha2VzIGEgaW50ZWwtZ2Z4QCBmb3IgQ0kgdG8gcGljayB1cCBwYXRj
aGVzIGF0bS4KPgo+ID4gZG1hX3N5bmNfc2dfKiBkb2Vzbid0IHdvcmsgb24geDg2PyAgSXQgd291
bGQgYmUga2luZGEgdW5mb3J0dW5hdGUgdG8KPiA+IGhhdmUgdmdlbSBvbmx5IHdvcmsgb24geDg2
ICpvciogYXJtLi4gIG1heWJlIGJyaW5naW5nIGJhY2sKPiA+IGRybV9jZmx1c2hfcGFnZXMoKSBj
b3VsZCBtYWtlIGl0IHdvcmsgaW4gYm90aCBjYXNlcwo+Cj4gSSB0aGluayBpdCBzdGVtcyBmcm9t
IHRoZSBleHBlY3RhdGlvbiB0aGF0IHZnZW0gcHJvdmlkZXMgImRldmljZQo+IGNvaGVyZW5jeSIg
Zm9yIENQVSBhY2Nlc3MuIEZyb20gdGhlIHRlc3RpbmcgcGVyc3BlY3RpdmUsIGl0J3MgbmljZSB0
bwo+IGVtdWxhdGUgSFcgaW50ZXJhY3Rpb25zOyBidXQgbWF5YmUgdGhhdCBpcyBqdXN0IGJleW9u
ZCB0aGUgZ2VuZXJhbAo+IGNhcGFiaWxpdGllcyBhbmQgd2UgY2Fubm90IHNpbXBseSB1c2Ugdmdl
bSBhcyB3ZSBkbyBjdXJyZW50bHkuIFRoYXQKPiB3b3VsZCBsZWF2ZSBhIGhvbGUgZm9yIG1vY2tp
bmcgcHJpbWUgaW4gQ0kgdGhhdCBuZWVkcyBmaWxsaW5nIDooCgp5ZWFoLCBiZWluZyBhICJmYWtl
IiBkZXZpY2UgbWFrZXMgdGhpbmdzIGEgYml0IHJvdWdoLi4gIChJIHdvbmRlciBpZgp0aGVyZSBp
cyBzb21lIHdheSB0byBkbyBhIFZNIHcvIGJvdGggdmlyZ2wgYW5kIGk5MTUvZ3Z0IHRvIGdldCBz
b21lCm1vcmUgInJlYWwiIHRlc3Rpbmc/KQoKT1RPSCwgSSBraW5kYSB3YW50IHRvIG1ha2UgZHJt
X2NhY2hlIHdvcmsgb24gYXJtNjQsIHNpbmNlIGRtYS1tYXBwaW5nCmlzIGFscmVhZHkgcHJvYmxl
bWF0aWMsIHdoaWNoIHdvdWxkIG1ha2UgdGhpcyBwYXRjaCB1bm5lY2Vzc2FyeS4gIChJJ20Kc3Rp
bGwgbm90IGVudGlyZWx5IHN1cmUgd2hhdCB0byBkbyBhYm91dCAzMmIgYXJtLi4pCgpCUiwKLVIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
