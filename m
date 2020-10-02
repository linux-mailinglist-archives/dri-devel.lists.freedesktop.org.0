Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045C280FAB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 11:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4BA6E2A3;
	Fri,  2 Oct 2020 09:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E96E2A3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 09:17:14 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 26so613199ois.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOSBZhRJFAS3qCbbsmdSRECKQCWTp4XJnM6+JbGouE8=;
 b=Q1NWiFYrGoiVj8cPZOh/wIS3GBEKthMOhhSVItT2PkfoE8a/r85ybXAyadNCb6SXYy
 o/Isu3WojxnrpucBzfqG1IbMqo+JysKnRZsUZFHNZ9cBb5ug8Dx+fPzHylrpNZFsgydU
 cuInvQMKg1t/x9YixJG1rYLyss/3E+i7bfHgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOSBZhRJFAS3qCbbsmdSRECKQCWTp4XJnM6+JbGouE8=;
 b=cH5WMI9dcgZJuLqKyjkAuuxGwXMnRPvBfrXDiOYFaQWDPQOxW0Q2PiTSeRockEIF5e
 tuYWl04zr6PLAByFTADyLko1Vz043MjQeu1zA/dpZwBK54UJ75wV5JLH4v79RVvpcBFb
 0vtR7rtliZKb3TlyybtIxvcPZe93xRRFxsItkMgx1ClYUhGm+dOUCjgX1mLL35v71MOY
 a8JDJxYIEEH1KM8W27/UlYxU2nThzPkFjp38x/gm898dGbi/846R9RWGoF3/4w4XsYI4
 kMXdW6RIPlWkK5vTrgN6+gbHtQ3ujh2h6IaSawxSrATufDJGEKg+oTelLXn6p8lARvUY
 INiQ==
X-Gm-Message-State: AOAM5316QPSvbtxRFvAQ/rPNWNT2X5djuxrta6qDot4RJfPugNGg1Fvy
 ZiTRl0M9QWq9QinjZ5YSN2CyGFH7xN9iRtvH2NRNwA==
X-Google-Smtp-Source: ABdhPJxMIBIgDbjxQawoe36BvxUoF+2qBu/w4Dtzo53mWOKoaSDyHPYVhsi2KBVRUvIqApY/cBxumEnnsgYho/usjJw=
X-Received: by 2002:aca:eb49:: with SMTP id j70mr621408oih.101.1601630233557; 
 Fri, 02 Oct 2020 02:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201002084707.2203-1-christian.koenig@amd.com>
 <20201002084707.2203-4-christian.koenig@amd.com>
