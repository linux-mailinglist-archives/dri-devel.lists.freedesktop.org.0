Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E8E328D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2D26E3AC;
	Thu, 24 Oct 2019 12:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137A66E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:41:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s1so17144241wro.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=hEZzF+vNyQsRt/SfCWxmU30K+Fb24Wha62rPS3eV/20=;
 b=ht89u4DdsMmeCQoPrJkB8U2uLcrNmkN3ZVI9zuOSgS0LFkpQ8Pv+Y2ycFWJKKxwoC7
 YKYui2knGgs+m7m1hl1Nt67Ppo8uz7oMI3lfMdKlC2FeiWumjfvZe/tQXdkWrSw/Rz0e
 aKv3HlzmZu39kObHO80wERZ07m2LXyzKhvQkgwYtptr6cjT5gfb/78hTEQ+GunXjYGol
 CbdNDhk1Wxjl4l/HlHBVQKKuL8IzXddyn9l3SxfGuKumRSLCkIYmGxMvfNezCDZb9INt
 va8tleXLYxFJmBnuk6hiuQW8tXxEW9mjtvz+ysVyJz/GJIm/aDeNL2rn8L+qeLYqSeJ5
 b0jA==
X-Gm-Message-State: APjAAAXP9BqY3Az/tqlmrbBXdwSMJG+upWckZL343MsvOHTStjHse1AS
 bqPdyztaitUNuSnVw6Fb/M+x1A==
X-Google-Smtp-Source: APXvYqxOB84g7+tisRQaFaZooO78mIoBED/STGrea8tie25FlhqgGd4vAqQrpeICWwKRMNweBwmQXQ==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr3638014wrr.81.1571920865575; 
 Thu, 24 Oct 2019 05:41:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id e3sm2233418wme.36.2019.10.24.05.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:41:05 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:41:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: use the parent resv for ghost objects v3
