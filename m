Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E114BD3D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 16:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA086EE8A;
	Tue, 28 Jan 2020 15:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DBB6EE8B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 15:50:08 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 77so12409875oty.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nc6zEDXW8JJ+3wMLQz+Td4KltH/qS/E9W/fNWd91GVE=;
 b=aexZ6lqWaGA4Yqgfmv0EU2IOl51VB56G0IGfVO2bQMi5mn/PXPqJ+Mgj7dw7+QEHJO
 qRF8siw3EGSQY+5ShcjuCbmhzF8CBuuH2jAsX/qlyOiSxEVCKFKvuSosWdnUkNtMcMJ3
 cYDwrWmvboYVimo5vXWX8mOO0/W90LEfKjGDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nc6zEDXW8JJ+3wMLQz+Td4KltH/qS/E9W/fNWd91GVE=;
 b=lh4nCNTEasdNKI+6ZaY8ahlWsLm+KEBs9D3B2NWYmt272cZVruhnIDd9b4J12dt/7V
 2ZWfmhibKlPP33lPJ6FjNxHK+rSljNd06pohozs4vigZ0X8x2dGk3EkGitmzTkdbc/+x
 QIGBxg89mmM/PwhzCfKBpyk69mU3f1zZpEj9pbhOoAOeOPtw54s9/rmX4C3kz7C7N5AP
 4aA+fUu98PVwDqcLSAlK7yZvD8LggeSoc6tbaWu9EEytobhEpYHdWvdv/+HlBwogrj2O
 CpLdPzs+AWzcmqgNqwJsTTOY+5bH9fhZ/MnDbx5UXRxKZEKU4XgLTz/yoAVCwS18EXru
 ubXw==
X-Gm-Message-State: APjAAAWjKwzkNmK03RvwG49V3mILCxKssLruzspFYiYkZTIlA9Z7HW04
 PVb/esa1yGkTE9ebrnCWR+phMpavvdM3WC52bAzHQQ==
X-Google-Smtp-Source: APXvYqwh8ncpMiFVjXYefVItDpoiwQzhG8050eHpaLpG6eiCmNlj6Nh2jaVbtG9Wuk22BAaHia9csZ47hMVFYiRkVPo=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr17632223otq.281.1580226607561; 
 Tue, 28 Jan 2020 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20190821203835.18314-1-daniel.vetter@ffwll.ch>
 <20190822122038.GK5942@intel.com>
In-Reply-To: <20190822122038.GK5942@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 28 Jan 2020 16:49:56 +0100
Message-ID: <CAKMK7uHYJBsYbSkUbrAa4e6odrax4uij=CaNHkDewcoLJ3D6=w@mail.gmail.com>
Subject: Re: [PATCH] drm/crc: Actually allow to change the crc source
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMjoyMCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0
IDEwOjM4OjM1UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPb3BzLgo+ID4KPiA+
IEZpeGVzOiA5ZWRiZjFmYTYwMGEgKCJkcm06IEFkZCBBUEkgZm9yIGNhcHR1cmluZyBmcmFtZSBD
UkNzIikKPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+
ID4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiBDYzog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDIgKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kZWJ1Z2ZzX2NyYy5jCj4gPiBpbmRleCBiZTFiN2JhOTJmZmUuLjZmZTY5M2VlMTVmOSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gPiBAQCAtMzY5LDcgKzM2OSw3
IEBAIHZvaWQgZHJtX2RlYnVnZnNfY3J0Y19jcmNfYWRkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykK
PiA+Cj4gPiAgICAgICBjcmNfZW50ID0gZGVidWdmc19jcmVhdGVfZGlyKCJjcmMiLCBjcnRjLT5k
ZWJ1Z2ZzX2VudHJ5KTsKPiA+Cj4gPiAtICAgICBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJjb250cm9s
IiwgU19JUlVHTywgY3JjX2VudCwgY3J0YywKPiA+ICsgICAgIGRlYnVnZnNfY3JlYXRlX2ZpbGUo
ImNvbnRyb2wiLCBTX0lSVUdPIHwgU19JV1VTUiwgY3JjX2VudCwgY3J0YywKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmRybV9jcnRjX2NyY19jb250cm9sX2ZvcHMpOwo+Cj4gUmV2aWV3
ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpG
b3VuZCB0aGlzIG9sZCBwYXRjaCBvZiBtaW5lLCBmaW5hbGx5IGFwcGxpZWQgaXQuIFRoYW5rcyBm
b3IgeW91ciByZXZpZXcuCi1EYW5pZWwKCj4KPiBCdXQgY291bGQgd2UgcGxlYXNlIGdvIG9jdGFs
PyBNeSBicmFpbiBjYW4ndCBkZWNvZGUgdGhhdCBhbHBoYWJldCBzb3VwLgo+Cj4gPiAgICAgICBk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkYXRhIiwgU19JUlVHTywgY3JjX2VudCwgY3J0YywKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmRybV9jcnRjX2NyY19kYXRhX2ZvcHMpOwo+ID4gLS0K
PiA+IDIuMjMuMC5yYzEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwK
CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
