Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CD65367
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 11:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C456E158;
	Thu, 11 Jul 2019 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687E6E158
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 09:01:08 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r21so5086883otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 02:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeDZmXjNJ9N7oIVRGzsPot+OviyxnkTNYoPrR8aP9d0=;
 b=emtTipk8H6abCYCVJJrt4jg69oC7BSaw2KJdORPXlRB2ZkX42fPz/39Ra6aQPZ/Qd3
 LfzCRgPaY9y0tT7X83GqMIaG+HTmoFNpGFmMKTOkq1fazQzH/i41fUkdkwjEoDN9uSJj
 bPUyBgrXnclfgHDgW2994/36FDSpPMm0QH/rld8fFhISUzr2G54CsmH85plokrJJtqLb
 jn9xMUGEawqphw81dQTXsHZRPLlY2m6+3eP7/H+tuBii3ptGO79O7lsNPFH1rqwsvXgK
 AiO9Q+ejR201kY9UK9QAsP0+NJ4CHpb+g/3aF5LLtNEd368Re4EJg3l3siKjwdtrERhJ
 yXCA==
X-Gm-Message-State: APjAAAWrbnYImHd7LhrMqrHc78hN+ZboHElc7eUxMxqfnLbB7DfUP0Xc
 zQ4WKjx9USrp7so4YJFamV7Vz2+twVbHTzDR3XkKNg==
X-Google-Smtp-Source: APXvYqyCe/q3wxFRFcscYkRVe1u6hjZ8HXpR04sDpIEvQ3IpTztAbYS+YIrgCTNiGXnCwyPJ/360DKflCgH4LVh3/HQ=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr2620567oth.281.1562835667563; 
 Thu, 11 Jul 2019 02:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <20190711082105.GI15868@phenom.ffwll.local>
 <hG3hgN80Bt03njzCaW7h3xaog7ppTTBzmsShC0L5LdCbr5dFkHMJHHxizeYa_IYP7uCwMG-vPJOWMhueq2LirNKFhulkkni2KFf3XA24bb8=@emersion.fr>
In-Reply-To: <hG3hgN80Bt03njzCaW7h3xaog7ppTTBzmsShC0L5LdCbr5dFkHMJHHxizeYa_IYP7uCwMG-vPJOWMhueq2LirNKFhulkkni2KFf3XA24bb8=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 11 Jul 2019 11:00:56 +0200
Message-ID: <CAKMK7uHfnOHJS8sQ0fpysSTB-SiJ29ACH+rKQ45rhT+7rBH5pQ@mail.gmail.com>
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
To: Simon Ser <contact@emersion.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oeDZmXjNJ9N7oIVRGzsPot+OviyxnkTNYoPrR8aP9d0=;
 b=AyRT3XENh3voNDIU9ZRTMsgyN3Zo2yZCwY7qigQgaUK9FKGX+35qABr0yhnPDp6BAq
 ZMS0QvIAvXjqXPAhsTcRiA0OJKJAV/5XmwZeWSQsdUXNyXZoessYbmII4RGEXPDrsM06
 p2XUYh0KkwQAC4FEQBfYkTymHANoe85Nv1jTU=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMTA6MjggQU0gU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiB3cm90ZToKPgo+IE9uIFRodXJzZGF5LCBKdWx5IDExLCAyMDE5IDExOjIxIEFNLCBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiBPbiBUdWUsIEp1biAy
