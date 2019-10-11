Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D616D468E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 19:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C52F6EC71;
	Fri, 11 Oct 2019 17:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1556EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 17:25:13 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o44so8599546ota.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odWazgo9+n3Ch+thWJ0an87IwtkMdZ6ngV5ze1k18zE=;
 b=PwU18sz5s9CtfRU0RQs9IpptvvD535gk9WZXsw0Hm2ZaofZeqDX4Onybq6R07WO3h8
 C1jGwuEHTglk88J2/MhkpCt+lQf1VY5OpMPoIzAPGTBh6cbnC94n7+6+kehDGUiujx7b
 FGdcpWpM1E95u0NFJVnmXs2faQbVMDkNHa2jzA8rLY6V0RZxahZsTAbYYk7zD5Mq2Lge
 sz0wySMcnWJDaxlctPzLzRP4m74L5r8dz3CGDTtwSBUvf9XL49L98VcZv4d0MyukGeJV
 +q0EynPHE/6wJNQvZ8y/OKq0KaCwRfT++40W+jy/raNxZ6geOq42KHa5DaRiemg+EALS
 xqFQ==
X-Gm-Message-State: APjAAAXPsaO2kQgYCtO+LHEFBFBmk8OMLt6S0O+G9cnFzstHZOBXJBkK
 TubbKl12EeDGGxe3dKZMCKvbWil+plK57EnWuz3JwQ==
X-Google-Smtp-Source: APXvYqzwmfvrl3WVBOL9MDA8ra+rkX7wVoQ99gh1LuWUxtlKyXDnDXBFO05EmzaYllZzwhYPHQbvH20Ibu4HYvdtQdQ=
X-Received: by 2002:a9d:6284:: with SMTP id x4mr4886452otk.281.1570814713062; 
 Fri, 11 Oct 2019 10:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191011084108.i7lfh2d7asfmcdk4@DESKTOP-E1NTVVP.localdomain>
 <c9d4f840-a3da-0f40-3a1c-c4aa522daf0f@baylibre.com>
 <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Oct 2019 19:25:02 +0200
