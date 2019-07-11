Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F265309
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 10:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C34889E4C;
	Thu, 11 Jul 2019 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E755E89E4C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:21:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so4893565edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=8WLxEYKvp+G8KVX29UoMgnN82gOfXefm67IW7Lz3ELM=;
 b=H4wNBYMsutAXEs4o/ennbabhEUZuSTGLGhDZlf/I0KWR+CUqI/xl6kJ2fYvmgWv9bB
 Fd07aPdT1zglkgYUVbVzNxIqCdqhX5zdDtdPoyN5qMimRUCTwtJFDEomloyfoePOr6Y+
 XB1s3MHbCNjjhxFbtCd9qYmZ6+Ei+N/p0szXtwPhgpGM4haFXbb8Cfix+ZxmpX5QDSg8
 mCcWzvrITyEboPeduu56cN+OngXB9thXgsdv4O1ObvY/LzF9nGA9vdAeLXaGmo7L7+IU
 vZesfYhfF2BcXqJUA8afXp3sJ8cwy2Pl9A6Qhqyy4VWlUvNUER8F9NaxIGx49w8nhisn
 q5iQ==
X-Gm-Message-State: APjAAAV/yckmOnGCm1DjVUnCygjhNAGQXUU9Hb0iIsctZLClkEEOLQGd
 ax1dIiudJykKg3cmG45BM/k=
X-Google-Smtp-Source: APXvYqxTHd8KSqi16wrHTqcM+LyLoZpCL/IQ+COZ9g2UG8zZBuEvORHbRxJBqYrz5yHutJ6G8Pb26Q==
X-Received: by 2002:a17:906:4d88:: with SMTP id
 s8mr1946987eju.225.1562833268556; 
 Thu, 11 Jul 2019 01:21:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c48sm1499881edb.10.2019.07.11.01.21.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 01:21:07 -0700 (PDT)
Date: Thu, 11 Jul 2019 10:21:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Message-ID: <20190711082105.GI15868@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8WLxEYKvp+G8KVX29UoMgnN82gOfXefm67IW7Lz3ELM=;
 b=JHCJ6NkfSauIaS7Bo2XYssW3dhuhO/NV0eotPKteo5zLIaB9b7e3IA+Y/QeAgV4Pei
 GQdbYgkUoo7ykifVmSN1xww1gmuVSU84cqx+KY7d0p0mgMCDFWknSKzmvbbT9r1xCle/
 dRKacixn3HqsZyDeWUFzylwCk5+vpFeZtmAEI=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6Mzg6MzFQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBUaGUgY29tcHV0ZV9jcmMoKSBmdW5jdGlvbiBpcyByZXNwb25zaWJsZSBmb3Ig
