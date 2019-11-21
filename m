Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A710509A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345EE6ED72;
	Thu, 21 Nov 2019 10:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676786ED72
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:36:16 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 23so694682otf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 02:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVm/FEuOaDuzh9olJ+shYNh1PB9eYBij2TiUyrfD0Mc=;
 b=VdEsNYmLag3Ev4aHgwt+fFXpTgf+IpkQ9wmjdKaUyu3DMp5n9kk3BadxnetiGnz+q+
 9eF0ZeR3Uj2uFLkeVUFEseqlV60B/K9AZnLHsfTrswhjrEQHb9wWMCySJ0X39aFGsfwS
 enNedaYEiDQNHzGoXdxkPWhEtzBWpG7GSFp6XGb3hBUvdpkYtYVBlJFVwJqyWUaSh60s
 EdZEt4ESZp5m8wjDheQnEzFg6nEVoOszPy5p+dquiSUGot9/HPTbIUozbEDR1u4tgYka
 s3AT+Lo/sUT7ePUWNCVTQFF2K4sw64HO66CchsKsUsKZ/dltIHpddpo9uUVI6G7e4DLI
 VKTw==
X-Gm-Message-State: APjAAAX3W+41KA7WaR0LjIAQlQV9DHbNmCSH6aUDzYyxhdeTLnsjqATH
 1tqR63nCIdpVrJOYGO9U+SNgf5PjRNOQG2L7jYQengYK
X-Google-Smtp-Source: APXvYqxoLGruOR4FKFSeOPLQ+xclg91vNWm5EyDwP+ioL4f9JrERqWa2hJ5S623zRpYk0BRE6gKXcHldbCT6yO0Iuvg=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr6129035otc.188.1574332575632; 
 Thu, 21 Nov 2019 02:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191121080259.7szddrq2bkecif7b@sirius.home.kraxel.org>
 <20191121084953.GB6236@phenom.ffwll.local>
 <20191121101823.2774x3htreifdjqf@sirius.home.kraxel.org>
In-Reply-To: <20191121101823.2774x3htreifdjqf@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Nov 2019 11:36:04 +0100
Message-ID: <CAKMK7uG3gXWW_exta9=SLY_OhMTAZoGF9U_MkJ60co7s-MiCsQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dVm/FEuOaDuzh9olJ+shYNh1PB9eYBij2TiUyrfD0Mc=;
 b=LSuhh1lkPofoX2uv0XHu/OnWB7SUCBhLsm/cOplfOZHFCn2qFnZk1k41ENBA+3LaY2
 ho6p51F6id7BFawDPd3dfVegAIIirVZrr0CvuSftvCYeDetqfDeagmJXsAL94sMalEOc
 EWk30bJAVJ2GeuOgBKy7B7rkrUjYtcD/+S2HY=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MTggQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6NDk6NTNBTSAr
MDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDA5
OjAyOjU5QU0gKzAxMDAsIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gPiA+ICAgSGksCj4gPiA+Cj4g
PiA+ID4gPiB1cGRhdGUtb2JqZWN0LWFmdGVyLW1vdmUgd29ya3MgZmluZS4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiB0cnkgemFwIG1hcHBpbmdzIHdpdGggbWFkdmlzZShkb250bmVlZCkgaGFzIG5vIGJh
ZCBlZmZlY3RzIChhZnRlciB2cmFtCj4gPiA+ID4gPiBtb3ZlLCB0cnlpbmcgdG8gZm9yY2UgcmUt
Y3JlYXRpbmcgdGhlIHB0ZXMpLgo+ID4gPiA+Cj4gPiA+ID4gV2VsbCBpZiBpdCdzIGJyb2tlbiB0
aGUgemFwcGluZyB3b3VsZG4ndCB3b3JrIDotKQo+ID4gPiA+Cj4gPiA+ID4gPiBkaWRuJ3QgdHJ5
IHRoZSBtZW1vcnkgcHJlc3N1cmUgdGhpbmcgeWV0Lgo+ID4gPiA+Cj4gPiA+ID4gSSdtIHN1cnBy
aXNlZCAuLi4gYW5kIEkgaGF2ZSBubyBpZGVhIGhvdy93aHkgaXQga2VlcHMgd29ya2luZy4KPiA+
ID4gPgo+ID4gPiA+IEZvciBteSBwYXJhbm9pYSwgY2FuIHlvdSBpbnN0cnVtZW50IHRoZSB0dG0g
cGFnZSBmYXVsdCBoYW5kbGVyLCBhbmQgZG91YmxlCj4gPiA+ID4gY2hlY2sgdGhhdCB3ZSBnZXQg
bmV3IGZhdWx0cyBhZnRlciB0aGUgbW92ZSwgYW5kIHNldCB1cCBuZXcgcHRlcyBmb3IgdGhlCj4g
PiA+ID4gc2FtZSBvbGQgbWFwcGluZywgYnV0IG5vdyBwb2ludGluZyBhdCB0aGUgbmV3IHBsYWNl
IGluIHZyYW0/Cj4gPiA+Cj4gPiA+IEhtbSwgb25seSB0aGUgZHJtIGRldmljZSBtYXBwaW5nIGlz
IGZhdWx0ZWQgaW4gYWZ0ZXIgbW92aW5nIGl0LAo+ID4gPiB0aGUgZG1hLWJ1ZiBtYXBwaW5nIGlz
IG5vdC4gIEZpeGVkIGJ5Ogo+ID4KPiA+IEFoIHllcywgdGhhdCdzIG1vcmUgd2hhdCBJJ2QgZXhw
ZWN0IHRvIGhhcHBlbiwgYW5kIHRoZSBiZWxvdyBpcyB3aGF0IEknZAo+ID4gZXhwZWN0IHRvIGZp
eCB0aGluZ3MgdXAuIEkgdGhpbmsgd2Ugc2hvdWxkIG1vdmUgaXQgdXAgYWhlYWQgb2YgdGhlIGRl
dmljZQo+ID4gY2FsbGJhY2sgKHNvIHRoYXQgZHJpdmVycyBjYW4gb3ZlcndyaXRlKSBhbmQgdGhl
biBwdXNoIGFzIGEgZml4LiBTZXBhcmF0ZQo+ID4gZnJvbSBhIHBvc3NpYmxlIHBhdGNoIHRvIHVu
ZG8gdGhlIGZha2Ugb2Zmc2V0IHJlbW92YWwuCj4gPiAtRGFuaWVsCj4KPiBJcyB0aGVyZSBhIG1v
cmUgZWxlZ2FudCB3YXkgdGhhbiBjb3B5aW5nIHRoZSBpbnRlbCBsaXN0IG9uIG5vbi1pbnRlbAo+
IHBhdGNoZXMgdG8ga2ljayBpbnRlbCBjaT8KCk5vcGUsIG5vdCByZWFsbHkuCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
