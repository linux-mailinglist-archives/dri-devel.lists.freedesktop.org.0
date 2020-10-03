Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDAE282350
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FE56E3D3;
	Sat,  3 Oct 2020 09:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ED46E3D0
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 09:46:03 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m13so3840765otl.9
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Oct 2020 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WmsHZ3xTqss6S86de6F2+GmRY4pwh6QmzDJN/bVYlUo=;
 b=hDibXoHAY2NY8DYQlETzpK27wX4ATsoMa5kzy1M2/palInn8ZKnTsfX9OAvCBMHLJ7
 UTXJhzhKn4fSMh0ypNeHIZ7V603V9nGrHtFMY58a+YAo7uy+FISml44C4EG7POAXsSK5
 tta54lMbGSCYR/621NNEVOBJzs4fvGGa04aCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WmsHZ3xTqss6S86de6F2+GmRY4pwh6QmzDJN/bVYlUo=;
 b=nWGYDdpnMwYak8prRRL541+kONhTFCiWbbtr59CZfBVPfs7yGl7kRZSsMjvy00tHrV
 juqIHyue+v2qRHTQ/yDGz+0hYb5H3QgLaRqWLqPFqmY/M1njlEZxcVcLVmoTY3gxE1Bv
 9X0Lptyey1LmU213U1o1MRLy0N2tWeJQBMgX/A83hCentfIljfsghGX67ogMYNqr/l/q
 +TN/r9ypdbFt6m48ltgRDC1quVNzzFJA28M+DDPPYVMH3aQBt7xinDp+64XHUsp0hyBS
 YsmttAomSF2WMbm/ySDLiqwRisy9+ADMwS+t25mQh/dUyFJjMK5O1UbBGsyqLyoH2Qg6
 U6+g==
X-Gm-Message-State: AOAM5329rs1kR9B94xMpPnE0tQpUHAnc377qpRDyR8wW2ryIAxGxTst9
 U0mBLb28pk3EQYT/eXBwU51fAv7/G6O9EZX+Ysa8nQ==
X-Google-Smtp-Source: ABdhPJx7DZsiJzsUZCobrpWxpW+51JFbUQoJiBR48TvpUyFl0hMBEePfLwnrqOzsuokwHF8YWn4ObJWhXDnnLDo1YzY=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr5004991otf.281.1601718362705; 
 Sat, 03 Oct 2020 02:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
