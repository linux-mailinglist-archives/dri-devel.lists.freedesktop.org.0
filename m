Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D886FCE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 05:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A396E1B6;
	Fri,  9 Aug 2019 03:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD03D6E1B6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 03:01:16 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9008A21743
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 03:01:15 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id s22so70679439qkj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 20:01:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVZm6zqbhzCL+JTT9Hv3FeVp3IyTGToFln9AJc6w+nfSWNm0Pop
 PVj6dv5UnGjLXXk3Rm5NIWZesotcY/4dQ0xHBQ==
X-Google-Smtp-Source: APXvYqzbEF8n0hzmmnQkKG1Q1u+o9Exay3eVWRoqOA1Upm3+P7b9pqKu2fCSph0kfJqH7p8rT9h2aB4USf+YBmDKuMQ=
X-Received: by 2002:a37:d8f:: with SMTP id 137mr9479292qkn.254.1565319674674; 
 Thu, 08 Aug 2019 20:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222918.15153-1-robh@kernel.org>
 <20190808231110.GA12294@kevin>
In-Reply-To: <20190808231110.GA12294@kevin>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 21:01:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
Message-ID: <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565319675;
 bh=l4LqmLolExgvehATrEtXE8vHPmP4eYH6IEqDXExMi9Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wla7dibD+b+j1N7y3zA+O/xs3KjN4pVGdGiZmU8N1bwKEr0AjF9VvLL2FhMU1MSTS
 h9PRucf+Nu/QRdNzyD46M88/PZmIePq5MJhHdIKPel2F0B7q8FxSHlYnXi3pRw6/1k
 zSjOg0lCyKmbwFrXygrZibMr64q3xdigsh5rbWQQ=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA1OjExIFBNIEFseXNzYSBSb3Nlbnp3ZWlnCjxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+ID4gQEAgLTQ0OCw2ICs0NTMsNyBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcGFuZnJvc3Rfam9iX2lycV9oYW5kbGVyKGludCBpcnEsIHZv
aWQgKmRhdGEpCj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICAgIGlmIChz
dGF0dXMgJiBKT0JfSU5UX01BU0tfRE9ORShqKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHBhbmZyb3N0X21tdV9hc19wdXQocGZkZXYsICZwZmRldi0+am9ic1tqXS0+ZmlsZV9wcml2LT5t
bXUpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHBhbmZyb3N0X2RldmZyZXFfcmVjb3JkX3Ry
YW5zaXRpb24ocGZkZXYsIGopOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9z
aWduYWwocGZkZXYtPmpvYnNbal0tPmRvbmVfZmVuY2UpOwo+ID4gICAgICAgICAgICAgICB9Cj4K
PiBJcyB0aGUgaWRlYSB0byBzd2l0Y2ggQVMncyB3aGVuIGFuIElSUSBpcyBmaXJlZCBjb3JyZXNw
b25kaW5nIHRvIGEKPiBwcm9jZXNzIHdpdGggYSBwYXJ0aWN1bGFyIGFkZHJlc3Mgc3NwYWNlPyAo
V2hlcmUgZG8gd2Ugc3dpdGNoIGJhY2s/IE9yCj4gaXMgdGhhdCBub3QgaG93IHRoZSBNTVUgYWN0
dWFsbHkgd29ya3MgaGVyZT8pCgpOby4gVGhlcmUncyAzIHN0YXRlcyBhbiBBUyBjYW4gYmUgaW46
IGZyZWUsIGFsbG9jYXRlZCwgYW5kIGluIHVzZS4KV2hlbiBhIGpvYiBydW5zLCBpdCByZXF1ZXN0
cyBhbiBhZGRyZXNzIHNwYWNlIGFuZCB0aGVuIG1hcmtzIGl0IG5vdCBpbgp1c2Ugd2hlbiBqb2Ig
aXMgY29tcGxldGUoYnV0IHN0YXlzIGFzc2lnbmVkKS4gVGhlIGZpcnN0IHRpbWUgdGhydSwgd2UK
ZmluZCBhIGZyZWUgQVMgaW4gdGhlIGFsbG9jX21hc2sgYW5kIGFzc2lnbiB0aGUgQVMgdG8gdGhl
IEZELiBUaGVuIHRoZQpuZXh0IHRpbWUgdGhydSwgd2UgbW9zdCBsaWtlbHkgYWxyZWFkeSBoYXZl
IG91ciBBUyBhbmQgd2UganVzdCBtYXJrIGl0CmluIHVzZSB3aXRoIGEgcmVmIGNvdW50LiBXZSBu
ZWVkIGEgcmVmIGNvdW50IGJlY2F1c2Ugd2UgaGF2ZSBtdWx0aXBsZQpqb2Igc2xvdHMuIElmIHRo
ZSBqb2IvRkQgZG9lc24ndCBoYXZlIGFuIEFTIGFzc2lnbmVkIGFuZCB0aGVyZSBhcmUgbm8KZnJl
ZSBvbmVzLCB0aGVuIHdlIHBpY2sgYW4gYWxsb2NhdGVkIG9uZSBub3QgaW4gdXNlIGZyb20gb3Vy
IExSVSBsaXN0CmFuZCBzd2l0Y2ggdGhlIEFTIGZyb20gdGhlIG9sZCBGRCB0byB0aGUgbmV3IG9u
ZS4KClN3aXRjaGluZyBhbiBBUyBmcm9tIG9uZSBGRCB0byBhbm90aGVyIHR1cm5zIG91dCB0byBi
ZSBxdWl0ZSBzaW1wbGUuCldlIHNpbXBseSB1cGRhdGUgdGhlIEFTIHJlZ2lzdGVycyB0byBwb2lu
dCB0byBuZXcgcGFnZSB0YWJsZSBiYXNlCmFkZHJlc3MgYW5kIHRoYXQncyBpdC4KCj4gTG9naWNh
bGx5IGl0IHNlZW1zIHNvdW5kLCBqdXN0IGFybWNoYWlyIG5lcnZvdXMgYWJvdXQgcG90ZW50aWFs
IHJhY2UKPiBjb25kaXRpb25zIHdpdGggd2VpcmQgbXVsdGl0aHJlYWRpbmcgc2V0dXBzLgoKQnV0
IFdlYkdMISA6KQoKSSB3YXMgd29ycmllZCB0b28uIEl0IHNlZW1zIHRvIGJlIHdvcmtpbmcgcHJl
dHR5IHdlbGwgdGhvdWdoLCBidXQgbW9yZQp0ZXN0aW5nIHdvdWxkIGJlIGdvb2QuIEkgZG9uJ3Qg
dGhpbmsgdGhlcmUgYXJlIGEgbG90IG9mIHVzZWNhc2VzIHRoYXQKdXNlIG1vcmUgQVMgdGhhbiB0
aGUgaC93IGhhcyAoOCBvbiBUODYwKSwgYnV0IEknbSBub3Qgc3VyZS4KCkkgdHJpZWQgdG8gY29t
ZSB1cCB3aXRoIGEgbG9ja2xlc3MgZmFzdHBhdGgsIGJ1dCB0aGVuIGp1c3QgZ2F2ZSB1cCBhbmQK
c3R1Y2sgYSBzcGlubG9jayBhcm91bmQgdGhlIHdob2xlIHRoaW5nLgo+Cj4gPiArICAgICAvKiBB
c3NpZ24gdGhlIGZyZWUgb3IgcmVjbGFpbWVkIEFTIHRvIHRoZSAgKi8KPgo+IHRvIHRoZS4uLi4/
CgpGRAoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
