Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A7318DB7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F1A6EE46;
	Thu, 11 Feb 2021 14:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79396EE4D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:56:43 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id s107so5346950otb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 06:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RmVDQyx+Ndcv5SeblotXpQRe27Egv2RqGDvlo6R5U8w=;
 b=E2yi8Dzo7qq3E3/flljC3xH7tiHdegmynb0SA7JlYIz5EM1sj6y32R7tM/aX9DYRic
 K+hqQA0/ECrgtm5QdSQmTLpcu8HZWUSLZuquZhonvDmxHXsor2V3Ekd730+4qyLBylcH
 5EHSAuBOoS1VnBHeezqtR3TIZEBKmUAZXQNaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RmVDQyx+Ndcv5SeblotXpQRe27Egv2RqGDvlo6R5U8w=;
 b=fviiiT8VK67jfeiegSE3ckriODMO5NpbfQKoJI+FOkQVYoyJ5ZwPOkgPteeEpcwnS+
 MDY6Em0QACLxL5L9a8g0H6peBqSvjPh6uoGKJbd90YBqj81UwS9Ym1RxAyBQiAd2/2G+
 nPq12uom4Qtl5vjnq5QvcZWD4BYdJ5i0wIgomurZ75z+AXMQtELJjb21A5e1aUQPcLZl
 DsID1oPYxdp1SZV8dfHsIFMxXcoZNo2T0eEMPXT/dPNwD7cXfzL3ZtuiL3UgMMLfS5mF
 hY9QNEQGjbz1JSDoyHvIBMotFqjSxr7Mx9NhTxChor5WbLHo7rMx+6JQ43911YONF7l3
 VrEg==
X-Gm-Message-State: AOAM531Cr8HFWxe0gMXsXeov4GFcIVnj68tnWmrOAI37/h+aM4upfGIt
 +n2zh02Ohe0jMDcO0e4rkYu7qSrXeV5v4NB9e75wzw==
X-Google-Smtp-Source: ABdhPJw3fjkRP9gLP7q/RDjMJ5TKsouRdxxZLHu0I2VLcTiQg1aD1zxxpNTCk8c6mMpxWvFuDBl3KNzaOyf4zVs07lM=
X-Received: by 2002:a9d:2270:: with SMTP id o103mr5794245ota.303.1613055403311; 
 Thu, 11 Feb 2021 06:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
 <20210210214053.GA610964@bjorn-Precision-5520>
