Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B5014687
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592C78918E;
	Mon,  6 May 2019 08:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6328919A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:40:44 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id l10so18998122iti.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 01:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8NoodJz3Tyk7K1SdtPgr1wSQtdEp94KgYEW4R597E8=;
 b=d3hDALG/QPmnf5MitJOMd5lVaof1G4B5EYcvDGXDu6FRGd33EPU4+DZ8jFDtMnuuFp
 zr6Od9XHoq6Tv1UuXsHHHz6zbkgvOCJvJaU8WfjUERdIkAaLQXqg7iRh/mh4vRoWE7cx
 lEafxrqJP4JyHpPeapq398k4mz6KXnjDgV5LLkubuhqPCiSYYWMuW5AP4bDUQ6OCKUqV
 eaSZrpLe/n7G9aj0VNWpy0NkBPY4xSv63/Vrc1V82ieimlG+0O5gynD3fRjw+C/d7erb
 Z9cVyQlkOt/w34pxVX/wDg5LGGR9Skk5WQx2M6THmsTFgBttoy+Dz0+s6/YMBBs1kb3t
 rM9g==
X-Gm-Message-State: APjAAAXt8Z1G+QxOqo2LmCCqmnLK754YHdc5Yo65jCleB8HY5O/GW85E
 rj1lRozENLt7BKuRda+IbbhmaBKN+mKX75DRNlruiQ==
X-Google-Smtp-Source: APXvYqxIk196lXAtmsgY4J+3B7uPUVFG8JolEjHfu8ThOXPRJHWrZ3uHcwsYaAP6AVP9mbMCxNsOBGv9eICcrcGv6ts=
X-Received: by 2002:a05:660c:4d0:: with SMTP id
 v16mr4955544itk.62.1557132043602; 
 Mon, 06 May 2019 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190502141643.21080-1-daniel.vetter@ffwll.ch>
 <20190503151437.dc2ty2mnddabrz4r@pathway.suse.cz>
 <CAKMK7uF8AD6033_tJw1Y7VsAXb6OD_syZtG3a-JM2g9eEb-P9g@mail.gmail.com>
 <20190506074809.huawsdaynyci5kwz@pathway.suse.cz>
