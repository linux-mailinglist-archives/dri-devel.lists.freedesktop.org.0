Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE11122B52
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 13:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E96E0C2;
	Tue, 17 Dec 2019 12:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACA06E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:21:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p67so437632oib.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 04:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/CDn5JbW1WME5Sd0iWMM5OOfuGmhgzxYpnO9v9Mx5mM=;
 b=nD7s6GfUfdnqJ3fpibOy+daQykEfd6KlQ/C+H1mCV+rzYSW7xeG56epmOdWX2jmb4O
 fYwReU3IqwCx4M3298gQUYjOhwW2KZxVw7j5j9qMOhktLJbX0gOHuKcQlEmi1KOS5Weq
 beyQhq0ynTt3gjCNjmkZObBNR000mbqTdwTOjXykSf13gv15fuLzbypgAb7ncq3eC91D
 tfMyWBj/nLfy0WYUYPFrCpe4BKJn3VkJgyqTOV2yOktSLYjZVmi2TYkA+DC4VPY2eK/M
 whmVPIEvj9+/EKLbBRpIvyAFssONKLsZ0Q2GN08m5bB+5P9xT44ToEeJBWzSxj6+/xwR
 Q2IQ==
X-Gm-Message-State: APjAAAViA7fmPGj0Q4R91pxnLT4BBwouzgS7QecR34Y/FtIg7YgYx5KD
 laD0mqrIfhGWEJM62tnCN6qSgcbBVlFOjPD5LLM=
X-Google-Smtp-Source: APXvYqzPSr0CwtK4yNcj7K0g++lVwKJ5FPqChcU+kVIEctdo1aMJqmdrkSGFU/KoIHB0qDg427vvgcfu8cIneKudg3o=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr208491oia.148.1576585281148;
 Tue, 17 Dec 2019 04:21:21 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2019 13:21:10 +0100
Message-ID: <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBUdWUsIERlYyAxNywgMjAxOSBhdCAxMjowMyBQTSBGYWJyaXppbyBD
YXN0cm8KPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBT
ZW50OiAxMyBEZWNlbWJlciAyMDE5IDE3OjExCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA2
LzEzXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBBZGQgImx2ZHMtZGVjb2RlciIgc3VwcG9ydAo+
ID4KPiA+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDAzOjUxOjI1UE0gKzAwMDAsIEZhYnJpemlv
IENhc3RybyB3cm90ZToKPiA+ID4gQWRkIHN1cHBvcnQgZm9yIHRyYW5zcGFyZW50IExWRFMgZGVj
b2RlcnMgYnkgYWRkaW5nIGEgbmV3Cj4gPiA+IGNvbXBhdGlibGUgc3RyaW5nICgibHZkcy1kZWNv
ZGVyIikgdG8gdGhlIGRyaXZlci4KPiA+ID4gVGhpcyBwYXRjaCBhbHNvIGFkZHMgbWVtYmVyIGNv
bm5lY3Rvcl90eXBlIHRvIHN0cnVjdCBsdmRzX2NvZGVjLAo+ID4gPiBhbmQgdGhhdCdzIGJlY2F1
c2UgTFZEUyBkZWNvZGVycyBoYXZlIGEgZGlmZmVyZW50IGNvbm5lY3RvciB0eXBlCj4gPiA+IGZy
b20gTFZEUyBlbmNvZGVycy4gV2UgZmlsbCB0aGlzIG5ldyBtZW1iZXIgdXAgd2l0aCB0aGUgZGF0
YQo+ID4gPiBtYXRjaGluZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29t
Pgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4gdjMtPnY0Ogo+ID4gPiAqIE5ldyBwYXRjaAo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jIHwgMTkgKysrKysr
KysrKysrKysrKy0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2x2ZHMtY29kZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCj4g
PiA+IGluZGV4IGI1ODAxYTIuLmMzMmUxMjUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jCj4gPiA+IEBAIC03LDYgKzcsNyBAQAo+ID4gPiAgI2luY2x1ZGUgPGxp
bnV4L2dwaW8vY29uc3VtZXIuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+
ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2Rldmlj
ZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4gPiA+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiA+Cj4gPiA+IEBAIC0xNyw2ICsxOCw3IEBAIHN0
cnVjdCBsdmRzX2NvZGVjIHsKPiA+ID4gICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKPiA+
ID4gICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwYW5lbF9icmlkZ2U7Cj4gPiA+ICAgICBzdHJ1Y3Qg
Z3Bpb19kZXNjICpwb3dlcmRvd25fZ3BpbzsKPiA+ID4gKyAgIHUzMiBjb25uZWN0b3JfdHlwZTsK
PiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgaW50IGx2ZHNfY29kZWNfYXR0YWNoKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiA+IEBAIC02NSw2ICs2Nyw3IEBAIHN0YXRpYyBpbnQg
bHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgICAg
aWYgKCFsdmRzX2NvZGVjKQo+ID4gPiAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4K
PiA+ID4gKyAgIGx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHUzMilvZl9kZXZpY2VfZ2V0
X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gPgo+ID4gSSdtIG5vdyBnZXR0aW5nIGEgY29tcGls
YXRpb24gZmFpbHVyZSBoZXJlOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1j
b2RlYy5jOiBJbiBmdW5jdGlvbiDigJhsdmRzX2NvZGVjX3Byb2Jl4oCZOgo+ID4gZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmM6Njg6MzE6IGVycm9yOiBjYXN0IGZyb20gcG9pbnRl
ciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV2Vycm9yPXBvaW50ZXItdG8taW50LWNh
c3RdCj4gPiAgIGx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHUzMilvZl9kZXZpY2VfZ2V0
X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+ID4KPiA+IFRoZSBmaXggc2hvdWxkIGJlIHNpbXBsZToKPiA+Cj4gPiAgICAgICBsdmRz
X2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1aW50cHRyX3Qpb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKGRldik7Cj4gPgo+ID4gSSdtIGJvdGhlcmVkIGJ5IHRoZSBmYWN0IHRoYXQgSSd2ZSBjb21w
aWxlZCB0aGlzIGJlZm9yZSB3aXRob3V0IGFueQo+ID4gaXNzdWUsIHNvIHRoaXMgcmVhbGx5IHB1
enpsZXMgbWUuIERvIHlvdSBnZXQgdGhlIHNhbWUgd2FybmluZyA/Cj4KPiBUaGUgd2FybmluZyBh
cHBlYXJzIHdoZW4gY29tcGlsaW5nIGZvciBhcm02NCwgdW5kZXJzdGFuZGFibHkgc28uCj4gV2Ug
bXVzdCBoYXZlIGNvbXBpbGVkIHRoaXMgZm9yIGFybSBvbmx5IHRoZSBmaXJzdCB0aW1lIGFyb3Vu
ZC4KPgo+IEkgdGhpbmsgdGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGlzIGlzIHRvIGVpdGhlciBj
YXN0IHRvICh1MzIpKHVpbnRwdHJfdCkgb3IgKHUzMikodW5zaWduZWQgbG9uZykuCgpKdXN0IGNh
c3RpbmcgdG8gdWludHB0cl90IHNob3VsZCBiZSBzdWZmaWNpZW50LgoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
