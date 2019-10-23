Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1308BE13C5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113056E9B5;
	Wed, 23 Oct 2019 08:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6452B6E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 03:54:09 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id m16so11168870iln.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 20:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LHGxMJgC9fsphY4M+7ir7vJgAGyj8pWVsdCiE4QA6o=;
 b=HPTCKLC4b0Z6XDh09P+Tw/Lmhppjux9EC5BGabumgcqlnbyZmfPX5mbLkirSVOyfSB
 YIzz5p4LlsG5fZgBnl0QV/cY9d3z2fhPijKQJ074ydOhwBBRBOFrjqbplrnjGLJa4SC2
 Xa+pgwv6PIr55agiQrOBgphdRl+XhsA4iHDktOxS/yfVwK/4KNoPdqEKgYUTm6y6DnbR
 xcrjKNhXGdNvI5KzmqCBLgKCAIGXaDg0mfUBOLDgT2YXcD9WHsXP8jPrTqIMwmHK9/oa
 DPXMbG9FT12O3C+ZyguvKjxKmQernCpDPwEZA3rhc/7/e5EgKisIaTQX2ag7MyM7x8+9
 YxuA==
X-Gm-Message-State: APjAAAW1loc9ljeHuZ3MJD69R56hMLGmFUCLOyPWAS+omtayO5eUISCq
 gGaDV98GzorRkzSsHllAT6Bj7qra981r+cIuHX0=
X-Google-Smtp-Source: APXvYqwrn/WBtVMHAFAqhmGHKKoxDT87Sr8DyCIRMO6XG644b9uQ571IH4gZTRLXpqfbcU/Odip8LocEhUk4d72c8Iw=
X-Received: by 2002:a92:4144:: with SMTP id o65mr35736635ila.172.1571802848526; 
 Tue, 22 Oct 2019 20:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
 <20191022093654.GF11828@phenom.ffwll.local>
In-Reply-To: <20191022093654.GF11828@phenom.ffwll.local>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 22 Oct 2019 22:53:57 -0500
Message-ID: <CAEkB2ETFM7u6YiUOT3fz4UQ3U_za9iM1arTnYNg-rjs5+wxOfw@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/LHGxMJgC9fsphY4M+7ir7vJgAGyj8pWVsdCiE4QA6o=;
 b=lDTH3vIpVKOT4cHUqTnhkivTQ/0ICLeWcMIrK5ZpKQrPpEFQiBap0C9/xiuuA7wMxu
 8qBj7L4RonbFjzmHvGBvSUy8aBkmXf57NlETXJkYp2JYk1Gs5XYFODyLJGmOygbbtq1n
 ZzoXTonLboEb9/AoN4tpBNFgcjkThTFUlluD+mVvTUlVccwdHYK0POuC2eN1/YMikfVZ
 oQhuvJhEVkSsPRc8/jRE4P2ZEt3qp1ejyR5m8zyHnDg0SuT6JavrrseUCrEJfdDrrMAp
 O16+zL3BDiIswbyFWElgVoRfqbC92XM2WGHKAz78vQqXUCUyWuZFD+jSb1/8B5eWe7Ue
 RRSQ==
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNDozNiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDE6NTI6NDlQTSAtMDUw
MCwgTmF2aWQgRW1hbWRvb3N0IHdyb3RlOgo+ID4gSW4gdGhlIGltcGVsZW1lbnRhdGlvbiBvZiB2
M2Rfc3VibWl0X2NsX2lvY3RsKCkgdGhlcmUgYXJlIHR3byBtZW1vcnkKPiA+IGxlYWtzLiBPbmUg
aXMgd2hlbiBhbGxvY2F0aW9uIGZvciBiaW4gZmFpbHMsIGFuZCB0aGUgb3RoZXIgaXMgd2hlbiBi
aW4KPiA+IGluaXRpYWxpemF0aW9uIGZhaWxzLiBJZiBrY2FsbG9jIGZhaWxzIHRvIGFsbG9jYXRl
IG1lbW9yeSBmb3IgYmluIHRoZW4KPiA+IHJlbmRlci0+YmFzZSBzaG91bGQgYmUgcHV0LiBBbHNv
LCBpZiB2M2Rfam9iX2luaXQoKSBmYWlscyB0byBpbml0aWFsaXplCj4gPiBiaW4tPmJhc2UgdGhl
biBhbGxvY2F0ZWQgbWVtb3J5IGZvciBiaW4gc2hvdWxkIGJlIHJlbGVhc2VkLgo+ID4KPiA+IEZp
eGVzOiBhNzgzYTA5ZWU3NmQgKCJkcm0vdjNkOiBSZWZhY3RvciBqb2IgbWFuYWdlbWVudC4iKQo+
ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgfCA1ICsrKyst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyBiL2RyaXZlcnMv
Z3B1L2RybS92M2QvdjNkX2dlbS5jCj4gPiBpbmRleCA1ZDgwNTA3YjUzOWIuLjE5YzA5MmQ3NTI2
NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+ID4gQEAgLTU1NywxMyArNTU3LDE2IEBA
IHYzZF9zdWJtaXRfY2xfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
PiA+Cj4gPiAgICAgICBpZiAoYXJncy0+YmNsX3N0YXJ0ICE9IGFyZ3MtPmJjbF9lbmQpIHsKPiA+
ICAgICAgICAgICAgICAgYmluID0ga2NhbGxvYygxLCBzaXplb2YoKmJpbiksIEdGUF9LRVJORUwp
Owo+ID4gLSAgICAgICAgICAgICBpZiAoIWJpbikKPiA+ICsgICAgICAgICAgICAgaWYgKCFiaW4p
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB2M2Rfam9iX3B1dCgmcmVuZGVyLT5iYXNlKTsK
Pgo+IFRoZSBqb2IgaXNuJ3QgaW5pdGlhbGl6ZWQgeWV0LCB0aGlzIGRvZXNuJ3Qgd29yay4KRG8g
eW91IG1lYW4gd2UgaGF2ZSB0byByZWxlYXNlIHJlbmRlciB2aWEga2ZyZWUoKSBoZXJlPwoKPgo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAg
ICB9Cj4gPgo+ID4gICAgICAgICAgICAgICByZXQgPSB2M2Rfam9iX2luaXQodjNkLCBmaWxlX3By
aXYsICZiaW4tPmJhc2UsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2M2Rf
am9iX2ZyZWUsIGFyZ3MtPmluX3N5bmNfYmNsKTsKPiA+ICAgICAgICAgICAgICAgaWYgKHJldCkg
ewo+ID4gICAgICAgICAgICAgICAgICAgICAgIHYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOwo+
Cj4gdjNkX2pvYl9wdXQgd2lsbCBjYWxsIGtmcmVlLCBpZiB5b3UgY2hhc2UgdGhlIGNhbGxjaGFp
biBsb25nIGVub3VnaCAoaW4KPiB2M2Rfam9iX2ZyZWUpLiBTbyBubyBidWcgaGVyZSwgdGhpcyB3
b3VsZCBsZWFkIHRvIGEgZG91YmxlIGtmcmVlIGFuZAo+IGNyYXNoLgpZZXMsIHYzZF9qb2JfcHV0
KCkgdGFrZXMgY2FyZSBvZiByZW5kZXIsCgo+IC1EYW5pZWwKPgo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGtmcmVlKGJpbik7CmJ1dCBob3cgYWJvdXQgbGVha2luZyBiaW4/Cgo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAt
LQo+ID4gMi4xNy4xCj4gPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCgoKLS0gCk5hdmlk
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
