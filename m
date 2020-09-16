Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB126C9CF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 21:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6766EACE;
	Wed, 16 Sep 2020 19:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A26EACE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 19:27:45 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id i26so12316719ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=86XH/9IiVG8WkAUBuuJvRIX3M4xatpQ4XbJBYCO84G8=;
 b=KHCDS7EqKAm6QCMhvEliIOGiIDPALGdREyv6/qmOS9cP5wP9YtK6MKUXT+kzKcSrMv
 avA4i2CKKcvvNFZaGPAW9kBiOHACfJvxATnBq/c7XOb7zv+E7psKPkQVk9Y8td1oq2QN
 uFC3cr7eEg5hvvt2FxOisMuaveIC/kr+oP/iC3kBz/drZN4f9tN5lE/eRogkXSheRkJT
 6SAEUoOj8xozc9ZE0iIH5AKXl6yVuwnPw0fQz0HnKiqqOY6wx8V/B3SawC1DQBSkpXcv
 CeCUJt4AOu0ouSS33Vn8cUXVdRRmK4WjpqE9kcnp+XrgCWkz3TGwkoLRuYYk2ciEuZJg
 mv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=86XH/9IiVG8WkAUBuuJvRIX3M4xatpQ4XbJBYCO84G8=;
 b=laFJ+BCaPF42iZjqKmPp6KHOR3n7Y1KcNHbRIctCvzuu53qft8p1lG/21KBIkMBZAQ
 Xr03iHlonfFsKDiK2UAprN0k4pE51VdDqG2Wc32pdYHWvuvS6+SWAhVDVKtH0W4mk5qg
 tMVj0MKVJgVfHpPX2Asrl1pI1lPB7KrPpXGgM59XkDmME1JlGJKA6j6iGvLIUTNLFb2w
 mKY+rUFzOU8hqXOdOAf+bacFEHy8+MaqGkgENztDnxRf6GkzxVuJnca64M6mHhXePv2x
 P67T/R9Ta34tmrwpt3ZZyCkpHvMCUkRItAGkbm4/edKpkNITcu/WRii+jRvSHQPIR7Ss
 TBEw==
X-Gm-Message-State: AOAM530Yjye+SUBpdtUCfc0YlRmcu/MQStBH0BJMEc13lCBekM0O8I5H
 WJk/muO+NYSFw6zkgXhXsnysGeKgG4q0UvFrmYg=
X-Google-Smtp-Source: ABdhPJwfJQr9pDBQxTf9N/NXWNl8bTJiKmDpLC+dkptKgt+JQo6Z+mLGY72kBk40jp5HBUGqvY8QxZIgInzl1Vn/ZXk=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr26180151ejj.237.1600284464064; 
 Wed, 16 Sep 2020 12:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200916142406.2379-1-christian.koenig@amd.com>
In-Reply-To: <20200916142406.2379-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 17 Sep 2020 05:27:33 +1000
Message-ID: <CAPM=9tzGmwcDfLAxrzrFi29kcbn1prifaECc_kn7+5_-65mfnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix incorrect TT->SYSTEM move handling
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBTZXAgMjAyMCBhdCAwMDoyNCwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiB3ZSBtb3ZlIGZyb20gdGhl
IFNZU1RFTSBkb21haW4gdG8gdGhlIFRUIGRvbWFpbgo+IHdlIHN0aWxsIG5lZWQgdG8gcG90ZW50
aWFsbHkgY2hhbmdlIHRoZSBjYWNoaW5nIHN0YXRlLgo+Cj4gVGhpcyBpcyBtb3N0IGxpa2VseSB0
aGUgc291cmNlIG9mIGEgYnVuY2ggb2YgcHJvYmxlbXMgd2l0aAo+IEFHUCBhbmQgVVNXQyB0b2dl
dGhlciB3aXRoIGhpYmVybmF0aW9uIGFuZCBzd2FwLgoKSSdtIGdvaW5nIHRvIG5lZWQgbW9yZSBj
b21tZW50YXJ5LCBiZWNhdXNlIEkndmUgYmVlbiBzdGFyaW5nIGF0IHRoaXMKY29kZSBhIGxvdCBp
biB0aGUgcGFzdCBmZXcgZGF5cyBhbmQgSSdtIGFsdGhvdWdoIEkgZGlzbGlrZSB0aGlzIHBhdGgs
CkknbSBub3Qgc3VyZSB3aGF0IHRoaXMgYnJpbmdzLgoKVGhlIGN1cnJlbnQgY29kZSBmbG93IHRv
IG1lIGlzIGZvciBTWVNURU0tPlRUIGRvbWFpbgoKdHRtX3R0X2NyZWF0ZQp0dG1fdHRfc2V0X3Bs
YWNlbWVudF9jYWNoaW5nIChuZXcgcGxhY2VtZW50KQp0dG1fdHRfYmluZCAoY2FuIGNhdXNlIHBv
cHVsYXRlKQptb3ZlX25vdGlmeQpyZXBsYWNlIHBvaW50ZXJzCmV2aWN0ZWQgPSBmYWxzZQpyZXR1
cm4KClRoZSBuZXcgZmxvdyBsb29rcyBsaWtlCnR0bV90dF9jcmVhdGUKdHRtX3R0X3NldF9wbGFj
ZW1lbnRfY2FjaGluZyAobmV3IHBsYWNlbWVudCkKdHRtX3R0X2JpbmQgKGNhbiBjYXVzZSBwb3B1
bGF0ZSkKbW92ZV9ub3RpZnkKKHZpYSB0dG1fYm9fbW92ZV90dG0pCnR0bV90dF9zZXRfcGxhY2Vt
ZW50X2NhY2hpbmcgKG5ldyBwbGFjZW1lbnQpCnR0bV90dF9iaW5kCnJlcGxhY2UgcG9pbnRlcnMK
KGJhY2sgdG8gbWFpbiBjb2RlKQpldmljdGVkID0gZmFsc2UKcmV0dXJuCgpJcyB0aGUgc2Vjb25k
IHNldCBwbGFjZW1lbnQgY2FjaGluZyBkb2luZyBzb21ldGhpbmcgZGlmZmVyZW50IGhlcmU/IG9y
CmlzIHRoZXJlIHNvbWV0aGluZyB0aGF0IGhhcHBlbnMgaW4gbW92ZSBub3RpZnkgdGhhdCB3ZSBu
ZWVkIHRvIHNldAp0aGluZ3MgYWZ0ZXJ3YXJkcz8KCkRhdmUuCgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENDOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA4
IC0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4gaW5kZXggZmZiZGMyMGQ4ZThkLi41ZjdlZmM5MDk3MGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPiBAQCAtMjY0LDEzICsyNjQsNiBAQCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVf
bW92ZV9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXRfZXJyOwo+ICAgICAgICAgICAgICAgICB9Cj4gLQo+IC0gICAgICAgICAgICAgICBpZiAoYm8t
Pm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKGJkZXYtPmRyaXZlci0+bW92ZV9ub3RpZnkpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KGJvLCBldmljdCwgbWVtKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBiby0+bWVtID0gKm1lbTsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIG1vdmVkOwo+IC0gICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAg
ICAgICAgIGlmIChiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+IEBAIC0yOTMsNyArMjg2LDYg
QEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPiAgICAgICAgIH0KPgo+
IC1tb3ZlZDoKPiAgICAgICAgIGJvLT5ldmljdGVkID0gZmFsc2U7Cj4KPiAgICAgICAgIGN0eC0+
Ynl0ZXNfbW92ZWQgKz0gYm8tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwo+IC0tCj4gMi4xNy4x
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
