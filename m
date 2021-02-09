Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A160C3150B8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AB66EAE1;
	Tue,  9 Feb 2021 13:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06CA6EAE1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:48:03 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id 63so17532763oty.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FQlbKKF3FAHD4Q9aDj+DmdjS1ms7IJrYpapeEHh02ng=;
 b=g5vh3B+ArCEUt8csP8nV0KVcOvxoj3k/cuqt8vtTznziVK6pwjUc0IvGFmjmfTRh1i
 9/6I9WWc7Y9w2mjiKna/a0Wd8u3Kv78WchbAw9LJEJq8NCfNTOAHWaBQL4Y/KxGfDsEh
 9oFiqrpkKTxQWW06gPgXJE6kl/jGOMmLKNYys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQlbKKF3FAHD4Q9aDj+DmdjS1ms7IJrYpapeEHh02ng=;
 b=h6/LcFNZebCSRV4pAYz12l67bg1kQXLZ/31iGUaZzjk5xWhofBlbfS4sIXW0M/aRbn
 iZROy6/gnNV/1BrJTbdQ4Qn/4J5h+7cId6lRgTY/jPHt0E2q2+BR0s7cmrKLlDQjturN
 hnj5BEnIzIGTbgcOG4gn/xd369h5M5aqFj3Rlg6YhXN9ans0UK5oAA62Wn9uGdVlg7Pw
 DikM6CMrjDAq0NaJIxBNY7118WeWAi5NWmakOTNMAhALiIcvMGPwzMq+W/bh4CLsgJlC
 hkK+kUTT9A42hH7btoP6OUN9bGuKtsbEtdL6W2seciYWHuIvcov6TEleWuK8zjgOUY5b
 rNTg==
X-Gm-Message-State: AOAM5322vxrAicgrD8HaTGJGYUWuRiMxTlh/wZphqhCYt1PudkupJKU6
 raNyAl2Ar2M/r3hHDEQEXGyhE65wLqIxp8mIVY5Qzg==
X-Google-Smtp-Source: ABdhPJxqSIM1cQ5QLJtkDjzNeTr3w6doFHFSBGsNI98EwEN0cDM/bHQOa+PxuZ2CbUrVcD7btHltAc/6suQHudMRavU=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr15755353ota.188.1612878482974; 
 Tue, 09 Feb 2021 05:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20210209131756.24650-1-christian.koenig@amd.com>
 <CAKMK7uFfRsjEXgsobocJvYE7iPqLLKtiyyCFk749t2=8s2vrCw@mail.gmail.com>
 <81a4da3e-00dc-9340-018c-1bfb87744b3c@gmail.com>
