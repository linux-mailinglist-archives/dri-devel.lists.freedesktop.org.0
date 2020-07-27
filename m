Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD322F765
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E589F71;
	Mon, 27 Jul 2020 18:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956889E8C;
 Mon, 27 Jul 2020 18:12:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a15so15803160wrh.10;
 Mon, 27 Jul 2020 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n+cjMJexAD4hVslCLfZxYw0xSj4v32Cg73ix8mAo6lQ=;
 b=rvXZRTq8JQeLezn3Y8PtrvIvpSkDiBHveZhfRmIRsSBeDJZnjKqBGy+QWwELGHHK9h
 IcMm8HWjNIwnu3YVdbwj7AmtnCfpAhFZ+Rpc4w8N91b/7XRDjPtMUQxHAY+v6x5JU1nS
 3XcXWMQ8Z6v41HCiM/COJFtN8CNp79O9B+gMY9IdeHjA7WwIXl3acZ7NJYKKF2pW6le1
 9956/PiAmuH96Npac+3FjCpIR1YH8sTu6ZSf+wTE+16ZZ4Wm2B1q9cjwtZTrnH27vFLU
 Os2LTJRtUv0ccsrNI3bsAmwtod5CkcmTpMeDKKx+aTuxVAdxyuvYtKYrRed634svN5W2
 SgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n+cjMJexAD4hVslCLfZxYw0xSj4v32Cg73ix8mAo6lQ=;
 b=gyjzUvE+H9QeMGnVOt8VSGVRaE3OE3qO+2IBMbEkZt9xt4B3QtBhsl9iEs268fO/i7
 zgjtp2+ZMG3j6iO4FNuceFzdNpuFBtvpSvcKAGFUlvWuDfr5cxjSvy4XlE4wGOaNaatk
 HEVX6dkwDgXkxmzr6ASCu2IJsu7ZkLqhGebU2bdsjCuLlDR+2fUmJ/dCODFbq2yFJ9nG
 F9NP0fhiwQKYuwswHiEGaj5ra84hSJaMQgOMqvHZLO7QJLlW9lujvpS4kiYwOftTQOL0
 GImSJsO/sjO8d0OmEE9G/KYbJRDl7YV7f9o88znCIULHCpt8p4DxT95SXejoemnaP7BT
 C4fw==
X-Gm-Message-State: AOAM533ebV9KoMqp7uy0TkKqddXqk+Y3/kbTORMdipi/qdz61ZkJqRm7
 EDB5LV51LiUJWbtF03ArrOCahueztm4WQ0l9WHY=
X-Google-Smtp-Source: ABdhPJwFtDW1X9++0RKW78h+dwtCDaX++VHQCmLYontPEXnwlgS2w9CTdMWsfkGtAl4r3B+vtG4bXra770bQd6VRpaY=
X-Received: by 2002:adf:a351:: with SMTP id d17mr21027063wrb.111.1595873530004; 
 Mon, 27 Jul 2020 11:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
 <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
In-Reply-To: <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2020 14:11:58 -0400
Message-ID: <CADnq5_OqdUxSKv21pg9o=a_dwyW7-j3URy+BYHrS+ubzuA-7NQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: avoid a useless memset
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgSnVsIDI3LCAyMDIwIGF0IDk6NDEgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gQW0gMjcuMDcuMjAgdW0gMTI6MzQgc2NocmllYiBDaHJpc3RvcGhlIEpBSUxMRVQ6Cj4g
PiBBdm9pZCBhIG1lbXNldCBhZnRlciBhIGNhbGwgdG8gJ2RtYV9hbGxvY19jb2hlcmVudCgpJy4K
PiA+IFRoaXMgaXMgdXNlbGVzcyBzaW5jZQo+ID4gY29tbWl0IDUxOGEyZjE5MjVjMyAoImRtYS1t
YXBwaW5nOiB6ZXJvIG1lbW9yeSByZXR1cm5lZCBmcm9tIGRtYV9hbGxvY18qIikKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5h
ZG9vLmZyPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2dhcnQuYyB8IDEgLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMKPiA+IGluZGV4IGI3Y2UyNTRlNTY2My4u
MzgwOGE3NTMxMjdiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZ2FydC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMK
PiA+IEBAIC04NSw3ICs4NSw2IEBAIGludCByYWRlb25fZ2FydF90YWJsZV9yYW1fYWxsb2Moc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gPiAgICAgICB9Cj4gPiAgICNlbmRpZgo+ID4gICAg
ICAgcmRldi0+Z2FydC5wdHIgPSBwdHI7Cj4gPiAtICAgICBtZW1zZXQoKHZvaWQgKilyZGV2LT5n
YXJ0LnB0ciwgMCwgcmRldi0+Z2FydC50YWJsZV9zaXplKTsKPiA+ICAgICAgIHJldHVybiAwOwo+
ID4gICB9Cj4gPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
