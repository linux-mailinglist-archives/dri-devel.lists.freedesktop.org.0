Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5610A0AD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C786E409;
	Tue, 26 Nov 2019 14:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D4F6E409
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:48:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g7so2092065wrw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=N01tYLIrPT//zAWimQzuNBBhZMEUzzp6uAlbUgAq5XI=;
 b=njiMRr0QhxotyeniIuRqNr/ftkayWJx6lp0f8pxh8hkMvBS3cm6fwit8/tnzBz7sW9
 5AZDF4jKKSpKLvcf0+7AX3mfyrksCWRYEuJnaIV6N2FHDhCZ/zRFnFmN6CA4gKEeo/DT
 Ysn59Ws1yDo8kb++RN7ACkfFZtaRX13Id8yQSnTCwQf5az04cw+GgpayGsh0Ck4DmgvR
 FyLEwc9MI1tuoBLpwctZ6MkLq2utBF/jbsqAP/Y4LijTIhHbWmp2QGFFUf08HZ7FrBaO
 jwD7lre+G/OBu+R1P72UpHAhlSjEO4zOtvN9blM6FYQvo77H5CTfpXx+rYBQlYfmXpHP
 /xeg==
X-Gm-Message-State: APjAAAUv/rqbCCOGwL0k6n0e43E6+pzXORnCcV0VG61fzHCLIr3qq8Yb
 og5+O465QSU/LjTsQ+t4UBGiSQ==
X-Google-Smtp-Source: APXvYqzGXLxHIhDdo9mBA7wxYyb59DS98+MZ9+L7IX12Ee0zcPn6MO2wm1H/XftPEXHhnj3h5foM+w==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr5813105wru.0.1574779689618;
 Tue, 26 Nov 2019 06:48:09 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j67sm3425802wmb.43.2019.11.26.06.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:48:08 -0800 (PST)