In-Reply-To: <81a4da3e-00dc-9340-018c-1bfb87744b3c@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 14:47:52 +0100
Message-ID: <CAKMK7uH0Xpj_7TV+u9brJUUOqdb34wU=z57zyjMWteoXiTRzZw@mail.gmail.com>
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

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCAyOjM0IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBBbSAwOS4wMi4yMSB1bSAx
NDozMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBUdWUsIEZlYiA5LCAyMDIxIGF0IDI6
MTggUE0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwu
Y29tPiB3cm90ZToKPiA+PiBPbmx5IGEgem9tYmllIGxlZnRvdmVyIGZyb20gcmViYXNpbmcuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gPj4gRml4ZXM6IDM3NjNkNjM1ZGVhYSAoImRybS90dG06IGFkZCBkZWJ1Z2Zz
IGRpcmVjdG9yeSB2MiIpCj4gPiBNeSBkcm0tbWlzYy1uZXh0IHN0aWxsIHVzZXMgdGhpcyBpbiBw
bGFjZXMsCj4KPiBIdWk/IFdoZXJlPwoKRHVoLCBJIG1peGVkIHVwIHR0bV9tZW1fZ2xvYmFsIHdp
dGggdHRtX2dsb2JhbCBhbmQgZGlkbid0IGZpdGxlciBteQpncmVwIG91dHB1dCBjb3JyZWN0bHkg
Li4uCgo+Cj4gPiAgIGlzIHRoaXMganVzdCBmYWxsb3V0IGZyb20KPiA+IHRoZSBtb3ZlIG9mIHRo
ZSBzeXNmcyBmaWxlcyBpbnRvIHZtd2dmeD8gWW91ciBGaXhlczogbGluZSBoZXJlCj4gPiBjb25m
dXNlcyBtZSBhIGxvdCwgYW5kIG9uIHRoZSBjdXJyZW50IGJhc2VsaW5lIEkgZG9uJ3QgdGhpbmsg
dGhpcwo+ID4gYXBwbGllcyAuLi4KPgo+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhpcyB3YXMganVz
dCBhbiBlcnJvciBkdXJpbmcgcmViYXNpbmcuCj4KPiBDb21taXQgMzc2M2Q2MzVkZWFhICgiZHJt
L3R0bTogYWRkIGRlYnVnZnMgZGlyZWN0b3J5IHYyIikgcmVtb3ZlZCB0aGUKPiBrb2JqLCBidXQg
d2hpbGUgcmViYXNpbmcgdGhlIHR0bV9kZXZpY2UgcmVuYW1lIEkgYWNjaWRlbnRhbGx5IGJyb3Vn
aHQgaXQKPiBiYWNrLgoKWW91ciBwYXRjaCBpcyBmaW5lLiBSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4KPiBDaHJpc3RpYW4uCj4KPiA+IC1EYW5p
ZWwKPiA+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYyB8
IDIgLS0KPiA+PiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmggICAgIHwgMSAtCj4gPj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9kZXZpY2UuYwo+ID4+IGluZGV4IGFjMDkwM2M5ZTYwYS4uOGJiNjFkZDI2NDM3IDEwMDY0NAo+
ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jCj4gPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKPiA+PiBAQCAtNDksOCArNDksNiBAQCBzdGF0
aWMgdm9pZCB0dG1fZ2xvYmFsX3JlbGVhc2Uodm9pZCkKPiA+PiAgICAgICAgICBpZiAoLS10dG1f
Z2xvYl91c2VfY291bnQgPiAwKQo+ID4+ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4K
PiA+PiAtICAgICAgIGtvYmplY3RfZGVsKCZnbG9iLT5rb2JqKTsKPiA+PiAtICAgICAgIGtvYmpl
Y3RfcHV0KCZnbG9iLT5rb2JqKTsKPiA+PiAgICAgICAgICB0dG1fbWVtX2dsb2JhbF9yZWxlYXNl
KCZ0dG1fbWVtX2dsb2IpOwo+ID4+ICAgICAgICAgIF9fZnJlZV9wYWdlKGdsb2ItPmR1bW15X3Jl
YWRfcGFnZSk7Cj4gPj4gICAgICAgICAgbWVtc2V0KGdsb2IsIDAsIHNpemVvZigqZ2xvYikpOwo+
ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oIGIvaW5jbHVkZS9k
cm0vdHRtL3R0bV9kZXZpY2UuaAo+ID4+IGluZGV4IDdiYzhiYjc5NzE2MS4uMDM1YmJjMDQ0YTNi
IDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPiA+PiArKysg
Yi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4gPj4gQEAgLTU1LDcgKzU1LDYgQEAgZXh0
ZXJuIHN0cnVjdCB0dG1fZ2xvYmFsIHsKPiA+PiAgICAgICAgICAgKiBDb25zdGFudCBhZnRlciBp
bml0Lgo+ID4+ICAgICAgICAgICAqLwo+ID4+Cj4gPj4gLSAgICAgICBzdHJ1Y3Qga29iamVjdCBr
b2JqOwo+ID4+ICAgICAgICAgIHN0cnVjdCBwYWdlICpkdW1teV9yZWFkX3BhZ2U7Cj4gPj4gICAg
ICAgICAgc3BpbmxvY2tfdCBscnVfbG9jazsKPiA+Pgo+ID4+IC0tCj4gPj4gMi4yNS4xCj4gPj4K
PiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPiA+Cj4gPgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
