Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5C7AD54
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 18:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BD26E5B8;
	Tue, 30 Jul 2019 16:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831D6E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 16:14:36 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id x74so5989215ywx.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9MpfSgkGCnSje8H9mA2izkiuK0kqTLnZkcT+mvy7Z6I=;
 b=nWVMC2qZb7MQADvTDf2fAWBxcwJ5dr4uFchcJJconlrh1vzUQuv7pDjC1YYs72P+nz
 z7ha51DEZs85Txc9MvrTPCwtc/Sv55NNKP+UQUXfxT2Zzqde4GM0Jg1+Hazv+mxRRHPL
 21tePMLXKYfyW/1kpNJwDtxm0USviWz5JMOYUJdRCXDDMfR4I1A40pK0T9tkLancxPm/
 XEGKU0wu2eW7UV6yoFGcfUwVyutH5E8A/pTsqPwTDTJPmTzkn8ZtbZuyZDBME7LuVxQF
 WLClXtNOb5NPL3T6w8zsbxEooxhr3T1eHfMt7C74tTJ1+6edbbSPt+qMAYYG1gAAv+FM
 zPwg==
X-Gm-Message-State: APjAAAWPM28ujJg+CByIVmLxJz5Pr+itICBh0wO8B8RmVXj4pryiseUQ
 xua28dXfivOJWNxucUc3dRYeBQ==
X-Google-Smtp-Source: APXvYqxIUiM8pj4HbXTH0Gjcik1/NQLYcK7sffYMLl1yH2GjBJS0ug4Nd+NI/f9vmL9+2GTUkJWelQ==
X-Received: by 2002:a81:3d7:: with SMTP id 206mr66248427ywd.411.1564503275686; 
 Tue, 30 Jul 2019 09:14:35 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id z9sm15173307ywj.84.2019.07.30.09.14.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 09:14:34 -0700 (PDT)
