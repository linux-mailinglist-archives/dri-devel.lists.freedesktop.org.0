Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F670F8CB4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111A46E39C;
	Tue, 12 Nov 2019 10:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48A6E39C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:20:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g3so17106896ljl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 02:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wt2tEGTMbBPb9EywvqOKOcH2ynL0iBFpbMNN4+VttJ0=;
 b=f+bjJF8xL30kmb+HOuMu7Iohx9o9BUyjAJPZnHWgmOm0NLcW4N3GgAOgxoc6JuOofi
 sf2JgbiGROAynPQ5Y1Wft+yY0K+55U7sZCHji35u4fD5ICStPgp4gVv7faMlAHJrUegq
 nSUtOq6dJKydYVXdVxagM98RpigzYkUdKiqBRauxmpAvLSlCRK2xkrXaqVuM5Hip/PsP
 LC017PL6y3PIM/Nq/b+wkVDiHWQALL9kCmKs+VO5N8uxyZsr/NljlWFnfKW3REk2lmQi
 CviyStOe1WO/ol5HC3b2pS40KyBDl6uPk6hHbixtE2TojprwLMrnD3IG9x199LwZjXf8
 Gdjg==
X-Gm-Message-State: APjAAAW3cNQbneMO8CLfRUTtls2hsW4wtcNwdeoLLRPA0xwJ34aQ9+qC
 kyAeU6aZDq3MRyjH4FcCrn5g/5itMBX9VM/aVCI=
X-Google-Smtp-Source: APXvYqwLv1QgL2LY5NF5oc3QxBBclz4En9VtQbqxmqlW3vDAlGPhSJ+CTuktQ/HjVllWY5WHsgIXoLqwTbvrEiWLmT8=
X-Received: by 2002:a2e:9e45:: with SMTP id g5mr17502010ljk.58.1573554038403; 
 Tue, 12 Nov 2019 02:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20191107153048.843881-1-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191107153048.843881-1-paul.kocialkowski@bootlin.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Nov 2019 11:20:27 +0100