Message-ID: <20191024124103.GI11828@phenom.ffwll.local>
References: <20191024111632.1836-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024111632.1836-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=hEZzF+vNyQsRt/SfCWxmU30K+Fb24Wha62rPS3eV/20=;
 b=Q/4LLZw9A695taZ/07q31sEMY4Roih8aEld1rtgMJgIWQiMiXlPLjavybA/SujEkoQ
 BGXy9EyE67AYEUZyhkx8sFK4RJLNNOa7N93f/LDub5aOdBgPTCzwUlcSmuC4FU1mVMoX
 9B3v+B1TJP8hzT0HgOlgjggWYAsinV5Wk/mt8=
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDE6MTY6MzJQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBUaGlzIHdheSB0aGUgVFRNIGlzIGRlc3Ryb3llZCB3aXRoIHRoZSBjb3JyZWN0
IGRtYV9yZXN2IG9iamVjdAo+IGxvY2tlZCBhbmQgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0
ZWQgQk8gZXZpY3Rpb25zLgo+IAo+IHYyOiBMaW1pdCB0aGlzIHRvIG9ubHkgY2FzZXMgd2hlbiB0
aGUgcGFyZW50IG9iamVjdCB1c2VzIGEgc2VwYXJhdGUKPiAgICAgcmVzZXJ2YXRpb24gb2JqZWN0
IGFzIHdlbGwuIFRoaXMgZml4ZXMgYW5vdGhlciBPT00gcHJvYmxlbS4KPiB2MzogZml4IGluaXQg
YW5kIHRyeV9sb2NrIG9uIHRoZSB3cm9uZyBvYmplY3QKClVoIHRoaXMgbWFrZXMgYSBsb3QgbW9y
ZSBzZW5zZSB3aXRoIHRoYXQgZml4ZWQgOi0pCgpOb3cgZXZlbiBmZWVsaW5nIGJvbGQgZW5vdWdo
IGZvciBhCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAy
MCArKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gaW5kZXgg
NzNhMWIwMTg2MDI5Li5mN2I1N2NhMWE5NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdXRpbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRp
bC5jCj4gQEAgLTUxNiw5ICs1MTYsMTEgQEAgc3RhdGljIGludCB0dG1fYnVmZmVyX29iamVjdF90
cmFuc2ZlcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJa3JlZl9pbml0KCZmYm8t
PmJhc2Uua3JlZik7Cj4gIAlmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0
cm95Owo+ICAJZmJvLT5iYXNlLmFjY19zaXplID0gMDsKPiAtCWZiby0+YmFzZS5iYXNlLnJlc3Yg
PSAmZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7Cj4gLQlkbWFfcmVzdl9pbml0KGZiby0+YmFzZS5iYXNl
LnJlc3YpOwo+IC0JcmV0ID0gZG1hX3Jlc3ZfdHJ5bG9jayhmYm8tPmJhc2UuYmFzZS5yZXN2KTsK
PiArCWlmIChiby0+YmFzZS5yZXN2ID09ICZiby0+YmFzZS5fcmVzdikKPiArCQlmYm8tPmJhc2Uu
YmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ICsKPiArCWRtYV9yZXN2X2luaXQo
JmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiArCXJldCA9IGRtYV9yZXN2X3RyeWxvY2soJmZiby0+
YmFzZS5iYXNlLl9yZXN2KTsKPiAgCVdBUk5fT04oIXJldCk7Cj4gIAo+ICAJKm5ld19vYmogPSAm
ZmJvLT5iYXNlOwo+IEBAIC03MTUsNyArNzE3LDcgQEAgaW50IHR0bV9ib19tb3ZlX2FjY2VsX2Ns
ZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgCQlpZiAocmV0KQo+ICAJCQly
ZXR1cm4gcmV0Owo+ICAKPiAtCQlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShnaG9zdF9vYmotPmJh
c2UucmVzdiwgZmVuY2UpOwo+ICsJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmot
PmJhc2UuX3Jlc3YsIGZlbmNlKTsKPiAgCj4gIAkJLyoqCj4gIAkJICogSWYgd2UncmUgbm90IG1v
dmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0Cj4gQEAgLTcyOCw3ICs3MzAsNyBA
QCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+ICAJCWVsc2UKPiAgCQkJYm8tPnR0bSA9IE5VTEw7Cj4gIAo+IC0JCXR0bV9ib191bnJl
c2VydmUoZ2hvc3Rfb2JqKTsKPiArCQlkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5f
cmVzdik7Cj4gIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwo+ICAJfQo+ICAKPiBAQCAtNzcxLDcg
Kzc3Myw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+ICAJCWlmIChyZXQpCj4gIAkJCXJldHVybiByZXQ7Cj4gIAo+IC0JCWRtYV9yZXN2
X2FkZF9leGNsX2ZlbmNlKGdob3N0X29iai0+YmFzZS5yZXN2LCBmZW5jZSk7Cj4gKwkJZG1hX3Jl
c3ZfYWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+YmFzZS5fcmVzdiwgZmVuY2UpOwo+ICAKPiAg
CQkvKioKPiAgCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhlIFRU
TSBvYmplY3QKPiBAQCAtNzg0LDcgKzc4Niw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJCWVsc2UKPiAgCQkJYm8tPnR0bSA9IE5V
TEw7Cj4gIAo+IC0JCXR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsKPiArCQlkbWFfcmVzdl91
bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4gIAkJdHRtX2JvX3B1dChnaG9zdF9vYmop
Owo+ICAKPiAgCX0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVE
KSB7Cj4gQEAgLTg0MCw3ICs4NDIsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsK
PiAgCj4gLQlyZXQgPSBkbWFfcmVzdl9jb3B5X2ZlbmNlcyhnaG9zdC0+YmFzZS5yZXN2LCBiby0+
YmFzZS5yZXN2KTsKPiArCXJldCA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZnaG9zdC0+YmFzZS5f
cmVzdiwgYm8tPmJhc2UucmVzdik7Cj4gIAkvKiBMYXN0IHJlc29ydCwgd2FpdCBmb3IgdGhlIEJP
IHRvIGJlIGlkbGUgd2hlbiB3ZSBhcmUgT09NICovCj4gIAlpZiAocmV0KQo+ICAJCXR0bV9ib193
YWl0KGJvLCBmYWxzZSwgZmFsc2UpOwo+IEBAIC04NDksNyArODUxLDcgQEAgaW50IHR0bV9ib19w
aXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gIAliby0+bWVt
Lm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKPiAgCWJvLT50dG0gPSBOVUxMOwo+ICAKPiAtCXR0
bV9ib191bnJlc2VydmUoZ2hvc3QpOwo+ICsJZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdC0+YmFzZS5f
cmVzdik7Cj4gIAl0dG1fYm9fcHV0KGdob3N0KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAtLSAKPiAy
LjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
