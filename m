Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39621105392
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 14:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203D86EF39;
	Thu, 21 Nov 2019 13:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAC86E111
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 13:53:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so4546093wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 05:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=2uV87tHnIgiCiVK9tH7sB/ulKG7TgA9BdW+nsg2pQjI=;
 b=rZZG9+mp/9Pgu8P3JETzFJWPdEfgF+6bWdNQZ5PJ0dnm21xNKfq0Ioi9Jhc6UXCzlT
 2zih9noGcM2ohDjqQZMQDahc0l0cijZQVr2aQoU77CujXluqME8Dw6fnJUlubocEcyFx
 DEM3wKgaUcRxMxxwSYSvHz95mK8Eea3hlEjqS08udRVIuRDNgMi2cCjVSkjiWMk8e5i0
 W62jI5I/97AtFrUcAw8eJyCbNjhqqrLbB1tujnNChTkgiDxA7p2NZ2FRwHtt0aoDGiLY
 dNwhJwZvMG+JjS5qwCH2G+rPWxSfDjjdur8uZD6YaQ7V7VlZWkggdtdkEqol/rv3QKhg
 iBQA==
X-Gm-Message-State: APjAAAXES2cCmRfy+9ASPuxRIaKni4XVAdLScuKdFfiiqS1FtF0h8SDL
 47buG5f3R3mepmI6aKnByUbg5g==
X-Google-Smtp-Source: APXvYqwEA3bovHHym+mhiZDwTYwH78g+bl2IMsyxxa/rOWNOiZDxDdFMyQqVfSr1m0ndkBVvI7gs2g==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr11440009wro.355.1574344383273; 
 Thu, 21 Nov 2019 05:53:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y19sm3169650wmd.29.2019.11.21.05.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 05:53:02 -0800 (PST)
