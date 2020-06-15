Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C631F8FC1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA496E27A;
	Mon, 15 Jun 2020 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE0A89CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 05:50:36 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id w18so16502173iom.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EfP5hZSQNzjQqMkWc9LoRXc1AAXxZHM8N9PyJWorKz4=;
 b=OZpP7pmFsGmdxfS3l7uamNicZ8uQ9Nf8MR0kC6l/Pylv2f33o6F24h0bpzGfnyXBFW
 5WWD5ZdB4FbEP6XgNmVN/I/lu5Po/R06+vSXGDdATGWAASgmjZwTL7BjbDf8xSkX4bLn
 NvXWEBf0YYdsh5NZACwjgmMVIxKlBjvbArIrI7x81zZEP9jcjTPCwI+rYqtQKHnMkpd/
 PLUN7P2RBZQ+ofxirAEShpREIO9P2aOlf7/3c1iZ5/MK9NJ2OLO1XrpiNrA1SLuQTndi
 3mA9KZYkXv6PV/m0QxLN3Nz1rJsCxRpY0lRvU0xbHuXq00+yKGSdmyDRWY0GXXflXEf7
 xlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EfP5hZSQNzjQqMkWc9LoRXc1AAXxZHM8N9PyJWorKz4=;
 b=GjvUjYzTneXewt45JX1rOtyPlTad0pZKrdee3pekRamZxj+q4afzW2hAUkMmN5Rb8q
 VBudkKnIVLBFbrBd7nBr17pljdDkmuLOJxUz6q/GXdnSvsTzWul9L4RGZ542hYBO+ClX
 JIgeEX1ybrAP8wjD9lz2ruguiUszR1escXtcu9/dh4cIaS3LpiqtQEho3VFQpsH74EfS
 hXiHdEH3QKdhLfzZIP6uUO/0ylTld50r0O8jbkHuWdSvgNRPVKdOJ4bSef76NjukEuck
 bViYiBOZRuEX7yVYSDbzqnqMMA4KT/oX4QyLwLn9XNuaY62Q+9nzeZ4+i8tQj7Skiezw
 ralg==
X-Gm-Message-State: AOAM532ZbS2ShFPFM5e64R/RYdM3mDIMq2Hwd1QnvYk2bwbPCfg5uxp1
 yww4ik0MF5RO3NW/mIzbkA3w53yX7aGhdoxy9dY=
X-Google-Smtp-Source: ABdhPJxz5YVDWt61fjYvqGw81By3kuArLbE5XdDIQNJvf/HKkZgzu8y6e9oqRac/mywKrTNKpTfgNMjzA98j5esPH4I=
X-Received: by 2002:a02:c9c5:: with SMTP id c5mr20110262jap.5.1592200235543;
 Sun, 14 Jun 2020 22:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200614062349epcas1p1e285479c1e6483708b62f93e70a453a4@epcas1p1.samsung.com>
 <20200614062339.87374-1-navid.emamdoost@gmail.com>
 <027d9eb5-a1c1-c329-72c3-a555b71f8677@samsung.com>
In-Reply-To: <027d9eb5-a1c1-c329-72c3-a555b71f8677@samsung.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 15 Jun 2020 00:50:24 -0500
Message-ID: <CAEkB2ESuG7omgvdEnfQ+hV_uWa1mhK=22VnN++TaFqOycaTc_A@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix ref count leak in mic_pre_enable
To: Inki Dae <inki.dae@samsung.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen McCamant <smccaman@umn.edu>,
 linux-arm-kernel@lists.infradead.org, Navid Emamdoost <emamd001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTQsIDIwMjAgYXQgNzo0NyBQTSBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3Vu
Zy5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiAyMC4gNi4gMTQuIOyYpO2bhCAzOjIz7JeQIE5hdmlk
IEVtYW1kb29zdCDsnbQo6rCAKSDsk7Qg6riAOgo+ID4gaW4gbWljX3ByZV9lbmFibGUsIHBtX3J1
bnRpbWVfZ2V0X3N5bmMgaXMgY2FsbGVkIHdoaWNoCj4gPiBpbmNyZW1lbnRzIHRoZSBjb3VudGVy
IGV2ZW4gaW4gY2FzZSBvZiBmYWlsdXJlLCBsZWFkaW5nIHRvIGluY29ycmVjdAo+ID4gcmVmIGNv
dW50LiBJbiBjYXNlIG9mIGZhaWx1cmUsIGRlY3JlbWVudCB0aGUgcmVmIGNvdW50IGJlZm9yZSBy
ZXR1cm5pbmcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5l
bWFtZG9vc3RAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX21pYy5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fbWljLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
bWljLmMKPiA+IGluZGV4IGE4NmFiYzE3MzYwNS4uNjlmZjc0YzJjZWI1IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKPiA+IEBAIC0yNzAsNyArMjcwLDcg
QEAgc3RhdGljIHZvaWQgbWljX3ByZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkK
PiA+Cj4gPiAgICAgICByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKG1pYy0+ZGV2KTsKPiA+ICAg
ICAgIGlmIChyZXQgPCAwKQo+ID4gLSAgICAgICAgICAgICBnb3RvIHVubG9jazsKPiA+ICsgICAg
ICAgICAgICAgZ290byB0dXJuX29mZjsKPgo+IEhvdyBhYm91dCBqdXN0IGNhbGxpbmcgcG1fcnVu
dGltZV9wdXRfbm9pZGxlKCk/Cj4KPiBpZiAocmV0IDwgMCkgewo+ICAgICAgICAgcG1fcnVudGlt
ZV9wdXRfbm9pZGxlKG1pYy0+ZGV2KTsKPiAgICAgICAgIGdvdG8gdW5sb2NrOwo+IH0KPgp2MiB3
YXMgc2VudC4KCj4gVGhhbmtzLAo+IElua2kgRGFlCj4KPiA+Cj4gPiAgICAgICBtaWNfc2V0X3Bh
dGgobWljLCAxKTsKPiA+Cj4gPgoKCgotLSAKTmF2aWQuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
