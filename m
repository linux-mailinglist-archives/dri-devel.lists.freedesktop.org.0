Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F830E6D
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 14:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF74893EA;
	Fri, 31 May 2019 12:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80720893E7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 12:55:07 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id s16so15042801ita.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 05:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRUe8zQwyuAuKGZtxLK3YIRDz14pyhb0pZiftXDRPlU=;
 b=gTDC3qtDg/issX7XXtaVEXFjshAXNprO15tFBNPPKaYoEjUnliivC58qAfRhY90jyK
 Yyx9YBC+rEnJUY4nC1L07Cld5FK3pBP+y2GnVoPDg08J20qdqjrw85wR15F1rlvVD4PA
 Av8MWiD5WGeUDZ+fPkVrBNl+ZjOcTPMH69b4LrVB7kTqBkswU8+t45+MllG0F/k4oQSp
 DWAeJImY1Sa70rWKChOAHi/wkphO2ciCAYlM4QEZ37Jt3sEfsb15N/9ZMNlTnAoNCoMD
 v7TcQB3NQT9BQhhvulNgIQVwjTn1uZ+kaa5+Fi/Cmsj0M0PNFNn+bn8hOXjCuGcLNcpT
 VIww==
X-Gm-Message-State: APjAAAVuYpOWJsjVpsVKkzYgyJjBZ5IgWgL+zbuZaRqSGNkSMn3GVGo0
 o+2eLIlBDynEew8m73zX2t04VfyO59E=
X-Google-Smtp-Source: APXvYqyFnbHA6yprIIuyKTTyj9K5Y25HVCFlfL8eA4cA+SZr+tvoZ5cj2egzAl+TJsBFAHGKBuw8zg==
X-Received: by 2002:a24:1c0a:: with SMTP id c10mr6816405itc.45.1559307306792; 
 Fri, 31 May 2019 05:55:06 -0700 (PDT)
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id j6sm2499924itg.24.2019.05.31.05.55.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 05:55:06 -0700 (PDT)
Received: by mail-it1-f171.google.com with SMTP id j204so9718604ite.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 05:55:06 -0700 (PDT)
X-Received: by 2002:a02:7b2d:: with SMTP id q45mr1964953jac.127.1559307306025; 
 Fri, 31 May 2019 05:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190529091836.22060-1-boris.brezillon@collabora.com>