Message-ID: <CAMeQTsYG+YvXqQqvJvsxT1h0z5zZJbdCtc5wPjUossvwidV=cA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fixup fbdev stolen size usage evaluation
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Wt2tEGTMbBPb9EywvqOKOcH2ynL0iBFpbMNN4+VttJ0=;
 b=XlbA2lkx5U6xHQpjpbtaPonUBRx8Bgbc9b0c0WsGCtpccg3XNabQSjfxQQMRs7LSy3
 CeEJEksFBroPrS6PWgQTN0XTRgomAjXS8WglIacf4vA7CL73qKqSptdAFrwiIazmgRob
 eJMFRZyuN2xgrDkcOa1epW+7vPZ+o4En9jvvNp3/xqkhqGgalnSPBlre1FjB/GoFsSEt
 xXvhXF6o4D3fdmSq5BdJ8gtMSi72WfQ3Zewzq1QIfdw/cCSAGnuR9Ke9UxQGitkIo3DS
 Enf6jzQVgg2rirgr4fquWQ6GEcJkfCW5pl/D+f6spNU+IzR2emUgHHl01u76fAi67ubk
 NHOg==
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNywgMjAxOSBhdCA0OjMwIFBNIFBhdWwgS29jaWFsa293c2tpCjxwYXVsLmtv
Y2lhbGtvd3NraUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBwc2JmYl9wcm9iZSBwZXJmb3JtcyBh
biBldmFsdWF0aW9uIG9mIHRoZSByZXF1aXJlZCBzaXplIGZyb20gdGhlIHN0b2xlbgo+IEdUVCBt
ZW1vcnksIGJ1dCBnZXRzIGl0IHdyb25nIGluIHR3byBkaXN0aW5jdCB3YXlzOgo+IC0gVGhlIHJl
c3VsdGluZyBzaXplIG11c3QgYmUgcGFnZS1zaXplLWFsaWduZWQ7Cj4gLSBUaGUgc2l6ZSB0byBh
bGxvY2F0ZSBpcyBkZXJpdmVkIGZyb20gdGhlIHN1cmZhY2UgZGltZW5zaW9ucywgbm90IHRoZSBm
Ygo+ICAgZGltZW5zaW9ucy4KPgo+IFdoZW4gdHdvIGNvbm5lY3RvcnMgYXJlIGNvbm5lY3RlZCB3
aXRoIGRpZmZlcmVudCBtb2RlcywgdGhlIHNtYWxsZXN0IHdpbGwKPiBiZSBzdG9yZWQgaW4gdGhl
IGZiIGRpbWVuc2lvbnMsIGJ1dCB0aGUgc2l6ZSB0aGF0IG5lZWRzIHRvIGJlIGFsbG9jYXRlZCBt
dXN0Cj4gbWF0Y2ggdGhlIGxhcmdlc3QgKHN1cmZhY2UpIGRpbWVuc2lvbnMuIFRoaXMgaXMgd2hh
dCBpcyB1c2VkIGluIHRoZSBhY3R1YWwKPiBhbGxvY2F0aW9uIGNvZGUuCj4KPiBGaXggdGhpcyBi
eSBjb3JyZWN0aW5nIHRoZSBldmFsdWF0aW9uIHRvIGNvbmZvcm0gdG8gdGhlIHR3byBwb2ludHMg
YWJvdmUuCj4gSXQgYWxsb3dzIGNvcnJlY3RseSBzd2l0Y2hpbmcgdG8gMTZicHAgd2hlbiBvbmUg
Y29ubmVjdG9yIGlzIGUuZy4gMTkyMHgxMDgwCj4gYW5kIHRoZSBvdGhlciBpcyAxMDI0eDc2OC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBi
b290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5j
IHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZm
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYwo+IGluZGV4IDIxOGYz
YmIxNTI3Ni4uOTAyMzdhYmVlMDg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZm
ZXIuYwo+IEBAIC00NjIsNiArNDYyLDcgQEAgc3RhdGljIGludCBwc2JmYl9wcm9iZShzdHJ1Y3Qg
ZHJtX2ZiX2hlbHBlciAqaGVscGVyLAo+ICAgICAgICAgICAgICAgICBjb250YWluZXJfb2YoaGVs
cGVyLCBzdHJ1Y3QgcHNiX2ZiZGV2LCBwc2JfZmJfaGVscGVyKTsKPiAgICAgICAgIHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBwc2JfZmJkZXYtPnBzYl9mYl9oZWxwZXIuZGV2Owo+ICAgICAgICAg
c3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYgPSBkZXYtPmRldl9wcml2YXRlOwo+ICsg
ICAgICAgdW5zaWduZWQgaW50IGZiX3NpemU7Cj4gICAgICAgICBpbnQgYnl0ZXNwcDsKPgo+ICAg
ICAgICAgYnl0ZXNwcCA9IHNpemVzLT5zdXJmYWNlX2JwcCAvIDg7Cj4gQEAgLTQ3MSw4ICs0NzIs
MTEgQEAgc3RhdGljIGludCBwc2JmYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVy
LAo+ICAgICAgICAgLyogSWYgdGhlIG1vZGUgd2lsbCBub3QgZml0IGluIDMyYml0IHRoZW4gc3dp
dGNoIHRvIDE2Yml0IHRvIGdldAo+ICAgICAgICAgICAgYSBjb25zb2xlIG9uIGZ1bGwgcmVzb2x1
dGlvbi4gVGhlIFggbW9kZSBzZXR0aW5nIHNlcnZlciB3aWxsCj4gICAgICAgICAgICBhbGxvY2F0
ZSBpdHMgb3duIDMyYml0IEdFTSBmcmFtZWJ1ZmZlciAqLwo+IC0gICAgICAgaWYgKEFMSUdOKHNp
emVzLT5mYl93aWR0aCAqIGJ5dGVzcHAsIDY0KSAqIHNpemVzLT5mYl9oZWlnaHQgPgo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGRldl9wcml2LT52cmFtX3N0b2xlbl9zaXplKSB7Cj4gKyAgICAg
ICBmYl9zaXplID0gQUxJR04oc2l6ZXMtPnN1cmZhY2Vfd2lkdGggKiBieXRlc3BwLCA2NCkgKgo+
ICsgICAgICAgICAgICAgICAgIHNpemVzLT5zdXJmYWNlX2hlaWdodDsKPiArICAgICAgIGZiX3Np
emUgPSBBTElHTihmYl9zaXplLCBQQUdFX1NJWkUpOwo+ICsKPiArICAgICAgIGlmIChmYl9zaXpl
ID4gZGV2X3ByaXYtPnZyYW1fc3RvbGVuX3NpemUpIHsKCnBzYl9ndHRfYWxsb2NfcmFuZ2UoKSBh
bHJlYWR5IGFsaWducyBieSBQQUdFX1NJWkUgZm9yIHVzLiBMb29rcyBsaWtlCndlIGFsaWduIGEg
Y291cGxlIG9mIHRpbWVzIGV4dHJhIGZvciBsdWNrLiBUaGlzIG5lZWRzIGNsZWFuaW5nIHVwCmlu
c3RlYWQgb2YgYWRkaW5nIGV2ZW4gbW9yZSBhbGlnbnMuCgpZb3VyIHNpemUgY2FsY3VsYXRpb24g
bG9va3MgY29ycmVjdCBhbmQgaW5kZWVkIG1ha2VzIG15IDEwMjR4NjAwICsKMTkyMHgxMDgwIHNl
dHVwIGFjdHVhbGx5IGRpc3BsYXkgc29tZXRoaW5nLCBidXQgZm9yIHNvbWUgcmVhc29uIEkgZ2V0
CmFuIGluY29ycmVjdCBwYW5uaW5nIG9uIHRoZSBzbWFsbGVyIHNjcmVlbiBhbmQgc3RhbGUgZGF0
YSBvbiB0aGUKc3VyZmFjZSBvbmx5IHZpc2libGUgYnkgdGhlIGxhcmdlciBDUlRDLiBBbnkgaWRl
YSB3aGF0J3MgZ29pbmcgb24/Cgo+ICAgICAgICAgICAgICAgICAgc2l6ZXMtPnN1cmZhY2VfYnBw
ID0gMTY7Cj4gICAgICAgICAgICAgICAgICBzaXplcy0+c3VyZmFjZV9kZXB0aCA9IDE2Owo+ICAg
ICAgICAgIH0KPiAtLQo+IDIuMjMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
