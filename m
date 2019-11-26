Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093910AB73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4066E247;
	Wed, 27 Nov 2019 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0B6E442;
 Tue, 26 Nov 2019 17:50:56 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id g12so8973559ild.2;
 Tue, 26 Nov 2019 09:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t54fAVQIi9k5/AbZql5pbL2ivaJ6crm1GO25m9MjvJc=;
 b=XoulAZWiniLes/GNXvFksn7km5RyL8ymujVtY09e2UVJVQKEC97tk6WIcH89vfZEN8
 jhsjvYqluThB9DLlW2fAnwalBquJLC9R/U/ha/Jcmk2NP2B/Ka96tjwvdk5Dhc/333HL
 goGpyBqigqAGmlt6wg0/k8czS+YOpB2p4KWx6zYs3TFUpmr1FaCalGgcJ/EuLR4YWoh4
 qNBNXCQ4+eb4xWRMeuvOHVMalj6VFF8YF/99OuOAbUL92qpBAa0LgxH6ZmeQmC2X6DY/
 GdXuho5dG1LKnUc/dMfEK+DPRH98mo1yueWsrnglL1k1LDeq6YrzOPTg6VAs0WQOV+s5
 X8JQ==
X-Gm-Message-State: APjAAAVOhGpsj9tQfW5j9d3H5rlGPHJpyK5FuDmrRkRlkYeX7Qzu6j0R
 DdQKUdBlGI02sHT5tKvHEvxuX1t4WGE4/f2nyau6Eg==
X-Google-Smtp-Source: APXvYqzm+6ORS3XPlQiKQzGWc5cG6OGpwMxeH1DU1CV56GkeNnwJblQL5RnEH0Uzo1SDohsp1pKp20tjI2IdfLHxu5A=
X-Received: by 2002:a92:ca8b:: with SMTP id t11mr26640081ilo.227.1574790656094; 
 Tue, 26 Nov 2019 09:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
 <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
In-Reply-To: <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 26 Nov 2019 11:50:44 -0600
Message-ID: <CAEkB2ER4dof02PcH6BDQoFNhkkds=zrPf+5-rSygUh=XU8H0zQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t54fAVQIi9k5/AbZql5pbL2ivaJ6crm1GO25m9MjvJc=;
 b=ATWoCaDTK3L62Ae6m3HNV6BKsPyvxBQuhyHHaO3QgvSSWyqbykVd4bX5NAIBjRvMio
 kLER7x38kNXm/78aAQD5HSJb0mAsWFcSkOF6txn5eWOPWmNF6bEpn1Y+ijU2c0ixBD2d
 zXol2/FurfuSesv7zr5bTxT+Z+bf0idq3SSf1/ekhPTSqbd11/HiKSUgGHn550ywg3IP
 SVdneLDrtS97GYycmry5pvAFNM0NQqSzN3GnJ94X3zA/7tnmLffKOKe+zLFLzLIoo4+B
 muMPEUw4KrHEh20uX9lRjQTtLEU9oGaCdZWkcxvYbZqKYd08cMN4Ol8cd8+MSJWH8lEU
 Fp2A==
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLgoKT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDkgUE0gTmF2aWQgRW1hbWRvb3N0
CjxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDIxLCAy
MDE5IGF0IDQ6MTQgUE0gTmF2aWQgRW1hbWRvb3N0Cj4gPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5j
b20+IHdyb3RlOgo+ID4KPiA+IEluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBub3V2ZWF1X2JvX2Fs
bG9jKCkgaWYgaXQgZmFpbHMgdG8gZGV0ZXJtaW5lIHRoZQo+ID4gdGFyZ2V0IHBhZ2Ugc2l6ZSB2
aWEgcGksIHRoZW4gdGhlIGFsbG9jYXRlZCBtZW1vcnkgZm9yIG52Ym8gc2hvdWxkIGJlCj4gPiBy
ZWxlYXNlZC4KPiA+Cj4gPiBGaXhlczogMDE5Y2JkNGE0ZmViICgiZHJtL25vdXZlYXU6IEluaXRp
YWxpemUgR0VNIG9iamVjdCBiZWZvcmUgVFRNIG9iamVjdCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBO
YXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+Cj4KPiBXb3VsZCB5b3Ug
cGxlYXNlIHJldmlldyB0aGlzIHBhdGNoPwo+Cj4KPiBUaGFua3MsCj4gTmF2aWQuCj4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDQgKysrLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gPiBpbmRleCBmODAxNWUwMzE4ZDcuLjE4
ODU3Y2Y0NDA2OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4g
PiBAQCAtMjc2LDggKzI3NiwxMCBAQCBub3V2ZWF1X2JvX2FsbG9jKHN0cnVjdCBub3V2ZWF1X2Ns
aSAqY2xpLCB1NjQgKnNpemUsIGludCAqYWxpZ24sIHUzMiBmbGFncywKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gLSAgICAgICBpZiAoV0FS
Tl9PTihwaSA8IDApKQo+ID4gKyAgICAgICBpZiAoV0FSTl9PTihwaSA8IDApKSB7Cj4gPiArICAg
ICAgICAgICAgICAga2ZyZWUobnZibyk7Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7Cj4gPiArICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIC8qIERpc2FibGUgY29t
cHJlc3Npb24gaWYgc3VpdGFibGUgc2V0dGluZ3MgY291bGRuJ3QgYmUgZm91bmQuICovCj4gPiAg
ICAgICAgIGlmIChudmJvLT5jb21wICYmICF2bW0tPnBhZ2VbcGldLmNvbXApIHsKPiA+IC0tCj4g
PiAyLjE3LjEKPiA+Cj4KPgo+IC0tCj4gTmF2aWQuCgoKCi0tIApOYXZpZC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
