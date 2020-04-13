Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA01A68F3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8D89E50;
	Mon, 13 Apr 2020 15:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9548589E50;
 Mon, 13 Apr 2020 15:35:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d27so1375466wra.1;
 Mon, 13 Apr 2020 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kZRVFgAOKld8tqLew8Q1nPTrfhvUAYvsUhfN119FV44=;
 b=senYnFL/5wmZhX/HSVLuTPNd2KNbQpWPv34anibBN37kMVZ4c+BSjLNHFLLSxIiXL+
 F72QrAf2laCHLLiLsvFmzkvMSSn1i4f+S35/qajJDW/2QTB9owld9yJjKWabdE+cbzLG
 4I56talOm1PbJH7a1RKfMw4ZSBVQ9ULgaOe/JyMnVNZB0s6xMvuQNC6JK6y+kfDOIp6d
 tx2DvVA/Nu9TG66lYlmkx94QkblE4tFiVBpZoqa09rzxyDj5RX3KAGIDA2SCA65hr35+
 Z7ReC3GdZCF/krUYwcs9FCSmQ0n8OYoP8Df8A4ySBrMn6a3wLC9EN2aNOyY/DcSg63Dy
 zbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kZRVFgAOKld8tqLew8Q1nPTrfhvUAYvsUhfN119FV44=;
 b=she7PI8kVLYm5Y2q930Ja2ITDYAN/tZXvpZ2RJGj7X/0l0oMtKvx/TWVbIAYDJwaxJ
 cCCShmmVWRfQhW2ojwy//K4RsIgBwVQqojlGOvn7Olmx9FC2+XYV7MjfcFhmg5KGfW89
 rQQLFnBSbDswND9/7or7wCThssDDHCa1xDy1iD/QmWgjyxV0yN6bV54Z5Tzvn0llEtUk
 FG8jlnb1n3AfHQJX0zr2GBRLRHDqQZ0mQLyo7wz+NHL+m71Q/PP96HPwY+IPrINZu5lA
 RFbEwmmQmmWIY5zr8Fh8mTFlO5kWkn/5PxtLcJBeR8SYdwtX8PS5s00ywBmEwxCL4eFj
 qOwA==
X-Gm-Message-State: AGi0Puamwe3MlOkvdURzu1OTafrD3VUm53wKYKWhNQ3nFTJCXk51dyh7
 ZE84HGUOvy4a5sSOlR+7QqWIZfEJLu5rD0iWDfC2Gw==
X-Google-Smtp-Source: APiQypJkGpX0VzTGcQjxPjZbdX/cgoIULertFmRCn31+Z3Ye8rbb1V7y3y3NA1qwc5A0cG/6NVjCk8Keqlovp5qthLI=
X-Received: by 2002:adf:fe45:: with SMTP id m5mr11061608wrs.124.1586792124298; 
 Mon, 13 Apr 2020 08:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <c76f92fc-b348-4d65-af6c-399e02969cf3@email.android.com>
In-Reply-To: <c76f92fc-b348-4d65-af6c-399e02969cf3@email.android.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:35:13 -0400
Message-ID: <CADnq5_ObHM4hJQ5Q4buq9n=1XRp7mt4S0ru-oqKxvnyR5yxvsw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Break out the loops if need_resched in bo
 delayed delete worker
To: "Koenig, Christian" <Christian.Koenig@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FuIHlvdSBtYWtlIHN1cmUgdGhpcyBsYW5kcyBpbiBkcm0tbWlzYz8KClRoYW5rcywKCkFsZXgK
Ck9uIEZyaSwgQXByIDEwLCAyMDIwIGF0IDg6MTUgQU0gS29lbmlnLCBDaHJpc3RpYW4KPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gQW0gMTAuMDQuMjAyMCAxMjo1OCBz
Y2hyaWViICJQYW4sIFhpbmh1aSIgPFhpbmh1aS5QYW5AYW1kLmNvbT46Cj4KPiBUaGUgZGVsYXll
ZCBkZWxldGUgbGlzdCBpcyBwZXIgZGV2aWNlIHdoaWNoIG1pZ2h0IGJlIHZlcnkgaHVnZS4gQW5k
IGluCj4gYSBoZWF2eSB3b3JrbG9hZCB0ZXN0LCB0aGUgbGlzdCBtaWdodCBhbHdheXMgbm90IGJl
IGVtcHR5LiBUaGF0IHdpbGwKPiB0cmlnZ2VyIGFueSBSQ1Ugc3RhbGwgd2FybmluZ3Mgb3Igc29m
dGxvY2t1cHMgaW4gbm9uLXByZWVtcHRpYmxlIGtlcm5lbHMKPiBMZXRzIGRvIGJyZWFrIG91dCB0
aGUgbG9vcHMgaW4gdGhhdCBjYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBhbiA8eGlu
aHVpLnBhbkBhbWQuY29tPgo+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggOWUwN2MzZjc1MTU2Li5jNWI1MTZmYTRl
YWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtNTE4LDcgKzUxOCw3IEBAIHN0YXRpYyBi
b29sIHR0bV9ib19kZWxheWVkX2RlbGV0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgYm9v
bCByZW1vdmVfYWxsKQo+ICAgICAgICAgIElOSVRfTElTVF9IRUFEKCZyZW1vdmVkKTsKPgo+ICAg
ICAgICAgIHNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+IC0gICAgICAgd2hpbGUgKCFsaXN0
X2VtcHR5KCZiZGV2LT5kZGVzdHJveSkpIHsKPiArICAgICAgIHdoaWxlICghbGlzdF9lbXB0eSgm
YmRldi0+ZGRlc3Ryb3kpICYmICFuZWVkX3Jlc2NoZWQoKSkgewo+ICAgICAgICAgICAgICAgICAg
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibzsKPgo+ICAgICAgICAgICAgICAgICAgYm8gPSBs
aXN0X2ZpcnN0X2VudHJ5KCZiZGV2LT5kZGVzdHJveSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
LAo+IC0tCj4gMi4xNy4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