Date: Tue, 30 Jul 2019 12:14:34 -0400
From: Sean Paul <sean@poorly.run>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190730161434.GQ104440@art_vandelay>
References: <20190722181945.244395-1-mka@chromium.org>
 <20190722202426.GL104440@art_vandelay>
 <20190722210207.GZ250418@google.com>
 <20190725174927.GN104440@art_vandelay>
 <ea3219fd-b8eb-279b-aa08-c77705a31249@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea3219fd-b8eb-279b-aa08-c77705a31249@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9MpfSgkGCnSje8H9mA2izkiuK0kqTLnZkcT+mvy7Z6I=;
 b=SJcJ5FmoPGTOo5WYdwowLs6YmtfNfpe2ZLcJN+aAMXSYtZ0nWCHoGG37HZnNJ7H2kv
 ZVjWKYzva7JPPQlqr/yp/xM7t/Vr8HHlSBERBpjUrbs1fjd1omsJ2OMjajnUUM8s5228
 LR83VVIwznftfwRKwA777HP3t0HEymbA6lsX++vhP9NmWv986lmEqUMYsp8NiXw8Ock0
 TJyDOkapxtv89Gfgaum2kk+zvPYr4lTNNSnFM74RgDIruOz3e8tDf+A4hi2hA7RRE2hp
 o1/wOfQkMzE5OTw1owIuocb6vEcsvlvgZU5FdZgUYU7gbQEXYWRmbpz8SEISdKE3yca0
 xZRw==
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6Mzg6MjNQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gT24gMjUvMDcvMjAxOSAxOTo0OSwgU2VhbiBQYXVsIHdyb3RlOgo+
ID4gT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDI6MDI6MDdQTSAtMDcwMCwgTWF0dGhpYXMgS2Fl
aGxja2Ugd3JvdGU6Cj4gPj4gT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDQ6MjQ6MjZQTSAtMDQw
MCwgU2VhbiBQYXVsIHdyb3RlOgo+ID4+PiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMToxOTo0
NUFNIC0wNzAwLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToKPiA+Pj4+IFRoZSBEREMvQ0kgcHJv
dG9jb2wgaW52b2x2ZXMgc2VuZGluZyBhIG11bHRpLWJ5dGUgcmVxdWVzdCB0byB0aGUKPiA+Pj4+
IGRpc3BsYXkgdmlhIEkyQywgd2hpY2ggaXMgdHlwaWNhbGx5IGZvbGxvd2VkIGJ5IGEgbXVsdGkt
Ynl0ZQo+ID4+Pj4gcmVzcG9uc2UuIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBvbmx5IGFs
bG93cyBzaW5nbGUgYnl0ZQo+ID4+Pj4gcmVhZHMvd3JpdGVzIG9yIHJlYWRzIG9mIDggc2VxdWVu
dGlhbCBieXRlcywgaGVuY2UgRERDL0NJIGlzIG5vdAo+ID4+Pj4gc3VwcG9ydGVkIHdoZW4gdGhl
IGludGVybmFsIEkyQyBjb250cm9sbGVyIGlzIHVzZWQuIFRoZSBJMkMKPiA+Pj4KPiA+Pj4gVGhp
cyBpcyB2ZXJ5IGxpa2VseSBhIHN0dXBpZCBxdWVzdGlvbiwgYnV0IEkgZGlkbid0IHNlZSBhbiBh
bnN3ZXIgZm9yIGl0LCBzbwo+ID4+PiBJJ2xsIGp1c3QgYXNrIDopCj4gPj4+Cj4gPj4+IElmIHRo
ZSBjb250cm9sbGVyIHN1cHBvcnRzIHhmZXJzIG9mIDggYnl0ZXMgYW5kIDEgYnl0ZXMsIGNvdWxk
IHlvdSBqdXN0IHNwbGl0Cj4gPj4+IHVwIGFueSBvZiB0aGVzZSB0cmFuc2FjdGlvbnMgaW50byBs
ZW4vOCtsZW4lOCB0cmFuc2FjdGlvbnM/Cj4gPj4KPiA+PiBUaGUgY29udHJvbGxlciBpbnRlcnBy
ZXRzIGFsbCB0cmFuc2ZlcnMgdG8gYmUgcmVnaXN0ZXIgYWNjZXNzZXMuIEl0IGlzCj4gPj4gbm90
IHBvc3NpYmxlIHRvIGp1c3Qgc2VuZCB0aGUgc2VxdWVuY2UgJzB4MGEgMHgwYiAweDBjJyBhcyB0
aHJlZSBieXRlCj4gPj4gdHJhbnNmZXJzLCB0aGUgY29udHJvbGxlciBleHBlY3RzIGFuIGFkZHJl
c3MgZm9yIGVhY2ggYnl0ZSBhbmQKPiA+PiAoc3VwcG9zZWRseSkgc2VuZHMgaXQgb3ZlciB0aGUg
d2lyZSwgd2hpY2ggdHlwaWNhbGx5IGlzbid0IHdoYXQgeW91Cj4gPj4gd2FudC4KPiA+Pgo+ID4+
IEFsc28gdGhlIDgtYnl0ZSByZWFkcyBvbmx5IHNlZW0gdG8gYmUgc3VwcG9ydGVkIGluIGNlcnRh
aW4KPiA+PiBjb25maWd1cmF0aW9ucyAoIndoZW4gdGhlIERXQ19IRE1JX1RYXzIwIHBhcmFtZXRl
ciBpcyBlbmFibGVkIikuCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGFuc3dlcnMg
KGJvdGggeW91IGFuZCBEb3VnKSEKPiA+IAo+ID4gVGhpcyBjaGFuZ2UgbG9va3MgZ29vZCB0byBt
ZSwgYnV0IEknbGwgbGVhdmUgaXQgdG8gYSBkdy1oZG1pIGV4cGVydCB0byBhcHBseS4gU28KPiA+
IGZ3aXcsCj4gCj4gSSdtIG5vdCBxdWFsaWZpZWQgYXMgYSBkdy1oZG1pIGV4cGVydCBidXQgdW50
aWwgdGhlIGludGVybmFsIGkyYyBjb250cm9sbGVyCj4gaXMgZXhwb3NlZCBhcyBhICJzdGFuZGFy
ZCIgaTJjIGFkYXB0ZXIgKHdoaWNoIGlzIGEgdmFsdWFibGUgZmVhdHVyZSksCj4gYmxhY2tsaXN0
aW5nIGEgZml4ZWQgYWRkcmVzcyBpcyB3cm9uZywgYW5kIHdlIHNob3VsZCBkZXRlY3QgaW52YWxp
ZC9tYWxmb3JtZWQKPiB0cmFuc2FjdGlvbnMgaW5zdGVhZCB0aGF0IGRvZXNuJ3QgZml0IGluIHRo
ZSBIVyBtb2RlbCBPUiByZWFsbHkgc3RvcCBlbXVsYXRpbmcKPiBhbiBpMmMgYWRhcHRlci4KCkkg
dGhpbmsgd2UgYWxsIGFncmVlIG9uIHRoaXMgKGFuZCBEb3VnIG1lbnRpb25lZCBpdCB1cHRocmVh
ZCkuIFRoYXQgc2FpZCwgdGhlCmRyaXZlciBpcyBjdXJyZW50bHkgcmV0dXJuaW5nIHN1Y2Nlc3Nm
dWwgc3RhdHVzIGFuZCBnYXJiYWdlIGRhdGEuIEkgdGhpbmsgdGhhdCdzCm9iamVjdGl2ZWx5IHdv
cnNlIHRoYW4gcmV0dXJuaW5nIGFuIGVycm9yLCBhbmQgdGhpcyBwYXRjaCByZWFsbHkgZG9lc24n
dApwcmV2ZW50IHVzIGZyb20gZG9pbmcgaXQgcmlnaHQgaW4gdGhlIGZ1dHVyZS4KCklmIHRoZSBj
b2RlIHdhc24ndCBhbHJlYWR5IHVwc3RyZWFtLCBJIGFncmVlIHdlIHNob3VsZCBwaXZvdCB0byB0
aGUgY29ycmVjdApzb2x1dGlvbi4gQnV0IHVubGVzcyBzb21lb25lIHZvbHVudGVlcnMgdG8gZml4
IHRoaXMgdGhlIHJpZ2h0IHdheSwgSSBkb24ndCBoYXZlCmEgcHJvYmxlbSB3aXRoIHRoaXMgcGF0
Y2ggZm9yIG5vdy4KClNlYW4KCj4gCj4gTW92aW5nIHRvIGRybV9kb19nZXRfZWRpZCgpIHdvdWxk
IG5lZWQgdG8gZW50aXJlbHkgcmV3cml0ZSBvciByZWZhY3RvciBjb21tdW5pY2F0aW9uCj4gY29k
ZSB0byBoYW5kbGUgdGhlIFNDREMgdHJhbnNhY3Rpb25zLCBzaW5jZSB0aGV5IHVzZSBhbiBpMmMg
YWRhcHRlci4uLgo+IAo+IE5laWwKPiAKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgo+ID4gCj4gPiAKPiA+Pgo+ID4+Pj4gdHJhbnNmZXJzIGNvbXBsZXRl
IHdpdGhvdXQgZXJyb3JzLCBob3dldmVyIHRoZSBkYXRhIGluIHRoZSByZXNwb25zZQo+ID4+Pj4g
aXMgZ2FyYmFnZS4gQWJvcnQgdHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChE
REMpIHdpdGgKPiA+Pj4+IC1FT1BOT1RTVVBQLCB0byBtYWtlIGl0IGV2aWRlbnQgdGhhdCB0aGUg
Y29tbXVuaWNhdGlvbiBpcyBmYWlsaW5nLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+ID4+Pj4gLS0tCj4gPj4+PiBDaGFu
Z2VzIGluIHYyOgo+ID4+Pj4gLSBjaGFuZ2VkIEREQ19JMkNfQUREUiB0byBERENfQ0lfQUREUgo+
ID4+Pj4gLS0tCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMgfCA4ICsrKysrKysrCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+
ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4g
Pj4+PiBpbmRleCAwNDViMWIxM2ZkMGUuLjI4OTMzNjI5ZjNjNyAxMDA2NDQKPiA+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4+Pj4gQEAgLTM1LDYg
KzM1LDcgQEAKPiA+Pj4+ICAKPiA+Pj4+ICAjaW5jbHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+
Cj4gPj4+PiAgCj4gPj4+PiArI2RlZmluZSBERENfQ0lfQUREUgkJMHgzNwo+ID4+Pj4gICNkZWZp
bmUgRERDX1NFR01FTlRfQUREUgkweDMwCj4gPj4+PiAgCj4gPj4+PiAgI2RlZmluZSBIRE1JX0VE
SURfTEVOCQk1MTIKPiA+Pj4+IEBAIC0zMjIsNiArMzIzLDEzIEBAIHN0YXRpYyBpbnQgZHdfaGRt
aV9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCj4gPj4+PiAgCXU4IGFkZHIgPSBt
c2dzWzBdLmFkZHI7Cj4gPj4+PiAgCWludCBpLCByZXQgPSAwOwo+ID4+Pj4gIAo+ID4+Pj4gKwlp
ZiAoYWRkciA9PSBERENfQ0lfQUREUikKPiA+Pj4+ICsJCS8qCj4gPj4+PiArCQkgKiBUaGUgaW50
ZXJuYWwgSTJDIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGUgbXVsdGktYnl0ZQo+ID4+
Pj4gKwkJICogcmVhZCBhbmQgd3JpdGUgb3BlcmF0aW9ucyBuZWVkZWQgZm9yIEREQy9DSS4KPiA+
Pj4+ICsJCSAqLwo+ID4+Pj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+Pj4gKwo+ID4+Pj4g
IAlkZXZfZGJnKGhkbWktPmRldiwgInhmZXI6IG51bTogJWQsIGFkZHI6ICUjeFxuIiwgbnVtLCBh
ZGRyKTsKPiA+Pj4+ICAKPiA+Pj4+ICAJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7Cj4gPj4+
Cj4gPiAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
