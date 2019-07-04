Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97F5F95D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 15:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018EE6E34D;
	Thu,  4 Jul 2019 13:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AE56E34D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 13:51:41 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so5485142eds.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 06:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
 b=B5uGmWmORQj5n4qMnMNem/2yzGpJO+t2dB3pCENNUZmGpYlvynVKkNoFJ+zDAUReG/
 DvNQygIsy+JXS1QQhNAak8ML52owCy72HOpXpPTKHd9030kvGKTV+q4qHkqhLsOigM+V
 kAZy2zB4QnzHQBhuKaP+JzOFhNqMEZpYvXSiYGaMR8WhpYPi2A/9DBxtdHD89U+ITZq5
 Kl5HGBvuNP8bObjKekR9ofI4M4HTFLJRYdz/276oAs7UlySP7owlnWDl1DbZDqgPo3gg
 MAUDg2Uu0dJ2qtjuLfKf2vwVcborX+90tp5EfCHmEEfM8bEXZY6B4bKY5vCcnOPnagDU
 HtUw==
X-Gm-Message-State: APjAAAV5vSVkpO7nkPQ/pM7OIxc1UTk1md79TAWb7scznXbIxSffa+ZJ
 T1t818kW09ctvsFleYxftT0Q9Gi1VeXHV9uZ6ck=
X-Google-Smtp-Source: APXvYqy0BJY/7zHhJ8fIDLe2X+6WEGO81pJJSvAlHI679eDU3T2nzWxvLXnNB4Rdv1E6hpJcX38qgxrxWALFF2nDlLo=
X-Received: by 2002:a17:906:6802:: with SMTP id
 k2mr14814143ejr.174.1562248299953; 
 Thu, 04 Jul 2019 06:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-1-robdclark@gmail.com>
 <20190702202631.32148-2-robdclark@gmail.com>
 <20190704082001.GD6546@8bytes.org>
In-Reply-To: <20190704082001.GD6546@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jul 2019 06:51:23 -0700
Message-ID: <CAF6AEGtjMqoFprY+r6zwUxxpm9iFfN-n-uNad3w9vxOCcTrQJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu
 explicitly
To: Joerg Roedel <joro@8bytes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
 b=hmowFyFGkwXbEFC/kyfNcBrt9V9cHjiQIm+Z0EQg+YQlW5rfQRBhO6IWD/BOPARcU8
 ejkMVH9q8Bv/mYnS9q+JYZEaMW6sagrnojzOC/UCdqT3UYZIjmJv7Ok7r+uMy0DWvY2q
 G5LjM3qwC79ZEsjXxJ0NSXeUDTWElwdMq1sg4TDlJPFAn7vz9L3Kwr5DLPndWA2aCO4w
 IB/oKVx3QJxAdG6Tq411VPBtbkIiFTSiT3hkWex2/NgQhoJVAqWD0dH+LHbaf/Tbrcbx
 1M15JCpoSLDBP5ASs7mwSbbI91QiAFOyTYcOBf7okxvzYFcPQesKfXn0kM/zjR+Jzwwq
 DICw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCAxOjIwIEFNIEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMu
