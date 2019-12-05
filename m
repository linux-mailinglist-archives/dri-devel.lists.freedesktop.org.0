Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B911400D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 12:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF6E6E053;
	Thu,  5 Dec 2019 11:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478E66E053
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 11:26:36 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x3so2230358oto.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 03:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Evszky+fx96+pLAuwjzgjs4UK3vxOiDLPqgGwQL06A=;
 b=b/dhDuhz3Vd8BmNMmX9wLZhm45X0jdghhBXswl7//swMtnCvk0EZ0RTzPErunE9LUh
 NO0IvfGDdXTorB/mG2ojmhTrj3oSraED34E7QWMZ6SfRlk+Q47NwS8+6NaQIjt0PpTpP
 H8n3PQOaV+CIpy9bfe4ZL/cO1BJGi1l7gnWe1eIcGeuvMEUxJG/xYQGHF6tlVW/+2h+U
 hKU6dcr/aZ36PmBEhtf0rGTiH902P8q1C6TSs2h8hvQ9Gzv9WL+wceReA+yEszeaZlVQ
 6islQsJLVvnW25OrIHfXUEO2FJB+1tBACJoqyIsO+MBO7UcjbN0RbGo75sDkm59joIpO
 R/Lw==
X-Gm-Message-State: APjAAAWJ6QLqnLyQVGNiqf9iG/0ttmgCir5j5rJt36h1wnwWH9C4LA04
 tjamdVxHmwpnLPdGb7mH3Q0E14SpYc21MsCdj261QQ==
X-Google-Smtp-Source: APXvYqxPvYKiziWmSlzGXY3HbUqHT+ufKdv+yN238TvnHRjM/eu4VZArXocGE1E4GmXAWUoXt9Cj4P7bv+1nva57A2k=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr5877995otj.106.1575545195476;
 Thu, 05 Dec 2019 03:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20191205090252.5711-1-tzimmermann@suse.de>
