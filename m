Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCA1075DA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 17:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E536E3BC;
	Fri, 22 Nov 2019 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415276E3BC;
 Fri, 22 Nov 2019 16:33:52 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E28D42071F;
 Fri, 22 Nov 2019 16:33:51 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id 59so2941741qtg.8;
 Fri, 22 Nov 2019 08:33:51 -0800 (PST)
X-Gm-Message-State: APjAAAUlB8oZ6MHeWghwqQm/Ax+VpmU292soN6OWIBonlSGTlKyFU3hl
 ngZmk70LhKoBuvGwZbcgwpYxD33sNRtu3XM+8Q==
X-Google-Smtp-Source: APXvYqxchCFnjicpj/mI4c77iDCN/gC9ccsQrxBycA7EYCX5YjWvwLHuCLYbnAj5UJswQc9IhOoMnO8aF/oMxE2ZINM=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr65541qtn.300.1574440431080;
 Fri, 22 Nov 2019 08:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20191122063749.27113-1-kraxel@redhat.com>
 <20191122063749.27113-2-kraxel@redhat.com>
In-Reply-To: <20191122063749.27113-2-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Nov 2019 10:33:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL8+REqdZKCwPbsahdRPFd4dTd9vHq4RT_zcwFqikR9qQ@mail.gmail.com>
Message-ID: <CAL_JsqL8+REqdZKCwPbsahdRPFd4dTd9vHq4RT_zcwFqikR9qQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: call drm_gem_object_funcs.mmap with fake
 offset
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574440432;
 bh=0Adq0cz7fbHoUOTKT+s9l1SPAPwabZRExUUmuY6Sx7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R6oUiLfCGwAyPMNAv+ioG5XZ7ORx3ZNVXsaOH5HgayrTF7v2Sh/wqScJjuqKPqxmU
 k2JkKLVQjliVzIxhyMOrbM4/X65M5tywH5jd2DLNZKqDY9jCT5T/XTJ/Y9HVF8Fhg9
 ifib79nGisdM8psZ5sZLU47mqCTHAo7wSTZdPsmk=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MzcgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZha2Ugb2Zmc2V0IGlzIGdvaW5nIHRvIHN0YXksIHNv
IGNoYW5nZSB0aGUgY2FsbGluZyBjb252ZW50aW9uIGZvcgo+IGRybV9nZW1fb2JqZWN0X2Z1bmNz
Lm1tYXAgdG8gaW5jbHVkZSB0aGUgZmFrZSBvZmZzZXQuICBVcGRhdGUgYWxsIHVzZXJzCj4gYWNj
b3JkaW5nbHkuCj4KPiBOb3RlIHRoYXQgdGhpcyByZXZlcnRzIDgzYjhhNmYyNDJlYSAoImRybS9n
ZW06IEZpeCBtbWFwIGZha2Ugb2Zmc2V0Cj4gaGFuZGxpbmcgZm9yIGRybV9nZW1fb2JqZWN0X2Z1
bmNzLm1tYXAiKSBhbmQgb24gdG9wIHRoZW4gYWRkcyB0aGUgZmFrZQo+IG9mZnNldCB0byAgZHJt
X2dlbV9wcmltZV9tbWFwIHRvIG1ha2Ugc3VyZSBhbGwgcGF0aHMgbGVhZGluZyB0bwo+IG9iai0+
ZnVuY3MtPm1tYXAgYXJlIGNvbnNpc3RlbnQuCgpJT1csIHYxIG9mIG15IG9yaWdpbmFsIGZpeC4g
OikgVGhvdWdoIHlvdSBkaWQgaXQgYSBsaXR0bGUgZGlmZmVyZW50bHk6Cgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMKPiBpbmRleCAwODE0MjExYjBmM2YuLmE5NjMzYmQyNDFiYiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMKPiBAQCAtNzE0LDYgKzcxNCw5IEBAIGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAgICAgICAg
aW50IHJldDsKPgo+ICAgICAgICAgaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkg
ewo+ICsgICAgICAgICAgICAgICAvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovCj4gKyAgICAgICAg
ICAgICAgIHZtYS0+dm1fcGdvZmYgKz0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2Rl
KTsKPiArCgpDYW4ndCB0aGlzIGJlIG1vdmVkIG91dCBvZiB0aGUgaWYgYW5kIHRoZW4gdGhlIHNh
bWUgdGhpbmcgbGF0ZXIgZG93bgpyZW1vdmVkPyBVbmxlc3MgdGhlcmUncyBzb21lIHJlcXVpcmVt
ZW50IHRoYXQgZHJtX3ZtYV9ub2RlX2FsbG93KCkgYmUKY2FsbGVkIGJlZm9yZSBkcm1fdm1hX25v
ZGVfc3RhcnQoKSBpbiB0aGF0IGNhc2UuIERvZXNuJ3QgbG9vayBsaWtlIGl0CnRvIG1lLCBidXQg
SSdtIG5vdCByZWFsbHkgc3VyZS4KCj4gICAgICAgICAgICAgICAgIHJldCA9IG9iai0+ZnVuY3Mt
Pm1tYXAob2JqLCB2bWEpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