Message-ID: <CAKMK7uHEWQiXYE7RE7TffHEHMys=LTYcNeK+iAX3qiS-c2PNjQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=odWazgo9+n3Ch+thWJ0an87IwtkMdZ6ngV5ze1k18zE=;
 b=H0nofUIFEeA4klPEIMnfI+5qb9TMGr9a4DwMCKL+XpuFlPUXR63MhqtsFUn3npznu2
 TjHCnbuvrMRlkbr3TbwlhCpAb90LfZnwYdwbrq4dDYY82811VeiymGb3mcz2AigV1fFh
 BhpVMkiBV1NRDPdiNHl2mNhGp/pbvZoP0/ucc=
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
Cc: nd <nd@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTI6NTYgUE0gQnJpYW4gU3RhcmtleSA8QnJpYW4uU3Rh
cmtleUBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQg
MTE6MTQ6NDNBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiBIaSBCcmlhbiwKPiA+
Cj4gPiBPbiAxMS8xMC8yMDE5IDEwOjQxLCBCcmlhbiBTdGFya2V5IHdyb3RlOgoKPiA+ID4gQXJl
IHlvdSBzdXJlIHRoZSBHUFUgc3VwcG9ydHMgb3RoZXIgb3JkZXJzPyBJIHRoaW5rIGFueSBBcm0g
ZHJpdmVyCj4gPiA+IHdpbGwgb25seSBiZSBwcm9kdWNpbmcgRFJNX0ZPUk1BVHMgd2l0aCAiQkdS
IiBvcmRlciBlLmcuIEFCR1I4ODg+Cj4gPiA+IEknbSBub3QgY29udmluY2VkIHRoZSBHUFUgSFcg
YWN0dWFsbHkgc3VwcG9ydHMgYW55IG90aGVyIG9yZGVyLCBidXQKPiA+ID4gaXQncyBhbGwgcmF0
aGVyIGNvbmZ1c2luZyB3aXRoIHRleHR1cmUgc3dpenpsaW5nLiBXaGF0IEkgY2FuIHRlbGwgeW91
Cj4gPiA+IGZvciBzdXJlIGlzIHRoYXQgaXQgX2RvZXNfIHN1cHBvcnQgQkdSIG9yZGVyIChpbiBE
Uk0gbmFtaW5nCj4gPiA+IGNvbnZlbnRpb24pLgo+ID4KPiA+IFdlbGwsIHNpbmNlIHRoZSBCaWZy
b3N0IE1hbGkgYmxvYnMgYXJlIGNsb3NlZC1zb3VyY2UgYW5kIGRlbGl2ZXJlZAo+ID4gYnkgbGlj
ZW5zZWVzLCBpdCdzIGhhcmQgdG8gZGVmaW5lIHdoYXQgaXMgc3VwcG9ydGVkIGZyb20gYSBjbG9z
ZWQKPiA+IEdQVSBIVywgY2xvc2VkIFNXIGltcGxlbWVudGF0aW9uIHRvIGEgY2xvc2VkIHBpeGVs
IGZvcm1hdCBpbXBsZW1lbnRhdGlvbi4KPiA+Cj4KPiBJIGhlYXIgeW91LiBJTU8gdGhlIG9ubHkg
d2F5IHRvIG1ha2UgYW55IG9mIHRoaXMgY2xlYXIgaXMgdG8gcHVibGlzaAo+IHJlZmVyZW5jZSBk
YXRhIGFuZCB0ZXN0cyB3aGljaCBtYWtlIHN1cmUgaW1wbGVtZW50YXRpb25zIG1hdGNoIGVhY2gK
PiBvdGhlci4gSXQncyBzb21ldGhpbmcgSSdtIHRyeWluZyB0byBtYWtlIGhhcHBlbi4KCipjb3Vn
aCogaWd0IHRlc3Qgd2l0aCBjcmMvd3JpdGViYWNrIHZhbGlkYXRpb24gKmNvdWdoKgoKQW5kIHlv
dSBkb24ndCBldmVuIG5lZWQgYW55dGhpbmcgdGhhdCBhY3R1YWxseSBjb21wcmVzc2VzLiBBbGwg
eW91Cm5lZWQgaXMgdGhlIG1pbmltYWwgZW5vdWdoIEFGQkMga25vd2xlZGdlIHRvIHNldCB1cCB0
aGUgbWV0YWRhdGEgdGhhdApldmVyeXRoaW5nIGlzIHVuY29tcHJlc3NlZC4gV2UncmUgZG9pbmcg
dGhhdCBmb3Igb3VyIGludGVsIGNvbXByZXNzaW9uCmZvcm1hdHMgYWxyZWFkeSwgYW5kIGl0IHdv
cmtzIGdyZWF0IGluIG1ha2luZyBzdXJlIHRoYXQgd2UgaGF2ZQplbmQtdG8tZW5kIGFncmVlbWVu
dCBvbiBhbGwgdGhlIGJpdHMgYW5kIG9yZGVyaW5nIGFuZCBldmVyeXRoaW5nLiBPZmMKaXQgZG9l
c24ndCB2YWxpZGF0ZSB0aGUgZGVjb2RlciwgYnV0IHRoYXQncyBub3QgcmVhbGx5IGlndHMgam9i
LgpTaG91bGQgYmUgcG9zc2libGUgdG8gY29udmluY2UgQVJNIHRvIHJlbGVhc2UgdGhhdCAoYXMg
b3BlbiBzb3VyY2UsIGluCmlndCksIHNpbmNlIGl0IHdvdWxkIGJlIGZhaXJseSB2YWx1YWJsZSBm
b3IgdGhlIGVudGlyZSBlY29zeXN0ZW0gaGVyZQouLi4KLURhbmllbAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