In-Reply-To: <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 3 Oct 2020 11:45:51 +0200
Message-ID: <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMywgMjAyMCBhdCAxMjozOSBBTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMTAvMi8yMCAxMDo1MyBBTSwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+IEZvciAkcmVhc29ucyBJJ3ZlIHN0dW1ibGVkIG92ZXIgdGhpcyBjb2RlIGFuZCBJ
J20gbm90IHN1cmUgdGhlIGNoYW5nZQo+ID4gdG8gdGhlIG5ldyBndXAgZnVuY3Rpb25zIGluIDU1
YTY1MGMzNWZlYSAoIm1tL2d1cDogZnJhbWVfdmVjdG9yOgo+ID4gY29udmVydCBnZXRfdXNlcl9w
YWdlcygpIC0tPiBwaW5fdXNlcl9wYWdlcygpIikgd2FzIGVudGlyZWx5IGNvcnJlY3QuCj4gPgo+
ID4gVGhpcyBoZXJlIGlzIHVzZWQgZm9yIGxvbmcgdGVybSBidWZmZXJzIChub3QganVzdCBxdWlj
ayBJL08pIGxpa2UKPiA+IFJETUEsIGFuZCBKb2huIG5vdGVzIHRoaXMgaW4gaGlzIHBhdGNoLiBC
dXQgSSB0aG91Z2h0IHRoZSBydWxlIGZvcgo+ID4gdGhlc2UgaXMgdGhhdCB0aGV5IG5lZWQgdG8g
YWRkIEZPTExfTE9OR1RFUk0sIHdoaWNoIEpvaG4ncyBwYXRjaAo+ID4gZGlkbid0IGRvLgo+Cj4g
WWVwLiBUaGUgZWFybGllciBndXAgLS0+IHB1cCBjb252ZXJzaW9uIHBhdGNoZXMgd2VyZSBpbnRl
bmRlZCB0byBub3QKPiBoYXZlIGFueSBub3RpY2VhYmxlIGJlaGF2aW9yIGNoYW5nZXMsIGFuZCBG
T0xMX0xPTkdURVJNLCB3aXRoIGl0J3MKPiBzcGVjaWFsIGNhc2VzIGFuZCBzdWNoLCBhZGRlZCBz
b21lIHJpc2sgdGhhdCBJIHdhc24ndCByZWFkeSB0byB0YWtlCj4gb24geWV0LiBBbHNvLCBGT0xM
X0xPTkdURVJNIHJ1bGVzIGFyZSBvbmx5ICpyZWNlbnRseSogZ2V0dGluZyBmaXJtZWQKPiB1cC4g
U28gdGhlcmUgd2FzIHNvbWUgZG91YnQgYXQgbGVhc3QgaW4gbXkgbWluZCwgYWJvdXQgd2hpY2gg
c2l0ZXMKPiBzaG91bGQgaGF2ZSBpdC4KPgo+IEJ1dCBub3cgdGhhdCB3ZSdyZSBoZXJlLCBJIHRo
aW5rIGl0J3MgcmVhbGx5IGdvb2QgdGhhdCB5b3UndmUgYnJvdWdodAo+IHRoaXMgdXAuIEl0J3Mg
ZGVmaW5pdGVseSB0aW1lIHRvIGFkZCBGT0xMX0xPTkdURVJNIHdoZXJldmVyIGl0J3MgbWlzc2lu
Zy4KClNvIHNob3VsZCBJIGtlZXAgdGhpcyBwYXRjaCwgb3Igd2lsbCBpdCBjb2xsaWRlIHdpdGgg
YSBzZXJpZXMgeW91J3JlIHdvcmtpbmcgb24/CgpBbHNvIHdpdGggdGhlIGZpcm1lZCB1cCBydWxl
cywgY29ycmVjdCB0aGF0IEkgY2FuIGFsc28gZHJvcCB0aGUKdm1hX2lzX2ZzZGF4IGNoZWNrIHdo
ZW4gdGhlIEZPTExfTE9OR1RFUk0gZmxhZyBpcyBzZXQ/CgpUaGFua3MsIERhbmllbAoKPgo+IHRo
YW5rcywKPiAtLQo+IEpvaG4gSHViYmFyZAo+IE5WSURJQQo+Cj4gPgo+ID4gVGhlcmUgaXMgYWxy
ZWFkeSBhIGRheCBzcGVjaWZpYyBjaGVjayAoYWRkZWQgaW4gYjdmMDU1NGE1NmYyICgibW06Cj4g
PiBmYWlsIGdldF92YWRkcl9mcmFtZXMoKSBmb3IgZmlsZXN5c3RlbS1kYXggbWFwcGluZ3MiKSks
IHNvIHRoaXMgc2VlbXMKPiA+IGxpa2UgdGhlIHBydWRlbnQgdGhpbmcgdG8gZG8uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4g
PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gPiBDYzogSsOpcsO0bWUgR2xpc3Nl
IDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+
IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiA+IENjOiBsaW51
eC1tbUBrdmFjay5vcmcKPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiA+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4gSGkgYWxsLAo+ID4KPiA+IEkgc3R1
bWJsZWQgb3ZlciB0aGlzIGFuZCBmaWd1cmVkIHR5cGluZyB0aGlzIHBhdGNoIGNhbid0IGh1cnQu
IFJlYWxseQo+ID4ganVzdCB0byBtYXliZSBsZWFybiBhIGZldyB0aGluZ3MgYWJvdXQgaG93IGd1
cC9wdXAgaXMgc3VwcG9zZWQgdG8gYmUKPiA+IHVzZWQgKHdlIGhhdmUgYSBiaXQgb2YgdGhhdCBp
biBkcml2ZXJzL2dwdSksIHRoaXMgaGVyZSBpc24ndCByZWFsbHkKPiA+IHJhbGF0ZWQgdG8gYW55
dGhpbmcgSSdtIGRvaW5nLgo+ID4KPiA+IEknbSBhbHNvIHdvbmRlcmluZyB3aGV0aGVyIHRoZSBl
eHBsaWNpdCBkYXggY2hlY2sgc2hvdWxkIGJlIHJlbW92ZWQsCj4gPiBzaW5jZSBGT0xMX0xPTkdU
RVJNIHNob3VsZCB0YWtlIGNhcmUgb2YgdGhhdCBhbHJlYWR5Lgo+ID4gLURhbmllbAo+ID4gLS0t
Cj4gPiAgIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vZnJhbWVf
dmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwo+ID4gaW5kZXggNWQzNGM5MDQ3ZTljLi4zNTA3
ZTA5Y2IzZmYgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9mcmFtZV92ZWN0b3IuYwo+ID4gKysrIGIvbW0v
ZnJhbWVfdmVjdG9yLmMKPiA+IEBAIC0zNSw3ICszNSw3IEBAIGludCBnZXRfdmFkZHJfZnJhbWVz
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCj4gPiAgIHsKPiA+
ICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gPiAgICAgICBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiA+IC0gICAgIHVuc2lnbmVkIGludCBndXBfZmxhZ3Mg
PSBGT0xMX1dSSVRFIHwgRk9MTF9GT1JDRTsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBndXBfZmxh
Z3MgPSBGT0xMX1dSSVRFIHwgRk9MTF9GT1JDRSB8IEZPTExfTE9OR1RFUk07Cj4gPiAgICAgICBp
bnQgcmV0ID0gMDsKPiA+ICAgICAgIGludCBlcnI7Cj4gPiAgICAgICBpbnQgbG9ja2VkOwo+ID4K
PgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
