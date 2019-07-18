Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E656D119
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F7B6E3FC;
	Thu, 18 Jul 2019 15:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393306E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:27:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r4so20714827qkm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97JpaqZJUw6kOHercdAb+lo0dDWCEEL1RlsGMmUyUJQ=;
 b=KA/1K6tM5GWQSiAJS/o/2rEavBBPx+GUvD8DdU6BZ+HlmgLbnXBTJOUChCB43Bla+d
 SRZMPBudCqkJ1MPDjeiwOENZwC+ep70EiKw7s89x8gi2ACr1u+Ha1KT0eRVvv0RIO75g
 5nSf66f9NjDHF7PWpXP74Qprshb0zOK6dehv8iD69dZYlcVaOFhHR40CpN8phjOp4AFi
 wxTW3ODcj5cHzMv0MSbk4o6+Wdg3CekioJZBS7gcedzD5SNj7rRKWJ4NBaYPdnpj9N5V
 BdIsSmKDlqagurugpOP03az06wGx8v+DCqbCRq91WYxWTTFBRMOGmhhvAGkfLAVb1m1D
 TmJQ==
X-Gm-Message-State: APjAAAVjnWUQ+T2UM1syeFhStZrlUV/lC+icDS4Dzy8aamfouLF3tUQO
 mPlOcHSoueORiOa4zhRGyh4+janXxEbXXElaRRI=
X-Google-Smtp-Source: APXvYqxCIjZHXKpNfPhDaPyGIIjSTqwDj1CDG3aJkAn737qQb0zmMiuJqk6Oo2xG5QZIRkFASljYqsiIXCBl020X4vI=
X-Received: by 2002:a37:4ac3:: with SMTP id
 x186mr30135208qka.138.1563463654235; 
 Thu, 18 Jul 2019 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
 <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
 <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
 <CAK8P3a2nYArwNQrifW2xgzN=GUkN2wAjmZVo21JNw6YjHzwh7Q@mail.gmail.com>
 <CAKdAkRS0w3KM-F95-F1jUicq2srAzWu21_7Npnw28F5fF+UxtA@mail.gmail.com>
