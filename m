Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E59E05E1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 16:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22176E808;
	Tue, 22 Oct 2019 14:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CFF6E808
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 14:04:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q13so13250318wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 07:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=VkiH/EAo2eZ26nBlDjJaN2XKhF9tEceprtmZWRr2/fw=;
 b=b76NIV9WCMR3QtuONkUB+t9PBt9YU5jG9C7l0EGhL+ULdzcbAFxbF56d8r7gmip45G
 +Fb3gcDWBmKTGBzsMZrY73gUJpOajFgqxWsXAN6TOqDMWjDbpxLYRsBk0Z7+Uegik54F
 Z/oOvdmLy6u+FCBWRWRuvTvEodyI7M2lNmGjCpk654t4fA5Kxty7epYOM0Vo2TmN0K97
 5hFvAfvCHHwFyHlEBLNQRhbWzjSZ3ejsCXJlzq8Dk4UJrWQbIcj3O3cuZOOHM+VyqTok
 YCZIqSF8HXrNU/c6d85yUREfZ1p0hEN6GOJ6I/2D5acTdmbNsFpwJV+/JVFQuE7oqjVz
 KtCQ==
X-Gm-Message-State: APjAAAWD8lQP0Iz7XJt0cxlTN0Gl5f+f2YxxqSktKOBdZFRq+E/Chv3T
 lyAuTEbylm79hPvVXrUpyrB19w==
X-Google-Smtp-Source: APXvYqyF4wUg9dGYpVXcTH0I2eOaq6t/5cRBR3j+c5irmCtcBu74ya1WJblBoTQlrvHrXhx+VDB8nQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr3668217wri.190.1571753094186; 
 Tue, 22 Oct 2019 07:04:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x12sm8991622wru.93.2019.10.22.07.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 07:04:50 -0700 (PDT)
Date: Tue, 22 Oct 2019 16:04:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 06/13] drm/dp: Do not busy-loop during link training
Message-ID: <20191022140447.GP11828@phenom.ffwll.local>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
 <20191021143437.1477719-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021143437.1477719-7-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VkiH/EAo2eZ26nBlDjJaN2XKhF9tEceprtmZWRr2/fw=;
 b=SBYRSqPjmyEnwej2jJZW8PoWXXg5BhSW/k1D7aS4hgm1wmJHOxLR19EFhR59GM1UKp
 8uhciTG+wiL6opwRG+j/tQjsN9AlITwzTcwDm8TE+mSdfT1YfQD00AGnxzn+7Y4UOXl/
 mtYhZqdAurIXGXy3UsDAA4mfyRchwluHGDDTo=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6MzQ6MzBQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBV
