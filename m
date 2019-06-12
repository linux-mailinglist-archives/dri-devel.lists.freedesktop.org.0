Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD2427DD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3C893EB;
	Wed, 12 Jun 2019 13:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD43894E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:44:06 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u124so10260387vsu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9eNNjiC95DGO5Rr9xHzwKKVyB2iJUKLNnHQi8kq580=;
 b=Izhd3Cf5OIrA0WkcgZ5Ctz499PU7HtTscN7ihBEy00ATv6T95J6tZ0MLORs1Z7s3Fb
 6e4yyRyD5/bpIpe6sKThDkTlTC0lVsDyG+una7DM1xSFkiuY/rrvIKfuswqHcoBsxnQx
 W9d0J6iRsC282jwMSmPkLrq9p/5OSX4ZpJbHwvmcN3NguFrX2k6aqzDwG26in3k7JsSa
 9aijLUmUbzVFhDTNminwZOada6yPaR43SeFj3zyPE+U63/jr7M6SYRqj5G7kyAQJqM4e
 QKcQl0zEPeTlw26OGLRQiH79352JDF054unUzPwvB3LIC2O/jBs2GcuVhOuOw4ytcOHX
 i0OA==
X-Gm-Message-State: APjAAAVOXn3wI137UeJSfAmo78UpvQbRtcBRAYaj+GLpIg+TrRL3p4co
 UhU3sH9KzS9OkenLp4joSXAoo7ZiHHntKoEYfLbSn24N
X-Google-Smtp-Source: APXvYqwg7WWOItw0K+q17y6/QBs6hlILk7thPeeV2RthhG16B2qGj6GzWftlvGDMylwlxNfOCzlAoGmUTg0QLWs/eQg=
X-Received: by 2002:a67:bb03:: with SMTP id m3mr31824777vsn.84.1560347046073; 
 Wed, 12 Jun 2019 06:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20190606222751.32567-9-daniel.vetter@ffwll.ch>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 10:43:56 -0300
Message-ID: <CADKXj+6tCmKVhD5HrQkrJD_y1ptMVAq5dA5C-Po1gE12NnXmAA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/vkms: No _irqsave within spin_lock_irq needed
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Z9eNNjiC95DGO5Rr9xHzwKKVyB2iJUKLNnHQi8kq580=;
 b=cZfHymcxXYzgrEGYC9/IrMEI9bvQwiLm+909TrNFhtc3iAmrYkzuTpIYUe6ielMsEV
 en/QqUDhOxHgNs9sPkGVX0/yGnCrUs2G5QOMKH0OhN2MGKpT7AReUyPiq9/dusAwi0P4
 +ccrg10q1Hs9vWH8hK85DpzTjttvvuQbaiI5yNJ7VMab+uh6bqCi82C+fpApFRaUlANf
 9yDaZhu6ut5O+kpWIqbo0WePBMmgTHi4MLzbPZbOjwX+8uuqkx/kvzTIQsOHlX60pmsP
 tu1YkYlaLcz7g/3lQYEK/M4yNz3ZKqYEG6g+Udvk56B1W4gvXc+lmiGA4qDgUStWW7Jw
 bYqg==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA3OjI4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gaXJxcyBhcmUgYWxyZWFkeSBvZmYuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21z
X2NydGMuYwo+IGluZGV4IGI2OTg3ZDkwODA1Zi4uNDhhNzkzYmE0MDMwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19jcnRjLmMKPiBAQCAtMTgzLDE3ICsxODMsMTYgQEAgc3RhdGljIHZvaWQgdmtt
c19jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0
YXRlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgdmttc19vdXRwdXQgKnZrbXNfb3V0cHV0ID0gZHJt
X2NydGNfdG9fdmttc19vdXRwdXQoY3J0Yyk7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
Owo+Cj4gICAgICAgICBpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Cj4gLSAgICAgICAgICAgICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKPiArICAg
ICAgICAgICAgICAgc3Bpbl9sb2NrKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwo+Cj4gICAgICAg
ICAgICAgICAgIGlmIChkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpICE9IDApCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3Rh
dGUtPmV2ZW50KTsKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsK
Pgo+IC0gICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2ssIGZsYWdzKTsKPiArICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmNydGMtPmRl
di0+ZXZlbnRfbG9jayk7Cj4KPiAgICAgICAgICAgICAgICAgY3J0Yy0+c3RhdGUtPmV2ZW50ID0g
TlVMTDsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpSZXZpZXdlZC1ieTogUm9kcmlnbyBTaXF1
ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+ClRlc3RlZC1ieTogUm9kcmlnbyBT
aXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+CgotLSAKClJvZHJpZ28gU2lx
dWVpcmEKaHR0cHM6Ly9zaXF1ZWlyYS50ZWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
