Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D34C2DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E46E46D;
	Wed, 19 Jun 2019 21:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2637F6E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:20:38 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w79so456161oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bI9P9AKaggByB2J+3Bzt1bHMyBdbzhZul43br86InHM=;
 b=Z5UCgbgGBmR0fbEPLE4ht4XU/sXz9dZPYHMkgksCY80YygEVm64jg7u0AuR4AkirF/
 ltXLA/AojERP3kpXk4c96JuTKxNE8Uqmq/UY8FbxQPpGiY3qnxghJXxekEkoh1MxC7EH
 uMWjCTNflenAREcC14AYYE1tUbDOI7JvIiS+fZP/X3OZl1kqexKWu+0njXT//BZJx/Xm
 cEwTqSerDrPjbkNl/6bnvMV1p1sxOhiUDe8BOyZrZtc3aCLwNPehEe4GMCL48KB+JlMM
 LUisl/jbafcXy96BVJ+FcsnePy0+CxHhjXZ7MdFc+aWMPCU8wSTng8cFFtQ+uUn0tkan
 /H3Q==
X-Gm-Message-State: APjAAAVfS/eOBICK3XxKKxqvSrgDgiTwAnSccSuM8C3jI3OtWfswVP4Q
 rqNd5ghAAT1GW3OA7s6PP4Vq9ifWVsAyNfAAsJ+0eQ==
X-Google-Smtp-Source: APXvYqx/TLTpB9wGr9JZtdZ6RHY2xIrpHVS+clHcKNaPFf5G0BlbrC2hAFkgq7x4pUPG8gx88sa6UIhdMVbNbLa5tDI=
X-Received: by 2002:a05:6808:118:: with SMTP id
 b24mr3757147oie.128.1560979237149; 
 Wed, 19 Jun 2019 14:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com> <20190618152215.GG12905@phenom.ffwll.local>
 <20190619165055.GI9360@ziepe.ca>
 <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
 <20190619201340.GL9360@ziepe.ca>
 <CAKMK7uGtXT1qLdUqnmTd9uUkdMrcreg4UmAxscx0Fp4Pv6uj_A@mail.gmail.com>
 <20190619204243.GM9360@ziepe.ca>
