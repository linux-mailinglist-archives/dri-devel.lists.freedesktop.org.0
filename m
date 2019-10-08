Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6735FCF6AC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 12:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6DB6E78A;
	Tue,  8 Oct 2019 10:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEAC6E78A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:01:21 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r16so15022801edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 03:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=AQdb6B57pre/1dTdcCpmPOkujYb6o276IXN4cIuIx1M=;
 b=cQGDN1n8LkU/PufxbnqSnF0wchw0AW8MifUk5ewh9cE5fJfULYOERjKLzjmd/0YsuN
 Xw4LDfVWfgvnuyOacS7wd+SRFyTg4JZN3PNyriU96EDtbYUXAJoAlLVz/1pokkQX5I6f
 ix1OELTS0i23n1lR3Uy5FzIM0KMkZbrSVY9/KdY4azqzh88lsDmXavK2e6nq0q7lcfbY
 T029HEFeSnDL6H7ogcyuUhlT1bGJbGTi9qRFmw/D7JSLh429ttA2A8s7E/d2NnKiLuvl
 E8M7ZpnhpwVD0V5vcm/tzzlH9NRXWZHAaMozJTey8TrelQE0NUVW4a5ei5WHqmURTmJN
 M3LA==
X-Gm-Message-State: APjAAAXQmJP3KRLju5l0sgiQ0KMQD9ZkPmNvmkhAdR7TX0TnCGdxtoRL
 EPrtg8kzFwqm68DF39nQIO9gaQ==
X-Google-Smtp-Source: APXvYqysntrKNBxIHzu4L6/EpSPoYXQDixAKQkul5jLxOaLSqYKQrZ/VVEdfPLQM02D7IwY6AJyLNw==
X-Received: by 2002:a50:f703:: with SMTP id g3mr32932384edn.43.1570528879969; 
 Tue, 08 Oct 2019 03:01:19 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s19sm2249152ejs.78.2019.10.08.03.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 03:01:19 -0700 (PDT)
