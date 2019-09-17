Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9DB4EBC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 15:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113F76EC5D;
	Tue, 17 Sep 2019 13:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970B46EC5D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:06:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f2so3276653edw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 06:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FONZyOhyoPhdtzYbo166zWQmGaSB68p/zg3H5dBoxy0=;
 b=pozpuadugM/a72xc/01pOMj1GCDYYSD637RXtXS4rAo7kajIq4l4A9bSAn83QwECeS
 AhkdP+4xw0oAdWFJV5Dy32MMGZTrT8Z9nQfFLc3VNrf2FSA+KaTLU7bTo2GG1vTHL07t
 1z3Uul2c68JXCJZh7GsxAQ9OwfQ/r5vMyN0xC0glFQuNWHMNOaUON2DKCWp7AlH/TaFN
 PO0kA4zmJn/4PB6svQ6ZJgB8tYAnMBDxp9VNiy0LMPQVpmmYjsgPYC8mml9pbl2KOT+b
 Y2NYxbGCG2DSJ7mu1QBSG98rN3643c2Aoh0Zl5BdRQQl3GKs6q/e7SRonT+IMHFVzfC7
 PsOw==
X-Gm-Message-State: APjAAAUIHvhFDF4hvNyhMYxPah6N7dFUwylEvLI5nBfJG98Ld1wsXgzm
 9106K1DAzQZkGteIIxzmRbNR9A==
X-Google-Smtp-Source: APXvYqyj0KQqf8AjVbYlTKFuUDR9F0Y4kaeZT3yjyuYORm9OIKp7pQe1vZZ2utPDvPiTQsZnnjOtDQ==
X-Received: by 2002:a17:906:2288:: with SMTP id
 p8mr4489242eja.250.1568725575131; 
 Tue, 17 Sep 2019 06:06:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h10sm424979edf.81.2019.09.17.06.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 06:06:14 -0700 (PDT)
Date: Tue, 17 Sep 2019 15:06:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm/fb-helper: Synchronize dirty worker with vblank
Message-ID: <20190917130612.GT3958@phenom.ffwll.local>
References: <20190912064230.27972-1-tzimmermann@suse.de>
 <20190912064230.27972-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912064230.27972-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FONZyOhyoPhdtzYbo166zWQmGaSB68p/zg3H5dBoxy0=;
 b=XS8nBfXoOn8ER40Az+9IMXEjLuGr8+SjglzhBEp22wqpIx9QnyesY/VP6s6cH/xDeK
 qrsV853gQs7ofySSNSCOkWqth69PoWfmCZZECY0PQ8UKl1TYTPeniRouE1QXOW2ku6jf
 a5cfqrS80JNEVlyB7qkz+0v4AHbB0VLDpkmKE=
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDg6NDI6MjhBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUn
cyBzaGFkb3cgYnVmZmVyLCB0aGUgZGlydHkKPiB3b3JrZXIgbm93IHdhaXRzIGZvciB2Ymxhbmsu
IFRoaXMgYWxsb3dzIHNldmVyYWwgc2NyZWVuIHVwZGF0ZXMgdG8gcGlsZQo+IHVwIGFuZCBhY3Rz
IGFzIGEgcmF0ZSBsaW1pdGVyLgo+IAo+IHYyOgo+IAkqIGRvbid0IGhvbGQgaGVscGVyLT5sb2Nr
IHdoaWxlIHdhaXRpbmcgZm9yIHZibGFuawo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+IGluZGV4IGE3YmE1YjQ5MDJkNi4u
ZDBjYjFmYTRmOTA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVy
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gQEAgLTQwMiw4ICs0
MDIsMTggQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykKPiAgCQkJCQkJICAgIGRpcnR5X3dvcmspOwo+ICAJc3RydWN0IGRybV9j
bGlwX3JlY3QgKmNsaXAgPSAmaGVscGVyLT5kaXJ0eV9jbGlwOwo+ICAJc3RydWN0IGRybV9jbGlw
X3JlY3QgY2xpcF9jb3B5Owo+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjOwo+ICAJdW5zaWduZWQg
bG9uZyBmbGFnczsKPiAgCXZvaWQgKnZhZGRyOwo+ICsJaW50IHJldDsKPiArCj4gKwkvKiByYXRl
LWxpbWl0IHVwZGF0ZSBmcmVxdWVuY3kgKi8KPiArCWNydGMgPSBoZWxwZXItPmNsaWVudC5tb2Rl
c2V0c1swXS5jcnRjOwo+ICsJcmV0ID0gZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKTsKPiArCWlm
ICghcmV0KSB7Cj4gKwkJZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5rKGNydGMpOwoKV2l0aG91dCB0
aGUgbG9ja2luZyAoc3BlY2lmaWNhbGx5LCBwcmV2ZW50aW5nIG90aGVyIG1hc3RlcnMpIHRoaXMg
Y2FuIGdvCmJvb20gc2luY2UgaXQgYWdhaW4gY2FsbHMgZHJtX3ZibGFua19nZXQuIElmIHNvbWVv
bmUgdHVybmVkIG9mIHRoZSBkaXNwbGF5Cm1lYW53aGlsZSB0aGF0IHdpbGwgZmFpbCwgYW5kIHJl
c3VsdCBpbiBhbiB1bnNpZ2h0bHkgV0FSTiBiYWNrdHJhY2UuCgpJIHRoaW5rIHdlIG5lZWQgYSBf
X2RybV9jcnRjX3dhaXRfb25lX3ZibGFuayhjcnRjKTsgd2hpY2ggcmVxdWlyZXMgdGhhdApjYWxs
ZXJzIGhvbGQgYSBmdWxsIHZibGFuayByZWZlcmVuY2UgYWxyZWFkeS4gVGhlIG90aGVyIGlzc3Vl
IGlzIHRoYXQgd2UKbWlnaHQgcmFjZSB3aXRoIHRoZSBkaXNhYmxpbmcgYW5kIGhpdCB0aGUgdGlt
ZW91dCwgd2hpY2ggYWdhaW4gZ2l2ZXMgdXMgYW4KdW5zaWdodGx5IFdBUk5JTkcgYmFja3RyYWNl
LiBCb3RoIGNhbiBoYXBwZW4gd2l0aG91dCBsb2NrcyAodGhhdCdzIHdoeSB0aGUKaW9jdGwgcGF0
aCBuZWVkcyB0aGVtKSwgYnV0IHdlIG5lZWQgdG8gYXZvaWQuCi1EYW5pZWwKPiArCQlkcm1fY3J0
Y192YmxhbmtfcHV0KGNydGMpOwo+ICsJfQo+ICAKPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZoZWxw
ZXItPmRpcnR5X2xvY2ssIGZsYWdzKTsKPiAgCWNsaXBfY29weSA9ICpjbGlwOwo+IC0tIAo+IDIu
MjMuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
