Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB66CA14
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418DB6E334;
	Thu, 18 Jul 2019 07:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BF06E312
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 07:21:40 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id l79so11851146ywe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 00:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I7RxY7r3Jgx1B32VLDVMayLONGfb/45rCMfF68XdUAg=;
 b=shNolO6WZNrB+xf7HgE7NkGGrDstCHAZC+KmVfnY0if44JvCoY4RQovMTEV8G0HlnP
 PNomqBSHAYZIzgDYSVE05gk60ry11QPPBIzKwsv5dibxmnID/Nf0OZPmJvP7PD6oKto+
 rBlXg1KRfVy4oFogbxbJ84OyO1tWazVGW89PsnbAyA2CStFI+k322EPDXlryZ+3IIuM1
 IOIsnKR60L9ssJk1FyyhHTmnOUVu9S4JcICXBpWDX2Sx2dIquOT0K/PnOJjykCAtiWFw
 L9WiRimzpA6iXrRu0RsYAjWvM9SOo+BqIWgTbk2pdGblWHznkPB5zoIj8OMYtW7gPR+O
 H3PQ==
X-Gm-Message-State: APjAAAWE7TxvDmdISQjvfUOTNMfEd67laecMtiqXBryjDqIkVyy/Ig89
 mnho+r92hM8fiDaF3V7ocVrNhak4yDnIrX0/BX8=
X-Google-Smtp-Source: APXvYqzyn24R75IvV9NOa9XZXY2XO7T0KL4m6uKnklrU5aFhxWobVyBsowaxjq35Rnfl9y9O3v18nyMMlKx/oST5D10=
X-Received: by 2002:a0d:f2c4:: with SMTP id
 b187mr27527652ywf.103.1563434500147; 
 Thu, 18 Jul 2019 00:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190711031021.23512-1-huangfq.daxian@gmail.com>
 <6f28e750-02e4-438a-3680-a4697014689d@amd.com>
