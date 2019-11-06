Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205CF16BD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909DE6ED29;
	Wed,  6 Nov 2019 13:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96DE6ED2A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 13:08:58 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z6so20778695otb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 05:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFhsru1L6tzUnwCkLtcYBpDV9IALSPI/5jakVlENkoE=;
 b=LuR6YRcvyuUMXhPAqGn55tWRxOJBJxsja+u+jTmr1w1GZ26V09a9xtxoZhx4GYcIN+
 Lj1dtN2yJw+HspgvYXRVtj8B+T3laX/YcsQWjHHJHUzTYAmIdSmdDlf+1/boYQRslaVz
 AYJb+43ShJ68yNrfw3b3l37ruaMIMri++pQF/tUGL0jsBrNPZyMKWtfwRJIqH7xSiqXj
 2iWRsmI4FD+E4XArXeffYQgIri4OEgslklFOYy4NHrjIdoHLZzF4NtCeFmILqBZczK3m
 GO6zNK3DJTlFA0jvegItY6FG3MbbVvis409+bw46CPFcSwXW0IPRySap5p19KrpLuzbT
 Ki5A==
X-Gm-Message-State: APjAAAUA8Wlcjs1HwPspCurAbYQN7NscpePUMJ0NXk72dKEJ2jrGtsoz
 Kz7iCjaueoonMMGtidjfceQ1GEKNwfb0Vcqpw3KtncKM
X-Google-Smtp-Source: APXvYqzD4gstAEqEsW1PUtsLpvgj/x1n7TM+sTpXnrUQtKlZIhq3m+WhRM0wpshptnzJdHClnorzrqdfNTjGSbjhrUw=
X-Received: by 2002:a9d:62d8:: with SMTP id z24mr1851447otk.188.1573045738128; 
 Wed, 06 Nov 2019 05:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106101950.GE23790@phenom.ffwll.local>
 <157303600842.24928.8883426579845207112@skylake-alporthouse-com>
 <157303697006.24928.6564122275201085833@skylake-alporthouse-com>
In-Reply-To: <157303697006.24928.6564122275201085833@skylake-alporthouse-com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 6 Nov 2019 14:08:47 +0100
Message-ID: <CAKMK7uGA0B1jbB2sc2WwZS1sON6BPrdvfNxQnWroDPqTuTKULg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Expose a method for creating
 anonymous struct file around drm_minor
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xFhsru1L6tzUnwCkLtcYBpDV9IALSPI/5jakVlENkoE=;
 b=Lr4LIcSBAs82c5PBtoKsU9UXyCzA+l9JYX35tA32P8gLso7L8soEJBngGCBRB5yA+I
 hhbDGMH1dVlOKPJ1yBNYf/iGNsWU4oPn7g5bUUWMLvfhydUhta6gUesishHnq4clwRId
 dFVjp6XOrjUzvsQiv5IbJqjJwexEUEOliL/Gs=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCAxMTo0MyBBTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4KPiBRdW90aW5nIENocmlzIFdpbHNvbiAoMjAxOS0xMS0w
