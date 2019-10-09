Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A3D17B4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED17E6EA3C;
	Wed,  9 Oct 2019 18:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC046EA3B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:44:10 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k25so2626157oiw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 11:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80jcnPBLsOoks69yHo8g6YiW4RIC2Pi47/8pROpVuWc=;
 b=mLbsF5xwfn5St5uAlsWxX2dJPAX1Luu6WVJ8v5L+za98HTf3fORQYz9WeuPO5J7xFN
 p4BprMGHIQ6DXUwdV2tD4hvrfAFjPFZHcFmRR0NCQxP7t/Llk4pdGjFPZp5LY1pJ6D6T
 WwMCLnZ2AvajwzR360jU2tUhKd8G3LJrXnJVkDw8l5N74F7uTjQcd1ld4dYE7RhR3EeE
 eaeoLY/NHZ5wIzhmBxVTCKdG2J3B1E0iuOLp79MlfXitCHFR/THDIlPMZbjZtOJi85e+
 1BKTE4lxu8WY7Toq7AkyZ6QnrwqQ1bkcGqVL/qYpdwB1hPWNQ23NR1bP+f1JZfrRHrsC
 rvdg==
X-Gm-Message-State: APjAAAX2L3211Sw8XdwyXN8EP3Tp7TGoQOW3aa1STx5HE13pVapoYcbA
 3UwHAd5i7D2dlQ+7ePlLifvS8dUhpxAz88Bq6wBMyA==
X-Google-Smtp-Source: APXvYqxK3ZYbW7gmd9nE9xtV5IyS7KCU4ZqXAfWDOa71iD0fhMG/5Icn6oKm9z6SvhJQad7k7SDKuvifreNikeNYeVw=
X-Received: by 2002:aca:3a55:: with SMTP id h82mr3856687oia.128.1570646649343; 
 Wed, 09 Oct 2019 11:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
In-Reply-To: <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Oct 2019 20:43:58 +0200
Message-ID: <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=80jcnPBLsOoks69yHo8g6YiW4RIC2Pi47/8pROpVuWc=;
 b=MNqqYHpMw01a7siHJTmNDsZU/gVtDJklrOtu9mitWMxnxA/AjOqQHWYUhBI6XkjxBp
 fb/0SUpv7f97S258loyt9/mP1quCcObSikIDKnzLPgYRkv0mTX1R+JLXdPDMs5nlPoNM
 hq2MsXJt/oJZugSpmImlMYOydesHrFM6MorA4=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCA4OjIzIFBNIExha2hhLCBCaGF3YW5wcmVldAo8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IFRoZSByZWFzb24gd2UgZG9u