Date: Thu, 21 Nov 2019 14:52:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drm: call drm_gem_object_funcs.mmap with fake offset
Message-ID: <20191121135259.GE6236@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20191121103807.18424-1-kraxel@redhat.com>
 <20191121103807.18424-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121103807.18424-2-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2uV87tHnIgiCiVK9tH7sB/ulKG7TgA9BdW+nsg2pQjI=;
 b=NUEEP1oBhkwjEiqtuvRUm0qG61q6F3PlYwUqK2J5ByTn5TxZ0d/Ax7oPnTAU1UMZV5
 t5MLO6lKSbZ/0WSkd151vNlW7P+IRnWI7IYkWInEmq15GIB1gKoZMGXtkEi/+MFyESVe
 dIjeAf41R3P7jWSActIRIMnpJl8aLh+qDh/jU=
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6Mzg6MDZBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBUaGUgZmFrZSBvZmZzZXQgaXMgZ29pbmcgdG8gc3RheSwgc28gY2hhbmdlIHRoZSBj
YWxsaW5nIGNvbnZlbnRpb24gZm9yCj4gZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCB0byBpbmNs
dWRlIHRoZSBmYWtlIG9mZnNldC4gIFVwZGF0ZSBhbGwgdXNlcnMKPiBhY2NvcmRpbmdseS4KClBs
ZWFzZSBhZGQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlOgoKTm90ZSB0aGF0IHRoaXMgcmV2ZXJ0cyA4
M2I4YTZmMjQyZWEgKCJkcm0vZ2VtOiBGaXggbW1hcCBmYWtlIG9mZnNldApoYW5kbGluZyBmb3Ig
ZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCIpIGFuZCBvbiB0b3AgdGhlbiBhZGRzIHRoZSBmYWtl
Cm9mZnNldCB0byAgZHJtX2dlbV9wcmltZV9tbWFwIHRvIG1ha2Ugc3VyZSBhbGwgcGF0aHMgbGVh
ZGluZyB0bwpvYmotPmZ1bmNzLT5tbWFwIGFyZSBjb25zaXN0ZW50LgoKRml4ZXM6IDgzYjhhNmYy
NDJlYSAoImRybS9nZW06IEZpeCBtbWFwIGZha2Ugb2Zmc2V0IGhhbmRsaW5nIGZvciBkcm1fZ2Vt
X29iamVjdF9mdW5jcy5tbWFwIikKQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpXaXRoIHRoYXQgYWxzbyBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLURhbmllbAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jICAgICAgICAgICAgICB8IDMgLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3NobWVtX2hlbHBlci5jIHwgMyArKysKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jICAg
ICAgICAgICAgfCAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAg
ICB8IDcgLS0tLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1
ZGUvZHJtL2RybV9nZW0uaAo+IGluZGV4IDk3YTQ4MTY1NjQyYy4uMGIzNzUwNjljZDQ4IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9n
ZW0uaAo+IEBAIC0xNTksOSArMTU5LDcgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHsK
PiAgCSAqCj4gIAkgKiBUaGUgY2FsbGJhY2sgaXMgdXNlZCBieSBieSBib3RoIGRybV9nZW1fbW1h
cF9vYmooKSBhbmQKPiAgCSAqIGRybV9nZW1fcHJpbWVfbW1hcCgpLiAgV2hlbiBAbW1hcCBpcyBw
cmVzZW50IEB2bV9vcHMgaXMgbm90Cj4gLQkgKiB1c2VkLCB0aGUgQG1tYXAgY2FsbGJhY2sgbXVz
dCBzZXQgdm1hLT52bV9vcHMgaW5zdGVhZC4gVGhlIEBtbWFwCj4gLQkgKiBjYWxsYmFjayBpcyBh
bHdheXMgY2FsbGVkIHdpdGggYSAwIG9mZnNldC4gVGhlIGNhbGxlciB3aWxsIHJlbW92ZQo+IC0J
ICogdGhlIGZha2Ugb2Zmc2V0IGFzIG5lY2Vzc2FyeS4KPiArCSAqIHVzZWQsIHRoZSBAbW1hcCBj
YWxsYmFjayBtdXN0IHNldCB2bWEtPnZtX29wcyBpbnN0ZWFkLgo+ICAJICovCj4gIAlpbnQgKCpt
bWFwKShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBpbmRleCAyZjJiODg5MDk2YjAuLjU2ZjQyZTBmMjU4NCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW0uYwo+IEBAIC0xMTA2LDkgKzExMDYsNiBAQCBpbnQgZHJtX2dlbV9tbWFw
X29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdW5zaWduZWQgbG9uZyBvYmpfc2l6ZSwK
PiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAlpZiAob2JqLT5mdW5jcyAmJiBvYmotPmZ1bmNz
LT5tbWFwKSB7Cj4gLQkJLyogUmVtb3ZlIHRoZSBmYWtlIG9mZnNldCAqLwo+IC0JCXZtYS0+dm1f
cGdvZmYgLT0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKPiAtCj4gIAkJcmV0
ID0gb2JqLT5mdW5jcy0+bW1hcChvYmosIHZtYSk7Cj4gIAkJaWYgKHJldCkKPiAgCQkJcmV0dXJu
IHJldDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+IGluZGV4IDA4MTBk
M2VmNjk2MS4uYTQyMWEyZWVkNDhhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMKPiBAQCAtNTI4LDYgKzUyOCw5IEBAIGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJ
c3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbTsKPiAgCWludCByZXQ7Cj4gIAo+ICsJ
LyogUmVtb3ZlIHRoZSBmYWtlIG9mZnNldCAqLwo+ICsJdm1hLT52bV9wZ29mZiAtPSBkcm1fdm1h
X25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOwo+ICsKPiAgCXNobWVtID0gdG9fZHJtX2dlbV9z
aG1lbV9vYmoob2JqKTsKPiAgCj4gIAlyZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1l
bSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYwo+IGluZGV4IDA4MTQyMTFiMGYzZi4uYTk2MzNiZDI0MWJiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYwo+IEBAIC03MTQsNiArNzE0LDkgQEAgaW50IGRybV9nZW1fcHJp
bWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gIAlpbnQgcmV0Owo+ICAKPiAgCWlmIChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3Mt
Pm1tYXApIHsKPiArCQkvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovCj4gKwkJdm1hLT52bV9wZ29m
ZiArPSBkcm1fdm1hX25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOwo+ICsKPiAgCQlyZXQgPSBv
YmotPmZ1bmNzLT5tbWFwKG9iaiwgdm1hKTsKPiAgCQlpZiAocmV0KQo+ICAJCQlyZXR1cm4gcmV0
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+IGluZGV4IGU2NDk1Y2EyNjMwYi4uM2U4YzNkZTkx
YWU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gQEAgLTUxNCwxMyArNTE0LDYgQEAg
RVhQT1JUX1NZTUJPTCh0dG1fYm9fbW1hcCk7Cj4gIGludCB0dG1fYm9fbW1hcF9vYmooc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gIHsK
PiAgCXR0bV9ib19nZXQoYm8pOwo+IC0KPiAtCS8qCj4gLQkgKiBGSVhNRTogJmRybV9nZW1fb2Jq
ZWN0X2Z1bmNzLm1tYXAgaXMgY2FsbGVkIHdpdGggdGhlIGZha2Ugb2Zmc2V0Cj4gLQkgKiByZW1v
dmVkLiBBZGQgaXQgYmFjayBoZXJlIHVudGlsIHRoZSByZXN0IG9mIFRUTSB3b3JrcyB3aXRob3V0
IGl0Lgo+IC0JICovCj4gLQl2bWEtPnZtX3Bnb2ZmICs9IGRybV92bWFfbm9kZV9zdGFydCgmYm8t
PmJhc2Uudm1hX25vZGUpOwo+IC0KPiAgCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChibywgdm1hKTsK
PiAgCXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
