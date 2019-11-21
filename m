Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA8106879
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48746F4DC;
	Fri, 22 Nov 2019 09:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A46F4C0;
 Thu, 21 Nov 2019 18:09:15 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i11so4479940iol.13;
 Thu, 21 Nov 2019 10:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhDv8B/MH9k+2gQLkxu3wNqBY8ATU21NQy45rVB5e/0=;
 b=cNo7Fuu8pNLOUQ2caOnhbYh1itx5q4oxtlC6fznvigmJbZ5AZxlum9DpL3kJyEHkll
 hI8lNNem6GBUazz5wixO7CTEMlbE8snlUjMUTYJuUvapRgT5Pxueu5jJ86d6e+EkCrwk
 0zUITUOXSJkJo/CP89stg4OYPrAeMearrWAYvsXMzo+/CHT4dWqrljNlvLiYBhOtTvXB
 zei+jLmcF2aj7xqcJwp43Y4Eie79GyyjUaxAorOnBgW1T3kU0NCSr+Td6enlkR/UgAJh
 ts42Xc7d7hahF8nQXjhYqxlfiNsG6LJDLnzw4RD9gDFNm1g7pYW8eRySg7D66r/H8/4C
 FU3A==
X-Gm-Message-State: APjAAAUyDePSf+zPd8g59z6fQxXXYM7HZsNJ8UfEyA7vcpU1952XGx9p
 e4l6gFZIMOnOJgiQ1dlTn7FtZRYpIADsTqMQ9Ds=
X-Google-Smtp-Source: APXvYqxlo2bv+bM+ry7TgMS2bHzA+FeG4N2aN4fgU0MpxQpJgbxeccusuTVlwBNNkJxfQTfEZoio57HSh9Teo0+EC80=
X-Received: by 2002:a02:ce51:: with SMTP id y17mr7688720jar.1.1574359754949;
 Thu, 21 Nov 2019 10:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021211449.9104-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:09:04 -0600
Message-ID: <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bhDv8B/MH9k+2gQLkxu3wNqBY8ATU21NQy45rVB5e/0=;
 b=JZBgJAoHLsaELThn5k6UAy5s4Qo+A7dUCdsWtG0c42UhKK3t+dMn/5paQKhgqRE532
 uu5lgnDMfAtg5I1V+8oaBRUjskvJu4k+FHeV2d38VLXO22aaGK6tzwMLVcsJcrx5HJSS
 Imay1ryOzoA2d5/D7lv7a6qluP3VEAIvRK5t7Xb2R4f+9EUnzkpbcv9CEcoQ8aE6Zr+6
 RKfUJj8XpzVDUz5E1eANFZ4CnzI4DU9eAurhl5e84U/clJmkiDAOuLly9caEvcBcpozR
 4lgp2i+TSUJsD/fbwXufE++3B1lScdQr0tN/OGW/vSu5DAzRZeDYM/+pwm3TFfrYyw57
 nltg==
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNDoxNCBQTSBOYXZpZCBFbWFtZG9vc3QKPG5hdmlkLmVt
YW1kb29zdEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIG5v
dXZlYXVfYm9fYWxsb2MoKSBpZiBpdCBmYWlscyB0byBkZXRlcm1pbmUgdGhlCj4gdGFyZ2V0IHBh
Z2Ugc2l6ZSB2aWEgcGksIHRoZW4gdGhlIGFsbG9jYXRlZCBtZW1vcnkgZm9yIG52Ym8gc2hvdWxk
IGJlCj4gcmVsZWFzZWQuCj4KPiBGaXhlczogMDE5Y2JkNGE0ZmViICgiZHJtL25vdXZlYXU6IElu
aXRpYWxpemUgR0VNIG9iamVjdCBiZWZvcmUgVFRNIG9iamVjdCIpCj4gU2lnbmVkLW9mZi1ieTog
TmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgoKV291bGQgeW91IHBs
ZWFzZSByZXZpZXcgdGhpcyBwYXRjaD8KCgpUaGFua3MsCk5hdmlkLgoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMKPiBpbmRleCBmODAxNWUwMzE4ZDcuLjE4ODU3Y2Y0NDA2OCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtMjc2LDggKzI3NiwxMCBAQCBub3V2
ZWF1X2JvX2FsbG9jKHN0cnVjdCBub3V2ZWF1X2NsaSAqY2xpLCB1NjQgKnNpemUsIGludCAqYWxp
Z24sIHUzMiBmbGFncywKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAg
IH0KPgo+IC0gICAgICAgaWYgKFdBUk5fT04ocGkgPCAwKSkKPiArICAgICAgIGlmIChXQVJOX09O
KHBpIDwgMCkpIHsKPiArICAgICAgICAgICAgICAga2ZyZWUobnZibyk7Cj4gICAgICAgICAgICAg
ICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICAvKiBE
aXNhYmxlIGNvbXByZXNzaW9uIGlmIHN1aXRhYmxlIHNldHRpbmdzIGNvdWxkbid0IGJlIGZvdW5k
LiAqLwo+ICAgICAgICAgaWYgKG52Ym8tPmNvbXAgJiYgIXZtbS0+cGFnZVtwaV0uY29tcCkgewo+
IC0tCj4gMi4xNy4xCj4KCgotLSAKTmF2aWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
