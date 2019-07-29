Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D77860E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375189AAD;
	Mon, 29 Jul 2019 07:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E550F898EA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 05:34:37 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id m202so44415249oig.6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaGp3kgEFZq5TRVhS/gSVCfAQk/B2Vhh2rMW5DZxtGU=;
 b=pdYxiW1cDyjmNq1yb0AVlexn9/i9bUeFQCaspJJGYsL0tRwEWZ4Z59XRRgPubXmUsj
 RKCCuwpvoHyaci69ffkQnpduerZWkZY+DNYvsyduH75Hisvcwi9iiA+G9dmyKy9k3o3Y
 L8Raz1sWi7HgwYqs9D1MDoZbutMV+vpB9aelYGLxtBZUsd68wooJd6Bsh9iDgTttFfoP
 W8EtHRb46X7E7/sCHKC+UUBKEyVcR5fqtCilN8c54k8u5WpNfmzjSToRwpeaBsHMvUe1
 39UcSMmZxk/Up/MGWrfiem2EYJh3ocX+tJJzo0EKRb/NyOAWYOq/3JgO3iaDcdKlzsdz
 skwg==
X-Gm-Message-State: APjAAAX3lNricjyLzPD5jZU+N1lw8uDqHTdt3m76ZCLxD69hMxTdDsza
 MY84mal2V1Rjsr7PhFrnEYtfdoUAIF0=
X-Google-Smtp-Source: APXvYqyWvGlZDSoYALIDauexi5qba+PEwwA6nSWJO6/vEVfYAgmo2BhOM3QNZhYp8E7KdxISEtWdCg==
X-Received: by 2002:aca:37c5:: with SMTP id e188mr17337201oia.66.1564378476547; 
 Sun, 28 Jul 2019 22:34:36 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45])
 by smtp.gmail.com with ESMTPSA id v22sm21803389oth.19.2019.07.28.22.34.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 22:34:35 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id d17so61362003oth.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:34:35 -0700 (PDT)
X-Received: by 2002:a9d:30c3:: with SMTP id r3mr77017546otg.141.1564378474946; 
 Sun, 28 Jul 2019 22:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190723053421.179679-1-acourbot@chromium.org>
 <1563947367.1070.7.camel@mtksdaap41>