c2UgbWljcm9zZWNvbmQgc2xlZXBzIGZvciB0aGUgY2xvY2sgcmVjb3ZlcnkgYW5kIGNoYW5uZWwg
ZXF1YWxpemF0aW9uCj4gZGVsYXlzIGR1cmluZyBsaW5rIHRyYWluaW5nLiBUaGUgZHVyYXRpb24g
b2YgdGhlc2UgZGVsYXlzIGNhbiBiZSBmcm9tCj4gMTAwIHVzIHVwIHRvIDE2IG1zLiBJdCBpcyBy
dWRlIHRvIGJ1c3ktbG9vcCBmb3IgdGhhdCBhbW91bnQgb2YgdGltZS4KPiAKPiBXaGlsZSBhdCBp
dCwgYWxzbyBjb252ZXJ0IHRvIHN0YW5kYXJkIGNvZGluZyBzdHlsZSBieSBwdXR0aW5nIHRoZQo+
IG9wZW5pbmcgYnJhY2VzIGluIGEgZnVuY3Rpb24gZGVmaW5pdGlvbiBvbiBhIG5ldyBsaW5lLiBB
bHNvIHN3aXRjaCB0bwo+IHVzaW5nIGFuIHVuc2lnbmVkIGludCBmb3IgdGhlIEFVWCByZWFkIGlu
dGVydmFsIHRvIG1hdGNoIHRoZSBkYXRhIHR5cGUKPiBvZiB0aGUgcGFyYW1ldGVycyB0byB1c2xl
ZXBfcmFuZ2UoKS4KPiAKPiB2MjogdXNlIGNvcnJlY3QgbXVsdGlwbGllciBmb3IgdHJhaW5pbmcg
ZGVsYXlzIChQaGlsaXBwIFphYmVsKQo+IHYzOiBjbGFyaWZ5IGRhdGEgdHlwZSBjaGFuZ2UgaW4g
Y29tbWl0IG1lc3NhZ2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgoKQWZ0ZXIgeW91IHBvaW50aW5nIG91dCBvbiBpcmMgdGhhdCB0aGUgZGVm
YXVsdCB2YWx1ZSBpc24ndCB0aGUgc2FtZSBhbmQgbWUKaGF2aW5nIGZsYXNoLWJhY2tzIC4uLgoK
UmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMzAgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBpbmRleCA4ZjJkN2M0ODUw
Y2EuLmFjODAyYjA0ZjEyMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hl
bHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IEBAIC0xMjAs
MzMgKzEyMCwzOSBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyhj
b25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSQo+ICB9Cj4gIEVYUE9SVF9TWU1C
T0woZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVfZW1waGFzaXMpOwo+ICAKPiAtdm9pZCBk
cm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JF
Q0VJVkVSX0NBUF9TSVpFXSkgewo+IC0JaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklO
R19BVVhfUkRfSU5URVJWQUxdICYKPiAtCQkJICBEUF9UUkFJTklOR19BVVhfUkRfTUFTSzsKPiAr
dm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNk
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKPiArewo+ICsJdW5zaWduZWQgbG9uZyByZF9pbnRlcnZh
bCA9IGRwY2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCj4gKwkJCQkJIERQX1RSQUlO
SU5HX0FVWF9SRF9NQVNLOwo+ICAKPiAgCWlmIChyZF9pbnRlcnZhbCA+IDQpCj4gLQkJRFJNX0RF
QlVHX0tNUygiQVVYIGludGVydmFsICVkLCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiArCQlE
Uk1fREVCVUdfS01TKCJBVVggaW50ZXJ2YWwgJWx1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwK
PiAgCQkJICAgICAgcmRfaW50ZXJ2YWwpOwo+ICAKPiAgCWlmIChyZF9pbnRlcnZhbCA9PSAwIHx8
IGRwY2RbRFBfRFBDRF9SRVZdID49IERQX0RQQ0RfUkVWXzE0KQo+IC0JCXVkZWxheSgxMDApOwo+
ICsJCXJkX2ludGVydmFsID0gMTAwOwo+ICAJZWxzZQo+IC0JCW1kZWxheShyZF9pbnRlcnZhbCAq
IDQpOwo+ICsJCXJkX2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwo+ICsKPiArCXVzbGVl
cF9yYW5nZShyZF9pbnRlcnZhbCwgcmRfaW50ZXJ2YWwgKiAyKTsKPiAgfQo+ICBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsKPiAgCj4gLXZvaWQg
ZHJtX2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJ
VkVSX0NBUF9TSVpFXSkgewo+IC0JaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19B
VVhfUkRfSU5URVJWQUxdICYKPiAtCQkJICBEUF9UUkFJTklOR19BVVhfUkRfTUFTSzsKPiArdm9p
ZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRwY2RbRFBfUkVD
RUlWRVJfQ0FQX1NJWkVdKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nIHJkX2ludGVydmFsID0gZHBj
ZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKPiArCQkJCQkgRFBfVFJBSU5JTkdfQVVY
X1JEX01BU0s7Cj4gIAo+ICAJaWYgKHJkX2ludGVydmFsID4gNCkKPiAtCQlEUk1fREVCVUdfS01T
KCJBVVggaW50ZXJ2YWwgJWQsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAo+ICsJCURSTV9ERUJV
R19LTVMoIkFVWCBpbnRlcnZhbCAlbHUsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAo+ICAJCQkg
ICAgICByZF9pbnRlcnZhbCk7Cj4gIAo+ICAJaWYgKHJkX2ludGVydmFsID09IDApCj4gLQkJdWRl
bGF5KDQwMCk7Cj4gKwkJcmRfaW50ZXJ2YWwgPSA0MDA7Cj4gIAllbHNlCj4gLQkJbWRlbGF5KHJk
X2ludGVydmFsICogNCk7Cj4gKwkJcmRfaW50ZXJ2YWwgKj0gNCAqIFVTRUNfUEVSX01TRUM7Cj4g
Kwo+ICsJdXNsZWVwX3JhbmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwo+ICB9Cj4g
IEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheSk7Cj4gIAo+
IC0tIAo+IDIuMjMuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
