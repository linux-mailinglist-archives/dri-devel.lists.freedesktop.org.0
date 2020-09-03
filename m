Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783225B9C5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 06:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F233E6E159;
	Thu,  3 Sep 2020 04:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2D6E159;
 Thu,  3 Sep 2020 04:30:36 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id h20so1220057ybj.8;
 Wed, 02 Sep 2020 21:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yJbL8hwpYT/FHPDCXFodYqZmciwIPAmrWYDJe9+d1Dc=;
 b=d7JJLTj0d7x3dwUBO//K681btsfFt6zPWepuvYSxx/E3eC0gmtaOMQWzuhp5ZUoPl7
 i7AAa4Es45YowthkDQZycMj21XVnDdwoDeATY3Ud+LkrBgZFcHsOg+2m29ESoJSmGIxZ
 r3gEnnaLj8vNSTf78Io9wbvJKoowxvpDGRyDtHobYtUKbaekmL2oOlDiWeK1fb5B//i8
 31xUjwPgYn8e16Xg/fSuSrSmFeu9jwJ7DmaapzbJnf5ezGwGem6JB4m+VExDtuAJ8dE3
 xJbqODARNi7YEKCsu/rEV6e97BtVWr1oIFIUOgK3kHalTa8m2eEwJ/cSpZ7uXEuWYFSU
 H0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJbL8hwpYT/FHPDCXFodYqZmciwIPAmrWYDJe9+d1Dc=;
 b=UGZvq48tb7bh5CZqRz7n+pgldVkfEyF/3AUw5+3SrSY9ug+IU4pw4inBmeL21j+Htz
 mJHbRJEjbNUca49iprG4/BZYolbo2kQNOkwUTSwxyVP+1kZ6cr3ui7HoYGHJK0dVYRkk
 8fxo9Z42Eevbg4SqcXipylQsOZUiKTQKrSmbvk+dtZs4JDxOolOd6TkCuV/qZFAnSRvv
 Hhuj9darRDCNnFMVYf17yQTjEQg9ml/NVsn1jFWPh4QI4yAG4U3gA0kxWGz27BaAP+Qm
 7fWSEZ+nCg7eQ1cds+kIK+h5XeQIYJe0qjDxDkMuJivQM8emhjs9+kJyO5OYUMkXW6nI
 7UFw==
X-Gm-Message-State: AOAM530o3CFhmkWLhBtPwPE/SNvGp98LSyLiJ6rlvvkTzXdoi0MyMqtf
 n7pNbo5P7hDWe9pdjsTmaGT/z3mj7EET2gm/wdU=
X-Google-Smtp-Source: ABdhPJz8d5DdUEWTuocHgiH8BbJfDhxb+TOU0A7+XANWi5HFWOw2GnuEfSVCXVtyQWKI1W3niI5yMFhCnM/YcG+Ado8=
X-Received: by 2002:a25:acd0:: with SMTP id x16mr187855ybd.268.1599107435404; 
 Wed, 02 Sep 2020 21:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200901150542.7455-1-christian.koenig@amd.com>