In-Reply-To: <20210210214053.GA610964@bjorn-Precision-5520>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 11 Feb 2021 15:56:30 +0100
Message-ID: <CAKMK7uHi3Uvze3epTPC4613UzbT24LSO2GP8EkU8nxaKxOQBSA@mail.gmail.com>
Subject: Re: [PATCH] PCI: Also set up legacy files only after sysfs init
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgMTA6NDAgUE0gQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDA1LCAyMDIxIGF0IDAyOjM2OjMyUE0g
KzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBXZSBhcmUgYWxyZWFkeSBkb2luZyB0aGlz
IGZvciBhbGwgdGhlIHJlZ3VsYXIgc3lzZnMgZmlsZXMgb24gUENJCj4gPiBkZXZpY2VzLCBidXQg
bm90IHlldCBvbiB0aGUgbGVnYWN5IGlvIGZpbGVzIG9uIHRoZSBQQ0kgYnVzZXMuIFRodXMgZmFy
Cj4gPiBubyBwcm9ibGVtLCBidXQgaW4gdGhlIG5leHQgcGF0Y2ggSSB3YW50IHRvIHdpcmUgdXAg
aW9tZW0gcmV2b2tlCj4gPiBzdXBwb3J0LiBUaGF0IG5lZWRzIHRoZSB2ZnMgdXAgYW5kIHJ1bm5p
bmcgYWxyZWFkeSB0byBtYWtlIHN1cmUgdGhhdAo+ID4gaW9tZW1fZ2V0X21hcHBpbmcoKSB3b3Jr
cy4KPiA+Cj4gPiBXaXJlIGl0IHVwIGV4YWN0bHkgbGlrZSB0aGUgZXhpc3RpbmcgY29kZSBpbgo+
ID4gcGNpX2NyZWF0ZV9zeXNmc19kZXZfZmlsZXMoKS4gTm90ZSB0aGF0IHBjaV9yZW1vdmVfbGVn
YWN5X2ZpbGVzKCkKPiA+IGRvZXNuJ3QgbmVlZCBhIGNoZWNrIHNpbmNlIHRoZSBvbmUgZm9yIHBj
aV9idXMtPmxlZ2FjeV9pbyBpcwo+ID4gc3VmZmljaWVudC4KPiA+Cj4gPiBBbiBhbHRlcm5hdGl2
ZSBzb2x1dGlvbiB3b3VsZCBiZSB0byBpbXBsZW1lbnQgYSBjYWxsYmFjayBpbiBzeXNmcyB0bwo+
ID4gc2V0IHVwIHRoZSBhZGRyZXNzIHNwYWNlIGZyb20gaW9tZW1fZ2V0X21hcHBpbmcoKSB3aGVu
IHVzZXJzcGFjZSBjYWxscwo+ID4gbW1hcCgpLiBUaGlzIGFsc28gd29ya3MsIGJ1dCBHcmVnIGRp
ZG4ndCByZWFsbHkgbGlrZSB0aGF0IGp1c3QgdG8gd29yawo+ID4gYXJvdW5kIGFuIG9yZGVyaW5n
IGlzc3VlIHdoZW4gdGhlIGtlcm5lbCBsb2FkcyBpbml0aWFsbHkuCj4gPgo+ID4gdjI6IEltcHJv
dmUgY29tbWl0IG1lc3NhZ2UgKEJqb3JuKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Cj4gQWNrZWQtYnk6IEJqb3JuIEhlbGdh
YXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4KPiBJIHdpc2ggd2Ugd2VyZW4ndCBleHRlbmRpbmcg
YSBrbm93bi1yYWN5IG1lY2hhbmlzbSB0byBkbyB0aGlzLCBidXQgYXQKPiBsZWFzdCB3ZSdyZSBu
b3QgKmFkZGluZyogYSBicmFuZCBuZXcgcmFjZS4KClllYWggaXQncyBub3QgZ3JlYXQuIFRoYW5r
cyBmb3IgbG9va2luZyBhdCBib3RoIGFnYWluLCBJJ2xsIGZpeCB1cCB0aGUKdHlwb3Mgb24gdGhl
IDJuZCBvbmUgYW5kIG1lcmdlIHRoZW0gYm90aC4KCkNoZWVycywgRGFuaWVsCgo+Cj4gPiBDYzog
U3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gPiBDYzogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+Cj4gPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4g
PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gPiBDYzogSsOpcsO0bWUgR2xpc3Nl
IDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+
IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiA+IENjOiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gQ2M6IGxpbnV4
LW1tQGt2YWNrLm9yZwo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdv
b2dsZS5jb20+Cj4gPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9wY2kvcGNpLXN5c2ZzLmMgfCA3ICsrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaS1zeXNm
cy5jIGIvZHJpdmVycy9wY2kvcGNpLXN5c2ZzLmMKPiA+IGluZGV4IGZiMDcyZjRiMzE3Ni4uMGM0
NWI0ZjdiMjE0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wY2kvcGNpLXN5c2ZzLmMKPiA+ICsr
KyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jCj4gPiBAQCAtOTI3LDYgKzkyNyw5IEBAIHZvaWQg
cGNpX2NyZWF0ZV9sZWdhY3lfZmlsZXMoc3RydWN0IHBjaV9idXMgKmIpCj4gPiAgewo+ID4gICAg
ICAgaW50IGVycm9yOwo+ID4KPiA+ICsgICAgIGlmICghc3lzZnNfaW5pdGlhbGl6ZWQpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICAgICAgIGItPmxlZ2FjeV9pbyA9IGtjYWxs
b2MoMiwgc2l6ZW9mKHN0cnVjdCBiaW5fYXR0cmlidXRlKSwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgR0ZQX0FUT01JQyk7Cj4gPiAgICAgICBpZiAoIWItPmxlZ2FjeV9pbykKPiA+
IEBAIC0xNDQ4LDYgKzE0NTEsNyBAQCB2b2lkIHBjaV9yZW1vdmVfc3lzZnNfZGV2X2ZpbGVzKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IHBjaV9zeXNmc19pbml0
KHZvaWQpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBOVUxMOwo+ID4g
KyAgICAgc3RydWN0IHBjaV9idXMgKnBidXMgPSBOVUxMOwo+ID4gICAgICAgaW50IHJldHZhbDsK
PiA+Cj4gPiAgICAgICBzeXNmc19pbml0aWFsaXplZCA9IDE7Cj4gPiBAQCAtMTQ1OSw2ICsxNDYz
LDkgQEAgc3RhdGljIGludCBfX2luaXQgcGNpX3N5c2ZzX2luaXQodm9pZCkKPiA+ICAgICAgICAg
ICAgICAgfQo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIHdoaWxlICgocGJ1cyA9IHBjaV9maW5k
X25leHRfYnVzKHBidXMpKSkKPiA+ICsgICAgICAgICAgICAgcGNpX2NyZWF0ZV9sZWdhY3lfZmls
ZXMocGJ1cyk7Cj4gPiArCj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAgbGF0ZV9pbml0
Y2FsbChwY2lfc3lzZnNfaW5pdCk7Cj4gPiAtLQo+ID4gMi4zMC4wCj4gPgo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