J3QgdXNlIGRybV9oZGNwIGlzIGJlY2F1c2Ugb3VyIHBvbGljeSBpcyB0byBkbyBoZGNwCj4gdmVy
aWZpY2F0aW9uIHVzaW5nIFBTUC9IVyAob25ib2FyZCBzZWN1cmUgcHJvY2Vzc29yKS4KCmk5MTUg
YWxzbyB1c2VzIGh3IHRvIGF1dGgsIHdlIHN0aWxsIHVzZSB0aGUgcGFydHMgZnJvbSBkcm1faGRj
cCAuLi4KRGlkIHlvdSBhY3R1YWxseSBsb29rIGF0IHdoYXQncyBpbiB0aGVyZT8gSXQncyBlc3Nl
bnRpYWxseSBqdXN0IHNoYXJlZApkZWZpbmVzIGFuZCBkYXRhIHN0cnVjdHVyZXMgZnJvbSB0aGUg
c3RhbmRhcmQsIHBsdXMgYSBmZXcgbWluaW1hbApoZWxwZXJzIHRvIGVuL2RlY29kZSBzb21lIGJp
dHMuIEp1c3QgZnJvbSBhIHF1aWNrIHJlYWQgdGhlIGVudGlyZQpwYXRjaCB2ZXJ5IG11Y2ggbG9v
a3MgbGlrZSBtaWRsYXllciBldmVyeXdoZXJlIGRlc2lnbiB0aGF0IHdlCmRpc2N1c3NlZCBiYWNr
IHdoZW4gREMgbGFuZGVkIC4uLgotRGFuaWVsCgo+Cj4gQmhhd2FuCj4KPiBPbiAyMDE5LTEwLTA5
IDEyOjMyIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAx
OSBhdCAxMTowODowM1BNICswMTAwLCBDb2xpbiBJYW4gS2luZyB3cm90ZToKPiA+PiBIaSwKPiA+
Pgo+ID4+IFN0YXRpYyBhbmFseXNpcyB3aXRoIENvdmVyaXR5IGhhcyBkZXRlY3RlZCBhIHBvdGVu
dGlhbCBpc3N1ZSB3aXRoCj4gPj4gZnVuY3Rpb24gdmFsaWRhdGVfYmtzdiBpbgo+ID4+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgd2l0
aCByZWNlbnQKPiA+PiBjb21taXQ6Cj4gPj4KPiA+PiBjb21taXQgZWQ5ZDhlMmJjYjAwM2VjOTQ2
NThjYWZlOWIxYmIzOTYwZTIxMzllYwo+ID4+IEF1dGhvcjogQmhhd2FucHJlZXQgTGFraGEgPEJo
YXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Cj4gPj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEg
MjAxOSAtMDQwMAo+ID4+Cj4gPj4gICAgICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVs
ZQo+ID4gSSB0aGluayB0aGUgcmVhbCBxdWVzdGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBu
b3QgdXNpbmcgZHJtX2hkY3A/Cj4gPiAtRGFuaWVsCj4gPgo+ID4+Cj4gPj4gVGhlIGFuYWx5c2lz
IGlzIGFzIGZvbGxvd3M6Cj4gPj4KPiA+PiAgIDI4IHN0YXRpYyBpbmxpbmUgZW51bSBtb2RfaGRj
cF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3ApCj4gPj4gICAyOSB7
Cj4gPj4KPiA+PiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91bmRzIHJlYWQgKE9WRVJS
VU4pCj4gPj4KPiA+PiAxLiBvdmVycnVuLWxvY2FsOgo+ID4+IE92ZXJydW5uaW5nIGFycmF5IG9m
IDUgYnl0ZXMgYXQgYnl0ZSBvZmZzZXQgNyBieSBkZXJlZmVyZW5jaW5nIHBvaW50ZXIKPiA+PiAo
dWludDY0X3QgKiloZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2Lgo+ID4+Cj4gPj4gICAzMCAgICAg
ICAgdWludDY0X3QgbiA9ICoodWludDY0X3QgKiloZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2Owo+
ID4+ICAgMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOwo+ID4+ICAgMzIKPiA+PiAgIDMzICAg
ICAgICB3aGlsZSAobikgewo+ID4+ICAgMzQgICAgICAgICAgICAgICAgY291bnQrKzsKPiA+PiAg
IDM1ICAgICAgICAgICAgICAgIG4gJj0gKG4gLSAxKTsKPiA+PiAgIDM2ICAgICAgICB9Cj4gPj4K
PiA+PiBoZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2IGlzIGFuIGFycmF5IG9mIDUgdWludDhfdCBh
cyBkZWZpbmVkIGluCj4gPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRj
cC9oZGNwLmggYXMgZm9sbG93czoKPiA+Pgo+ID4+IHN0cnVjdCBtb2RfaGRjcF9tZXNzYWdlX2hk
Y3AxIHsKPiA+PiAgICAgICAgICB1aW50OF90ICAgICAgICAgYW5bOF07Cj4gPj4gICAgICAgICAg
dWludDhfdCAgICAgICAgIGFrc3ZbNV07Cj4gPj4gICAgICAgICAgdWludDhfdCAgICAgICAgIGFp
bmZvOwo+ID4+ICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBia3N2WzVdOwo+ID4+ICAgICAgICAg
IHVpbnQxNl90ICAgICAgICByMHA7Cj4gPj4gICAgICAgICAgdWludDhfdCAgICAgICAgIGJjYXBz
Owo+ID4+ICAgICAgICAgIHVpbnQxNl90ICAgICAgICBic3RhdHVzOwo+ID4+ICAgICAgICAgIHVp
bnQ4X3QgICAgICAgICBrc3ZsaXN0WzYzNV07Cj4gPj4gICAgICAgICAgdWludDE2X3QgICAgICAg
IGtzdmxpc3Rfc2l6ZTsKPiA+PiAgICAgICAgICB1aW50OF90ICAgICAgICAgdnBbMjBdOwo+ID4+
Cj4gPj4gICAgICAgICAgdWludDE2X3QgICAgICAgIGJpbmZvX2RwOwo+ID4+IH07Cj4gPj4KPiA+
PiB2YXJpYWJsZSBuIGlzIGdvaW5nIHRvIGNvbnRhaW4gdGhlIGNvbnRhaW5zIG9mIHIwcCBhbmQg
YmNhcHMuIEknbSBub3QKPiA+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50aW9uYWwuIElmIG5vdCwg
dGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUKPiA+PiBpbmNvcnJlY3QgaWYgdGhlc2UgYXJl
IG5vbi16ZXJvLgo+ID4+Cj4gPj4gQ29saW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
