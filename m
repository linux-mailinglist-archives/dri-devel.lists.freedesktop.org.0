Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D36E7A7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 17:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FA76E844;
	Fri, 19 Jul 2019 15:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C966E844
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 15:04:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so34752411eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/Dk2h3VtRtpKEYNTLoFv9y8SCMtDA0mX1ON9McDAxU=;
 b=jbkSlFYhw9AV1dN/3nflt1WYXK6SvWg0Si5WopRr2K6zsmkS4qzQ3QuLN0joHeY+cV
 Scet5RbT47wYCoSobikhUEeCmAZB1X3VDvcB4isU9wKNwILIrNRiyegukiG8+MNHaFVm
 vN5EriMk37/KjR2E2uJHjdh/yeNXlZeWkNhxSbbcvJ9iASo6nrYjFAYTgXKNvH7Ikv7U
 3oeuWN4YiagSRNhkDd/fE1EhfHaAYh8zctMXWJ+nEha5WYcnYKUGTM/DVD6wynGENocw
 fKZdmnpHjbJqoE4W10ZVVKAsqfmffGWl165K/HTbNjehHO9iEmW5NxFc7+z1tjRUKEmW
 R4Kw==
X-Gm-Message-State: APjAAAXLwo2//ron067Y/VBz3Vp26e+ZmJ99C6aYXe4ltjbNjJwX/5cL
 buNmNP6Xbp1r6ndNv0/d8uEi1cAxBOJXlKm5cus=
X-Google-Smtp-Source: APXvYqy3AfEghQMcXF9VOwRQhc99W/f1B3Sr0Ahbjqamx/d9/eLK0MRlwOFZqBcUvcmk5DpgHTia3heGjRaNq1+9/qo=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr46428179edn.272.1563548651767; 
 Fri, 19 Jul 2019 08:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190716164221.15436-1-robdclark@gmail.com>
 <20190716164221.15436-2-robdclark@gmail.com>
 <20190719090949.GG15868@phenom.ffwll.local>
In-Reply-To: <20190719090949.GG15868@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Jul 2019 08:04:00 -0700
Message-ID: <CAF6AEGt=ks93F=hYGEy-+PUDTsXA2Wp+DwhGYLFraJ5jZmRKtA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vgem: use normal cached mmap'ings
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>, 
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, 
 Imre Deak <imre.deak@intel.com>, Deepak Sharma <deepak.sharma@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2/Dk2h3VtRtpKEYNTLoFv9y8SCMtDA0mX1ON9McDAxU=;
 b=LIKBplXRAWWluVZjmlGO+RFdgPMEFB1SZiGGuN29eKqCWRhMudg9nG+zgdj25EEILX
 1rwgX5ujfBV4SjE5F6ICNBFuCaUSXiLjCyhqlgwJ6qz6Q3Ct1z6keOIJPOQIdUbwDS+0
 PdDF7wQ96pf8GqTeMvx1U7rOJnF/TFCEJpB/JgVYXLcHj517bqAtNC/wbNKkEOHwznBo
 V8WZiVKbHH/FxWj/EMKYRJ3tI56yJEyJfQ0yDrE/NspTQt8dHa3DiQR2e/BDjyL5nPKN
 dCJowEYVFEWlAgo43ZqutPHx2Uma7eJyw0dfiXYeU+mGVmg8WCdXXWKgiqIwwej/6Y6x
 BOdw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjowOSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDk6NDI6MTVBTSAtMDcw
MCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4KPiA+IFNpbmNlIHRoZXJlIGlzIG5vIHJlYWwgZGV2aWNlIGFzc29jaWF0ZWQg
d2l0aCB2Z2VtLCBpdCBpcyBpbXBvc3NpYmxlIHRvCj4gPiBlbmQgdXAgd2l0aCBhcHByb3ByaWF0
ZSBkZXYtPmRtYV9vcHMsIG1lYW5pbmcgdGhhdCB3ZSBoYXZlIG5vIHdheSB0bwo+ID4gaW52YWxp
ZGF0ZSB0aGUgc2htZW0gcGFnZXMgYWxsb2NhdGVkIGJ5IHZnZW0uICBTbywgYXQgbGVhc3Qgb24g
cGxhdGZvcm1zCj4gPiB3aXRob3V0IGRybV9jZmx1c2hfcGFnZXMoKSwgd2UgZW5kIHVwIHdpdGgg
Y29ycnVwdGlvbiB3aGVuIGNhY2hlIGxpbmVzCj4gPiBmcm9tIHByZXZpb3VzIHVzYWdlIG9mIHZn
ZW0gYm8gcGFnZXMgZ2V0IGV2aWN0ZWQgdG8gbWVtb3J5Lgo+ID4KPiA+IFRoZSBvbmx5IHNhbmUg
b3B0aW9uIGlzIHRvIHVzZSBjYWNoZWQgbWFwcGluZ3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBQb3NzaWJseSB3
ZSBjb3VsZCBkbWFfc3luY18qX2Zvcl97ZGV2aWNlLGNwdX0oKSBvbiBkbWFidWYgYXR0YWNoL2Rl
dGFjaCwKPiA+IGFsdGhvdWdoIHRoZSAtPmdlbV9wcmltZV97cGluLHVucGlufSgpIEFQSSBpc24n
dCBxdWl0ZSBpZGVhbCBmb3IgdGhhdCBhcwo+ID4gaXQgaXMuICBBbmQgdGhhdCBkb2Vzbid0IHJl
YWxseSBoZWxwIGZvciBkcml2ZXJzIHRoYXQgZG9uJ3QgYXR0YWNoLwo+ID4gZGV0YWNoIGZvciBl
YWNoIHVzZS4KPiA+Cj4gPiBCdXQgQUZBSUNUIHZnZW0gaXMgbWFpbmx5IHVzZWQgZm9yIGRtYWJ1
ZiB0ZXN0aW5nLCBzbyBtYXliZSB3ZSBkb24ndAo+ID4gbmVlZCB0byBjYXJlIHRvbyBtdWNoIGFi
b3V0IHVzZSBvZiBjYWNoZWQgbW1hcCdpbmdzLgo+Cj4gSXNuJ3QgdGhpcyBnb2luZyB0byBob3Jy
aWJseSBicmVhayB0ZXN0aW5nIGJ1ZmZlciBzaGFyaW5nIHdpdGggU29DCj4gZGV2aWNlcz8gSSdk
IGFzc3VtZSB0aGV5IGFsbCBleHBlY3Qgd3JpdGVjb21iaW5pbmcgbW9kZSB0byBtYWtlIHN1cmUg
c3R1ZmYKPiBpcyBjb2hlcmVudD8KPgo+IEFsc28gY291bGQgd2UgZ2V0IGF3YXkgd2l0aCB0aGlz
IGJ5IHNpbXBseSBleHRlbmRpbmcgZHJtX2NmbHVzaF9wYWdlcyBmb3IKPiB0aG9zZSBhcm0gcGxh
dGZvcm1zIHdoZXJlIHdlIGRvIGhhdmUgYSBjbGZsdXNoIGluc3RydWN0aW9uPyBZZXMgSSBrbm93
Cj4gdGhhdCdsbCBnZXQgcGVvcGxlIHNjcmVhbWluZywgSSdsbCBzaHJ1ZyA6LSkKPgo+IElmIGFs
bCB3ZSBuZWVkIHBhdGNoIDEvMiBmb3IgaXMgdGhpcyB2Z2VtIHBhdGNoIHRoZW4gdGhlIGF1ZGl0
aW5nIG5lZWRlZCBmb3IKPiBwYXRjaCAxIGRvZXNuJ3QgbG9vayBhcHBlYWxpbmcgLi4uCgpJIHRo
aW5rIHdlIHNob3VsZCBnbyB3LyB0aGUgc2ltcGxlciBhcHByb2FjaCBpbiB0aGF0IGtlZXBzIFdD
IChidXQKa2luZGEgcmVsaWVzIG9uIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBvZiBkbWEtbWFw
cGluZywgaWUuCmRldi0+ZG1hX29wcz09TlVMTCA9PiBkbWFfZGlyZWN0CgpJTU8gdGhlIGZpcnN0
IHBhdGNoIGluIHRoaXMgc2VyaWVzIGlzIHByb2JhYmx5IGEgdGhpbmcgd2Ugc2hvdWxkIHRyeQp0
byBkbyBzb21laG93LCBpdCBpcyBhIGJpdCBydWRlIHRoYXQgY29yZSBoZWxwZXJzIGFyZSBmb3Jj
aW5nIFdDLiAgQnV0Cm5vdCBzdXJlIGFib3V0IGhvdyB0byBsYW5kIHRoYXQgc21vb3RobHkuICBQ
ZXJoYXBzIHNvbWV0aGluZyB3b3J0aAphZGRpbmcgdG8gdGhlIFRPRE8gbGlzdCBhdCBhbnkgcmF0
ZS4KCkJSLAotUgoKPiAtRGFuaWVsCj4KPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdl
bV9kcnYuYyB8IDcgKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Z2Vt
L3ZnZW1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCj4gPiBpbmRleCAx
MWE4Zjk5YmExOGMuLmNjZjBjM2ZiZDU4NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92Z2VtL3ZnZW1fZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2
LmMKPiA+IEBAIC0yNTksOSArMjU5LDYgQEAgc3RhdGljIGludCB2Z2VtX21tYXAoc3RydWN0IGZp
bGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4gICAgICAgaWYgKHJldCkK
PiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiAtICAgICAvKiBLZWVwIHRoZSBX
QyBtbWFwaW5nIHNldCBieSBkcm1fZ2VtX21tYXAoKSBidXQgb3VyIHBhZ2VzCj4gPiAtICAgICAg
KiBhcmUgb3JkaW5hcnkgYW5kIG5vdCBzcGVjaWFsLgo+ID4gLSAgICAgICovCj4gPiAgICAgICB2
bWEtPnZtX2ZsYWdzID0gZmxhZ3MgfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7Cj4gPiAg
ICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBAQCAtMzgyLDcgKzM3OSw3IEBAIHN0YXRpYyB2b2lk
ICp2Z2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4gPiAgICAgICBp
ZiAoSVNfRVJSKHBhZ2VzKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPgo+ID4g
LSAgICAgcmV0dXJuIHZtYXAocGFnZXMsIG5fcGFnZXMsIDAsIHBncHJvdF93cml0ZWNvbWJpbmUo
UEFHRV9LRVJORUwpKTsKPiA+ICsgICAgIHJldHVybiB2bWFwKHBhZ2VzLCBuX3BhZ2VzLCAwLCBQ
QUdFX0tFUk5FTCk7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCB2Z2VtX3ByaW1lX3Z1bm1h
cChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCj4gPiBAQCAtNDExLDcg
KzQwOCw3IEBAIHN0YXRpYyBpbnQgdmdlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLAo+ID4gICAgICAgZnB1dCh2bWEtPnZtX2ZpbGUpOwo+ID4gICAgICAgdm1hLT52bV9m
aWxlID0gZ2V0X2ZpbGUob2JqLT5maWxwKTsKPiA+ICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0gVk1f
RE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOwo+ID4gLSAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBw
Z3Byb3Rfd3JpdGVjb21iaW5lKHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncykpOwo+ID4g
KyAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3Mp
Owo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+IC0tCj4gPiAyLjIxLjAKPiA+Cj4K
PiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KPiBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
