Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E174927B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 23:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5C96E0A8;
	Mon, 17 Jun 2019 21:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425D6E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 21:20:50 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so18179824edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=QwMS4l0IiLFb0S3tY2+/+xgF4EPZEuXg82MQvYRZDHI=;
 b=T0v5tPpo47LqSsN1Qxunid7coWz/JXyMesuHdnZfnALKCXR2aMepQt01DFpk9HYdde
 SGJPQ/Cpo2cqvjKsoWFGPnZJrunvKdm9Na2/5d9OToTr569DlIy27bLt+qfUM98jZJ3D
 D4LUo0i4bI6KcgCRo/XlfPZe2eOWZtNfn1uGCG0fDk7fj5dK8DyRn0n1iQXpbnnyUr2m
 wXtKG6bCOATtGM6g5AtSCl902Ruwj7fsJRIaigQ3pJDvyM3TvgwvAGHWaiHzsAgC2k72
 EGNw52wYq4al7NBHgcPUFV58wqujPuoYy9rPhrdXYee0ISHO61rFzWuKeukcYmOCa7R3
 1t8Q==
X-Gm-Message-State: APjAAAWKpvjCuRunOzXBJii08Suo6pZhM7hlRi76Lv2j5EIxUVGT3RjO
 xBL5JAO/6QoLK60Q+QoeNMN/+w==
X-Google-Smtp-Source: APXvYqzEmnx6JrLQWrK3cbDti2AZFOunfhDYsttyWnQ+jzkxEzSIIdKA1TGnmtEZ+HOjMOPtDQW7vA==
X-Received: by 2002:a17:906:708d:: with SMTP id
 b13mr17369427ejk.89.1560806449344; 
 Mon, 17 Jun 2019 14:20:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s5sm3821092edh.3.2019.06.17.14.20.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 14:20:48 -0700 (PDT)
Date: Mon, 17 Jun 2019 23:20:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
Message-ID: <20190617212046.GL12905@phenom.ffwll.local>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
 <f326e4e2-2cc3-6e90-f9d3-96b5c8c8b070@tronnes.org>
 <20190617162951.GJ12905@phenom.ffwll.local>
 <fd97eea4-32cd-81a4-6b3e-076a1d524a4a@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd97eea4-32cd-81a4-6b3e-076a1d524a4a@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QwMS4l0IiLFb0S3tY2+/+xgF4EPZEuXg82MQvYRZDHI=;
 b=FUl529v2NTmBIJVjS3eDGPlPmmhsPf/z5nxNg37b1R7nRXkDCG4ZttTvovZiQOtwJP
 Cw7L/c+EMiFhMcpo6RvLT8IiC849STIYAskcKDOqTjnJ69+M7k2wT9433ptNZaP7aNnl
 4eUXEJ4DIF38fYXP2FcucGhgMx8VuTdHuf+Q0=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDY6NTQ6MDRQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAxNy4wNi4yMDE5IDE4LjI5LCBza3JldiBEYW5pZWwgVmV0dGVy
