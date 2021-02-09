Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E684315030
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC276E062;
	Tue,  9 Feb 2021 13:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807376E062
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:32:16 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id x23so4268527oop.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/Q7a+LGfICloYVHMYZXi33hCWWfJYsgT1T180TgF94M=;
 b=Wyy3qkJtXyRB3EjsAFF8n7XPz2FNLyAXVGDx2nhRAMgR02FnCOLhBxz5n85UninbPH
 swCcuUkgfaot/okgMfzZnCXrveZ6ZBMSx9MVVDl8wmkdnsBvJusQY5tOnmkoNEORQFXg
 MlEPqVRDeL6tYlIX8XPXycRnodmMAzUNBmNaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/Q7a+LGfICloYVHMYZXi33hCWWfJYsgT1T180TgF94M=;
 b=hnD/JSkj5BMe96s1jRvIw4aeywSoqczt4lS1Umn1mPQkK2qX6ErTZHeZQzQc/WKUS+
 ZrifFzccbqZoro1YNA5Twjllr6rnjrM8vTmhrSKUxudUjG9M/Qj8zt6NLO6w5SvHfpBu
 KgSWwefO8MO0Or6czrPLerQRNkaR8hxLO+0tYl0KnOQpV/sNmKgbOiF32pDLjEjMP6IX
 KdPIIuMHo9vY+AsIVwKmjsPgGJEgMuV64gW01OEGkoTf7k6f1Ta6WrBKzx2RLmLiflY+
 FXLfNlXCzS0Nsb8SBHjt5pmh6Fe0mL0ptTZSjsVQs4lz4h8sVqHWxVago9q9p4MNBg3G
 /dBQ==
X-Gm-Message-State: AOAM5317k4+e3/3A8ilw+TTmW2mCwI5+mHaEFEXMQLLDcUGLJvpT66Zl
 cqlRwsRF0Pj+GvSp3fQbxBY3xnMMVtefbapTEcwKRg==
X-Google-Smtp-Source: ABdhPJxxwZqaOq0FKBoqA1BnrlPOLTxOK3m7l+fr1OllSc+PzGcW2ks5Ghg+A5JzZOUYXe8cOy42ajPJ/nBPkWTJ44k=
X-Received: by 2002:a4a:424c:: with SMTP id i12mr16041692ooj.85.1612877535808; 
 Tue, 09 Feb 2021 05:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20210209131756.24650-1-christian.koenig@amd.com>
In-Reply-To: <20210209131756.24650-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 14:32:04 +0100
Message-ID: <CAKMK7uFfRsjEXgsobocJvYE7iPqLLKtiyyCFk749t2=8s2vrCw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix removal of bo_count sysfs file
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
Cc: Nirmoy <nirmodas@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCAyOjE4IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9ubHkgYSB6b21iaWUgbGVmdG92
ZXIgZnJvbSByZWJhc2luZy4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBGaXhlczogMzc2M2Q2MzVkZWFhICgiZHJtL3R0bTog
YWRkIGRlYnVnZnMgZGlyZWN0b3J5IHYyIikKCk15IGRybS1taXNjLW5leHQgc3RpbGwgdXNlcyB0
aGlzIGluIHBsYWNlcywgaXMgdGhpcyBqdXN0IGZhbGxvdXQgZnJvbQp0aGUgbW92ZSBvZiB0aGUg
c3lzZnMgZmlsZXMgaW50byB2bXdnZng/IFlvdXIgRml4ZXM6IGxpbmUgaGVyZQpjb25mdXNlcyBt
ZSBhIGxvdCwgYW5kIG9uIHRoZSBjdXJyZW50IGJhc2VsaW5lIEkgZG9uJ3QgdGhpbmsgdGhpcwph
cHBsaWVzIC4uLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZp
Y2UuYyB8IDIgLS0KPiAgaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaCAgICAgfCAxIC0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNl
LmMKPiBpbmRleCBhYzA5MDNjOWU2MGEuLjhiYjYxZGQyNjQzNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2RldmljZS5jCj4gQEAgLTQ5LDggKzQ5LDYgQEAgc3RhdGljIHZvaWQgdHRtX2dsb2JhbF9y
ZWxlYXNlKHZvaWQpCj4gICAgICAgICBpZiAoLS10dG1fZ2xvYl91c2VfY291bnQgPiAwKQo+ICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPgo+IC0gICAgICAga29iamVjdF9kZWwoJmdsb2ItPmtv
YmopOwo+IC0gICAgICAga29iamVjdF9wdXQoJmdsb2ItPmtvYmopOwo+ICAgICAgICAgdHRtX21l
bV9nbG9iYWxfcmVsZWFzZSgmdHRtX21lbV9nbG9iKTsKPiAgICAgICAgIF9fZnJlZV9wYWdlKGds
b2ItPmR1bW15X3JlYWRfcGFnZSk7Cj4gICAgICAgICBtZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpn
bG9iKSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmggYi9pbmNs
dWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4gaW5kZXggN2JjOGJiNzk3MTYxLi4wMzViYmMwNDRh
M2IgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+ICsrKyBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPiBAQCAtNTUsNyArNTUsNiBAQCBleHRlcm4gc3Ry
dWN0IHR0bV9nbG9iYWwgewo+ICAgICAgICAgICogQ29uc3RhbnQgYWZ0ZXIgaW5pdC4KPiAgICAg
ICAgICAqLwo+Cj4gLSAgICAgICBzdHJ1Y3Qga29iamVjdCBrb2JqOwo+ICAgICAgICAgc3RydWN0
IHBhZ2UgKmR1bW15X3JlYWRfcGFnZTsKPiAgICAgICAgIHNwaW5sb2NrX3QgbHJ1X2xvY2s7Cj4K
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