Y2FsY3VsYXRpbmcgdGhlCj4gZnJhbWVidWZmZXIgQ1JDIHZhbHVlOyBkdWUgdG8gdGhlIFhSR0Ig
Zm9ybWF0LCB0aGlzIGZ1bmN0aW9uIGhhcyB0bwo+IGlnbm9yZSB0aGUgYWxwaGEgY2hhbm5lbCBk
dXJpbmcgdGhlIENSQyBjb21wdXRhdGlvbi4gVGhlcmVmb3JlLAo+IGNvbXB1dGVfY3JjKCkgc2V0
IHplcm8gdG8gdGhlIGFscGhhIGNoYW5uZWwgZGlyZWN0bHkgaW4gdGhlIGlucHV0Cj4gZnJhbWVi
dWZmZXIsIHdoaWNoIGlzIG5vdCBhIHByb2JsZW0gc2luY2UgdGhpcyBmdW5jdGlvbiByZWNlaXZl
cyBhIGNvcHkKPiBvZiB0aGUgb3JpZ2luYWwgYnVmZmVyLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRv
IHVzZSB0aGlzIGZ1bmN0aW9uIGluIGEKPiBjb250ZXh0IHdpdGhvdXQgYSBidWZmZXIgY29weSwg
aXQgd2lsbCBjaGFuZ2UgdGhlIGluaXRpYWwgdmFsdWUuIFRoaXMKPiBwYXRjaCBtYWtlcyBjb21w
dXRlX2NyYygpIGNhbGN1bGF0ZSB0aGUgQ1JDIHZhbHVlIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZQo+
IGlucHV0IGZyYW1lYnVmZmVyLgoKVWggd2h5PyBGb3Igd3JpdGViYWNrIHdlJ3JlIHdyaXRpbmcg
dGhlIG91dHB1dCB0b28sIHNvIHdlIGNhbiB3cml0ZQp3aGF0ZXZlciB3ZSB3YW50IHRvIGludG8g
dGhlIGFscGhhIGNoYW5uZWwuIEZvciB3cml0ZWJhY2sgd2Ugc2hvdWxkIG5ldmVyCmFjY2VwdCBh
IHBpeGVsIGZvcm1hdCB3aGVyZSBhbHBoYSBhY3R1YWxseSBtYXR0ZXJzLCB0aGF0IGRvZXNuJ3Qg
bWFrZQpzZW5zZS4gWW91IGNhbid0IHNlZSB0aHJvdWdoIGEgcmVhbCBzY3JlZW4gZWl0aGVyLCB0
aGV5IGFyZSBhbGwgb3BhcXVlIDotKQotRGFuaWVsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZHJp
Z28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgfCAzMSArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCj4gaW5kZXggNTFhMjcw
NTE0MjE5Li44MTI2YWEwZjk2OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19jb21wb3Nlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nl
ci5jCj4gQEAgLTYsMzMgKzYsNDAgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBl
ci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+Cj4gIAo+
ICtzdGF0aWMgdTMyIGdldF9waXhlbF9mcm9tX2J1ZmZlcihpbnQgeCwgaW50IHksIGNvbnN0IHU4
ICpidWZmZXIsCj4gKwkJCQkgY29uc3Qgc3RydWN0IHZrbXNfY29tcG9zZXIgKmNvbXBvc2VyKQo+
ICt7Cj4gKwlpbnQgc3JjX29mZnNldCA9IGNvbXBvc2VyLT5vZmZzZXQgKyAoeSAqIGNvbXBvc2Vy
LT5waXRjaCkKPiArCQkJCQkgICsgKHggKiBjb21wb3Nlci0+Y3BwKTsKPiArCj4gKwlyZXR1cm4g
Kih1MzIgKikmYnVmZmVyW3NyY19vZmZzZXRdOwo+ICt9Cj4gKwo+ICAvKioKPiAgICogY29tcHV0
ZV9jcmMgLSBDb21wdXRlIENSQyB2YWx1ZSBvbiBvdXRwdXQgZnJhbWUKPiAgICoKPiAtICogQHZh
ZGRyX291dDogYWRkcmVzcyB0byBmaW5hbCBmcmFtZWJ1ZmZlcgo+ICsgKiBAdmFkZHI6IGFkZHJl
c3MgdG8gZmluYWwgZnJhbWVidWZmZXIKPiAgICogQGNvbXBvc2VyOiBmcmFtZWJ1ZmZlcidzIG1l
dGFkYXRhCj4gICAqCj4gICAqIHJldHVybnMgQ1JDIHZhbHVlIGNvbXB1dGVkIHVzaW5nIGNyYzMy
IG9uIHRoZSB2aXNpYmxlIHBvcnRpb24gb2YKPiAgICogdGhlIGZpbmFsIGZyYW1lYnVmZmVyIGF0
IHZhZGRyX291dAo+ICAgKi8KPiAtc3RhdGljIHVpbnQzMl90IGNvbXB1dGVfY3JjKHZvaWQgKnZh
ZGRyX291dCwgc3RydWN0IHZrbXNfY29tcG9zZXIgKmNvbXBvc2VyKQo+ICtzdGF0aWMgdWludDMy
X3QgY29tcHV0ZV9jcmMoY29uc3QgdTggKnZhZGRyLAo+ICsJCQkgICAgY29uc3Qgc3RydWN0IHZr
bXNfY29tcG9zZXIgKmNvbXBvc2VyKQo+ICB7Cj4gLQlpbnQgaSwgaiwgc3JjX29mZnNldDsKPiAr
CWludCB4LCB5Owo+ICAJaW50IHhfc3JjID0gY29tcG9zZXItPnNyYy54MSA+PiAxNjsKPiAgCWlu
dCB5X3NyYyA9IGNvbXBvc2VyLT5zcmMueTEgPj4gMTY7Cj4gIAlpbnQgaF9zcmMgPSBkcm1fcmVj
dF9oZWlnaHQoJmNvbXBvc2VyLT5zcmMpID4+IDE2Owo+ICAJaW50IHdfc3JjID0gZHJtX3JlY3Rf
d2lkdGgoJmNvbXBvc2VyLT5zcmMpID4+IDE2Owo+IC0JdTMyIGNyYyA9IDA7Cj4gKwl1MzIgY3Jj
ID0gMCwgcGl4ZWwgPSAwOwo+ICAKPiAtCWZvciAoaSA9IHlfc3JjOyBpIDwgeV9zcmMgKyBoX3Ny
YzsgKytpKSB7Cj4gLQkJZm9yIChqID0geF9zcmM7IGogPCB4X3NyYyArIHdfc3JjOyArK2opIHsK
PiAtCQkJc3JjX29mZnNldCA9IGNvbXBvc2VyLT5vZmZzZXQKPiAtCQkJCSAgICAgKyAoaSAqIGNv
bXBvc2VyLT5waXRjaCkKPiAtCQkJCSAgICAgKyAoaiAqIGNvbXBvc2VyLT5jcHApOwo+ICsJZm9y
ICh5ID0geV9zcmM7IHkgPCB5X3NyYyArIGhfc3JjOyArK3kpIHsKPiArCQlmb3IgKHggPSB4X3Ny
YzsgeCA8IHhfc3JjICsgd19zcmM7ICsreCkgewo+ICAJCQkvKiBYUkdCIGZvcm1hdCBpZ25vcmVz
IEFscGhhIGNoYW5uZWwgKi8KPiAtCQkJbWVtc2V0KHZhZGRyX291dCArIHNyY19vZmZzZXQgKyAy
NCwgMCwgIDgpOwo+IC0JCQljcmMgPSBjcmMzMl9sZShjcmMsIHZhZGRyX291dCArIHNyY19vZmZz
ZXQsCj4gLQkJCQkgICAgICAgc2l6ZW9mKHUzMikpOwo+ICsJCQlwaXhlbCA9IGdldF9waXhlbF9m
cm9tX2J1ZmZlcih4LCB5LCB2YWRkciwgY29tcG9zZXIpOwo+ICsJCQliaXRtYXBfY2xlYXIoKHZv
aWQgKikmcGl4ZWwsIDAsIDgpOwo+ICsJCQljcmMgPSBjcmMzMl9sZShjcmMsICh2b2lkICopJnBp
eGVsLCBzaXplb2YodTMyKSk7Cj4gIAkJfQo+ICAJfQo+ICAKPiAtLSAKPiAyLjIxLjAKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