NSwgMjAxOSBhdCAxMDozODozMVBNIC0wMzAwLCBSb2RyaWdvIFNpcXVlaXJhIHdyb3RlOgo+ID4K
PiA+ID4gVGhlIGNvbXB1dGVfY3JjKCkgZnVuY3Rpb24gaXMgcmVzcG9uc2libGUgZm9yIGNhbGN1
bGF0aW5nIHRoZQo+ID4gPiBmcmFtZWJ1ZmZlciBDUkMgdmFsdWU7IGR1ZSB0byB0aGUgWFJHQiBm
b3JtYXQsIHRoaXMgZnVuY3Rpb24gaGFzIHRvCj4gPiA+IGlnbm9yZSB0aGUgYWxwaGEgY2hhbm5l
bCBkdXJpbmcgdGhlIENSQyBjb21wdXRhdGlvbi4gVGhlcmVmb3JlLAo+ID4gPiBjb21wdXRlX2Ny
YygpIHNldCB6ZXJvIHRvIHRoZSBhbHBoYSBjaGFubmVsIGRpcmVjdGx5IGluIHRoZSBpbnB1dAo+
ID4gPiBmcmFtZWJ1ZmZlciwgd2hpY2ggaXMgbm90IGEgcHJvYmxlbSBzaW5jZSB0aGlzIGZ1bmN0
aW9uIHJlY2VpdmVzIGEgY29weQo+ID4gPiBvZiB0aGUgb3JpZ2luYWwgYnVmZmVyLiBIb3dldmVy
LCBpZiB3ZSB3YW50IHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGluIGEKPiA+ID4gY29udGV4dCB3aXRo
b3V0IGEgYnVmZmVyIGNvcHksIGl0IHdpbGwgY2hhbmdlIHRoZSBpbml0aWFsIHZhbHVlLiBUaGlz
Cj4gPiA+IHBhdGNoIG1ha2VzIGNvbXB1dGVfY3JjKCkgY2FsY3VsYXRlIHRoZSBDUkMgdmFsdWUg
d2l0aG91dCBtb2RpZnlpbmcgdGhlCj4gPiA+IGlucHV0IGZyYW1lYnVmZmVyLgo+ID4KPiA+IFVo
IHdoeT8gRm9yIHdyaXRlYmFjayB3ZSdyZSB3cml0aW5nIHRoZSBvdXRwdXQgdG9vLCBzbyB3ZSBj
YW4gd3JpdGUKPiA+IHdoYXRldmVyIHdlIHdhbnQgdG8gaW50byB0aGUgYWxwaGEgY2hhbm5lbC4g
Rm9yIHdyaXRlYmFjayB3ZSBzaG91bGQgbmV2ZXIKPiA+IGFjY2VwdCBhIHBpeGVsIGZvcm1hdCB3
aGVyZSBhbHBoYSBhY3R1YWxseSBtYXR0ZXJzLCB0aGF0IGRvZXNuJ3QgbWFrZQo+ID4gc2Vuc2Uu
IFlvdSBjYW4ndCBzZWUgdGhyb3VnaCBhIHJlYWwgc2NyZWVuIGVpdGhlciwgdGhleSBhcmUgYWxs
IG9wYXF1ZSA6LSkKPgo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGF0LiBTZWUgZS5nLgo+IGh0dHBz
Oi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1NlZS10aHJvdWdoX2Rpc3BsYXkKClRoZXkgaGF2ZSB2
YXJpYWJsZSBvcGFxdWVuZXNzLCBpbmRlcGVuZGVudCBvZiB0aGUgY29sb3IgdmFsdWU/Cgo+IE1h
bnkgZHJpdmVycyBhbHJlYWR5IGFjY2VwdCBGQnMgd2l0aCBhbHBoYSBjaGFubmVscyBmb3IgdGhl
IHByaW1hcnkKPiBwbGFuZS4KPiBodHRwczovL2RybWRiLmVtZXJzaW9uLmZyL2Zvcm1hdHM/cGxh
bmU9MQoKSWYgeW91IGhhdmUgYSBiYWNrZ3JvdW5kIGNvbG9yICh3ZSBhc3N1bWUgaXQgdG8gYmUg
YmxhY2spIHRoYXQgbWFrZXMKc2Vuc2UuIFN0aWxsIGRvZXNuJ3QgbWVhbiB3ZSByZW5kZXIgdHJh
bnNwYXJlbnQgb3V0cHV0LCB3ZSBkb24ndC4KCj4gSnVzdCBtYWtpbmcgc3VyZSB3ZSBhcmVuJ3Qg
cGFpbnRpbmcgb3Vyc2VsdmVzIGludG8gYSBjb3JuZXIuIDpQCgpZb3UgY2FuIGFkZCBBUkdCIHRv
IHlvdXIgd3JpdGViYWNrIGZvcm1hdCBzdXBwb3J0IGxpc3QsIHRoZXJlIGlzIG5vCmNvcm5lciBo
ZXJlIGF0IGFsbCB0byBnZXQgaW50byAoYXQgbGVhc3QgaW4gdGhlIGFic3RyYWN0IHNlbnNlKS4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
