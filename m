Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A236FCFF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25BF6F54D;
	Fri, 30 Apr 2021 15:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A336F54D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:04:46 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id u20so38793140qku.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jtR0NBZ0KecIgIrw4tmTmvy0v/jfkTllo4YltgX/ff8=;
 b=QZ+InoHVhEhvV3l2NMIPOsbjVNhqfyryFp1Vm3SiYBB+hFHpvXiJkXIlq0Te0lrtr7
 XgTojMkCMIdSe+/ySEWlqdyxWEROB8C44JrSxVqGTQJJivQr1KBiemCtiI1N3LIQQyvK
 ykQM1RAtMmRItOCkMUjjAHhpaomr7LyBs8z3IaLsowzFupnPXKQc49A3MU5txFlu3jiK
 DZzZPapepx9dKqXDrZULH7RFi4QsXCIBm8UtoZNW3hANpccpYUureytfH9fRlqdftmjH
 kNEnJp5atHOulywC15ubaFdpMRh8/PXGXdlPR+apskv0eAAhYYxOaZPm9qJ/7qVGeidY
 /vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jtR0NBZ0KecIgIrw4tmTmvy0v/jfkTllo4YltgX/ff8=;
 b=czWBr5ssGiESWBjtWvKuPlX5+VlNnXg1iWyJDNduAZIzcRgGRVFXWT71aDHGDq6O2D
 B91JOeNjNyftpn//RuG1BYm6+RKcMtar5nVg5wHwlRt5iEq9T3y6dtufNlQtcUYG/4cC
 PQCZxFrJaAhQhCDQJbIX4hnjA1apTxjrcw0Qiog1kxjEdTaieUe2Ud9OOdM3wixO0Lve
 2LTO+A0T5yXsG1l5F7ZdqX7vUAdvIk/NFjs+INAoLtzr/+vmlNqqy2Y7vBShFPhs7Gtp
 A3YQGhbUnpydmGA23RiOV8NcaVhZ2ZHk6Ad6F1QjT+cfSki9mNjShPUzcxjWvSojZoFt
 3UHg==
X-Gm-Message-State: AOAM532qau7bDFrKNcHxyGCGdhxDULw3e2YxDpowcUuJ/P3MOOKTYesS
 9xfrVVBcolnl3azoeHLvhkAFN5NUerXbwXQnUHr0XsYa0Ls=
X-Google-Smtp-Source: ABdhPJwN+WY2FLUljm0cw034Q3CEtAsxEOfnhnLMf2WG0VmgGnWmAMTlqwjSAelnkhzfhOMcEA/H5SZmPza8D7kaXcA=
X-Received: by 2002:a05:620a:1011:: with SMTP id
 z17mr5831810qkj.426.1619795085827; 
 Fri, 30 Apr 2021 08:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-7-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 30 Apr 2021 16:04:19 +0100
Message-ID: <CAM0jSHPX23up+orR+qqkBqsFTPsk1JO1Ds3zLxvjPTtR_WOmfg@mail.gmail.com>
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
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3N5c19tYW5hZ2VyLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3N5c19t
YW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5jCj4gaW5kZXgg
ZWQ5MjYxNTIxNGUzLi5hOTI2MTE0ZWRmZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fc3lzX21hbmFnZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3N5
c19tYW5hZ2VyLmMKPiBAQCAtMywxOCArMywyNSBAQAo+ICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1f
cmVzb3VyY2UuaD4KPiAgI2luY2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPgo+ICAjaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4K
PiAgc3RhdGljIGludCB0dG1fc3lzX21hbl9hbGxvYyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
dHRtX3BsYWNlICpwbGFjZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fcmVzb3VyY2UgKm1lbSkKPiAgewo+ICsgICAgICAgbWVtLT5tbV9ub2RlID0ga3phbGxvYyhz
aXplb2YoKm1lbSksIEdGUF9LRVJORUwpOwo+ICsgICAgICAgaWYgKCFtZW0tPm1tX25vZGUpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiArICAgICAgIHR0bV9yZXNvdXJj
ZV9pbml0KGJvLCBwbGFjZSwgbWVtLT5tbV9ub2RlKTsKClllYWgsIHdoeSBhcmUgd2UgcGFzc2lu
ZyB0aGUgbW1fbm9kZSBoZXJlLCBpdCdzIG5vdCB0aGUgdHRtX3Jlc291cmNlPwoKPiAgICAgICAg
IHJldHVybiAwOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgdHRtX3N5c19tYW5fZnJlZShzdHJ1Y3Qg
dHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAgewo+ICsgICAgICAga2ZyZWUobWVtLT5tbV9u
b2RlKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXJf
ZnVuYyB0dG1fc3lzX21hbmFnZXJfZnVuYyA9IHsKPiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