In-Reply-To: <20190619204243.GM9360@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Jun 2019 23:20:23 +0200
Message-ID: <CAKMK7uEJu4+gDLGDabxeDpArgXEGQ0B+9Z_SUM2zTB4QsnTB+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bI9P9AKaggByB2J+3Bzt1bHMyBdbzhZul43br86InHM=;
 b=Tz3wIEMJQ6KUu24p8kJGpTzmA6Co/vmiIUI3dfmnw92cqIil2cOfv4n0isjZeDFBj/
 N2DwUQt3F8qi0Lq/xtl6BMeVRiOStswnCRJNxGBm9I3jcsl0Vin08++XC8/kTEXa8Rb4
 gdhuT8fnTwj/ll0yWjskwxZDpP7xdYe59hvjI=
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6NDIgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6MTg6NDNQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEwOjEz
IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4gT24gV2VkLCBK
dW4gMTksIDIwMTkgYXQgMDk6NTc6MTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
ID4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA2OjUwIFBNIEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDA1OjIy
OjE1UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgTWF5
IDIxLCAyMDE5IGF0IDExOjQ0OjExQU0gLTA0MDAsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDJQTSArMDIwMCwgRGFuaWVs
IFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IEp1c3QgYSBiaXQgb2YgcGFyYW5vaWEsIHNp
bmNlIGlmIHdlIHN0YXJ0IHB1c2hpbmcgdGhpcyBkZWVwIGludG8KPiA+ID4gPiA+ID4gPiA+IGNh
bGxjaGFpbnMgaXQncyBoYXJkIHRvIHNwb3QgYWxsIHBsYWNlcyB3aGVyZSBhbiBtbXUgbm90aWZp
ZXIKPiA+ID4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5v
dCBhbGxvd2VkIHRvLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEluc3BpcmVkIGJ5
IHNvbWUgY29uZnVzaW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQK
PiA+ID4gPiA+ID4gPiA+IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBuZXdseS1pbnRyb2R1Y2Vk
IHJldHVybiB2YWx1ZSB0byBoYW5kbGUgc29tZQo+ID4gPiA+ID4gPiA+ID4gY29ybmVyIGNhc2Vz
LiBVbnRpbCB3ZSByZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+
ID4gPiA+ID4gPiA+ID4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVyLgo+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJl
IHRvIHNwbGl0IHRoZSBjYWxsYmFjayBpbnRvIHR3bwo+ID4gPiA+ID4gPiA+ID4gdmVyc2lvbnMs
IG9uZSB3aXRoIHRoZSBpbnQgcmV0dXJuIHZhbHVlLCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZAo+
ID4gPiA+ID4gPiA+ID4gcmV0dXJuIHZhbHVlIGxpa2UgaW4gb2xkZXIga2VybmVscy4gQnV0IHRo
YXQncyBhIGxvdCBtb3JlIGNodXJuIGZvcgo+ID4gPiA+ID4gPiA+ID4gZmFpcmx5IGxpdHRsZSBn
YWluIEkgdGhpbmsuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gU3VtbWFyeSBmcm9t
IHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2FybmluZwo+
ID4gPiA+ID4gPiA+ID4gbGV2ZWw6IFRoaXMgYWxsb3dzIGF1dG9tYXRlZCB0b29saW5nIGluIENJ
IHRvIGNhdGNoIGJ1Z3Mgd2l0aG91dAo+ID4gPiA+ID4gPiA+ID4gaHVtYW5zIGhhdmluZyB0byBs
b29rIGF0IGV2ZXJ5dGhpbmcuIElmIHdlIGp1c3QgdXBncmFkZSB0aGUgZXhpc3RpbmcKPiA+ID4g
PiA+ID4gPiA+IHByX2luZm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9z
aXRpdmVzLiBBbmQgYXMtaXMsIG5vCj4gPiA+ID4gPiA+ID4gPiBvbmUgd2lsbCBldmVyIHNwb3Qg
dGhlIHByb2JsZW0gc2luY2UgaXQncyBsb3N0IGluIHRoZSBtYXNzaXZlIGFtb3VudHMKPiA+ID4g
PiA+ID4gPiA+IG9mIG92ZXJhbGwgZG1lc2cgbm9pc2UuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gdjI6IERyb3AgdGhlIGZ1bGwgV0FSTl9PTiBiYWNrdHJhY2UgaW4gZmF2b3VyIG9m
IGp1c3QgYSBwcl93YXJuIGZvcgo+ID4gPiA+ID4gPiA+ID4gdGhlIHByb2JsZW1hdGljIGNhc2Ug
KE1pY2hhbCBIb2NrbykuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBkaXNhZ3JlZSB3aXRoIHRoaXMg
djIgbm90ZSwgdGhlIFdBUk5fT04vV0FSTiB3aWxsIHRyaWdnZXIgY2hlY2tlcnMKPiA+ID4gPiA+
IGxpa2Ugc3l6a2FsbGVyIHRvIHJlcG9ydCBhIGJ1Zywgd2hpbGUgYSByYW5kb20gcHJfd2FybiBw
cm9iYWJseSB3aWxsCj4gPiA+ID4gPiBub3QuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBkbyBhZ3Jl
ZSB0aGUgYmFja3RyYWNlIGlzIG5vdCB1c2VmdWwgaGVyZSwgYnV0IHdlIGRvbid0IGhhdmUgYQo+
ID4gPiA+ID4gd2Fybi1uby1iYWNrdHJhY2UgdmVyc2lvbi4uCj4gPiA+ID4gPgo+ID4gPiA+ID4g
SU1ITywga2VybmVsL2RyaXZlciBidWdzIHNob3VsZCBhbHdheXMgYmUgcmVwb3J0ZWQgYnkgV0FS
TiAmCj4gPiA+ID4gPiBmcmllbmRzLiBXZSBuZXZlciBleHBlY3QgdG8gc2VlIHRoZSBwcmludCwg
c28gd2h5IGRvIHdlIGNhcmUgaG93IGJpZwo+ID4gPiA+ID4gaXQgaXM/Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQWxzbyBub3RlIHRoYXQgV0FSTiBpbnRlZ3JhdGVzIGFuIHVubGlrZWx5KCkgaW50byBp
dCBzbyB0aGUgY29kZWdlbiBpcwo+ID4gPiA+ID4gYXV0b21hdGljYWxseSBhIGJpdCBtb3JlIG9w
dGltYWwgdGhhdCB0aGUgaWYgJiBwcl93YXJuIGNvbWJpbmF0aW9uLgo+ID4gPiA+Cj4gPiA+ID4g
V2hlcmUgZG8geW91IG1ha2UgYSBkaWZmZXJlbmNlIGJldHdlZW4gYSBXQVJOIHdpdGhvdXQgYmFj
a3RyYWNlIGFuZCBhCj4gPiA+ID4gcHJfd2Fybj8gVGhleSdyZSBib3RoIGR1bXBlZCBhdCB0aGUg
c2FtZSBsb2ctbGV2ZWwgLi4uCj4gPiA+Cj4gPiA+IFdBUk4gcGFuaWNzIHRoZSBrZXJuZWwgd2hl
biB5b3Ugc2V0Cj4gPiA+Cj4gPiA+IC9wcm9jL3N5cy9rZXJuZWwvcGFuaWNfb25fd2Fybgo+ID4g
Pgo+ID4gPiBTbyBhdXRvIHRlc3RpbmcgdG9vbHMgY2FuIHNldCB0aGF0IGFuZCBnZXQgYSBjbGVh
biBkZXRlY3Rpb24gdGhhdCB0aGUKPiA+ID4ga2VybmVsIGhhcyBmYWlsZWQgdGhlIHRlc3QgaW4g
c29tZSB3YXkuCj4gPiA+Cj4gPiA+IE90aGVyd2lzZSB5b3UgYXJlIGxlZnQgd2l0aCBmcmFpbC91
Z2x5IGdyZXBwaW5nIG9mIGRtZXNnLgo+ID4KPiA+IEhtIHJpZ2h0Lgo+ID4KPiA+IEFueXdheSwg
SSdtIGhhcHB5IHRvIHJlcGFpbnQgdGhlIGJpa2VzaGVkIGluIGFueSBjb2xvciB0aGF0J3MgZGVz
aXJlZCwKPiA+IGlmIHRoYXQgaGVscHMgd2l0aCBsYW5kaW5nIGl0LiBXQVJOX1dJVEhPVVRfQkFD
S1RSQUNFIG1pZ2h0IHRha2UgYSBiaXQKPiA+IGxvbmdlciAobmVlZCB0byBmaW5kIGEgYml0IG9m
IHRpbWUsIHBsdXMgaXQnbGwgZGVmaW5pdGVseSBhdHRyYWN0IG1vcmUKPiA+IGNvbW1lbnRzKS4K
Pgo+IEkgd2FzIGFjdHVhbGx5IGp1c3Qgd3JpdGluZyBzb21ldGhpbmcgdmVyeSBzaW1pbGFyIHdo
ZW4gbG9va2luZyBhdCB0aGUKPiBobW0gdGhpbmdzLi4KPgo+IEFsc28sIGlzIHRoZSB0ZXN0IGJh
Y2t3YXJkcz8KClllcywgaW4gdGhlIGxhc3QgcmViYXNlIEkgc2NyZXdlZCB0aGluZ3MgdXAgOi0v
Ci1EYW5pZWwKCj4gbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZSgpID09IHRydWUgbWVhbnMg
dGhlIGNhbGxiYWNrIG11c3QgcmV0dXJuCj4gemVybwo+Cj4gbW11X25vdGlmaWZlcl9yYW5nZV9i
bG9ja2FibGUoKSA9PSBmYWxzZSBtZWFucyB0aGUgY2FsbGJhY2sgY2FuIHJldHVybgo+IDAgb3Ig
LUVBR0FJTi4KPgo+IFN1Z2dlc3QgdGhpczoKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHJfaW5mbygiJXBTIGNhbGxiYWNrIGZhaWxlZCB3aXRoICVkIGluICVzYmxvY2thYmxl
IGNvbnRleHQuXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
bi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBfcmV0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAhbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5n
ZSkgPyAibm9uLSIgOiAiIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJO
X09OKG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpIHx8Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9yZXQgIT0gLUVBR0FJTik7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBfcmV0Owo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiAgICAgICAgICAgICAgICAgfQo+Cj4gVG8gZXhwcmVzcyB0aGUgQVBJIGludmFyaWFu
dC4KPgo+IEphc29uCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
