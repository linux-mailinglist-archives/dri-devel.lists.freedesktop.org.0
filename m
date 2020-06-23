Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD9204F8C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 12:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224856E397;
	Tue, 23 Jun 2020 10:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D14F6E087
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 10:51:16 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n6so16139378otl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QoCPlVuRfLdDkwTBRDRK73tEwxS3sN2fuJiGkn2CvdE=;
 b=gOKzF5Yl8kKYahi5zjnsTU+qXPPirvcXIt/7AkVJ+qdy+FWf0uU8V6HbpsO4r2juD7
 w2iP9eBLHtTmU+rweutvCfl7szvkDoX2LnG9M/YYCRnGryXBoohfc4iAuNKngf9sT2St
 1E0jtqC1MmLkv3KSwEE7j8DVPU+fk/IRWiczw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QoCPlVuRfLdDkwTBRDRK73tEwxS3sN2fuJiGkn2CvdE=;
 b=Z6adRd62LXy3cvLZonrcUanOOOkudrlCNG7BiaE8wU+oBI/wv4OfZsUXFs8wXMdIIk
 LQJunQvtgPDBWm0AQKASManQweqhc3krhLR4x3ckSKiyOYgYy/+UsFE/d5lbYe9Y0D6P
 vKnVbArGz//ABQ+eXtDmQdxtfkt5x+VieX3yxQAzFoZJCtHUW8qLR8OChQEMxAddx+cQ
 5SB2jMsJ2JkTzRJBvqwFTBA/ZRXxy/3DPPg+wUs/tlOI5FAvbtuT7/hlXoNUK2S+Vh1N
 m+KQmqcCfOzHSOCr656asAAog/o09j3zH3LpB5r8kSDi3YcHX4ndTLIFUDrYM0I+o6fW
 kuZQ==
X-Gm-Message-State: AOAM531ir+P9h4UkGtYEbze+7GqPszVz2InVKVPYDf9bR9KABdD+j74l
 I1a7UtV+ZFDeHJg5yBJsghNGK78TWQAiAIP5fYxlElrm
X-Google-Smtp-Source: ABdhPJwsXeafc7ngCrqn/R9dExkVr9aTpMWL7pHCp5L8XQ6N2/9uvR1ASQII2PdIi3/ADKwLAzkpagO1g50upZNnhdo=
X-Received: by 2002:a05:6830:54:: with SMTP id
 d20mr18786397otp.281.1592909475390; 
 Tue, 23 Jun 2020 03:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20200604081224.863494-9-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 23 Jun 2020 12:51:04 +0200
Message-ID: <CAKMK7uHx+rFyjQOWL2r1fOo2EP3u_owMP2zfg3NnEkxUY4BhkA@mail.gmail.com>
Subject: Re: [PATCH 08/18] drm/amdgpu: add dma-fence annotations to atomic
 commit path
To: DRI Development <dri-devel@lists.freedesktop.org>, 
 Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>, 
 Thomas Hellstrom <thomas.hellstrom@intel.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9sYW5kICYgdm13Z2Z4IG1haW50YWluZXJzLAoKVGhvbWFzIGhhcyBwbGF5ZWQgYXJvdW5k