b3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIFR1ZSwgSnVsIDAyLCAyMDE5IGF0IDAxOjI2
OjE4UE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+IDEpIEluIHNvbWUgY2FzZXMgdGhlIGJv
b3Rsb2FkZXIgdGFrZXMgdGhlIGlvbW11IG91dCBvZiBieXBhc3MgYW5kCj4gPiAgICBlbmFibGVz
IHRoZSBkaXNwbGF5LiAgVGhpcyBpcyBpbiBwYXJ0aWN1bGFyIGEgcHJvYmxlbSBvbiB0aGUgYWFy
Y2g2NAo+ID4gICAgbGFwdG9wcyB0aGF0IGV4aXN0IHRoZXNlIGRheXMsIGFuZCBtb2Rlcm4gc25h
cGRyYWdvbiBhbmRyb2lkIGRldmljZXMuCj4gPiAgICAoT2xkZXIgZGV2aWNlcyBhbHNvIGVuYWJs
ZWQgdGhlIGRpc3BsYXkgaW4gYm9vdGxvYWRlciBidXQgZGlkIG5vdAo+ID4gICAgdGFrZSB0aGUg
aW9tbXUgb3V0IG9mIGJ5cGFzcy4pICBBdHRhY2hpbmcgYSBETUEgb3IgSURFTlRJVFkgZG9tYWlu
Cj4gPiAgICB3aGlsZSBzY2Fub3V0IGlzIGFjdGl2ZSwgYmVmb3JlIHRoZSBkcml2ZXIgaGFzIGEg
Y2hhbmNlIHRvIGludGVydmVuZSwKPiA+ICAgIG1ha2VzIHRoaW5ncyBnbyAqYm9vbSoKPgo+IEp1
c3QgdG8gbWFrZSBzdXJlIEkgZ2V0IHRoaXMgcmlnaHQ6IFRoZSBib290bG9hZGVyIGluaWFsaXpl
cyB0aGUgU01NVQo+IGFuZCBjcmVhdGVzIG5vbi1pZGVudGl0eSBtYXBwaW5ncyBmb3IgdGhlIEdQ
VT8gQW5kIHdoZW4gdGhlIFNNTVUgZHJpdmVyCj4gaW4gTGludXggdGFrZXMgb3ZlciB0aGlzIGJy
ZWFrcyBkaXNwbGF5IG91dHB1dC4KCmNvcnJlY3QKCj4gPiArICAgICAvKgo+ID4gKyAgICAgICog
SWYgZHJpdmVyIGlzIGdvaW5nIHRvIG1hbmFnZSBpb21tdSBkaXJlY3RseSwgdGhlbiBhdm9pZAo+
ID4gKyAgICAgICogYXR0YWNoaW5nIGFueSBub24gZHJpdmVyIG1hbmFnZWQgZG9tYWluLiAgVGhl
cmUgY291bGQKPiA+ICsgICAgICAqIGJlIGFscmVhZHkgYWN0aXZlIGRtYSB1bmRlcndheSAoaWUu
IHNjYW5vdXQgaW4gY2FzZSBvZgo+ID4gKyAgICAgICogYm9vdGxvYWRlciBlbmFibGVkIGRpc3Bs
YXkpLCBhbmQgaW50ZXJmZXJpbmcgd2l0aCB0aGF0Cj4gPiArICAgICAgKiB3aWxsIG1ha2UgdGhp
bmdzIGdvICpib29tKgo+ID4gKyAgICAgICovCj4gPiArICAgICBpZiAoKGRvbWFpbi0+dHlwZSAh
PSBJT01NVV9ET01BSU5fVU5NQU5BR0VEKSAmJgo+ID4gKyAgICAgICAgIGRldi0+ZHJpdmVyICYm
IGRldi0+ZHJpdmVyLT5kcml2ZXJfbWFuYWdlc19pb21tdSkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gPiArCj4KPiBXaGVuIHRoZSBkZWZhdWx0IGRvbWFpbiBpcyBhdHRhY2hlZCwgdGhl
cmUgaXMgdXN1YWxseSBubyBkcml2ZXIgYXR0YWNoZWQKPiB5ZXQuIEkgdGhpbmsgdGhpcyBuZWVk
cyB0byBiZSBjb21tdW5pY2F0ZWQgYnkgdGhlIGZpcm13YXJlIHRvIExpbnV4IGFuZAo+IHRoZSBj
b2RlIHNob3VsZCBjaGVjayBhZ2FpbnN0IHRoYXQuCgpBdCBsZWFzdCBmb3IgdGhlIE9GIGNhc2Us
IGl0IGhhcHBlbnMgaW4gdGhlIG9mX2RtYV9jb25maWd1cmUoKSB3aGljaApoYXBwZW5zIGZyb20g
cmVhbGx5X3Byb2JlKCksIHNvIHRoZXJlIGlzIG5vcm1hbGx5IGEgZHJpdmVyLiAgVGhlcmUgYXJl
CmEgZmV3IGV4Y2VwdGlvbmFsIGNhc2VzLCB3aGVyZSBkcml2ZXJzIGNhbGwgb2ZfZG1hX2NvbmZp
Z3VyZSgpIG9uCnRoZWlyIG93biBzdWItZGV2aWNlIHdpdGhvdXQgYSBkcml2ZXIgYXR0YWNoZWQg
KGhlbmNlIHRoZSBuZWVkIHRvCmNoZWNrIGlmIGRldi0+ZHJpdmVyIGlzIE5VTEwpLgoKSSdtIGFs
c28gaW50ZXJlc3RlZCBpbiB0aGUgQUNQSSBjYXNlIGV2ZW50dWFsbHkuLi4gdGhlIGFhcmNoNjQK
IndpbmRvd3MiIGxhcHRvcHMgZG8gaGF2ZSBBQ1BJLiAgQnV0IGZvciBub3cgd2UgYXJlIGJvb3Rp
bmcgd2l0aCBEVApzaW5jZSB0aGVyZSBpcyBxdWl0ZSBhIGxvdCBvZiB3b3JrIGJlZm9yZSB3ZSBn
ZXQgdG8gcG9pbnQgb2YgdXNpbmcKQUNQSS4gIChJbiBwYXJ0aWN1bGFyLCB1bmRlciB3aW5kb3dz
LCBkZXZpY2UgcG93ZXIgbWFuYWdlbWVudCBpcyBkb25lCnRocnUgYSBQbGF0Zm9ybSBFeHRlbnNp
b24gIFBsdWdpbiAoUEVQKSwgYnV0IHNvIGZhciBsaW51eCBoYXMgbm8gc3VjaAptZWNoYW5pc20u
KQoKV2UgcmVhbGx5IGRvbid0IGhhdmUgY29udHJvbCBvZiB0aGUgZmlybXdhcmUuICBCdXQgd2hl
biBhcm0tc21tdSBpcwpwcm9iZWQgaXQgY2FuIHJlYWQgYmFjayB0aGUgaHcgc3RhdGUgYW5kIGZp
Z3VyZSBvdXQgd2hhdCBpcyBnb2luZyBvbgood2l0aCBhbiBSRkMgc2VyaWVzWzFdIGZyb20gQmpv
cm4gd2hpY2ggd2FzIHBvc3RlZCBlYXJsaWVyKSwgc28gd2UKZG9uJ3QgcmVhbGx5IG5lZWQgdG8g
ZGVwZW5kIG9uIHRoZSBmaXJtd2FyZS4KCj4gPiAtICAgICBib29sIHN1cHByZXNzX2JpbmRfYXR0
cnM7ICAgICAgIC8qIGRpc2FibGVzIGJpbmQvdW5iaW5kIHZpYSBzeXNmcyAqLwo+ID4gKyAgICAg
Ym9vbCBzdXBwcmVzc19iaW5kX2F0dHJzOjE7ICAgICAvKiBkaXNhYmxlcyBiaW5kL3VuYmluZCB2
aWEgc3lzZnMgKi8KPiA+ICsgICAgIGJvb2wgZHJpdmVyX21hbmFnZXNfaW9tbXU6MTsgICAgLyog
ZHJpdmVyIG1hbmFnZXMgSU9NTVUgZXhwbGljaXRseSAqLwo+Cj4gSG93IGRvZXMgdGhpcyBmaWVs
ZCBnZXQgc2V0PwoKCkl0IGlzIHNldCBpbiB0aGUgZHJpdmVyIGluIHRoZSBzZWNvbmQgcGF0Y2hb
Ml0gaW4gdGhpcyBzZXJpZXMuCgpCUiwKLVIKClsxXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9hcm0ta2VybmVsL21zZzczMjI0Ni5odG1sClsyXSBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvMzE1MjkxLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
