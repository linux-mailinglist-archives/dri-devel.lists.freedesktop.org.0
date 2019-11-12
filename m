Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19EF92EC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4B89BF6;
	Tue, 12 Nov 2019 14:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5C89BF6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:44:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n1so18778616wra.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=06qDehYL4B3jZJMwaNNxH+0yQWPBc3JHXK9jP6pNCwk=;
 b=F+jGvhLzbr1ZWndvd5HLf1kYbEGy5EPZgesMV8XyG8PjxmoaEzBlhB8HKIzKCEAQKs
 y5p3dtVJg0J5nglXTAMdMhlppx9kch3BxB43q8oCnNh2VJIKlXSq+/AdqPl7GSfz+rxZ
 mivV4tFViH/pTGvl6okU81V9UxUTyJvQGmUI3kOKEw9zT22wPkW2+yhoGOwGQ7Z5svzI
 TvGKum6CA3LwPvp5rAxgrsTc2x339y8tcOKQ0LTgS60DsjmUXCjewaABwQIgQcLKC6eO
 GLJdkcMzWADQRg0pEjKpvP/dE0YMT/iJAVKhpcn2LitMTZW3vkNcSeYKpcGI5Y7ppy8I
 eJWQ==
X-Gm-Message-State: APjAAAUJSZ+L35hWSBYcfnDXfp2l3tL6F7UTqyBLae073bEnNKMj5/9x
 HrQGYt+xkNWU1FN9wfBdhuXqCg==
X-Google-Smtp-Source: APXvYqxLILE62DZemx0IXvOIQpcd3TsrJif6pLp6/nztk0TlY2PJalMREGGmdll0JQ8m3QxI5mbdYQ==
X-Received: by 2002:a5d:6104:: with SMTP id v4mr24721790wrt.36.1573569877795; 
 Tue, 12 Nov 2019 06:44:37 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l4sm3078614wml.33.2019.11.12.06.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 06:44:36 -0800 (PST)
Date: Tue, 12 Nov 2019 15:44:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191112144435.GK23790@phenom.ffwll.local>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=06qDehYL4B3jZJMwaNNxH+0yQWPBc3JHXK9jP6pNCwk=;
 b=WbpI2z6awckwe4jZD4zoP6lsuZa2EyYn0/z/gGSugtvE3n9UtzK2R9jMxR4lBnrFKo
 DkQW/4VoOzAD+//PHmQVAySH0AcXccpcPHctvxY6WlJlMm+bcy9rgB8/+1vBLONNZfAC
 oK1o3nPOL8APAdM3zS5o2kY0mu2duj5XxG+Og=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6Mzg6MTlBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAxMDo0OToyMUFNICswMTAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiA+IEhpCj4gPiAKPiA+IEFtIDEyLjExLjE5IHVtIDEwOjMyIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MjY6
NDRBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPiA+PiBIaQo+ID4gPj4KPiA+
ID4+IEFtIDA4LjExLjE5IHVtIDE3OjI3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4+PiBP
biBGcmksIE9jdCAyNSwgMjAxOSBhdCAwOTozMDo0MkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gPj4+PiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAwMjoxODo1OVBNIC0wNTAwLCBS
b2IgSGVycmluZyB3cm90ZToKPiA+ID4+Pj4+IENvbW1pdCBjNDAwNjljYjdiZDYgKCJkcm06IGFk
ZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MiKQo+ID4gPj4+Pj4gaW50cm9kdWNlZCBh
IEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2ggaXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhl
Cj4gPiA+Pj4+PiBmYWtlIG9mZnNldCBmcm9tIHZtX3Bnb2ZmLiBIb3dldmVyLCBmb3IgbW1hcCgp
IG9uIGRtYWJ1ZnMsIHRoZXJlIGlzIG5vdAo+ID4gPj4+Pj4gYSBmYWtlIG9mZnNldC4KPiA+ID4+
Pj4+Cj4gPiA+Pj4+PiBUbyBmaXggdGhpcywgbGV0J3MgYWx3YXlzIGNhbGwgbW1hcCgpIG9iamVj
dCBjYWxsYmFjayB3aXRoIGFuIG9mZnNldCBvZiAwLAo+ID4gPj4+Pj4gYW5kIGxlYXZlIGl0IHVw
IHRvIGRybV9nZW1fbW1hcF9vYmooKSB0byByZW1vdmUgdGhlIGZha2Ugb2Zmc2V0Lgo+ID4gPj4+
Pj4KPiA+ID4+Pj4+IFRUTSBzdGlsbCBuZWVkcyB0aGUgZmFrZSBvZmZzZXQsIHNvIHdlIGhhdmUg
dG8gYWRkIGl0IGJhY2sgdW50aWwgdGhhdCdzCj4gPiA+Pj4+PiBmaXhlZC4KPiA+ID4+Pj4+Cj4g
PiA+Pj4+PiBGaXhlczogYzQwMDY5Y2I3YmQ2ICgiZHJtOiBhZGQgbW1hcCgpIHRvIGRybV9nZW1f
b2JqZWN0X2Z1bmNzIikKPiA+ID4+Pj4+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KPiA+ID4+Pj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pgo+ID4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
PiA+ID4+Pj4+IC0tLQo+ID4gPj4+Pj4gdjI6Cj4gPiA+Pj4+PiAtIE1vdmUgc3VidHJhY3Rpbmcg
dGhlIGZha2Ugb2Zmc2V0IG91dCBvZiBtbWFwKCkgb2JqIGNhbGxiYWNrcy4KPiA+ID4+Pj4+Cj4g
PiA+Pj4+PiBJJ3ZlIHRlc3RlZCBzaG1lbSwgYnV0IG5vdCB0dG0uIEhvcGVmdWxseSwgSSB1bmRl
cnN0b29kIHdoYXQncyBuZWVkZWQgCj4gPiA+Pj4+PiBmb3IgVFRNLgo+ID4gPj4+Cj4gPiA+Pj4g
U28gdW5mb3J0dW5hdGVseSBJJ20gYWxyZWFkeSBoYXZpbmcgcmVncmV0cyBvbiB0aGlzLiBXZSBt
aWdodCBldmVuIGhhdmUKPiA+ID4+PiBicm9rZW4gc29tZSBvZiB0aGUgdHRtIGRyaXZlcnMgaGVy
ZS4KPiA+ID4+Pgo+ID4gPj4+IFRyb3VibGUgaXMsIGlmIHlvdSBuZWVkIHRvIHNob290IGRvd24g
dXNlcnNwYWNlIHB0ZXMgb2YgYSBibyAoYmVjYXVzZSBpdCdzCj4gPiA+Pj4gZ2V0dGluZyBtb3Zl
ZCBvciB3aGF0ZXZlciksIHRoZW4gd2UgZG8gdGhhdCB3aXRoIHVubWFwX21hcHBpbmdfcmFuZ2Uu
Cj4gPiA+Pj4gV2hpY2ggbWVhbnMgZWFjaCBibyBuZWVkcyB0byBiZSBtYXBwaW5nIHdpdGggYSB1
bmlxdWUgKG9mZnNldCwKPiA+ID4+PiBhZHJlc3Nfc3BhY2UpLCBvciBpdCB3b24ndCB3b3JrLiBC
eSByZW1hcHBpbmcgYWxsIHRoZSBibyB0byAwIHdlJ3ZlIGJyb2tlbgo+ID4gPj4+IHRoaXMuIFdl
J3ZlIGFsc28gaGFkIHRoaXMgYnJva2VuIHRoaXMgZm9yIGEgd2hpbGUgZm9yIHRoZSBzaW1wbGlz
dGljCj4gPiA+Pj4gZG1hLWJ1ZiBtbWFwLCBzaW5jZSB3aXRob3V0IGFueSBmdXJ0aGVyIGFjdGlv
biB3ZSdsbCByZXVzZSB0aGUgYWRkcmVzcwo+ID4gPj4+IHNwYWNlIG9mIHRoZSBkbWEtYnVmIGlu
b2RlLCBub3Qgb2YgdGhlIGRybV9kZXZpY2UuCj4gPiA+Pj4KPiA+ID4+PiBTdHJhbmdlbHkgYm90
aCBldG5hdml2IGFuZCBtc20gaGF2ZSBhIGNvbW1lbnQgdG8gdGhhdCBlZmZlY3QgLSBncmVwIGZv
cgo+ID4gPj4+IHVubWFwX21hcHBpbmdfcmFuZ2UuIEJ1dCBuZWl0aGVyIGFjdHVhbGx5IHVzZXMg
aXQuCj4gPiA+Pj4KPiA+ID4+PiBOb3QgZXhhY3RseSBzdXJlIHdoYXQncyB0aGUgYmVzdCBjb3Vy
c2Ugb2YgYWN0aW9uIGhlcmUgbm93Lgo+ID4gPj4+Cj4gPiA+Pj4gQWxzbyBhZGRpbmcgVGhvbWFz
IFppbW1lcm1hbm4sIHdobydzIHdvcmtlZCBvbiBhbGwgdGhlIHZyYW0gaGVscGVycy4KPiA+ID4+
Cj4gPiA+PiBWUkFNIGhlbHBlcnMgdXNlIGRybV9nZW1fdHRtX21tYXAoKSwgd2hpY2ggd3JhcHMg
dHRtX2JvX21tYXBfb2JqKCkuCj4gPiA+PiBUaGVzZSBjaGFuZ2VzIHNob3VsZCBiZSB0cmFuc3Bh
cmVudC4KPiA+ID4gCj4gPiA+IFRoZXJlJ3Mgc3RpbGwgdGhlIGlzc3VlIHRoYXQgZm9yIGRtYS1i
dWYgbW1hcCB2cyBkcm0gbW1hcCB5b3UgdXNlCj4gPiA+IGRpZmZlcmVudCBmX21hcHBpbmcsIHdo
aWNoIG1lYW5zIHR0bSdzIHB0ZSBzaG9vdGRvd24gd29uJ3Qgd29yayBjb3JyZWN0bHkKPiA+ID4g
Zm9yIGRtYS1idWYgbW1hcHMuIEJ1dCB5ZWFoIG5vcm1hbCBvcGVyYXRpb24gZm9yIHR0bS92cmFt
IGhlbHBlcnMgc2hvdWxkCj4gPiA+IGJlIGZpbmUuCj4gPiAKPiA+IFZSQU0gaGVscGVycyBkb24n
dCBzdXBwb3J0IGRtYWJ1ZnMuCj4gCj4gSXQncyBub3QgdGhhdCBzaW1wbGUuICBFdmVuIHdoZW4g
bm90IHN1cHBvcnRpbmcgZG1hLWJ1ZiBleHBvcnQgYW5kCj4gaW1wb3J0IGl0IGlzIHN0aWxsIHBv
c3NpYmxlIHRvIGNyZWF0ZSBkbWEtYnVmcywgaW1wb3J0IHRoZW0gaW50byB0aGUKPiBzYW1lIGRy
aXZlciAod2hpY2ggZG9lc24ndCBhY3R1YWxseSBleHBvcnQraW1wb3J0IGJ1dCBqdXN0IGdyYWJz
IGEgZ2VtCj4gb2JqZWN0IHJlZmVyZW5jZSBpbnN0ZWFkKSBhbmQgYWxzbyB0byBtbWFwIHRoZW0g
dmlhIHByaW1lL2RtYS1idWYgY29kZQo+IHBhdGggLi4uCj4gCj4gQ2FuIHR0bSB1c2UgdGhlIHNh
bWUgdHJpY2sgbXNtIHVzZXM/ICBOb3cgdGhhdCB0dG0gYm8ncyBhcmUgYSBnZW0gb2JqZWN0Cj4g
c3VwZXJjbGFzcyBJIHRoaW5rIHdlIHNob3VsZCBiZSBhYmxlIHRvIHN3aXRjaCB2bWEtPnZtX2Zp
bGUgdG8KPiBiby0+YmFzZS5maWxwLCBzaW1saWFyIHRvIG1zbV9nZW1fbW1hcF9vYmooKSwgcHJv
YmFibHkgYmVzdCBkb25lIGluCj4gZHJtX2dlbV90dG1fbW1hcCgpLgoKYm8tPmJhc2UuZmlscCBp
cyB0aGUgc2htZW0gaW5vZGUgZmlsZSwgYW5kIEknbSBub3QgdG9vIHN1cmUgaG93IG11Y2ggc2ht
ZW0KYXBwcm92ZXMgb2YgdXMgbWlzYXBwcm9wcmlhdGluZyB0aGUgbWFwcGluZy4gRm9yIHNobWVt
IG9ubHkgb2JqZWN0cyBpdApwcm9iYWJseSBkb2Vzbid0IG1hdHRlciAoc2luY2UgYm90aCBnZW0g
bW1hcHMgYW5kIHNobWVtIG1tYXBzIHdpbGwgcG9pbnQKYXQgdGhlIHNhbWUgdW5kZXJseWluZyBz
dHJ1Y3QgcGFnZSksIGJ1dCBmb3IgdnJhbS90dG0vYW55dGhpbmcgZWxzZSB0aGUKZ2VtIG1tYXAg
bWlnaHQgcG9pbnQgaW50byBpb21lbSwgYW5kIHNobWVtIHRoZW4gbWlnaHQgZ28gYm9vbSB0cnlp
bmcgdG8gZG8Kc3R1ZmYgd2l0aCB0aGF0LiBJIHRoaW5rIGhhdmluZyBvdXIgb3duIG1hcHBpbmcg
d291bGQgYmUgdGhlIGNsZWFuZXN0CmxvbmctdGVybSBhcHByb2FjaCAuLi4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