Date: Tue, 26 Nov 2019 15:48:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/rect: Keep the scaled clip bounded
Message-ID: <20191126144807.GZ29965@phenom.ffwll.local>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
 <20191122175623.13565-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122175623.13565-3-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=N01tYLIrPT//zAWimQzuNBBhZMEUzzp6uAlbUgAq5XI=;
 b=WvHX8E7B9sCytU+zvbm1GrZrsphEBio6aroXT/Iv3lVuvV4Rt+soHosrd5TI+JY8eT
 bg63Ee9Fh+EtXpf+Mu0LPSYXS83h7YLntxs7R9t10fzlY3qMwXqfrTANzHymUcp/tYih
 YxRLEan2Jv5yELMrARNO1w1FB24jFv0FoBQrU=
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDc6NTY6MjFQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IExpbWl0IHRoZSBzY2FsZWQgY2xpcCB0byBvbmx5IGNsaXAgYXQgbW9zdCBkc3Rf
dy9oIHBpeGVscy4KPiBUaGlzIGF2b2lkcyB0aGUgcHJvYmxlbSB3aXRoIGNsaXBfc2NhbGVkKCkg
bm90IGJlaW5nIGFibGUKPiB0byByZXR1cm4gbmVnYXRpdmUgdmFsdWVzLiBTaW5jZSBuZXdfc3Jj
X3cvaCBpcyBub3cgcHJvcGVybHkKPiBib3VuZGVkIHdlIGNhbiByZW1vdmUgdGhlIGNsYW1wKClz
Lgo+IAo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gVGVzdGNhc2U6IGlndC9r
bXNfc2VsZnRlc3QvZHJtX3JlY3RfY2xpcF9zY2FsZWRfc2lnbmVkX3ZzX3Vuc2lnbmVkCj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMgfCAxMSArKysrKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcmVjdC5jCj4gaW5kZXggODE4NzM4ZTgzZDA2Li5hOWM3ZjkwODM2ZjMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3JlY3QuYwo+IEBAIC01OSw2ICs1OSw5IEBAIHN0YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMyIHNy
YywgdTMyIGRzdCwgdTMyIGNsaXApCj4gIAlpZiAoZHN0ID09IDApCj4gIAkJcmV0dXJuIDA7Cj4g
IAo+ICsJLyogT25seSBjbGlwIHdoYXQgd2UgaGF2ZS4gS2VlcHMgdGhlIHJlc3VsdCBib3VuZGVk
LiAqLwo+ICsJY2xpcCA9IG1pbihjbGlwLCBkc3QpOwo+ICsKPiAgCXRtcCA9IG11bF91MzJfdTMy
KHNyYywgZHN0IC0gY2xpcCk7Cj4gIAo+ICAJLyoKPiBAQCAtOTQsNyArOTcsNyBAQCBib29sIGRy
bV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3Qg
KmRzdCwKCmJ0dyBJIGp1c3Qgbm90aWNlZCB0aGF0IHRoZSBrZXJuZWxkb2MgZm9yIGRybV9yZWN0
X2NsaXBfc2NhbGVkKCkgd2Fzbid0CnVwZGF0ZWQgYWZ0ZXIgTWFhcnRlbidzIHBhdGNoIDotLyBJ
dCBzdGlsbCB0YWxrcyBhYm91dCBoc2NhbGUgYW5kIHZzY2FsZS4KSSdtIGdvaW5nIHRvIHR5cGUg
YSBwYXRjaCB0byBmaXggdGhhdC4KCk9uIHlvdXIgcGF0Y2ggaGVyZTogUmV2aWV3ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+ICAJCXUzMiBuZXdfc3JjX3cg
PSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+ICAJCQkJCSAgICBkcm1fcmVjdF93
aWR0aChkc3QpLCBkaWZmKTsKPiAgCj4gLQkJc3JjLT54MSA9IGNsYW1wX3QoaW50NjRfdCwgc3Jj
LT54MiAtIG5ld19zcmNfdywgSU5UX01JTiwgSU5UX01BWCk7Cj4gKwkJc3JjLT54MSA9IHNyYy0+
eDIgLSBuZXdfc3JjX3c7Cj4gIAkJZHN0LT54MSA9IGNsaXAtPngxOwo+ICAJfQo+ICAJZGlmZiA9
IGNsaXAtPnkxIC0gZHN0LT55MTsKPiBAQCAtMTAyLDcgKzEwNSw3IEBAIGJvb2wgZHJtX3JlY3Rf
Y2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+
ICAJCXUzMiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKPiAg
CQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksIGRpZmYpOwo+ICAKPiAtCQlzcmMtPnkxID0g
Y2xhbXBfdChpbnQ2NF90LCBzcmMtPnkyIC0gbmV3X3NyY19oLCBJTlRfTUlOLCBJTlRfTUFYKTsK
PiArCQlzcmMtPnkxID0gc3JjLT55MiAtIG5ld19zcmNfaDsKPiAgCQlkc3QtPnkxID0gY2xpcC0+
eTE7Cj4gIAl9Cj4gIAlkaWZmID0gZHN0LT54MiAtIGNsaXAtPngyOwo+IEBAIC0xMTAsNyArMTEz
LDcgQEAgYm9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3Ry
dWN0IGRybV9yZWN0ICpkc3QsCj4gIAkJdTMyIG5ld19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9y
ZWN0X3dpZHRoKHNyYyksCj4gIAkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksIGRpZmYpOwo+
ICAKPiAtCQlzcmMtPngyID0gY2xhbXBfdChpbnQ2NF90LCBzcmMtPngxICsgbmV3X3NyY193LCBJ
TlRfTUlOLCBJTlRfTUFYKTsKPiArCQlzcmMtPngyID0gc3JjLT54MSArIG5ld19zcmNfdzsKPiAg
CQlkc3QtPngyID0gY2xpcC0+eDI7Cj4gIAl9Cj4gIAlkaWZmID0gZHN0LT55MiAtIGNsaXAtPnky
Owo+IEBAIC0xMTgsNyArMTIxLDcgQEAgYm9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3Qg
ZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCj4gIAkJdTMyIG5ld19zcmNfaCA9
IGNsaXBfc2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAo+ICAJCQkJCSAgICBkcm1fcmVjdF9o
ZWlnaHQoZHN0KSwgZGlmZik7Cj4gIAo+IC0JCXNyYy0+eTIgPSBjbGFtcF90KGludDY0X3QsIHNy
Yy0+eTEgKyBuZXdfc3JjX2gsIElOVF9NSU4sIElOVF9NQVgpOwo+ICsJCXNyYy0+eTIgPSBzcmMt
PnkxICsgbmV3X3NyY19oOwo+ICAJCWRzdC0+eTIgPSBjbGlwLT55MjsKPiAgCX0KPiAgCj4gLS0g
Cj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
