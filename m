Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF61102C6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB796EA15;
	Tue,  3 Dec 2019 16:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45636EA16
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:46:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so4569562wrr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lePQmCseTp9bskEyz6bBWCyl7NDpDZPssZ2LR7hDmAI=;
 b=j67IgHVzMtu+kKPSkVSrEfvWQDr5tMyxsaf7pR6Lv15ZbDj2rdSiigYehrn+M5Iv9e
 fXOnzZobqu9Ww4sRb8rEaP0Ei1KKo7VWEVVQYSVYSG/Ema0xZFulPLnMMDxlPPoWsxw0
 3hhRD6jCFkDw9L2M3umFpQ2a8PoAoXNrnIMyKzwtG+YzZwCB34dzanS+v8OVNKR4TeXL
 7FcOYclGVjKVY85Kw0DHxRzbU1ji8GXH+EppZcunjryJynrl+We2uG1gtGQg6G/cc3OB
 03k4YjbOsw72WbD5wsC8yrxmmfOJpBCn504LbTXVVmMQIRqIq4jOUdpTyxmbhsUW8Oj1
 TeLQ==
X-Gm-Message-State: APjAAAXAd6R7dlKUEemCZEAXmzBQYDPiDjI9jQqVxxxDsl1Ve+fLVDOh
 48jciaD9VzyKUWkQEPGkjNcriQ==
X-Google-Smtp-Source: APXvYqzC4TlMWzjbN06wfhC5H/2lK+Du8aPg9B1xmlJwUVUjyl/FVBfSmX6QsF5Lotf7xMLhwio6ew==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr6541487wrx.288.1575391578346; 
 Tue, 03 Dec 2019 08:46:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t1sm3915088wma.43.2019.12.03.08.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:46:17 -0800 (PST)
Date: Tue, 3 Dec 2019 17:46:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 01/12] video: fbdev: atyfb: modify the static fb_ops
 directly
