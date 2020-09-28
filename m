Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684427A6F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 07:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE6289C99;
	Mon, 28 Sep 2020 05:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9562C89C99
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 05:29:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p9so6724163ejf.6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 22:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cTYd7wmIi4TDdaVUBfN6KvKT6wGrah9q+Jv/we6jv94=;
 b=Zd2Eok9Da/H0+7X9TBLZR6ZW6KAkfoqgenOKGpdtH2WG9A8XEqWoYZ4GYcLR/RmCnC
 6Nm+UP5UG/2xA2Xq27eUksXHU1bFA+W1x852xfiiLR5joHOlFWGRPWXn9nAnsta/1n7F
 sz24kFO2L3qXf/qksLVdZ3p4gWnf/L5Osov+5qvsJwQMVLLd60BaY8BjBtsadoU2Hvnl
 ETaIybyt/HB02Lm6GsEgBtBTBDkr11sKxkB6op8CjSrk73pkbBjT8TnlifQATLEgwRpE
 zWlo0V64Skv70buvtslX4v3s2Y7A2E+NkcsDIlxc2z2pgUrrhE0dgi1BExVcw/Gw+yqY
 KGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cTYd7wmIi4TDdaVUBfN6KvKT6wGrah9q+Jv/we6jv94=;
 b=dIwmhBQs/cgp8QdgV1wMPJNZzMoTCpJzeIPvf92fu8UGzvsfKNY0nP21s7hxm6HXYs
 cAqALA/fSEho0Efs8bUbE6beZxSR6ZolGxC06jr84oJ8TiAUXTVWXFdtFM0Z2ffNcyZ0
 eZFr1bqZ/+jB8aEP1CXry1rk09f9GMZPlxlUYubyyuwVFxUjoh921xMSwZ9uFPk2jlsD
 Jsuy59SFP9rpi7WUxdgVUuMSxkd1QfvSF04NS852v/i5dX85O+4ZF44E5437+SKts+qd
 y4BDoq3we9e1+SRgx03fcivKZpmIXfssxalL2N6N041OSOcqJXOeTMXvj6LiVSSMJxya
 JMuw==
X-Gm-Message-State: AOAM5305rC9nWVSxr3VQ2GzjLNmYc23pR1cR1tRWG8FDPUgXI0JTp5ZW
 0UmHpImFeXORxay4mFFwoMZUuN6PqXkOlMZKwhk=
X-Google-Smtp-Source: ABdhPJyi4eICUmKsX1SBKtEyWA7/Xn+t/RZIanTfxRZE8RUXESE+m1XnqsdpswyuVgv78q+RZd/iBA6XuT02l+LaAfs=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr21576ejd.419.1601270949184; 
 Sun, 27 Sep 2020 22:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200925145540.1214-1-christian.koenig@amd.com>
In-Reply-To: <20200925145540.1214-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Sep 2020 15:28:57 +1000
Message-ID: <CAPM=9tyG=3yjVoK4i6cFfHvmD3-o5E5igGnqD_Zvxd5fUbkYJA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/ttm: move SG flag check into ttm_bo_vm_reserve
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
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNiBTZXAgMjAyMCBhdCAwMDo1NSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSnVzdCBjaGVjayBlYXJsaWVyIGlm
IGEgQk8gY2FuIGJlIHBhZ2UgZmF1bHRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpOaWNl
IHdvcmssCgpGb3IgdGhlIHNlcmllcwoKUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVk
QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwg
MTYgKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gaW5kZXggOThhMDA2ZmMz
MGE1Li45OTFlZjEzMmUxMDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBAQCAtMTU3
LDYgKzE1NywxNSBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9yZXNlcnZlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZNX0ZBVUxU
X05PUEFHRTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFJlZnVzZSB0
byBmYXVsdCBpbXBvcnRlZCBwYWdlcy4gVGhpcyBzaG91bGQgYmUgaGFuZGxlZAo+ICsgICAgICAg
ICogKGlmIGF0IGFsbCkgYnkgcmVkaXJlY3RpbmcgbW1hcCB0byB0aGUgZXhwb3J0ZXIuCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIGlmIChiby0+dHRtICYmIChiby0+dHRtLT5wYWdlX2ZsYWdzICYg
VFRNX1BBR0VfRkxBR19TRykpIHsKPiArICAgICAgICAgICAgICAgZG1hX3Jlc3ZfdW5sb2NrKGJv
LT5iYXNlLnJlc3YpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+
ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wo
dHRtX2JvX3ZtX3Jlc2VydmUpOwo+IEBAIC0yODEsMTMgKzI5MCw2IEBAIHZtX2ZhdWx0X3QgdHRt
X2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ICAgICAgICAgdm1f
ZmF1bHRfdCByZXQgPSBWTV9GQVVMVF9OT1BBR0U7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGFk
ZHJlc3MgPSB2bWYtPmFkZHJlc3M7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBSZWZ1c2Ug
dG8gZmF1bHQgaW1wb3J0ZWQgcGFnZXMuIFRoaXMgc2hvdWxkIGJlIGhhbmRsZWQKPiAtICAgICAg
ICAqIChpZiBhdCBhbGwpIGJ5IHJlZGlyZWN0aW5nIG1tYXAgdG8gdGhlIGV4cG9ydGVyLgo+IC0g
ICAgICAgICovCj4gLSAgICAgICBpZiAoYm8tPnR0bSAmJiAoYm8tPnR0bS0+cGFnZV9mbGFncyAm
IFRUTV9QQUdFX0ZMQUdfU0cpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lH
QlVTOwo+IC0KPiAgICAgICAgIGlmIChiZGV2LT5kcml2ZXItPmZhdWx0X3Jlc2VydmVfbm90aWZ5
KSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKm1vdmluZyA9IGRtYV9mZW5j
ZV9nZXQoYm8tPm1vdmluZyk7Cj4KPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