In-Reply-To: <20191205090252.5711-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Dec 2019 12:26:24 +0100
Message-ID: <CAKMK7uGXt7SsmhVDYN7L7sZOS8P1JWgenc40UbE=Z80mjhQ83g@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Call mgag200_driver_{load,unload}() before
 registering device
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+Evszky+fx96+pLAuwjzgjs4UK3vxOiDLPqgGwQL06A=;
 b=kakiw6j6XU7HpYrUUYSyYstVYqFld3J2wyOQ1jTXZho5t0KZcQoa2y6JgFciKhRsKV
 86IZ7ufqHfkRcLVB9RCbH3AublyGWwqsjphw1k9evpejV0IiA830cqgvNdDJnHAuzJQv
 fhxaK9LQijYxfT44LUF2AZSHtyYA3UJAN3Vdk=
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
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMDowMiBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBUaGUgbG9hZC91bmxvYWQgY2FsbGJhY2tzIGluIHN0
cnVjdCBkcm1fZHJpdmVyIGFyZSBkZXByZWNhdGVkLiBSZW1vdmUKPiB0aGVtIGFuZCBjYWxsIGZ1
bmN0aW9ucyBleHBsaWNpdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KClRoZSBldmVuIGZhbmNpZXIgdmVyc2lvbiBvZiB0aGlzIHdvdWxkIGJl
IHRvIGVtYmVkIHRoZSBkcm1fZGV2aWNlIGFuZApzd2l0Y2ggb3ZlciB0byBkcm1fZGV2X2luaXQo
KS4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
YyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzgg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9kcnYuYwo+IGluZGV4IGQ0Mzk1MWNhZWVhMC4uMzBiM2I4MjdhZGY4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCj4gQEAgLTYsMTMgKzYsMTMgQEAKPiAgICog
ICAgICAgICAgRGF2ZSBBaXJsaWUKPiAgICovCj4KPiAtI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvY29uc29sZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9pb2N0
bC5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcGNp
aWRzLmg+Cj4KPiAgI2luY2x1ZGUgIm1nYWcyMDBfZHJ2LmgiCj4gQEAgLTQ4LDE2ICs0OCw1MCBA
QCBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgcGNpaWRsaXN0KTsKPgo+ICBzdGF0aWMgaW50IG1n
YV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNl
X2lkICplbnQpCj4gIHsKPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXY7Cj4gKyAgICAg
ICBpbnQgcmV0Owo+ICsKPiAgICAgICAgIGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5n
X3BjaV9mcmFtZWJ1ZmZlcnMocGRldiwgIm1nYWcyMDBkcm1mYiIpOwo+Cj4gLSAgICAgICByZXR1
cm4gZHJtX2dldF9wY2lfZGV2KHBkZXYsIGVudCwgJmRyaXZlcik7Cj4gKyAgICAgICByZXQgPSBw
Y2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgZGV2ID0gZHJtX2Rldl9hbGxvYygmZHJpdmVy
LCAmcGRldi0+ZGV2KTsKPiArICAgICAgIGlmIChJU19FUlIoZGV2KSkgewo+ICsgICAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKGRldik7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX3BjaV9k
aXNhYmxlX2RldmljZTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBkZXYtPnBkZXYgPSBwZGV2
Owo+ICsgICAgICAgcGNpX3NldF9kcnZkYXRhKHBkZXYsIGRldik7Cj4gKwo+ICsgICAgICAgcmV0
ID0gbWdhZzIwMF9kcml2ZXJfbG9hZChkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ICsgICAgICAg
aWYgKHJldCkKPiArICAgICAgICAgICAgICAgZ290byBlcnJfZHJtX2Rldl9wdXQ7Cj4gKwo+ICsg
ICAgICAgcmV0ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ICsg
ICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgZ290byBlcnJfbWdhZzIwMF9kcml2ZXJf
dW5sb2FkOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICsKPiArZXJyX21nYWcyMDBfZHJpdmVy
X3VubG9hZDoKPiArICAgICAgIG1nYWcyMDBfZHJpdmVyX3VubG9hZChkZXYpOwo+ICtlcnJfZHJt
X2Rldl9wdXQ6Cj4gKyAgICAgICBkcm1fZGV2X3B1dChkZXYpOwo+ICtlcnJfcGNpX2Rpc2FibGVf
ZGV2aWNlOgo+ICsgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICsgICAgICAgcmV0
dXJuIHJldDsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG1nYV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dl
dF9kcnZkYXRhKHBkZXYpOwo+Cj4gLSAgICAgICBkcm1fcHV0X2RldihkZXYpOwo+ICsgICAgICAg
ZHJtX2Rldl91bnJlZ2lzdGVyKGRldik7Cj4gKyAgICAgICBtZ2FnMjAwX2RyaXZlcl91bmxvYWQo
ZGV2KTsKPiArICAgICAgIGRybV9kZXZfcHV0KGRldik7Cj4gIH0KPgo+ICBERUZJTkVfRFJNX0dF
TV9GT1BTKG1nYWcyMDBfZHJpdmVyX2ZvcHMpOwo+IEBAIC05Myw4ICsxMjcsNiBAQCBpbnQgbWdh
ZzIwMF9kcml2ZXJfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLAo+Cj4gIHN0YXRp
YyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7Cj4gICAgICAgICAuZHJpdmVyX2ZlYXR1cmVz
ID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VULAo+IC0gICAgICAgLmxvYWQgPSBtZ2FnMjAw
X2RyaXZlcl9sb2FkLAo+IC0gICAgICAgLnVubG9hZCA9IG1nYWcyMDBfZHJpdmVyX3VubG9hZCwK
PiAgICAgICAgIC5mb3BzID0gJm1nYWcyMDBfZHJpdmVyX2ZvcHMsCj4gICAgICAgICAubmFtZSA9
IERSSVZFUl9OQU1FLAo+ICAgICAgICAgLmRlc2MgPSBEUklWRVJfREVTQywKPiAtLQo+IDIuMjMu
MAo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