Date: Tue, 8 Oct 2019 12:01:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm/fb-helper: Synchronize dirty worker with vblank
Message-ID: <20191008100116.GM16989@phenom.ffwll.local>
References: <20190912064230.27972-1-tzimmermann@suse.de>
 <20190912064230.27972-2-tzimmermann@suse.de>
 <20190917130612.GT3958@phenom.ffwll.local>
 <d34d3ce5-a608-3f66-ced3-6bd566ac47a0@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d34d3ce5-a608-3f66-ced3-6bd566ac47a0@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=AQdb6B57pre/1dTdcCpmPOkujYb6o276IXN4cIuIx1M=;
 b=lWzgh4vRj11BTaIjtjhk24IPSk3MEQ7E1Jh93hOnxZWp+syc37tXCXB+V6IYmOPR5U
 tsD9flprhyGA67cpcVQaYypK0WRFvW7v9YUZUFfBGPoFiH8/MTHm3VOF3jr81O0XE9he
 740fvnRfsm3u+TJbT0yPeVb9yRZyLBO/g9/4Y=
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTA6NDE6NDNBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxNy4wOS4xOSB1bSAxNTowNiBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gPiBPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCAwODo0MjoyOEFNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+ID4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZy
b20gdGhlIGNvbnNvbGUncyBzaGFkb3cgYnVmZmVyLCB0aGUgZGlydHkKPiA+ID4gd29ya2VyIG5v
dyB3YWl0cyBmb3IgdmJsYW5rLiBUaGlzIGFsbG93cyBzZXZlcmFsIHNjcmVlbiB1cGRhdGVzIHRv
IHBpbGUKPiA+ID4gdXAgYW5kIGFjdHMgYXMgYSByYXRlIGxpbWl0ZXIuCj4gPiA+IAo+ID4gPiB2
MjoKPiA+ID4gCSogZG9uJ3QgaG9sZCBoZWxwZXItPmxvY2sgd2hpbGUgd2FpdGluZyBmb3IgdmJs
YW5rCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYyB8IDEwICsrKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gPiA+IGluZGV4IGE3
YmE1YjQ5MDJkNi4uZDBjYjFmYTRmOTA5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMKPiA+ID4gQEAgLTQwMiw4ICs0MDIsMTggQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBl
cl9kaXJ0eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiA+ID4gICAJCQkJCQkgICAg
ZGlydHlfd29yayk7Cj4gPiA+ICAgCXN0cnVjdCBkcm1fY2xpcF9yZWN0ICpjbGlwID0gJmhlbHBl
ci0+ZGlydHlfY2xpcDsKPiA+ID4gICAJc3RydWN0IGRybV9jbGlwX3JlY3QgY2xpcF9jb3B5Owo+
ID4gPiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiA+ID4gICAJdW5zaWduZWQgbG9uZyBmbGFn
czsKPiA+ID4gICAJdm9pZCAqdmFkZHI7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiAr
CS8qIHJhdGUtbGltaXQgdXBkYXRlIGZyZXF1ZW5jeSAqLwo+ID4gPiArCWNydGMgPSBoZWxwZXIt
PmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOwo+ID4gPiArCXJldCA9IGRybV9jcnRjX3ZibGFua19n
ZXQoY3J0Yyk7Cj4gPiA+ICsJaWYgKCFyZXQpIHsKPiA+ID4gKwkJZHJtX2NydGNfd2FpdF9vbmVf
dmJsYW5rKGNydGMpOwo+ID4gCj4gPiBXaXRob3V0IHRoZSBsb2NraW5nIChzcGVjaWZpY2FsbHks
IHByZXZlbnRpbmcgb3RoZXIgbWFzdGVycykgdGhpcyBjYW4gZ28KPiA+IGJvb20gc2luY2UgaXQg
YWdhaW4gY2FsbHMgZHJtX3ZibGFua19nZXQuIElmIHNvbWVvbmUgdHVybmVkIG9mIHRoZSBkaXNw
bGF5Cj4gPiBtZWFud2hpbGUgdGhhdCB3aWxsIGZhaWwsIGFuZCByZXN1bHQgaW4gYW4gdW5zaWdo
dGx5IFdBUk4gYmFja3RyYWNlLgo+ID4gCj4gPiBJIHRoaW5rIHdlIG5lZWQgYSBfX2RybV9jcnRj
X3dhaXRfb25lX3ZibGFuayhjcnRjKTsgd2hpY2ggcmVxdWlyZXMgdGhhdAo+ID4gY2FsbGVycyBo
b2xkIGEgZnVsbCB2YmxhbmsgcmVmZXJlbmNlIGFscmVhZHkuIFRoZSBvdGhlciBpc3N1ZSBpcyB0
aGF0IHdlCj4gPiBtaWdodCByYWNlIHdpdGggdGhlIGRpc2FibGluZyBhbmQgaGl0IHRoZSB0aW1l
b3V0LCB3aGljaCBhZ2FpbiBnaXZlcyB1cyBhbgo+ID4gdW5zaWdodGx5IFdBUk5JTkcgYmFja3Ry
YWNlLiBCb3RoIGNhbiBoYXBwZW4gd2l0aG91dCBsb2NrcyAodGhhdCdzIHdoeSB0aGUKPiA+IGlv
Y3RsIHBhdGggbmVlZHMgdGhlbSksIGJ1dCB3ZSBuZWVkIHRvIGF2b2lkLgo+IAo+IEhlcmUncyBh
IHN0YXR1cyB1cGRhdGU6IEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgcGF0Y2ggZm9yIGEgd2hp
bGUsIGJ1dCB0aGUKPiB3b3JrZXIgc3RpbGwgY2Fubm90IHdhaXQgcmVsaWFibGUgZm9yIHZibGFu
a3MuIFdoZW4gdGhlIHdvcmtlciBydW5zLCB0aGUKPiBkaXNwbGF5IGNvdWxkIGJlIG9mZiBhbmQg
aGVuY2Ugbm8gdmJsYW5rIGV2ZW50cyBvY2N1ci4gVGhhdCdzIGVzcGVjaWFsbHkgYQo+IHByb2Js
ZW0gZHVyaW5nIGJvb3QuIFRoZSB3b3JrZXIgd2FybnMgYWJvdXQgbWlzc2VkIHZibGFua3MgYmVj
YXVzZSB0aGUKPiBjb25zb2xlJ3MgdmlkZW8gbW9kZSBpcyBzdGlsbCBiZWluZyBwcm9ncmFtbWVk
LgoKVGhpcyBzb3VuZHMgbGlrZSBhIGRyaXZlciBidWcgdG8gbWUuIElmIGRybV9jcnRjX3ZibGFu
a19nZXQgcmV0dXJucwpzdWNjZXNzZnVsbHksIHZibGFua3MgYXJlIHN1cHBvc2VkIHRvIHdvcmsu
IElmIHRoYXQncyBub3QgdGhlIGNhc2UgYXQgbG9hZAp0aW1lLCB0aGVuIHNvbWV0aGluZyB3aXRo
IHRoZSB2YmxhbmsgaW5pdCBoYXMgZ29uZSB3cm9uZyBzb21ld2hlcmUgKG9yCmZiZGV2IGlzIHNl
dCB1cCB0b28gZWFybHkpLgotRGFuaWVsCgo+IAoKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAK
PiA+IC1EYW5pZWwKPiA+ID4gKwkJZHJtX2NydGNfdmJsYW5rX3B1dChjcnRjKTsKPiA+ID4gKwl9
Cj4gPiA+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZoZWxwZXItPmRpcnR5X2xvY2ssIGZsYWdzKTsK
PiA+ID4gICAJY2xpcF9jb3B5ID0gKmNsaXA7Cj4gPiA+IC0tIAo+ID4gPiAyLjIzLjAKPiA+ID4g
Cj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVy
ZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJh
c2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