In-Reply-To: <20201002084707.2203-4-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Oct 2020 11:17:02 +0200
Message-ID: <CAKMK7uEgD-1ErZAG=ojVw6-AKiUkr0hUjzp+CHgU3Cg4uwqDiQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/vmwgfx: move ttm_bo_swapout_all into vmwgfx
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMiwgMjAyMCBhdCAxMDo0NyBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJdCBpcyB0aGUgc29sZSB1c2Vy
IG9mIHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CgpQYXRjaGVzIDEsIDMmNDogQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpQYXRjaCAxIGlzIG1heWJlIGEgYml0IGJpZyBhbmQg
c2hvdWxkbid0IGJlIGFsbCBzbWFzaGVkLCBidXQgd2hhdGV2ZXIuCi1EYW5pZWwKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAgNiArKysrKy0KPiAgaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgfCAgMSAtCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGlu
ZGV4IDVjNTgzNmM0Mjg0ZS4uNzQ3MDhkZDRhOGU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4g
QEAgLTEzMDgsMTcgKzEzMDgsNiBAQCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4ICpjdHgpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fc3dhcG91dCk7Cj4K
PiAtdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwodm9pZCkKPiAtewo+IC0gICAgICAgc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsKPiAtICAgICAgICAgICAgICAgLmludGVycnVwdGlibGUg
PSBmYWxzZSwKPiAtICAgICAgICAgICAgICAgLm5vX3dhaXRfZ3B1ID0gZmFsc2UKPiAtICAgICAg
IH07Cj4gLQo+IC0gICAgICAgd2hpbGUgKHR0bV9ib19zd2Fwb3V0KCZjdHgpID09IDApOwo+IC19
Cj4gLUVYUE9SVF9TWU1CT0wodHRtX2JvX3N3YXBvdXRfYWxsKTsKPiAtCj4gIHZvaWQgdHRtX2Jv
X3R0X2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgewo+ICAgICAgICAg
aWYgKGJvLT50dG0gPT0gTlVMTCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+IGlu
ZGV4IDJmOTkwNzllMTIyYi4uZGNiY2IwNGZmMjdjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMKPiBAQCAtMTM2NCw2ICsxMzY0LDEwIEBAIHN0YXRpYyBpbnQgdm13X3BtX2Zy
ZWV6ZShzdHJ1Y3QgZGV2aWNlICprZGV2KQo+ICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYg
PSB0b19wY2lfZGV2KGtkZXYpOwo+ICAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgICAgICAgIHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3By
aXYgPSB2bXdfcHJpdihkZXYpOwo+ICsgICAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0
eCA9IHsKPiArICAgICAgICAgICAgICAgLmludGVycnVwdGlibGUgPSBmYWxzZSwKPiArICAgICAg
ICAgICAgICAgLm5vX3dhaXRfZ3B1ID0gZmFsc2UKPiArICAgICAgIH07Cj4gICAgICAgICBpbnQg
cmV0Owo+Cj4gICAgICAgICAvKgo+IEBAIC0xMzg0LDcgKzEzODgsNyBAQCBzdGF0aWMgaW50IHZt
d19wbV9mcmVlemUoc3RydWN0IGRldmljZSAqa2RldikKPiAgICAgICAgIHZtd19leGVjYnVmX3Jl
bGVhc2VfcGlubmVkX2JvKGRldl9wcml2KTsKPiAgICAgICAgIHZtd19yZXNvdXJjZV9ldmljdF9h
bGwoZGV2X3ByaXYpOwo+ICAgICAgICAgdm13X3JlbGVhc2VfZGV2aWNlX2Vhcmx5KGRldl9wcml2
KTsKPiAtICAgICAgIHR0bV9ib19zd2Fwb3V0X2FsbCgpOwo+ICsgICAgICAgd2hpbGUgKHR0bV9i
b19zd2Fwb3V0KCZjdHgpID09IDApOwo+ICAgICAgICAgaWYgKGRldl9wcml2LT5lbmFibGVfZmIp
Cj4gICAgICAgICAgICAgICAgIHZtd19maWZvX3Jlc291cmNlX2RlYyhkZXZfcHJpdik7Cj4gICAg
ICAgICBpZiAoYXRvbWljX3JlYWQoJmRldl9wcml2LT5udW1fZmlmb19yZXNvdXJjZXMpICE9IDAp
IHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBpbmRleCBmMGZiZWY3ODE3YzYuLjYzMGNlMjI4OGRlNyAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gKysrIGIvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC01NDIsNyArNTQyLDYgQEAgc3NpemVfdCB0dG1f
Ym9faW8oc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsIHN0cnVjdCBmaWxlICpmaWxwLAo+ICAgICAg
ICAgICAgICAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpmX3BvcywgYm9vbCB3cml0ZSk7Cj4K
PiAgaW50IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KTsKPiAt
dm9pZCB0dG1fYm9fc3dhcG91dF9hbGwodm9pZCk7Cj4KPiAgLyoqCj4gICAqIHR0bV9ib191c2Vz
X2VtYmVkZGVkX2dlbV9vYmplY3QgLSBjaGVjayBpZiB0aGUgZ2l2ZW4gYm8gdXNlcyB0aGUKPiAt
LQo+IDIuMTcuMQo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