In-Reply-To: <20200901150542.7455-1-christian.koenig@amd.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 3 Sep 2020 14:30:24 +1000
Message-ID: <CACAvsv4TU56GOuzSQoNHf+roqW8f4W8fQe8YzEWWv_7ZeEOsfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ttm: make sure that we always zero init mem.bus v2
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
Cc: ML nouveau <Nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyIFNlcCAyMDIwIGF0IDAxOjA1LCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBhcmUgdHJ5aW5nIHRvIHJlbW92
ZSB0aGUgaW9fbHJ1IGhhbmRsaW5nIGFuZCBkZXBlbmQKPiBvbiB6ZXJvIGluaXQgYmFzZSwgb2Zm
c2V0IGFuZCBhZGRyIGhlcmUuCj4KPiB2MjogaW5pdCBhZGRyIGFzIHdlbGwKTG9va3MgbGlrZSB0
aGUgaXNzdWVzIEkgbm90aWNlZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBoYXZlIGJlZW4KZGVh
bHQgd2l0aCwgc28sIGZvciB0aGUgc2VyaWVzOgoKUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJz
a2VnZ3NAcmVkaGF0LmNvbT4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCBlMzkzMWU1MTU5MDYuLjc3MmM2NDBhNjA0NiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC02NTAsNiArNjUwLDkgQEAgc3RhdGljIGludCB0dG1f
Ym9fZXZpY3Qoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAgICAgIGV2aWN0X21l
bS5tbV9ub2RlID0gTlVMTDsKPiAgICAgICAgIGV2aWN0X21lbS5idXMuaW9fcmVzZXJ2ZWRfdm0g
PSBmYWxzZTsKPiAgICAgICAgIGV2aWN0X21lbS5idXMuaW9fcmVzZXJ2ZWRfY291bnQgPSAwOwo+
ICsgICAgICAgZXZpY3RfbWVtLmJ1cy5iYXNlID0gMDsKPiArICAgICAgIGV2aWN0X21lbS5idXMu
b2Zmc2V0ID0gMDsKPiArICAgICAgIGV2aWN0X21lbS5idXMuYWRkciA9IE5VTEw7Cj4KPiAgICAg
ICAgIHJldCA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZldmljdF9tZW0sIGN0
eCk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gQEAgLTEwODQsNiArMTA4Nyw5IEBAIHN0YXRpYyBp
bnQgdHRtX2JvX21vdmVfYnVmZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAg
ICAgICBtZW0ucGFnZV9hbGlnbm1lbnQgPSBiby0+bWVtLnBhZ2VfYWxpZ25tZW50Owo+ICAgICAg
ICAgbWVtLmJ1cy5pb19yZXNlcnZlZF92bSA9IGZhbHNlOwo+ICAgICAgICAgbWVtLmJ1cy5pb19y
ZXNlcnZlZF9jb3VudCA9IDA7Cj4gKyAgICAgICBtZW0uYnVzLmJhc2UgPSAwOwo+ICsgICAgICAg
bWVtLmJ1cy5vZmZzZXQgPSAwOwo+ICsgICAgICAgbWVtLmJ1cy5hZGRyID0gTlVMTDsKPiAgICAg
ICAgIG1lbS5tbV9ub2RlID0gTlVMTDsKPgo+ICAgICAgICAgLyoKPiBAQCAtMTI0Myw2ICsxMjQ5
LDkgQEAgaW50IHR0bV9ib19pbml0X3Jlc2VydmVkKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LAo+ICAgICAgICAgYm8tPm1lbS5wYWdlX2FsaWdubWVudCA9IHBhZ2VfYWxpZ25tZW50Owo+ICAg
ICAgICAgYm8tPm1lbS5idXMuaW9fcmVzZXJ2ZWRfdm0gPSBmYWxzZTsKPiAgICAgICAgIGJvLT5t
ZW0uYnVzLmlvX3Jlc2VydmVkX2NvdW50ID0gMDsKPiArICAgICAgIGJvLT5tZW0uYnVzLmJhc2Ug
PSAwOwo+ICsgICAgICAgYm8tPm1lbS5idXMub2Zmc2V0ID0gMDsKPiArICAgICAgIGJvLT5tZW0u
YnVzLmFkZHIgPSBOVUxMOwo+ICAgICAgICAgYm8tPm1vdmluZyA9IE5VTEw7Cj4gICAgICAgICBi
by0+bWVtLnBsYWNlbWVudCA9IChUVE1fUExfRkxBR19TWVNURU0gfCBUVE1fUExfRkxBR19DQUNI
RUQpOwo+ICAgICAgICAgYm8tPmFjY19zaXplID0gYWNjX3NpemU7Cj4gLS0KPiAyLjE3LjEKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
