Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176BBE360B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07126E43C;
	Thu, 24 Oct 2019 14:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05446E43C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:57:04 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v138so1972691oif.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 07:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EA3WkWm2bN73rKW3U4LaatM6yKyaTt/H4ATtFLK/Elk=;
 b=TEH835cDVwpqJXyh2c9fAdAYzE+c8jg/bcQphkNSmpRmaU5AGLzN0NDVrEWAFk9tU1
 yhGkuxILVTmQ1dKcIBwz8X0PRMQ8KNMxY8Hk/UQmDGdoK/kdepamFD08hp/XTxFWTG8f
 nTfm2B2rQVLcsfFMfFMs//u/PwlUeyhmtP1hkBG6haygXiuaK8Xvu07K3p9T++vT9k9e
 htCU9aYEg67TEAdXk7yS544CTs9MEwXki9tRX0B74hnUG/eFB/ieLEe/8zkAW1C4pM+4
 8/L8/qrANhw76nVeRTv9opfkQS7rqWGcnt9rgBV7TuB4OBtSCi+k8IN64PPHUSU0mWaB
 JZlw==
X-Gm-Message-State: APjAAAUmJ+hEsxFowC52mgeQrjLBuA5CYvtBDO8CopX5espKcMLpDxFI
 SvTg/Ic29NIMkxrVnd6SC5mcj7BSh5Qu60ijz5zEAg==
X-Google-Smtp-Source: APXvYqwajIH9NjBkJFpzE5aVbmDKveUizD8IjpR9YkUjgP9itgPvKgRDFPHXw9wuM9PiH8zzzSW1EwR5lgfBFLLB5ss=
X-Received: by 2002:a54:4e8a:: with SMTP id c10mr5048046oiy.14.1571929024059; 
 Thu, 24 Oct 2019 07:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191023222226.9064-1-robh@kernel.org>
 <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
 <20191024123214.GE11828@phenom.ffwll.local>
 <CAL_Jsq+4N8iNjTLkh5BvcGQ4YaSe=atXs4TZrMEJ1hreQn=pQA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+4N8iNjTLkh5BvcGQ4YaSe=atXs4TZrMEJ1hreQn=pQA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Oct 2019 16:56:27 +0200
