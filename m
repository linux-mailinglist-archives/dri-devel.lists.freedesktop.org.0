Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0C316E43
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 19:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDE46ECC2;
	Wed, 10 Feb 2021 18:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AA66ECC2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:16:08 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id d20so3035878oiw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kCoAvyn++S9ZO2SLgyP0zi8pWo7chF01OKA6DZG8CcQ=;
 b=dfisD3DgVMV0p+tD1rPis2vOuxutQ1Lbyn4S+AKoZGF+YwcVe6buKLlaxoeIK1Jow3
 xbok7QYzGdzO6gzhubVq/dFqaMokMPrYEKgMPckZVdP7rk4v5CX41woUAUDNpjJKH7Gz
 jdjEUPLd5r9OYuSXkGE20LWyqdFFrly99su/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kCoAvyn++S9ZO2SLgyP0zi8pWo7chF01OKA6DZG8CcQ=;
 b=bGmgcZs89qPmamdCyNqrI2P28gntzKvLqYAzur4vcyib7UA135PVtYgpVl6gqBs2aN
 jleOPA5tK+HvEUHFcM6Q1G/yDR78hYpBkEIy/7o7xifHQmX1QaQnQvl9fYP4luzkZH3/
 5lmO6lTkNoJgCuPIbTHl07X3GpSfIMOdeKE2XxGwXdGYfRGvUKoxAA3hmfZ6GDoXxQ44
 sNa8XMM6meUcixAHxY4LZvBPAQj8eZVD/CgDmqUEpsq04nNXxOA2wOzIl7b0oYUggZAV
 VWxuQ3K+ZawpsSFmzBNWwZT54mxF1yrwnkGuOnhcgZ+eu5z/ewzJAEqApbrSnuEG4Lre
 jQQw==
X-Gm-Message-State: AOAM533OCYO7AOMU/Qr78WsrfkGkP4UVgUaj1ifteU0229xp1xXgzd+2
 d40dFyNxcQHG+HgeVV9fMtrqr1K3yY55qwVpPwI7ug==
X-Google-Smtp-Source: ABdhPJwAtbfmVtL7ktS8w6AsLr+jo09Wwqm6jOIOqJb6Q/T4lyOUVjjwr2c82J9AX1f6MkyLZbeTIPBcF5ef3PI/8T8=
X-Received: by 2002:aca:df42:: with SMTP id w63mr160584oig.128.1612980967541; 
 Wed, 10 Feb 2021 10:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20210210160549.1462-1-christian.koenig@amd.com>
In-Reply-To: <20210210160549.1462-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 10 Feb 2021 19:15:56 +0100
Message-ID: <CAKMK7uHYoxc81QW+gDTVVaXdKizSLogr_TfzWyL_8caOx+0JgA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: make sure pool pages are cleared
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 efault@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgNTowNSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgb2xkIGltcGxlbWVudGF0
aW9uIHdhc24ndCBjb25zaXN0ZW5kIG9uIHRoaXMuCj4KPiBCdXQgaXQgbG9va3MgbGlrZSB3ZSBk
ZXBlbmQgb24gdGhpcyBzbyBiZXR0ZXIgYnJpbmcgaXQgYmFjay4KPgo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBSZXBvcnRlZC1h
bmQtdGVzdGVkLWJ5OiBNaWtlIEdhbGJyYWl0aCA8ZWZhdWx0QGdteC5kZT4KPiBGaXhlczogZDA5
OWZjOGY1NDBhICgiZHJtL3R0bTogbmV3IFRUIGJhY2tlbmQgYWxsb2NhdGlvbiBwb29sIHYzIikK
CldlbGwgSSB0aGluayBpbiBnZW5lcmFsIHRoZXJlJ3MgYSBiaXQgYW4gaXNzdWUgaW4gdHRtIHdp
dGggbm90CmNsZWFyaW5nIHN0dWZmIGV2ZXJ5d2hlcmUuIFNvIGRlZmluaXRlbHkgaW4gZmF2b3Vy
IG9mIGNsZWFyaW5nIHN0dWZmLgpMb29raW5nIGF0IHRoZSBjb2RlIHRoaXMgb25seSBmaXhlcyB0
aGUgY2xlYXJpbmcsIGF0IGFsbG9jIHRpbWUgd2UncmUKc3RpbGwgdmVyeSBvcHRpb25hbCB3aXRo
IGNsZWFyaW5nLiBJIHRoaW5rIHdlIHNob3VsZCBqdXN0IHNldApfX0dGUF9aRVJPIHVuY29uZGl0
aW9uYWxseSB0aGVyZSB0b28uCgpXaXRoIHRoYXQ6IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fcG9vbC5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+IGluZGV4IDc0YmYxYzg0YjYzNy4uNmUyN2Ni
MWJmNDhiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+IEBAIC0zMyw2ICszMyw3IEBACj4K
PiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBp
bmcuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4KPgo+ICAjaWZkZWYgQ09ORklHX1g4
Ngo+ICAjaW5jbHVkZSA8YXNtL3NldF9tZW1vcnkuaD4KPiBAQCAtMjE4LDYgKzIxOSwxNSBAQCBz
dGF0aWMgdm9pZCB0dG1fcG9vbF91bm1hcChzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIGRtYV9hZGRy
X3QgZG1hX2FkZHIsCj4gIC8qIEdpdmUgcGFnZXMgaW50byBhIHNwZWNpZmljIHBvb2xfdHlwZSAq
Lwo+ICBzdGF0aWMgdm9pZCB0dG1fcG9vbF90eXBlX2dpdmUoc3RydWN0IHR0bV9wb29sX3R5cGUg
KnB0LCBzdHJ1Y3QgcGFnZSAqcCkKPiAgewo+ICsgICAgICAgdW5zaWduZWQgaW50IGksIG51bV9w
YWdlcyA9IDEgPDwgcHQtPm9yZGVyOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBudW1f
cGFnZXM7ICsraSkgewo+ICsgICAgICAgICAgICAgICBpZiAoUGFnZUhpZ2hNZW0ocCkpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY2xlYXJfaGlnaHBhZ2UocCArIGkpOwo+ICsgICAgICAgICAg
ICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfcGFnZShwYWdlX2FkZHJl
c3MocCArIGkpKTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBzcGluX2xvY2soJnB0LT5sb2Nr
KTsKPiAgICAgICAgIGxpc3RfYWRkKCZwLT5scnUsICZwdC0+cGFnZXMpOwo+ICAgICAgICAgc3Bp
bl91bmxvY2soJnB0LT5sb2NrKTsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
