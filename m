Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B036FB57
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 15:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8026F452;
	Fri, 30 Apr 2021 13:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D76F452
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 13:17:19 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d12so13497564qtr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wVFMZhAPv4uooZBQnFvhHza47m5Myujqkbzk9IoJBns=;
 b=MSYMBLC7z2I/oFBmGIc2yDzAzMJAKIJ2xQWctSekWNrsa96zCwRU55sDneZ/pKwFaq
 UjzqaQxdwUwS74+2VDSFsaUZaQJjA7C5yp+U63bo9lCduE7zE2lnQwhk8ph6G8YUjIkD
 YDEM/vC7bhUmyCbVkAMsNZgAgOtnbYDcGVmUe8aoRpCFTvwy9J74eHm+InYaPSYxAT00
 IprzwUl4t8TLnrziO7BRi2vscYPJRjKoxvYp8g7nGCz3JWHewKLJGZCl4OMzl8NonFhn
 aVbjQ/W6+eShxkR2GwwBeT0k9BMmoVBwyyFL1HoEr5XFMWM9I9F1idCl1gWR+wWx5SEU
 65Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wVFMZhAPv4uooZBQnFvhHza47m5Myujqkbzk9IoJBns=;
 b=BuoMg6rPZhWJQul5cyLZ+LPm/jueRdqNok8hkvcESqaw4Eudf8T+ixAFHUYe+LX3q0
 vKzRi4Oj4s59rwZvE5qIKmqmi0TgRg/4JMT3Sx325YvscgK8RHasRu8ovBUNqyzyCdDX
 PuEzNfWRXwjTtz/Wlrjmfp+ZXIT4sPXQsVit1CD3LxV6gKAnW451sr87ZO8u295ax8Xp
 FphpP/KmCF8HFJoaPQ4MwD5Fv+W7S9vlkF2f2snCudRyn5IUL2HqmXR5WwvaJ8uOX08I
 mHnPXFlncJ0ACMXIYTRJgqzyWL87lr9AjA7bgU53fIBT09gyJLjiGp2P9rYa/3n2v5Le
 WpdQ==
X-Gm-Message-State: AOAM531L6r4EcjXkUeN5ZIWBEOhS0YfpmlGQmpf0osQvVvpbm+/F3eWS
 ZkfVSVO/65fqV9hDXSUNMJX68KF/j18d5PMH/98=
X-Google-Smtp-Source: ABdhPJyLAB0v3NU7VQWguzN7ld+2OC/wsCy8ksHKsfmudg46KdBqKVufoX4SdFkfcsLmWbjwwnSZa1RWsYtKE3N4RsA=
X-Received: by 2002:a05:622a:1354:: with SMTP id
 w20mr4504176qtk.223.1619788638287; 
 Fri, 30 Apr 2021 06:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-7-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 30 Apr 2021 14:16:51 +0100
Message-ID: <CAM0jSHOn2zsC0JbO2ux6P+nU9gtXOTd8geJgNz_dxEYw5U9F_Q@mail.gmail.com>
Subject: Re: [PATCH 07/13] drm/ttm: flip over the sys manager to self
 allocated nodes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMCBBcHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTWFrZSBzdXJlIHRvIGFsbG9jYXRl
IGEgcmVzb3VyY2Ugb2JqZWN0IGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpPaywgSSBndWVzcyBJIGhhdmUgdG8ga2Vl
cCByZWFkaW5nLApSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYyB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3N5c19tYW5hZ2VyLmMKPiBpbmRleCBlZDkyNjE1MjE0ZTMuLmE5MjYxMTRlZGZl
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYwo+IEBAIC0zLDE4ICsz
LDI1IEBACj4gICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9yZXNvdXJjZS5oPgo+ICAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPgo+ICBzdGF0aWMgaW50IHR0bV9zeXNfbWFu
X2FsbG9jKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbWVtKQo+ICB7Cj4g
KyAgICAgICBtZW0tPm1tX25vZGUgPSBremFsbG9jKHNpemVvZigqbWVtKSwgR0ZQX0tFUk5FTCk7
Cj4gKyAgICAgICBpZiAoIW1lbS0+bW1fbm9kZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07Cj4gKwo+ICsgICAgICAgdHRtX3Jlc291cmNlX2luaXQoYm8sIHBsYWNlLCBtZW0tPm1t
X25vZGUpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCB0dG1fc3lz
X21hbl9mcmVlKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbWVtKQo+ICB7Cj4gKyAgICAg
ICBrZnJlZShtZW0tPm1tX25vZGUpOwo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1f
cmVzb3VyY2VfbWFuYWdlcl9mdW5jIHR0bV9zeXNfbWFuYWdlcl9mdW5jID0gewo+IC0tCj4gMi4y
NS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