IHdpdGggdGhlc2UgYW5ub3RhdGlvbnMgb24gaGlzIHZtd2dmeCBzZXR1cCwKYW5kIGZvdW5kIHNv
bWUgaXNzdWVzLiBBcHBhcmVudGx5IGluIHRoZSBhdG9taWNfY29tbWl0X3RhaWwgcGF0aCB3aGVu
CmhhbmRsaW5nIHRoZSBkaXJ0eSByZWN0YW5nbGUgc3R1ZmYgeW91IGFjcXVpcmUgYSB0dG0gcmVz
ZXJ2YXRpb24sCndoaWNoIGlzIGEgbm8tZ28gc2luY2UgaXQgY291bGQgZGVhZGxvY2sgd2l0aCBv
dGhlciBwYXRocyAtIGF0b21pYwpjb21taXRzIGNhbiBwcm9kdWNlIGEgZG1hX2ZlbmNlLgoKVGhp
cyBwYXRjaCBoZXJlIGhpZ2hsaWdodHMgdGhhdCB3aXRoIHRoZSBuZXcgYW5ub3RhdGlvbnMsIGFu
ZAphcHBhcmVudGx5IGNhdXNlcyBhIGxvY2tkZXAgc3BsYXQgaWYgeW91IGdvIHRocm91Z2ggdGhl
IGRpcnR5IHJlY3QKcGF0aHMgKG5vdCBzdXJlIGlmIGl0IGFsc28gaGFwcGVucyBvdGhlcndpc2Us
IFRob21hcyBjYW4gZmlsbCB5b3UgaW4Kd2l0aCB0aGUgZGV0YWlscykuCgpDYW4geW91IHBscyB0
YWtlIGEgbG9vayBhdCB0aGlzPyBJJ20gaGFwcHkgdG8gaGVscCBvdXQgd2l0aCBhbmFseXppbmcK
YW55IGxvY2tkZXAgc3BsYXRzLiBGb3IgYWN0dWFsIGZpeGVzIFRob21hcyBpcyBiZXR0ZXIgc2lu
Y2UgSSBkb24ndAp1bmRlcnN0YW5kIGEgbG90IG9mIGhvdyBkcm0vdm13Z2Z4IHdvcmtzIGludGVy
bmFsbHkuCgpDaGVlcnMsIERhbmllbAoKCk9uIFRodSwgSnVuIDQsIDIwMjAgYXQgMTA6MTIgQU0g
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBJIG5lZWQg
YSBjYW5hcnkgaW4gYSB0dG0tYmFzZWQgYXRvbWljIGRyaXZlciB0byBtYWtlIHN1cmUgdGhlCj4g
ZG1hX2ZlbmNlX2JlZ2luL2VuZF9zaWduYWxsaW5nIGFubm90YXRpb25zIGFjdHVhbGx5IHdvcmsu
Cj4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+IENjOiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwo+IENjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA2
ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBpbmRleCBi
ZGJhMGJmZDZkZjEuLmFkYWJmYTkyOWY0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBAIC01Nyw2ICs1Nyw3IEBACj4K
PiAgI2luY2x1ZGUgIml2c3JjaWQvaXZzcmNpZF92aXNsYW5kczMwLmgiCj4KPiArI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tb2R1bGVwYXJhbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvdmVyc2lvbi5oPgo+IEBA
IC03MzIwLDYgKzczMjEsOSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fYXRvbWljX2NvbW1pdF90
YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiAgICAgICAgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpvbGRfY29uX3N0YXRlLCAqbmV3X2Nvbl9zdGF0ZTsKPiAgICAgICAg
IHN0cnVjdCBkbV9jcnRjX3N0YXRlICpkbV9vbGRfY3J0Y19zdGF0ZSwgKmRtX25ld19jcnRjX3N0
YXRlOwo+ICAgICAgICAgaW50IGNydGNfZGlzYWJsZV9jb3VudCA9IDA7Cj4gKyAgICAgICBib29s
IGZlbmNlX2Nvb2tpZTsKPiArCj4gKyAgICAgICBmZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVn
aW5fc2lnbmFsbGluZygpOwo+Cj4gICAgICAgICBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfbGVn
YWN5X21vZGVzZXRfc3RhdGUoZGV2LCBzdGF0ZSk7Cj4KPiBAQCAtNzYwMCw2ICs3NjA0LDggQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpCj4gICAgICAgICAvKiBTaWduYWwgSFcgcHJvZ3JhbW1pbmcgY29tcGxl
dGlvbiAqLwo+ICAgICAgICAgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUoc3RhdGUp
Owo+Cj4gKyAgICAgICBkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoZmVuY2VfY29va2llKTsKPiAr
Cj4gICAgICAgICBpZiAod2FpdF9mb3JfdmJsYW5rKQo+ICAgICAgICAgICAgICAgICBkcm1fYXRv
bWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUoZGV2LCBzdGF0ZSk7Cj4KPiAtLQo+IDIuMjYu
Mgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