In-Reply-To: <6f28e750-02e4-438a-3680-a4697014689d@amd.com>
From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Thu, 18 Jul 2019 15:21:29 +0800
Message-ID: <CABXRUiTG4=isYUHkoha9dYX0P=k6AuQAnrZkcWHT=-Yf2gk6Vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:39:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I7RxY7r3Jgx1B32VLDVMayLONGfb/45rCMfF68XdUAg=;
 b=eTVCASN/nT7UvlP4b2X/hXHaLQJXMUscbQC9BC69DYGyPbL5539AeuPk0d0lVuNnFB
 94C85zw3keVa0UWRcTL7/iGcxD2GoaJLbsEOeuzl7SzOaXTXuuSkatIwiqUUkz0Ct9xE
 mGjy62wdb3x1vH6IxM68zd3oFq5NJ7lL4c6N1qGUMn49oUG7bagRqGf2qPFEb2IEzUe3
 koODk1TdrlZk8rfnxf3R1i1527woiDDZn1VyNTHdATm+EqtapeyaDGfXCotryhLL6zl8
 dXugt/fxJlPXUHWrvY1Fiwv4s6ZgoH08QSVOMRsPpumfPgdGQPiNKaQWD/oHCyK1xxCa
 rtxg==
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4g5pa8IDIwMTnlubQ3
5pyIMTbml6XpgLHkuowg5LiL5Y2IOTozOOWvq+mBk++8mgo+Cj4gQW0gMTEuMDcuMTkgdW0gMDU6
MTAgc2NocmllYiBGdXFpYW4gSHVhbmc6Cj4gPiBJbiBmdW5jdGlvbiBfX3R0bV9kbWFfYWxsb2Nf
cGFnZSgpLCBkX3BhZ2UtPmFkZHIgaXMgYWxsb2NhdGVkCj4gPiBieSBkbWFfYWxsb2NfYXR0cnMo
KSBidXQgZnJlZWQgd2l0aCB1c2UgZG1hX2ZyZWVfY29oZXJlbnQoKSBpbgo+ID4gX190dG1fZG1h
X2ZyZWVfcGFnZSgpLgo+ID4gVXNlIHRoZSBjb3JyZWN0IGRtYV9mcmVlX2F0dHJzKCkgdG8gZnJl
ZSBkX3BhZ2UtPnZhZGRyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVh
bmdmcS5kYXhpYW5AZ21haWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEhvdyBkbyB5b3Ugd2FudCB0byB1cHN0cmVh
bSB0aGF0PyBTaG91bGQgSSBwdWxsIGl0IGludG8gb3VyIHRyZWU/CgpJIGp1c3QgY2FtZSBhY3Jv
c3MgdGhpcyBtaXN1c2UgY2FzZSBhY2NpZGVudGFsbHkuCkkgYW0gbm90IHZlcnkgY2xlYXIgYWJv
dXQgJ0hvdyB0byB1cHN0cmVhbSB0aGF0Jy4KQXJlIHRoZXJlIG1vcmUgdGhhbiBvbmUgd2F5IHRv
IHVwc3RyZWFtIHRoZSBjb2RlIGFuZCBmaXggdGhlIHByb2JsZW0/CgpGcm9tIG15IHNpZGUsIGl0
IGlzIG9rIHRoYXQgeW91IHB1bGwgaXQgaW50byB5b3VyIHRyZWUgYW5kIGZpeCBpdCBvcgpmaXgg
aXQgaW4gb3RoZXIgd2F5Lgo6KSBJdCB3aWxsIGJlIGZpbmUgaWYgdGhlIHByb2JsZW0gaXMgZml4
ZWQuCgpUaGFua3MuCgo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgfCA2ICsrKysrLQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCj4gPiBpbmRleCBkNTk0Zjc1MjBi
N2IuLjdkNzhlNmRlYWM4OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3BhZ2VfYWxsb2NfZG1hLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2Vf
YWxsb2NfZG1hLmMKPiA+IEBAIC0yODUsOSArMjg1LDEzIEBAIHN0YXRpYyBpbnQgdHRtX3NldF9w
YWdlc19jYWNoaW5nKHN0cnVjdCBkbWFfcG9vbCAqcG9vbCwKPiA+Cj4gPiAgIHN0YXRpYyB2b2lk
IF9fdHRtX2RtYV9mcmVlX3BhZ2Uoc3RydWN0IGRtYV9wb29sICpwb29sLCBzdHJ1Y3QgZG1hX3Bh
Z2UgKmRfcGFnZSkKPiA+ICAgewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBhdHRycyA9IDA7Cj4g
PiAgICAgICBkbWFfYWRkcl90IGRtYSA9IGRfcGFnZS0+ZG1hOwo+ID4gICAgICAgZF9wYWdlLT52
YWRkciAmPSB+VkFERFJfRkxBR19IVUdFX1BPT0w7Cj4gPiAtICAgICBkbWFfZnJlZV9jb2hlcmVu
dChwb29sLT5kZXYsIHBvb2wtPnNpemUsICh2b2lkICopZF9wYWdlLT52YWRkciwgZG1hKTsKPiA+
ICsgICAgIGlmIChwb29sLT50eXBlICYgSVNfSFVHRSkKPiA+ICsgICAgICAgICAgICAgYXR0cnMg
PSBETUFfQVRUUl9OT19XQVJOOwo+ID4gKwo+ID4gKyAgICAgZG1hX2ZyZWVfYXR0cnMocG9vbC0+
ZGV2LCBwb29sLT5zaXplLCAodm9pZCAqKWRfcGFnZS0+dmFkZHIsIGRtYSwgYXR0cnMpOwo+ID4K
PiA+ICAgICAgIGtmcmVlKGRfcGFnZSk7Cj4gPiAgICAgICBkX3BhZ2UgPSBOVUxMOwo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