NiAxMDoyNjo0OCkKPiA+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0xMS0wNiAxMDoxOTo1
MCkKPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6MDc6MTRBTSArMDAwMCwgQ2hyaXMg
V2lsc29uIHdyb3RlOgo+ID4gPiA+IFNvbWV0aW1lcyB3ZSBuZWVkIHRvIGNyZWF0ZSBhIHN0cnVj
dCBmaWxlIHRvIHdyYXAgYSBkcm1fZGV2aWNlLCBhcyBpdAo+ID4gPiA+IHRoZSB1c2VyIHdlcmUg
dG8gaGF2ZSBvcGVuZWQgL2Rldi9kcmkvY2FyZDAgYnV0IHRvIGRvIHNvIGFub255bW91c2x5Cj4g
PiA+ID4gKGkuZS4gZm9yIGludGVybmFsIHVzZSkuIFByb3ZpZGUgYSB1dGlsaXR5IG1ldGhvZCB0
byBjcmVhdGUgYSBzdHJ1Y3QKPiA+ID4gPiBmaWxlIHdpdGggdGhlIGRybV9kZXZpY2UtPmRyaXZl
ci5mb3BzLCB0aGF0IHdyYXAgdGhlIGRybV9kZXZpY2UuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+ID4KPiA+
ID4gRm9yIHByb3BlciBpbnRlcm5hbCBhY2Nlc3Mgd2UgYWxyZWFkeSBoYXZlIGRybV9jbGllbnRf
b3Blbiwgc28gSSB0aGluawo+ID4gPiB0aGlzIGhhcyBsaW1pdGVkIChidXQgZ29vZCB1c2UpIGlu
IHNlbGZ0ZXN0cyBvbmx5LiBTbwo+ID4gPiBFWFBPUlRfU1lNQk9MX0ZPUl9URVNUU19PTkxZIHBs
dXMgbWF5YmUgYSBjbGVhcmVyIG5hbWUgZm9yIHRoZSBpbnRlbmRlZAo+ID4gPiB1c2UgbGlrZSBk
cm1fZmlsZV9tb2NrX29wZW4/Cj4gPgo+ID4gSSBmb3VuZCB0aGUgZXhhbXBsZSBpbiBkcm1fZ2Vt
X3ByaW1lX21tYXAoKSB0aGF0IHdhcyBkb2luZyB0aGUgc2FtZSB0cmljaywKPiA+IGFuZCB0aGUg
dHJpY2sgb2YgYmVpbmcgYWJsZSB0byBpbnN0YW50aWF0ZSBuZXcgc3RydWN0IGZpbGUgYW5kIGlu
c3RhbGwgYQo+ID4gZmQgd2hlbmV2ZXIgc2VlbXMgbGlrZSBpdCB3aWxsIGNvbWUgaW4gaGFuZHku
Li4gSnVzdCBsYWNraW5nIHRoZSB0aGlyZAo+ID4gdXNlciBhdCB0aGUgbW9tZW50IHRvIGNsYWlt
IGdlbmVyYWxpdHkuCj4KPiBUaGUgY2xvc2VzdCBleGFtcGxlIEkgZm91bmQgaW4gdGhlIHNwaXJp
dCBvZiBjcmVhdGluZyBhIG5ldyBkcm1fZGV2aWNlCj4gc3RydWN0IGZpbGUgYW5kIGluc3RhbGxp
bmcgaXQgaXMgZHJtX21vZGVfY3JlYXRlX2xlYXNlX2lvY3RsKCkgdGhhdCB1c2VzCj4gZmlsZV9j
bG9uZV9vcGVuKCkgZm9yIHRoaXMgcHVycG9zZS4gVGhlIGFyZ3VtZW50IHRoZXJlIHdvdWxkIGJl
IHdoZXRoZXIKPiBjbG9uaW5nIHRoZSAoZmlsZS0+Zl9wYXRoLCBmaWxlLT5mX2ZsYWdzLCBmaWxl
LT5mX2NyZWQpIGlzIGFwcHJvcHJpYXRlCj4gdmVyc3VzIGFuIGFub255bW91cyBpbm9kZS4gSSB0
aGluayBjbG9uaW5nIHRoZSBjcmVkZW50aWFscyBzZWVtcyBjb3JyZWN0Cj4gZm9yIGxlYXNpbmcu
CgpIbSAuLi4gSSB0aGluayB3ZSB3YW50IHRoZSBjbG9uZSBmb3IgdGhpcyBvbmUgaGVyZSB0b28u
IE90aGVyd2lzZSB3ZQpnZXQgdGhlIHdyb25nIGlub2RlLCBhbmQgdGhlbiB1bm1hcF9tYXBwaW5n
X3JhbmdlIHdvbnQgd29yayBjb3JyZWN0bHksCmFuZCB3ZSBjYW50IHVzZSB0aGlzIGZvciBzZWxm
dGVzdHMuIFRoYXQncyB0aGUgb25seSBjYXNlIHdoZXJlIEkgdGhpbmsKd2UgZG8gYWN0dWFsbHkg
bmVlZCB0aGUgZmlsZS9pbm9kZSB0byBiZSBmdW5jdGlvbmFsLiBGb3IgYW55dGhpbmcgZWxzZQp0
aGUgZHJtX2NsaWVudCBpbnRlcm5hbCBhcGkgZ2V0cyBhd2F5IHdpdGhvdXQgdGhlIGZpbGUvaW5v
ZGUgc3R1ZmYuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