In-Reply-To: <CAKdAkRS0w3KM-F95-F1jUicq2srAzWu21_7Npnw28F5fF+UxtA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jul 2019 17:27:18 +0200
Message-ID: <CAK8P3a2O9jaV=EfCLp=_X1wW6yAB9_cSGfMUBwFHjS+1x76yPg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNToxNyBQTSBEbWl0cnkgVG9yb2tob3YKPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDY6MTMg
UE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAx
OCwgMjAxOSBhdCA0OjU2IFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdy
b3RlOgo+ID4gPiBPbiAxOC4wNy4yMDE5IDE2OjIxLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4g
PiA+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDQ6MTYgUE0gQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiA+ID4+IFByb3BlciBzb2x1dGlvbiBoYXMgYmVlbiBh
bHJlYWR5IG1lcmdlZCB2aWEgaW5wdXQgdHJlZVsxXS4KPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4g
Pj4gWzFdOgo+ID4gPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBS2RBa1JUR1hO
YlVzdUtBU05HTGZ3VXdDN0Fzb2Q5SzViYVlMUFdQVTdFWC00Mi15QUBtYWlsLmdtYWlsLmNvbS8K
PiA+ID4gPiBBdCB0aGF0IGxpbmssIEkgb25seSBzZWUgdGhlIHBhdGNoIHRoYXQgY2F1c2VkIHRo
ZSByZWdyZXNzaW9uLCBub3QKPiA+ID4gPiB0aGUgc29sdXRpb24uIEFyZSB5b3Ugc3VyZSBpdCdz
IGZpeGVkPwo+ID4gPgo+ID4gPgo+ID4gPiBVcHMsIHlvdSBhcmUgcmlnaHQsIEkgdGhvdWdoIHlv
dSBhcmUgZml4aW5nIHdoYXQgdGhpcyBwYXRjaCBhdHRlbXB0ZWQgdG8KPiA+ID4gZml4IDopCj4g
PiA+Cj4gPiA+IEFueXdheSwgd2Ugd2FudCB0byBhdm9pZCBkZXBlbmRlbmN5IG9uIFJDX0NPUkUg
LSB0aGlzIGRyaXZlciBkb2VzIG5vdAo+ID4gPiByZXF1aXJlIGl0LCBidXQgd2l0aCBSQ19DT1JF
IGl0IGhhcyBhZGRpdGlvbmFsIGZlYXR1cmVzLgo+ID4KPiA+IFJpZ2h0LCB0aGF0J3Mgd2hhdCBt
eSBwYXRjaCBkb2VzOiBpZiBSQ19DT1JFIGlzIGRpc2FibGVkLCB5b3UgY2FuCj4gPiBzdGlsbCBz
ZXQgRFJNX1NJTF9TSUk4NjIwPXksIGJ1dCBpZiBSQ19DT1JFPW0sIERSTV9TSUxfU0lJODYyMAo+
ID4gY2FuIG9ubHkgYmUgPW0gb3IgPW4uCj4gPgo+ID4gPiBNYXliZSAiaW1wbHkgSU5QVVQiIHdv
dWxkIGhlbHA/Cj4gPgo+ID4gTm8sIHRoYXQgd291bGQgbWFrZSBpdCB3b3JzZS4gRGV2aWNlIGRy
aXZlcnMgcmVhbGx5IGhhdmUgbm8gYnVzaW5lc3MKPiA+IHR1cm5pbmcgb24gb3RoZXIgc3Vic3lz
dGVtcy4KPiA+Cj4KPiBPSywgaW4gdGhlIG1lYW50aW1lIEkgd2lsbCByZWRvIHRoZSBicmFuY2gg
YnkgZHJvcHBpbmcgdGhlCj4gc2lsLXNpaTg2MjAuYyBLY29uZmlnIGNoYW5nZXMgYW5kIGFsc28g
ZHJvcCBhbGwgImltcGx5IiBidXNpbmVzcyBmcm9tCj4gYXBwbGVzcGkgZHJpdmVyIGFzIHRoZXkg
Z2l2ZSB1cyBtb3JlIHRyb3VibGUgdGhhbiB0aGV5IGFyZSB3b3J0aC4gV2UKPiBkbyBub3QgaGF2
ZSAiaW1wbHkiIGZvciBpODAxX3NtYnVzIGZvciBTeW1hcHRpY3MgU01CVVMgbW9kZSBhbmQgaXQK
PiB3b3JrcyBmaW5lLiBJdCBpdCBkaXN0cm8ncyB0YXNrIHRvIGNvbmZpZ3VyZSB0aGUga2VybmVs
IHByb3Blcmx5LgoKVGhhbmtzIQoKSSB0aGluayB0aGUgImRybS9icmlkZ2U6IG1ha2UgcmVtb3Rl
IGNvbnRyb2wgb3B0aW9uYWwiIHBhdGNoIGlzCmZpbmUgd2l0aCBteSBmaXh1cCwgdGhlIElTX0VO
QUJMRUQoKSBjaGVja3MgdGFrZSBjYXJlIG9mIHRoZQpjYXNlIHdoZXJlIFJDX0NPUkUgaXMgdW5h
dmFpbGFibGUsIGFuZCB0aGUgJ2RlcGVuZHMgb24KUkNfQ09SRSB8fCAhUkNfQ09SRScgbGluZSB0
YWtlcyBjYXJlIG9mIHRoZSBSQ19DT1JFPW0KY2FzZS4KCkkgc3VwcG9zZSBSb25hbGQgY291bGQg
c2VuZCBhIHJlcGxhY2VtZW50IHBhdGNoIHdpdGggbXkKZml4dXAgYWZ0ZXIgdGhlIG1lcmdlIHdp
bmRvdy4KCiAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