In-Reply-To: <1563947367.1070.7.camel@mtksdaap41>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 29 Jul 2019 14:34:22 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV1_7PfvxhGFHQsTSh24gLTHyZWVG4ZXKsLCEqWDQb8-A@mail.gmail.com>
Message-ID: <CAPBb6MV1_7PfvxhGFHQsTSh24gLTHyZWVG4ZXKsLCEqWDQb8-A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: make imported PRIME buffers contiguous
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JaGp3kgEFZq5TRVhS/gSVCfAQk/B2Vhh2rMW5DZxtGU=;
 b=WmXswO1gqiSorGC4ip/zmQ4EJYLWz1GfFiJ7rsQn0fda4gOodSPR13eNYXLeVP8gI6
 TiItkjpeVAYZ9jPzIra+ug8Zd6QizwTno1TIvdOMHE5FM0LIJ6lw7a/Msw5J6QFW18FT
 4MVE2zcS/4P7OVuELVoX5VlLzqKO/4Uu7FD3I=
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMjo0OSBQTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPgo+IEhpLCBBbGV4YW5kcmU6Cj4KPiBPbiBUdWUsIDIwMTktMDctMjMgYXQgMTQ6
MzQgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+ID4gVGhpcyBkcml2ZXIgcmVxdWly
ZXMgaW1wb3J0ZWQgUFJJTUUgYnVmZmVycyB0byBhcHBlYXIgY29udGlndW91c2x5IGluCj4gPiBp
dHMgSU8gYWRkcmVzcyBzcGFjZS4gTWFrZSBzdXJlIHRoaXMgaXMgdGhlIGNhc2UgYnkgc2V0dGlu
ZyB0aGUgbWF4aW11bQo+ID4gRE1BIHNlZ21lbnQgc2l6ZSB0byBhIGJldHRlciB2YWx1ZSB0aGFu
IHRoZSBkZWZhdWx0IDY0SyBvbiB0aGUgRE1BCj4gPiBkZXZpY2UsIGFuZCB1c2Ugc2FpZCBETUEg
ZGV2aWNlIHdoZW4gaW1wb3J0aW5nIFBSSU1FIGJ1ZmZlcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgNDcgKysrKysrKysrKysr
KysrKysrKysrKysrLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
aCB8ICAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiBp
bmRleCA5NWZkYmQwZmJjYWMuLjRhZDQ3NzBmYWIxMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ID4gQEAgLTIxMyw2ICsyMTMsNyBAQCBzdGF0aWMgaW50
IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiA+ICAgICAgIHN0cnVj
dCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkcm0tPmRldl9wcml2YXRlOwo+ID4gICAgICAg
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnA7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkbWFfZGV2Owo+ID4gICAgICAgaW50IHJl
dDsKPiA+Cj4gPiAgICAgICBpZiAoIWlvbW11X3ByZXNlbnQoJnBsYXRmb3JtX2J1c190eXBlKSkK
PiA+IEBAIC0yNzUsNyArMjc2LDI3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtKQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9jb21wb25lbnRf
dW5iaW5kOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIHByaXZhdGUtPmRtYV9kZXYgPSAmcGRl
di0+ZGV2Owo+ID4gKyAgICAgZG1hX2RldiA9ICZwZGV2LT5kZXY7Cj4gPiArICAgICBwcml2YXRl
LT5kbWFfZGV2ID0gZG1hX2RldjsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBDb25m
aWd1cmUgdGhlIERNQSBzZWdtZW50IHNpemUgdG8gbWFrZSBzdXJlIHdlIGdldCBjb250aWd1b3Vz
IElPVkEKPiA+ICsgICAgICAqIHdoZW4gaW1wb3J0aW5nIFBSSU1FIGJ1ZmZlcnMuCj4gPiArICAg
ICAgKi8KPiA+ICsgICAgIGlmICghZG1hX2Rldi0+ZG1hX3Bhcm1zKSB7Cj4gPiArICAgICAgICAg
ICAgIHByaXZhdGUtPmRtYV9wYXJtc19hbGxvY2F0ZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAg
ICBkbWFfZGV2LT5kbWFfcGFybXMgPQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldm1fa3ph
bGxvYyhkcm0tPmRldiwgc2l6ZW9mKCpkbWFfZGV2LT5kbWFfcGFybXMpLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIH0KPiA+ICsg
ICAgIGlmICghZG1hX2Rldi0+ZG1hX3Bhcm1zKQo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9j
b21wb25lbnRfdW5iaW5kOwo+Cj4gcmV0dXJuIHdpdGggcmV0ID0gMD8KCk9vcHMsIGluZGVlZC4K
Cj4KPiA+ICsKPiA+ICsgICAgIHJldCA9IGRtYV9zZXRfbWF4X3NlZ19zaXplKGRtYV9kZXYsICh1
bnNpZ25lZCBpbnQpRE1BX0JJVF9NQVNLKDMyKSk7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiAr
ICAgICAgICAgICAgIGRldl9lcnIoZG1hX2RldiwgIkZhaWxlZCB0byBzZXQgRE1BIHNlZ21lbnQg
c2l6ZVxuIik7Cj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX3Vuc2V0X2RtYV9wYXJtczsKPiA+
ICsgICAgIH0KPiA+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogV2UgZG9uJ3QgdXNlIHRoZSBk
cm1faXJxX2luc3RhbGwoKSBoZWxwZXJzIHByb3ZpZGVkIGJ5IHRoZSBEUk0KPiA+IEBAIC0yODUs
MTMgKzMwNiwxNiBAQCBzdGF0aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSkKPiA+ICAgICAgIGRybS0+aXJxX2VuYWJsZWQgPSB0cnVlOwo+ID4gICAgICAgcmV0
ID0gZHJtX3ZibGFua19pbml0KGRybSwgTUFYX0NSVEMpOwo+ID4gICAgICAgaWYgKHJldCA8IDAp
Cj4gPiAtICAgICAgICAgICAgIGdvdG8gZXJyX2NvbXBvbmVudF91bmJpbmQ7Cj4gPiArICAgICAg
ICAgICAgIGdvdG8gZXJyX3Vuc2V0X2RtYV9wYXJtczsKPiA+Cj4gPiAgICAgICBkcm1fa21zX2hl
bHBlcl9wb2xsX2luaXQoZHJtKTsKPiA+ICAgICAgIGRybV9tb2RlX2NvbmZpZ19yZXNldChkcm0p
Owo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICtlcnJfdW5zZXRfZG1hX3Bhcm1zOgo+
ID4gKyAgICAgaWYgKHByaXZhdGUtPmRtYV9wYXJtc19hbGxvY2F0ZWQpCj4gPiArICAgICAgICAg
ICAgIGRtYV9kZXYtPmRtYV9wYXJtcyA9IE5VTEw7Cj4gPiAgZXJyX2NvbXBvbmVudF91bmJpbmQ6
Cj4gPiAgICAgICBjb21wb25lbnRfdW5iaW5kX2FsbChkcm0tPmRldiwgZHJtKTsKPiA+ICBlcnJf
Y29uZmlnX2NsZWFudXA6Cj4gPiBAQCAtMzAyLDkgKzMyNiwxNCBAQCBzdGF0aWMgaW50IG10a19k
cm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiA+Cj4gPiAgc3RhdGljIHZvaWQg
bXRrX2RybV9rbXNfZGVpbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4gPiAgewo+ID4gKyAg
ICAgc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4g
PiArCj4gPiAgICAgICBkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiA+ICAgICAgIGRy
bV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gPgo+ID4gKyAgICAgaWYgKHByaXZhdGUt
PmRtYV9wYXJtc19hbGxvY2F0ZWQpCj4gPiArICAgICAgICAgICAgIHByaXZhdGUtPmRtYV9kZXYt
PmRtYV9wYXJtcyA9IE5VTEw7Cj4gPiArCj4gPiAgICAgICBjb21wb25lbnRfdW5iaW5kX2FsbChk
cm0tPmRldiwgZHJtKTsKPiA+ICAgICAgIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7Cj4g
PiAgfQo+ID4gQEAgLTMyMCw2ICszNDksMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29w
ZXJhdGlvbnMgbXRrX2RybV9mb3BzID0gewo+ID4gICAgICAgLmNvbXBhdF9pb2N0bCA9IGRybV9j
b21wYXRfaW9jdGwsCj4gPiAgfTsKPiA+Cj4gPiArLyoKPiA+ICsgKiBXZSBuZWVkIHRvIG92ZXJy
aWRlIHRoaXMgYmVjYXVzZSB0aGUgZGV2aWNlIHVzZWQgdG8gaW1wb3J0IHRoZSBtZW1vcnkgaXMK
PiA+ICsgKiBub3QgZGV2LT5kZXYsIGFzIGRybV9nZW1fcHJpbWVfaW1wb3J0KCkgZXhwZWN0cy4K
PiA+ICsgKi8KPiA+ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19kcm1fZ2VtX3ByaW1lX2lt
cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmKQo+ID4gK3sKPiA+
ICsgICAgIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkZXYtPmRldl9wcml2YXRl
Owo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIGRybV9nZW1fcHJpbWVfaW1wb3J0X2RldihkZXYsIGRt
YV9idWYsIHByaXZhdGUtPmRtYV9kZXYpOwo+ID4gK30KPiA+ICsKPgo+IEkgdGhpbmsgdGhpcyBw
YXJ0IHNob3VsZCBiZSBhbiBpbmRlcGVuZGVudCBwYXRjaCB3aGljaCBmaXh1cAo+IDExOWY1MTcz
NjI4YWEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MgTVQ4
MTczLiIpCgpJIGhhdmUgc3BsaXQgdGhpcyBwYXRjaCBhbmQgc2VudCBhIHYyLgoKVGhhbmtzLApB
bGV4LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
