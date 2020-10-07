Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EE2866A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 20:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270746E972;
	Wed,  7 Oct 2020 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B904089993
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 18:14:17 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id 4so844328ooh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
 b=lyjVFBq/8C4cx1xV9ChTXnV40ihqdqpwLDP0hKiWG7wMCAY1kcUxadTiFEkVrngi/w
 V9y6TiR2NUPQYfn7qatcnS2KH2rC4iURG1Imt+VcjCPG3gMt13p5HinunxSiaAfYb6mn
 oHrygbKnexw8amjrZlMfKtPR5lb/S9ssQU4cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cQRYAtP+xjx5WuekS6OE0CV7kqmxj7BYflzO3gWdvvE=;
 b=MHqjBZ2ZWtP6kjwPrvufRtnft5UaV8OJRzJeLxdyjDSpzQ4ZsKN0Kvy5Q0MmcKZC6c
 bKuTs3433kHjIH5YYsvyjUXf2nmw8KqxzC+/arLoPnQxvV82l23OoYQMoRILN+rvbJRM
 2Tk29LIDYcNWuzYqrDfvcuQ2cWnmO1xCENWHqaK6fE+kpOgJr6R9BbqOmhfwPyMCMQcU
 0GYLVjV+C9IOazuSOQ8nAL4x8Nrm3QM8RZB+AlZsxJSrFbxSfadkWX5TS4JXnG4mtWuo
 0AcqXdEqXnm2aYPuRiVDehi25GjhGa8CvD0xsH9S0sPPd7SXpziSHWdFrc+HzoJgxOYn
 nPFw==
X-Gm-Message-State: AOAM531NRlQfJ0karyJUhK7GchvtTgqCiINaeSTsPCuixtQhzD8bHewh
 P2cn8x8DGDRFMxyhxFMkXbks/X2Ofb8qGmV1bYPxSQ==
X-Google-Smtp-Source: ABdhPJzjOjAMzRbSVSt+lqfvvsdq1EBjj80477iZlPA7zPuN7ej1AyuyFSKWwEDM91Ycyft1zzLM1yCXh0Q5piW4a7o=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr2831112oov.28.1602094456975; 
 Wed, 07 Oct 2020 11:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-14-daniel.vetter@ffwll.ch>
 <20201007173911.GX5177@ziepe.ca>