Ogo+ID4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6NDc6NTBQTSArMDIwMCwgTm9yYWxmIFRy
w7hubmVzIHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBEZW4gMTQuMDYuMjAxOSAyMi4zNSwgc2tyZXYg
RGFuaWVsIFZldHRlcjoKPiA+Pj4gV2UncmUga2luZGEgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVj
dGlvbi4gU3BvdHRlZCB3aGlsZSB0eXBpbmcgYmV0dGVyCj4gPj4+IGdlbS9wcmltZSBkb2NzLgo+
ID4+Pgo+ID4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
Pj4+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+Pj4gQ2M6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPj4+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9k
by5yc3QgfCA0ICsrKysKPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+
Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+Pj4gaW5kZXggYjRhNzZjMjcwM2U1Li4yMzU4M2YwZTM3
NTUgMTAwNjQ0Cj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gPj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gPj4+IEBAIC0yMjgsNiArMjI4LDEwIEBA
IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcwo+ID4+PiAgR0VNIG9iamVjdHMgY2FuIG5vdyBo
YXZlIGEgZnVuY3Rpb24gdGFibGUgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGNhbGxiYWNrcyBvbiB0
aGUKPiA+Pj4gIERSTSBkcml2ZXIgc3RydWN0LiBUaGlzIGlzIG5vdyB0aGUgcHJlZmVycmVkIHdh
eSBhbmQgZHJpdmVycyBjYW4gYmUgbW92ZWQgb3Zlci4KPiA+Pj4gIAo+ID4+PiArVW5mb3J0dW5h
dGVseSBzb21lIG9mIHRoZSByZWNlbnRseSBhZGRlZCBHRU0gaGVscGVycyBhcmUgZ29pbmcgaW4g
dGhlIHdyb25nCj4gPj4+ICtkaXJlY3Rpb24gYnkgYWRkaW5nIE9QUyBtYWNyb3MgdGhhdCB1c2Ug
dGhlIG9sZCwgZGVwcmVjYXRlZCBob29rcy4gU2VlCj4gPj4+ICtEUk1fR0VNX0NNQV9WTUFQX0RS
SVZFUl9PUFMsIERSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywgYW5kIERSTV9HRU1fVlJBTV9EUklW
RVJfUFJJTUUuCj4gPj4+ICsKPiA+Pgo+ID4+IEJvdGggRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJf
T1BTIGFuZCBEUk1fR0VNX1NITUVNX0RSSVZFUl9PUFMgdXNlIHRoZQo+ID4+IEdFTSB2dGFibGUu
IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmcgaGVyZT8KPiA+IAo+ID4gZ2VtIHZ0YWJsZSBJIG1l
YW4gZHJtX2dlbV9vYmplY3RfZnVuY3MuIFdoaWNoIHRoZXNlIG1hY3JvcyBkZWZpbml0ZWx5Cj4g
PiBhcmVuJ3QgdXNlZnVsIGZvci4KPiAKPiAjZGVmaW5lIERSTV9HRU1fQ01BX1ZNQVBfRFJJVkVS
X09QUyBcCj4gCS5nZW1fY3JlYXRlX29iamVjdAk9IGRybV9jbWFfZ2VtX2NyZWF0ZV9vYmplY3Rf
ZGVmYXVsdF9mdW5jcywgXAo+IAkuZHVtYl9jcmVhdGUJCT0gZHJtX2dlbV9jbWFfZHVtYl9jcmVh
dGUsIFwKPiAJLnByaW1lX2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2Zk
LCBcCj4gCS5wcmltZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwg
XAo+IAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9y
dF9zZ190YWJsZV92bWFwLCBcCj4gCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2VtX3ByaW1lX21t
YXAKPiAKPiBfX2RybV9nZW1fY21hX2NyZWF0ZSgpIGNhbGxzIC0+Z2VtX2NyZWF0ZV9vYmplY3Qu
Cj4gCj4gZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNzKCkgc2V0czoKPiAJ
Y21hX29iai0+YmFzZS5mdW5jcyA9ICZkcm1fY21hX2dlbV9kZWZhdWx0X2Z1bmNzOwo+IAo+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2NtYV9nZW1fZGVmYXVs
dF9mdW5jcyA9IHsKPiAJLmZyZWUgPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKPiAJLnByaW50
X2luZm8gPSBkcm1fZ2VtX2NtYV9wcmludF9pbmZvLAo+IAkuZ2V0X3NnX3RhYmxlID0gZHJtX2dl
bV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+IAkudm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Zt
YXAsCj4gCS52bV9vcHMgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+IH07Cj4gCj4gVGhlIEdFTSBT
SE1FTSBoZWxwZXIgd2FzIG1hZGUgYWZ0ZXIgZHJtX2dlbV9vYmplY3RfZnVuY3MgY2FtZSBhYm91
dCBzbwo+IGl0IHNldHMgdGhlIGRlZmF1bHQgdnRhYmxlIGluIGRybV9nZW1fc2htZW1fY3JlYXRl
KCk6Cj4gCQlvYmotPmZ1bmNzID0gJmRybV9nZW1fc2htZW1fZnVuY3M7Cj4gCj4gc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3NobWVtX2Z1bmNzID0gewo+
IAkuZnJlZSA9IGRybV9nZW1fc2htZW1fZnJlZV9vYmplY3QsCj4gCS5wcmludF9pbmZvID0gZHJt
X2dlbV9zaG1lbV9wcmludF9pbmZvLAo+IAkucGluID0gZHJtX2dlbV9zaG1lbV9waW4sCj4gCS51
bnBpbiA9IGRybV9nZW1fc2htZW1fdW5waW4sCj4gCS5nZXRfc2dfdGFibGUgPSBkcm1fZ2VtX3No
bWVtX2dldF9zZ190YWJsZSwKPiAJLnZtYXAgPSBkcm1fZ2VtX3NobWVtX3ZtYXAsCj4gCS52dW5t
YXAgPSBkcm1fZ2VtX3NobWVtX3Z1bm1hcCwKPiAJLnZtX29wcyA9ICZkcm1fZ2VtX3NobWVtX3Zt
X29wcywKPiB9Owo+IAo+ICNkZWZpbmUgRFJNX0dFTV9TSE1FTV9EUklWRVJfT1BTIFwKPiAJLnBy
aW1lX2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLCBcCj4gCS5wcmlt
ZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwgXAo+IAkuZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fc2htZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxl
LCBcCj4gCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2VtX3ByaW1lX21tYXAsIFwKPiAJLmR1bWJf
Y3JlYXRlCQk9IGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUKPiAKPiBTbyB0aGUgdHdvIGRyaXZl
ciBvcHMgbWFjcm9lcyBvbmx5IHNldCB0aGUgbmVjZXNzYXJ5IGJpdHMgdG8gZW5hYmxlCj4gcHJp
bWUgaW1wb3J0L2V4cG9ydC9tbWFwIGFuZCBkdW1iIGJ1ZmZlciBjcmVhdGlvbiwgbGVhdmluZyB0
aGUgcmVzdCB0bwo+IGRybV9nZW1fb2JqZWN0X2Z1bmNzLgo+IEhhdmUgd2UgZGVwcmVjYXRlZCBh
bnkgb2YgdGhlc2UgaG9va3M/CgpVaCBJIHdhcyBibGluZCA6LS8gVW5mb3J0dW5hdGVseSBJIHB1
c2hlZCB0aGF0IHBhdGNoIGFscmVhZHksIEknbGwgZm9sbG93CnVwIHdpdGggYSBwYXRjaCB0byBm
aXggaXQuIHZyYW0gaGVscGVycyBhcmUgbm90IGZvbGxvd2luZyBsYXRlc3QgYmVzdApwcmFjdGlj
ZXMgdGhvdWdoLCByaWdodD8KCkFsc28gSSBndWVzcyBhIGxvdCBtb3JlIG9mIHRoZSBjbWEgaGVs
cGVyIHVzaW5nIGRyaXZlcnMgY291bGQgYmUgY3V0IG92ZXIKdG8gdGhlIHZtYXAgb25lcz8KLURh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