In-Reply-To: <20190529091836.22060-1-boris.brezillon@collabora.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 31 May 2019 14:54:54 +0200
X-Gmail-Original-Message-ID: <CAAObsKBYvVKVTJf6ZwSarAVr6FSCz-NDYNhEqrDhBWUM3q57Nw@mail.gmail.com>
Message-ID: <CAAObsKBYvVKVTJf6ZwSarAVr6FSCz-NDYNhEqrDhBWUM3q57Nw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Make sure a BO is only unmapped when
 appropriate
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RRUe8zQwyuAuKGZtxLK3YIRDz14pyhb0pZiftXDRPlU=;
 b=cTkTyaXWwnB6q1lhhnK+dEPVS0ql6hvJxhqWFJa65ajuoMexH/KFwN/9JkjS53Nr5b
 uuX4lv9Y4pPu/m0qxsPMjUW3d3+unGrI8vIVtimdPqlPEV6KvDNBAdZWsQtZlaGMZ2T6
 o1mh+pYD1AppJzI8MEKcaWu0nTPnWStC7tWjg6yusf7TX/KxqHVCtKZCsoPKq0pE6UZg
 djQfN4nhCa55hbwWeGIWIEGrYZOBNKkmD7ACjVBlkVs+wV6oa1+IwkL/RrudAdzPKqv0
 u23SbWK1xRqWK4qaUq71aWUYcfj+16LUpAYDyJwnVB7iyqj13ghwEB11kCFX9u8qepYZ
 B/ZA==
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
Cc: Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSBhdCAxMToxOCwgQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBtbXVfb3BzLT51bm1hcCgpIHdpbGwgZmFp
bCB3aGVuIGNhbGxlZCBvbiBhIEJPIHRoYXQgaGFzIG5vdCBiZWVuCj4gcHJldmlvdXNseSBtYXBw
ZWQsIGFuZCB0aGUgZXJyb3IgcGF0aCBpbiBwYW5mcm9zdF9pb2N0bF9jcmVhdGVfYm8oKQo+IGNh
biBjYWxsIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgpICh3aGljaCBpbiB0dXJuIGNhbGxz
Cj4gcGFuZnJvc3RfbW11X3VubWFwKCkpIG9uIGEgQk8gdGhhdCBoYXMgbm90IGJlZW4gbWFwcGVk
IHlldC4KPgo+IEtlZXAgdHJhY2sgb2YgdGhlIG1hcHBlZC91bm1hcHBlZCBzdGF0ZSB0byBhdm9p
ZCBzdWNoIGlzc3Vlcy4KPgo+IEZpeGVzOiBmM2JhOTEyMjhlOGUgKCJkcm0vcGFuZnJvc3Q6IEFk
ZCBpbml0aWFsIHBhbmZyb3N0IGRyaXZlciIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0u
aCB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA4ICsr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gaW5kZXggMDQ1MDAwZWI1ZmNmLi42ZGJjYWJh
MDIwZmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gQEAg
LTExLDYgKzExLDcgQEAgc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3Qgewo+ICAgICAgICAgc3Ry
dWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IGJhc2U7Cj4KPiAgICAgICAgIHN0cnVjdCBkcm1fbW1f
bm9kZSBub2RlOwo+ICsgICAgICAgYm9vbCBpc19tYXBwZWQ7Cj4gIH07Cj4KPiAgc3RhdGljIGlu
bGluZQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBpbmRleCA3NjJi
MWJkMmE4YzIuLmZiNTU2YWE4OTIwMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMKPiBAQCAtMTU2LDYgKzE1Niw5IEBAIGludCBwYW5mcm9zdF9tbXVfbWFwKHN0
cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKPiAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAq
c2d0Owo+ICAgICAgICAgaW50IHJldDsKPgo+ICsgICAgICAgaWYgKGJvLT5pc19tYXBwZWQpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAwOwoKSW4gd2hhdCBjaXJjdW1zdGFuY2VzIHdlIHdhbnQg
dG8gc2lsZW50bHkgZ28gb24/IEkgd291bGQgZXhwZWN0IHRoYXQKZm9yIHRoaXMgZnVuY3Rpb24g
dG8gYmUgY2FsbGVkIHdoZW4gdGhlIEJPIGhhcyBiZWVuIG1hcHBlZCBhbHJlYWR5CndvdWxkIG1l
YW4gdGhhdCB3ZSBoYXZlIGEgYnVnIGluIHRoZSBrZXJuZWwsIHNvIHdoeSBub3QgYSBXQVJOPwoK
PiArCj4gICAgICAgICBzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2JqKTsKPiAg
ICAgICAgIGlmIChXQVJOX09OKElTX0VSUihzZ3QpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoc2d0KTsKPiBAQCAtMTg5LDYgKzE5Miw3IEBAIGludCBwYW5mcm9zdF9tbXVfbWFw
KHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKPgo+ICAgICAgICAgcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsKPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKHBmZGV2LT5kZXYpOwo+ICsgICAgICAgYm8tPmlzX21hcHBlZCA9IHRydWU7Cj4KPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4gQEAgLTIwMyw2ICsyMDcsOSBAQCB2b2lkIHBhbmZyb3N0
X21tdV91bm1hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gICAgICAgICBzaXpl
X3QgdW5tYXBwZWRfbGVuID0gMDsKPiAgICAgICAgIGludCByZXQ7Cj4KPiArICAgICAgIGlmICgh
Ym8tPmlzX21hcHBlZCkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwoKU2ltaWxhcmx5LCBJIHRo
aW5rIHRoYXQgd2hhdCB3ZSBzaG91bGQgZG8gaXMgbm90IHRvIGNhbGwKcGFuZnJvc3RfbW11X3Vu
bWFwIHdoZW4gYSBCTyBpcyBmcmVlZCBpZiB3ZSBrbm93IGl0IGlzbid0IG1hcHBlZC4gQW5kCnBy
b2JhYmx5IGFkZCBhIFdBUk4gaGVyZSBpZiBpdCBzdGlsbCBnZXRzIGNhbGxlZCB3aGVuIHRoZSBC
TyBpc24ndAptYXBwZWQuCgo+ICsKPiAgICAgICAgIGRldl9kYmcocGZkZXYtPmRldiwgInVubWFw
OiBpb3ZhPSVsbHgsIGxlbj0lengiLCBpb3ZhLCBsZW4pOwo+Cj4gICAgICAgICByZXQgPSBwbV9y
dW50aW1lX2dldF9zeW5jKHBmZGV2LT5kZXYpOwo+IEBAIC0yMzAsNiArMjM3LDcgQEAgdm9pZCBw
YW5mcm9zdF9tbXVfdW5tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvKQo+Cj4gICAg
ICAgICBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHBmZGV2LT5kZXYpOwo+ICAgICAgICAgcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7Cj4gKyAgICAgICBiby0+aXNfbWFw
cGVkID0gZmFsc2U7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBtbXVfdGxiX2ludl9jb250ZXh0X3Mx
KHZvaWQgKmNvb2tpZSkKPiAtLQo+IDIuMjAuMQo+CgpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9m
IHRoaXMhCgpUb21ldQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