In-Reply-To: <20201007173911.GX5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 20:14:06 +0200
Message-ID: <CAKMK7uEbAAJPPmv1yM_-V24Xg=S=NWxs2Yhi51kb-4AZLbFTTg@mail.gmail.com>
Subject: Re: [PATCH 13/13] vfio/type1: Mark follow_pfn as unsafe
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgNywgMjAyMCBhdCA3OjM5IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBl
LmNhPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDA3LCAyMDIwIGF0IDA2OjQ0OjI2UE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBUaGUgY29kZSBzZWVtcyB0byBzdHVmZiB0aGVzZSBw
Zm5zIGludG8gaW9tbXUgcHRzIChvciBzb21ldGhpbmcgbGlrZQo+ID4gdGhhdCwgSSBkaWRuJ3Qg
Zm9sbG93KSwgYnV0IHRoZXJlJ3Mgbm8gbW11X25vdGlmaWVyIHRvIGVuc3VyZSB0aGF0Cj4gPiBh
Y2Nlc3MgaXMgc3luY2hyb25pemVkIHdpdGggcHRlIHVwZGF0ZXMuCj4gPgo+ID4gSGVuY2UgbWFy
ayB0aGVzZSBhcyB1bnNhZmUuIFRoaXMgbWVhbnMgdGhhdCB3aXRoCj4gPiBDT05GSUdfU1RSSUNU
X0ZPTExPV19QRk4sIHRoZXNlIHdpbGwgYmUgcmVqZWN0ZWQuCj4gPgo+ID4gUmVhbCBmaXggaXMg
dG8gd2lyZSB1cCBhbiBtbXVfbm90aWZpZXIgLi4uIHNvbWVob3cuIFByb2JhYmx5IG1lYW5zIGFu
eQo+ID4gaW52YWxpZGF0ZSBpcyBhIGZhdGFsIGZhdWx0IGZvciB0aGlzIHZmaW8gZGV2aWNlLCBi
dXQgdGhlbiB0aGlzCj4gPiBzaG91bGRuJ3QgZXZlciBoYXBwZW4gaWYgdXNlcnNwYWNlIGlzIHJl
YXNvbmFibGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+Cj4gPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4g
PiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiBDYzogRGFuIFdpbGxp
YW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+Cj4gPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4g
PiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4KPiA+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiA+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
PiA+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+ID4g
Q2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+ID4gQ2M6IGt2bUB2Z2VyLmtl
cm5lbC5vcmcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA0
ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+ID4gaW5kZXggNWZiZjBjMWY3NDMzLi5h
NGQ1M2YzZDBhMzUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBl
MS5jCj4gPiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gPiBAQCAtNDIx
LDcgKzQyMSw3IEBAIHN0YXRpYyBpbnQgZm9sbG93X2ZhdWx0X3BmbihzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gPiAgewo+ID4gICAgICAgaW50IHJl
dDsKPiA+Cj4gPiAtICAgICByZXQgPSBmb2xsb3dfcGZuKHZtYSwgdmFkZHIsIHBmbik7Cj4gPiAr
ICAgICByZXQgPSB1bnNhZmVfZm9sbG93X3Bmbih2bWEsIHZhZGRyLCBwZm4pOwo+ID4gICAgICAg
aWYgKHJldCkgewo+ID4gICAgICAgICAgICAgICBib29sIHVubG9ja2VkID0gZmFsc2U7Cj4gPgo+
ID4gQEAgLTQzNSw3ICs0MzUsNyBAQCBzdGF0aWMgaW50IGZvbGxvd19mYXVsdF9wZm4oc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gICAgICAgICAg
ICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPgo+
ID4gLSAgICAgICAgICAgICByZXQgPSBmb2xsb3dfcGZuKHZtYSwgdmFkZHIsIHBmbik7Cj4gPiAr
ICAgICAgICAgICAgIHJldCA9IHVuc2FmZV9mb2xsb3dfcGZuKHZtYSwgdmFkZHIsIHBmbik7Cj4g
PiAgICAgICB9Cj4KPiBUaGlzIGlzIGFjdHVhbGx5IGJlaW5nIGNvbW1vbmx5IHVzZWQsIHNvIGl0
IG5lZWRzIGZpeGluZy4KPgo+IFdoZW4gSSB0YWxrZWQgdG8gQWxleCBhYm91dCB0aGlzIGxhc3Qg
d2UgaGFkIHdvcmtlZCBvdXQgYSBwYXRjaCBzZXJpZXMKPiB0aGF0IGFkZHMgYSB0ZXN0IG9uIHZt
X29wcyB0aGF0IHRoZSB2bWEgY2FtZSBmcm9tIHZmaW8gaW4gdGhlIGZpcnN0Cj4gcGxhY2UuIFRo
ZSBWTUEncyBjcmVhdGVkIGJ5IFZGSU8gYXJlICdzYWZlJyBhcyB0aGUgUFRFcyBhcmUgbmV2ZXIg
Y2hhbmdlZC4KCkhtLCBidXQgd291bGRuJ3QgbmVlZCB0aGF0IHRoZSBzZW1pLW5hc3R5IHZtYV9v
cGVuIHRyaWNrIHRvIG1ha2Ugc3VyZQp0aGF0IHZtYSBkb2Vzbid0IHVudGltZWx5IGRpc2FwcGVh
cj8gT3IgaXMgdGhlIGlkZWEgdG8gbG9vayB1cCB0aGUKdW5kZXJseWluZyB2ZmlvIG9iamVjdCwg
YW5kIHJlZmNvdW50IHRoYXQgZGlyZWN0bHk/Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