Message-ID: <20191203164615.GE624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <7dfbf1d47203157f5eb9a6f447f0095765d0b5e6.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dfbf1d47203157f5eb9a6f447f0095765d0b5e6.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lePQmCseTp9bskEyz6bBWCyl7NDpDZPssZ2LR7hDmAI=;
 b=cvsJ1Yuu6+T8r48v8IhnUOlpQAhSpRTXUKXQdRghuT3Q2U8AGI3SGfNAQUD4M6fD/R
 9GNS+6GUen1jXnJZhAiq8MV7dVCI6ldoYZcyM+OeRNXtX+7mfslT/2uy0u9NMMg6SUws
 vNiPE/NqyGtnkPVdA53kY4uUIXYRL6ljLPi30=
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDY6Mzg6NDNQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gQXZvaWQgbW9kaWZ5aW5nIHRoZSBmYl9vcHMgdmlhIGluZm8tPmZib3BzIHRvIGxldCB1
cyBtYWtlIHRoZSBwb2ludGVyCj4gY29uc3QgaW4gdGhlIGZ1dHVyZS4KPiAKPiBDYzogbGludXgt
ZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmIu
aCAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMg
ICAgfCA2ICsrKy0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNoNjRfY3Vyc29yLmMg
fCA0ICsrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiLmggYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYi5oCj4gaW5kZXggZTVhMzQ3YzU4MTgwLi5hNzgz
M2JjOTgyMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmIuaAo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiLmgKPiBAQCAtMzQxLDcgKzM0MSw3
IEBAIGV4dGVybiBjb25zdCB1OCBhdHlfcG9zdGRpdmlkZXJzWzhdOwo+ICAgICAgICogIEhhcmR3
YXJlIGN1cnNvciBzdXBwb3J0Cj4gICAgICAgKi8KPiAgCj4gLWV4dGVybiBpbnQgYXR5X2luaXRf
Y3Vyc29yKHN0cnVjdCBmYl9pbmZvICppbmZvKTsKPiArZXh0ZXJuIGludCBhdHlfaW5pdF9jdXJz
b3Ioc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCBmYl9vcHMgKmF0eWZiX29wcyk7Cj4gIAo+
ICAgICAgLyoKPiAgICAgICAqICBIYXJkd2FyZSBhY2NlbGVyYXRpb24KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvYXR5ZmJfYmFzZS5jCj4gaW5kZXggNmRkYTVkODg1YTAzLi5iZWJjMDg1MDVkOTQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCj4gKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCj4gQEAgLTEzMTYsMTAgKzEzMTYs
MTAgQEAgc3RhdGljIGludCBhdHlmYl9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQo+ICAJ
cGFyLT5hY2NlbF9mbGFncyA9IHZhci0+YWNjZWxfZmxhZ3M7IC8qIGhhY2sgKi8KPiAgCj4gIAlp
ZiAodmFyLT5hY2NlbF9mbGFncykgewo+IC0JCWluZm8tPmZib3BzLT5mYl9zeW5jID0gYXR5ZmJf
c3luYzsKPiArCQlhdHlmYl9vcHMuZmJfc3luYyA9IGF0eWZiX3N5bmM7Cj4gIAkJaW5mby0+Zmxh
Z3MgJj0gfkZCSU5GT19IV0FDQ0VMX0RJU0FCTEVEOwo+ICAJfSBlbHNlIHsKPiAtCQlpbmZvLT5m
Ym9wcy0+ZmJfc3luYyA9IE5VTEw7Cj4gKwkJYXR5ZmJfb3BzLmZiX3N5bmMgPSBOVUxMOwo+ICAJ
CWluZm8tPmZsYWdzIHw9IEZCSU5GT19IV0FDQ0VMX0RJU0FCTEVEOwo+ICAJfQo+ICAKPiBAQCAt
MjcwMiw3ICsyNzAyLDcgQEAgc3RhdGljIGludCBhdHlfaW5pdChzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykKPiAgCj4gICNpZmRlZiBDT05GSUdfRkJfQVRZX0NUCj4gIAlpZiAoIW5vYWNjZWwgJiYgTTY0
X0hBUyhJTlRFR1JBVEVEKSkKPiAtCQlhdHlfaW5pdF9jdXJzb3IoaW5mbyk7Cj4gKwkJYXR5X2lu
aXRfY3Vyc29yKGluZm8sICZhdHlmYl9vcHMpOwoKVWggLi4uIGNhbiBJIGJpa2VzaGVkIHRoaXMg
dG8gZHVwbGljYXRpbmcgYW4gYXR5ZmJfY3Vyc29yX29wcyBhbmQgdGhlbgpqdXN0IHJlYXNzaWdu
aW5nIHRoZSBpbmZvLT5mYm9wcyBwb2ludGVyPwoKVGhpcyBoZXJlIHNlZW1zIGEgYml0IHRvbyB3
aWxkLgotRGFuaWVsCgo+ICAjZW5kaWYgLyogQ09ORklHX0ZCX0FUWV9DVCAqLwo+ICAJaW5mby0+
dmFyID0gdmFyOwo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFj
aDY0X2N1cnNvci5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2N1cnNvci5jCj4g
aW5kZXggNGNkZTI1ZWFiOGU4Li5iMDZmYTZlNDJlNmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi9hdHkvbWFjaDY0X2N1cnNvci5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvbWFjaDY0X2N1cnNvci5jCj4gQEAgLTE5NCw3ICsxOTQsNyBAQCBzdGF0aWMgaW50IGF0
eWZiX2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IGZiX2N1cnNvciAqY3Vyc29y
KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLWludCBhdHlfaW5pdF9jdXJzb3Ioc3RydWN0IGZi
X2luZm8gKmluZm8pCj4gK2ludCBhdHlfaW5pdF9jdXJzb3Ioc3RydWN0IGZiX2luZm8gKmluZm8s
IHN0cnVjdCBmYl9vcHMgKmF0eWZiX29wcykKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBhZGRyOwo+
ICAKPiBAQCAtMjE5LDcgKzIxOSw3IEBAIGludCBhdHlfaW5pdF9jdXJzb3Ioc3RydWN0IGZiX2lu
Zm8gKmluZm8pCj4gIAlpbmZvLT5zcHJpdGUuYnVmX2FsaWduID0gMTY7IAkvKiBhbmQgNjQgbGlu
ZXMgdGFsbC4gKi8KPiAgCWluZm8tPnNwcml0ZS5mbGFncyA9IEZCX1BJWE1BUF9JTzsKPiAgCj4g
LQlpbmZvLT5mYm9wcy0+ZmJfY3Vyc29yID0gYXR5ZmJfY3Vyc29yOwo+ICsJYXR5ZmJfb3BzLT5m
Yl9jdXJzb3IgPSBhdHlmYl9jdXJzb3I7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAtLSAKPiAy
LjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