Message-ID: <CAKMK7uGHY+MKzkFMHTUi95RWUk_SYAFZtxg_iwSOqBFNdmEfYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Fix mmap fake offset for
 drm_gem_object_funcs.mmap
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EA3WkWm2bN73rKW3U4LaatM6yKyaTt/H4ATtFLK/Elk=;
 b=FP/J9IJo6bHeGiv0zzMhAT5dtLM3g48EqkNbb4bsRUspNcdGXGGuCCLjFlVCj+61M6
 k91pVsKoRVNqhjOdDCk7wLYm1rXU5ezniQ8QX6GQ/B5aDYPBeAmmeMlMVmOjd28ddeBl
 y3zkd4aKdW6KUfCXsCa3EXD623v/oq3/1phe8=
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNDozOSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDc6MzIgQU0gRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE9jdCAyNCwgMjAx
OSBhdCAxMTowMjo0MEFNICswMjAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4gPiBPbiBXZWQs
IE9jdCAyMywgMjAxOSBhdCAwNToyMjoyNlBNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+
ID4gPiBDb21taXQgYzQwMDY5Y2I3YmQ2ICgiZHJtOiBhZGQgbW1hcCgpIHRvIGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIikKPiA+ID4gPiBpbnRyb2R1Y2VkIGEgR0VNIG9iamVjdCBtbWFwKCkgaG9vayB3
aGljaCBpcyBleHBlY3RlZCB0byBzdWJ0cmFjdCB0aGUKPiA+ID4gPiBmYWtlIG9mZnNldCBmcm9t
IHZtX3Bnb2ZmLgo+ID4gPgo+ID4gPiBMb25nLXRlcm0gaXQgaXMgcHJvYmFibHkgYSBnb29kIGlk
ZWEgdG8ganVzdCByZW1vdmUgdGhlIGZha2Ugb2Zmc2V0Cj4gPiA+IGhhbmRsaW5nIGZyb20gZHJp
dmVycy4gIEJ1dCB0aGF0J2xsIG9ubHkgd29yayBvbmNlIGFsbCBkcml2ZXJzIHN3aXRjaGVkCj4g
PiA+IGF3YXkgZnJvbSBjdXN0b20gZm9wcy0+bW1hcCBoYW5kbGVycyBzbyB3ZSBjYW4gaGFuZGxl
IHRoZSBvZmZzZXQgLT4gb2JqCj4gPiA+IGxvb2t1cCBpbiB0aGUgZHJtIGNvcmUgZm9yIGV2ZXJ5
Ym9keS4KPiA+ID4KPiA+ID4gU28gbGV0J3MgZ28gdGhpcyB3YXkgZm9yIG5vdy4KPiA+ID4KPiA+
ID4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4KPiA+IFVo
IHRoaXMgc291bmRzIGxpa2UgZG91YmxpbmcgZG93biBvbiByYXRoZXIgaG9ycmlibGUgc2VtYW50
aWNzLiBDYW4gd2UgYXQKPiA+IGxlYXN0IHN0b3AgdGhlIG1lc3MgaW5zdGVhZCBvZiBiYWtpbmcg
aXQgaW4gZm9yIHJlYWw/IFRoZSBob29rIGlzIHZlcnkKPiA+IHZlcnkgbmV3IGFmdGVyIGFsbC4g
SS5lLgo+ID4gLSBEb2N1bWVudCB0aGF0IG9iai0+ZnVuY3MtPm1tYXAgd2lsbCBoYXZlIDAgb2Zm
c2V0IGluIHRoZSBrZXJuZWxkb2MuCj4gPiAtIFJlbW92ZSB0aGUgc3VidHJhY3RpbmcgZnJvbSB0
aGUgc2htZW0gaGVscGVyCj4gPiAtIEluIHR0bV9ib19tbWFwX29iaiByZS1hZGQgdGhlIG9mZnNl
dCB3aXRoIGEgaHVnZSBGSVhNRSBjb21tZW50Lgo+ID4gLSBBZGp1c3QgZHJtX2dlbV9tbWFwX29i
aiB0byBkbyB0aGF0IHNhbWUgZm9yIG9iai0+ZnVuY3MtPm1tYXAgYW5kIGFsc28KPiA+ICAgZG9j
dW1lbnQgdGhlIGV4cGVjdGF0aW9uIHRoZXJlIHRvby4KPgo+IE9rYXkuCj4KPiA+IFRoaXMgZmVl
bHMgbGlrZSB2ZXJ5IG11Y2ggZ29pbmcgdGhlIHdyb25nIGRpcmVjdGlvbiAuLi4KPiA+Cj4gPiBB
bHNvIEkgZ3Vlc3MgR2VyZCBkaWRuJ3QgcmVhbGx5IHRlc3QgdGhpcyBwcmltZSBtbWFwIHN1cHBv
cnQ/Cj4KPiBQZXJoYXBzIGJlY2F1c2UgYXQgbGVhc3QgcGFydHMgb2YgdGhlIElHVCAidmdlbSIg
dGVzdHMgcmVhbGx5IGhhdmUKPiBub3RoaW5nIHNwZWNpZmljIGZvciAidmdlbSIgYW5kIHRoZXJl
IGRvZXNuJ3Qgc2VlbSB0byBiZSBhbm90aGVyIHRlc3QKPiBjYXNlIHRoYXQgZG9lcyBydW4gZG9p
bmcgdGhlIHNhbWUgdGhpbmcuIEFuZCBub25lIG9mIHRoZSBJR1QgcHJpbWUKPiB0ZXN0cyBydW4g
d2l0aG91dCBhbiBJbnRlbCBkcml2ZXIuIExvb2tpbmcgYXQgSUdUIGFsd2F5cyBtYWtlcyBtZSBz
YWQsCj4gYW5kIHRoZW4gSSBtb3ZlIG9uIHRvIG90aGVyIHRoaW5ncy4uLiA8L3JhbnQ+CgpUaGUg
b25seSBwcmltZSB0ZXN0IHRoYXQgY291bGQgYmUgbWFkZSBnZW5lcmljIGlzIHRoZSBrbXMgb25l
LCB3aGljaApzdGlsbCByZXF1aXJlcyBjcmMgdG8gbWFrZSBzdXJlIHRoZSBzdHVmZiBhY3R1YWxs
eSB3b3Jrcy4gRXZlcnl0aGluZwplbHNlIGlzIGtpbmRhIGRldmljZSBzcGVjaWZpYyAoYW5kIHZn
ZW0gaXMganVzdCB0aGUgdGVzdCB2ZWhpY2xlIHRvCm1ha2Ugd3JpdGluZyBhIHRlc3RjYXNlIHBv
c3NpYmxlIHdpdGhvdXQgYWN0dWFsbHkgbmVlZGluZyAyIGdwdXMpLgpNYXliZSB3ZSBjb3VsZCBk
byBhIGR1bWIgYnVmZmVyIGV4cG9ydCwgdGhlbiBtbWFwIHRlc3QsIGJ1dCB0aGF0CmRvZXNuJ3Qg
ZXhpc3QuIEkgdGhpbmsgZm9yIHRoZSBwcmltZStrbXMgb25lIHRoZXJlJ3MgYWN0dWFsbHkgcGF0
Y2hlcwpmbG9hdGluZyBhcm91bmQgdG8gbWFrZSBpdCBnZW5lcmljLgoKRm9yIHRoZSBvdGhlcnMg
SSByZWFsbHkgZG9uJ3QgdGhpbmsgeW91IGNhbiBtYWtlIHRoZW0gbXVjaCBnZW5lcmljLgoKPiBC
VFcsIGFyZSB0aGVyZSBJR1QgdGVzdCByZXN1bHRzIGZvciB2Z2VtL3ZrbXMgc29tZXdoZXJlPyBJ
IGRpZG4ndCBoYXZlCj4gYW55IGx1Y2sgZmluZGluZyBhbnl0aGluZy4KClVuZm9ydHVuYXRlbHkg
bm90ICh5ZXQpLiBJIGhhdmUgdGhpcyBkcmVhbSB0aGF0IG9uY2Ugd2UgaGF2ZSB0aGUKa2VybmVs
cyBvbiBnaXRsYWIgSSdsbCBtYWtlIGlndCBydW5zIG9uIGEgcWVtdSBydW4gd2l0aCB2a21zK3Zn
ZW0gb25seQpoYXBwZW4sIGFzIHRoZSBmaXJzdCBiYXNlbGluZS4gQnV0IHdlJ3JlIHNvbWUgd2F5
cyBvZmYgZnJvbSB0aGF0IHN0aWxsCjotLwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