In-Reply-To: <20190506074809.huawsdaynyci5kwz@pathway.suse.cz>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 6 May 2019 10:40:32 +0200
Message-ID: <CAKMK7uE=vAewKNfN3Svw1L47cKv10umws1HdYTehnLBnTMp0mQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: console: hack up console_trylock more
To: Petr Mladek <pmladek@suse.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=E8NoodJz3Tyk7K1SdtPgr1wSQtdEp94KgYEW4R597E8=;
 b=jATk1C77darD17jedT+v35FcfAnUSaDwzjZZMyFA6RNBWBR9GLFh6MrKGAek6gaqjP
 WJ6ii/Acr4HRe2NQUDuP85bYPhp8GwKEYg56vXNOdJkQDmY3CEKYycFKA6tw8u0AT2ux
 zeimwvmgvSKlmrHPQd37Opoq5rmItsMxTM48w=
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgNiwgMjAxOSBhdCA5OjQ4IEFNIFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2Uu
Y29tPiB3cm90ZToKPiBPbiBNb24gMjAxOS0wNS0wNiAwOToxMTozNywgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+IE9uIEZyaSwgTWF5IDMsIDIwMTkgYXQgNToxNCBQTSBQZXRyIE1sYWRlayA8cG1s
YWRla0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFRodSAyMDE5LTA1LTAyIDE2OjE2OjQzLCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiA+IGNvbnNvbGVfdHJ5bG9jaywgY2FsbGVkIGZyb20g
d2l0aGluIHByaW50aywgY2FuIGJlIGNhbGxlZCBmcm9tIHByZXR0eQo+ID4gPiA+IG11Y2ggYW55
d2hlcmUuIEluY2x1ZGluZyB0cnlfdG9fd2FrZV91cC4gTm90ZSB0aGF0IHRoaXMgaXNuJ3QgY29t
bW9uLAo+ID4gPiA+IHVzdWFsbHkgdGhlIGJveCBpcyBpbiBwcmV0dHkgYmFkIHNoYXBlIGF0IHRo
YXQgcG9pbnQgYWxyZWFkeS4gQnV0IGl0Cj4gPiA+ID4gcmVhbGx5IGRvZXNuJ3QgaGVscCB3aGVu
IHRoZW4gbG9ja2RlcCBqdW1wcyBpbiBhbmQgc3BhbXMgdGhlIGxvZ3MsCj4gPiA+ID4gcG90ZW50
aWFsbHkgb2JzY3VyaW5nIHRoZSByZWFsIGJhY2t0cmFjZSB3ZSdyZSByZWFsbHkgaW50ZXJlc3Rl
ZCBpbi4KPiA+ID4gPiBPbmUgY2FzZSBJJ3ZlIHNlZW4gKHNsaWdodGx5IHNpbXBsaWZpZWQgYmFj
a3RyYWNlKToKPiA+ID4gPgo+ID4gPiA+ICBDYWxsIFRyYWNlOgo+ID4gPiA+ICAgPElSUT4KPiA+
ID4gPiAgIGNvbnNvbGVfdHJ5bG9jaysweGUvMHg2MAo+ID4gPiA+ICAgdnByaW50a19lbWl0KzB4
ZjEvMHgzMjAKPiA+ID4gPiAgIHByaW50aysweDRkLzB4NjkKPiA+ID4gPiAgIF9fd2Fybl9wcmlu
dGsrMHg0Ni8weDkwCj4gPiA+ID4gICBuYXRpdmVfc21wX3NlbmRfcmVzY2hlZHVsZSsweDJmLzB4
NDAKPiA+ID4gPiAgIGNoZWNrX3ByZWVtcHRfY3VycisweDgxLzB4YTAKPiA+ID4gPiAgIHR0d3Vf
ZG9fd2FrZXVwKzB4MTQvMHgyMjAKPiA+ID4gPiAgIHRyeV90b193YWtlX3VwKzB4MjE4LzB4NWYw
Cj4gPiA+ID4gICBwb2xsd2FrZSsweDZmLzB4OTAKPiA+ID4gPiAgIGNyZWRpdF9lbnRyb3B5X2Jp
dHMrMHgyMDQvMHgzMTAKPiA+ID4gPiAgIGFkZF9pbnRlcnJ1cHRfcmFuZG9tbmVzcysweDE4Zi8w
eDIxMAo+ID4gPiA+ICAgaGFuZGxlX2lycSsweDY3LzB4MTYwCj4gPiA+ID4gICBkb19JUlErMHg1
ZS8weDEzMAo+ID4gPiA+ICAgY29tbW9uX2ludGVycnVwdCsweGYvMHhmCj4gPiA+ID4gICA8L0lS
UT4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgYWxvbmUgaXNuJ3QgYSBwcm9ibGVtLCBidXQgdGhlIHNw
aW5sb2NrIGluIHRoZSBzZW1hcGhvcmUgaXMgYWxzbwo+ID4gPiA+IHN0aWxsIGhlbGQgd2hpbGUg
d2FraW5nIHVwIHdhaXRlcnMgKHVwKCkgLT4gX191cCgpIC0+IHRyeV90b193YWtlX3VwKCkKPiA+
ID4gPiBjYWxsY2hhaW4pLCB3aGljaCB0aGVuIGNsb3NlcyB0aGUgcnVucXVldWUgdnMuIHNlbWFw
aG9yZS5sb2NrIGxvb3AsCj4gPiA+ID4gYW5kIHVwc2V0cyBsb2NrZGVwLCB3aGljaCBpc3N1ZXMg
YSBjaXJjdWxhciBsb2NraW5nIHNwbGF0IHRvIGRtZXNnLgo+ID4gPiA+IFdvcnNlIGl0IHVwc2V0
cyBkZXZlbG9wZXJzLCBzaW5jZSB3ZSBkb24ndCB3YW50IHRvIHNwYW0gZG1lc2cgd2l0aAo+ID4g
PiA+IGNsdXR0ZXIgd2hlbiB0aGUgbWFjaGluZSBpcyBkeWluZyBhbHJlYWR5Lgo+ID4gPiA+Cj4g
PiA+ID4gRml4IHRoaXMgYnkgY3JlYXRpbmcgYSBfX2Rvd25fdHJ5bG9jayB3aGljaCBvbmx5IHRy
eWxvY2tzIHRoZQo+ID4gPiA+IHNlbWFwaG9yZS5sb2NrLiBUaGlzIGlzbid0IGNvcnJlY3QgaW4g
ZnVsbCBnZW5lcmFsaXR5LCBidXQgZ29vZCBlbm91Z2gKPiA+ID4gPiBmb3IgY29uc29sZV9sb2Nr
Ogo+ID4gPiA+Cj4gPiA+ID4gLSB0aGVyZSdzIG9ubHkgZXZlciBvbmUgY29uc29sZV9sb2NrIGhv
bGRlciwgd2Ugd29uJ3QgZmFpbCBzcHVyaW91c2x5Cj4gPiA+ID4gICBiZWNhdXNlIHNvbWVvbmUg
aXMgZG9pbmcgYSBkb3duKCkgb3IgdXAoKSB3aGlsZSB0aGVyZSdzIHN0aWxsIHJvb20KPiA+ID4g
PiAgICh1bmxpa2Ugb3RoZXIgc2VtYXBob3JlcyB3aXRoIGNvdW50ID4gMSkuCj4gPiA+ID4KPiA+
ID4gPiAtIGNvbnNvbGVfdW5sb2NrKCkgaGFzIG9uZSBtYXNzaXZlIHJldHJ5IGxvb3AsIHdoaWNo
IHdpbGwgY2F0Y2ggYW55b25lCj4gPiA+ID4gICB3aG8gcmFjZXMgdGhlIHRyeWxvY2sgYWdhaW5z
dCB0aGUgdXAoKS4gVGhpcyBtYWtlcyBzdXJlIHRoYXQgbm8KPiA+ID4gPiAgIHByaW50ayBsaW5l
cyB3aWxsIGdldCBsb3N0LiBNYWtpbmcgdGhlIHRyeWxvY2sgbW9yZSByYWN5IHRoZXJlZm9yZQo+
ID4gPiA+ICAgaGFzIG5vIGZ1cnRoZXIgaW1wYWN0Lgo+ID4gPgo+ID4gPiBUbyBiZSBob25lc3Qs
IEkgZG8gbm90IHNlZSBob3cgdGhpcyBjb3VsZCBzb2x2ZSB0aGUgcHJvYmxlbS4KPiA+ID4KPiA+
ID4gVGhlIGNpcmN1bGFyIGRlcGVuZGVuY3kgaXMgc3RpbGwgdGhlcmUuIElmIHRoZSBuZXcgX19k
b3duX3RyeWxvY2soKQo+ID4gPiBzdWNjZWVkcyB0aGVuIGNvbnNvbGVfdW5sb2NrKCkgd2lsbCBn
ZXQgY2FsbGVkIGluIHRoZSBzYW1lIGNvbnRleHQKPiA+ID4gYW5kIGl0IHdpbGwgc3RpbGwgbmVl
ZCB0byBjYWxsIHVwKCkgLT4gdHJ5X3RvX3dha2VfdXAoKS4KPiA+ID4KPiA+ID4gTm90ZSB0aGF0
IHRoZXJlIGFyZSBtYW55IG90aGVyIGNvbnNvbGVfbG9jaygpIGNhbGxlcnMgdGhhdCBtaWdodAo+
ID4gPiBoYXBwZW4gaW4gcGFyYWxsZWwgYW5kIG1pZ2h0IGFwcGVhciBpbiB0aGUgd2FpdCBxdWV1
ZS4KPiA+Cj4gPiBIbSByaWdodC4gSXQncyB2ZXJ5IHJhcmUgd2UgaGl0IHRoaXMgaW4gb3VyIENJ
IGFuZCBJIGRvbid0IGtub3cgaG93IHRvCj4gPiByZXBybyBvdGhlcndpc2UsIHNvIGp1c3QgdGhy
ZXcgdGhpcyBvdXQgYXQgdGhlIHdhbGwgdG8gc2VlIGlmIGl0Cj4gPiBzdGlja3MuIEknbGwgdHJ5
IGFuZCBjb21lIHVwIHdpdGggYSBuZXcgdHJpY2sgdGhlbi4KPgo+IFNpbmdsZSBtZXNzYWdlcyBh
cmUgcHJpbnRlZCBmcm9tIHNjaGVkdWxlciB2aWEgcHJpbnRrX2RlZmVycmVkKCkuCj4gV0FSTigp
IG1pZ2h0IGJlIHNvbHZlZCBieSBpbnRyb2R1Y2luZyBwcmludGsgZGVmZXJyZWQgY29udGV4dCwK
PiBzZWUgdGhlIHBlci1jcHUgdmFyaWFibGUgcHJpbnRrX2NvbnRleHQuCgpJIGNvbnZpbmNlZCBt
eXNlbGYgdGhhdCBJIGNhbiB0YWtlIHRoZSB3YWtlX3VwX3Byb2Nlc3Mgb3V0IGZyb20gdW5kZXIK
dGhlIHNwaW5sb2NrLCBmb3IgdGhlIGxpbWl0ZWQgY2FzZSBvZiB0aGUgY29uc29sZSBsb2NrLiBJ
IHRoaW5rIHRoYXQncwphIGNsZWFuZXIgYW5kIG1vcmUgcm9idXN0IGZpeCB0aGFuIGxlYWtpbmcg
cHJpbnRrX2NvbnRleHQgdHJpY2tlcnkKaW50byB0aGUgY29uc29sZV91bmxvY2sgY29kZS4KLURh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
