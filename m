Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762F1DFBA7
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 01:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9B66E258;
	Sat, 23 May 2020 23:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B036E15E;
 Sat, 23 May 2020 23:18:43 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id d7so16949968eja.7;
 Sat, 23 May 2020 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qTudC0kHsQhaAnF/cig67ZtgOuZShJYIz5n75777QI0=;
 b=nR7VJUtBYdfY7cZfN+bMTyk9xVMDKht+TU3DEdUb3kXBwElFsd6R9+g4zVO4qYGjND
 j3ExNebSDQansXRRAUMWm6XOapUtBjPUSJ7tHvL35C2foTZ+nl6S/qEbhEuE/nPSU3wi
 AVY66IrjmaHc1lSHqRphxZvFfNCLN2K9uH6rGUGVH21aIPaEwn71KM2mtPe3xYwHAP15
 2ecZeBo+JFYQvl/cYqwAcybMbgYjRvDz+Eva1HQsY/dHHZvj5G1e3UXLNygrki7r6jXN
 t2DnbijuggGFY3Ewha8JmDqLNZ2+5YGJ3XHag4vNPWGbUAGIvA0Jnu5O/C9V33Mx6oga
 PBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qTudC0kHsQhaAnF/cig67ZtgOuZShJYIz5n75777QI0=;
 b=PhC37pB4XKIjHSBXoduHNzuxPcMBFheYdF/pnLJKx1s/CEi0ISCaiO0LrRc6k5Bg1c
 Vgjv0MI+zTObDAwzrcBnymTjy8TWMHuz7QgQNQiJTG3J2072JvoPQCc0kRvDGVhpqmUv
 0dSHZn456BckYod5KL3yRrqXQ4CjqPKBllTwmqtaj/ytnUXonh4hZ8hz2WpYaXPlSGdj
 P/S/qTHN3qTh5TdBYhwHDulBscq1Vd7TGZjxsA6aHTd7AWxaP65f1zC4EwS0Ihqk2VAJ
 93+tN8BKM0qQTuqCF3UdXKf1DtyDrJghI5F+qzUy8uwqTh/hV228AmLFCj2EB9f+swuk
 aFHg==
X-Gm-Message-State: AOAM530pzuxJ5N1VOJOH1Gju+LrISzG9sh/XKnCeCvdBZ0aTRmeuvk9T
 1pja0xu00G4o124aCEi4Z1SUHKG7Ay24Z/QgtyE=
X-Google-Smtp-Source: ABdhPJwzMx/jVFuTDLKRDebwIdmlbU6Vpg2xa3/LcsOdKTMjNBXwRaLoF5JgX+ThsXGDyFVVS7kntTFfz4vPb72aNas=
X-Received: by 2002:a17:906:6843:: with SMTP id
 a3mr12943995ejs.245.1590275921497; 
 Sat, 23 May 2020 16:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
 <20200522220316.23772-2-jcrouse@codeaurora.org>
 <20200523072300.GB28198@dragon>
In-Reply-To: <20200523072300.GB28198@dragon>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 23 May 2020 16:19:02 -0700
Message-ID: <CAF6AEGsrH4PvhBHcVgkVWTk4+wXnRQqiusQA18MrZ-dX-oFRcg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm: Attach the IOMMU device during
 initialization
To: Shawn Guo <shawn.guo@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 tongtiangen <tongtiangen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Georgi Djakov <georgi.djakov@linaro.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjMsIDIwMjAgYXQgMTI6MjMgQU0gU2hhd24gR3VvIDxzaGF3bi5ndW9AbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAyMiwgMjAyMCBhdCAwNDowMzoxNFBNIC0w
NjAwLCBKb3JkYW4gQ3JvdXNlIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dwdW1tdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1bW11LmMKPiA+
IGluZGV4IDM0OTgwZDhlYjdhZC4uMGFkMGY4NDg1NjBhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZ3B1bW11LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2dwdW1tdS5jCj4gPiBAQCAtMjEsMTEgKzIxLDYgQEAgc3RydWN0IG1zbV9ncHVtbXUgewo+
ID4gICNkZWZpbmUgR1BVTU1VX1BBR0VfU0laRSBTWl80Swo+ID4gICNkZWZpbmUgVEFCTEVfU0la
RSAoc2l6ZW9mKHVpbnQzMl90KSAqIEdQVU1NVV9WQV9SQU5HRSAvIEdQVU1NVV9QQUdFX1NJWkUp
Cj4gPgo+ID4gLXN0YXRpYyBpbnQgbXNtX2dwdW1tdV9hdHRhY2goc3RydWN0IG1zbV9tbXUgKm1t
dSkKPiA+IC17Cj4gPiAtICAgICByZXR1cm4gMDsKPiA+IC19Cj4gPiAtCj4gPiAgc3RhdGljIHZv
aWQgbXNtX2dwdW1tdV9kZXRhY2goc3RydWN0IG1zbV9tbXUgKm1tdSkKPiA+ICB7Cj4gPiAgfQo+
ID4gQEAgLTg1LDcgKzgwLDYgQEAgc3RhdGljIHZvaWQgbXNtX2dwdW1tdV9kZXN0cm95KHN0cnVj
dCBtc21fbW11ICptbXUpCj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9t
bXVfZnVuY3MgZnVuY3MgPSB7Cj4gPiAtICAgICAgICAgICAgIC5hdHRhY2ggPSBtc21fZ3B1bW11
X2F0dGFjaCwKPiA+ICAgICAgICAgICAgICAgLmRldGFjaCA9IG1zbV9ncHVtbXVfZGV0YWNoLAo+
ID4gICAgICAgICAgICAgICAubWFwID0gbXNtX2dwdW1tdV9tYXAsCj4gPiAgICAgICAgICAgICAg
IC51bm1hcCA9IG1zbV9ncHVtbXVfdW5tYXAsCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21faW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2lvbW11LmMKPiA+
IGluZGV4IGFkNThjZmU1OTk4ZS4uZTM1ZGFiNTc5MmNmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21faW9tbXUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21faW9tbXUuYwo+ID4gQEAgLTY2LDcgKzY2LDYgQEAgc3RhdGljIHZvaWQgbXNtX2lvbW11X2Rl
c3Ryb3koc3RydWN0IG1zbV9tbXUgKm1tdSkKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXNtX21tdV9mdW5jcyBmdW5jcyA9IHsKPiA+IC0gICAgICAgICAgICAgLmF0dGFjaCA9
IG1zbV9pb21tdV9hdHRhY2gsCj4KPiBJdCBjYXVzZXMgYW4gdW51c2VkIGZ1bmN0aW9uIHdhcm5p
bmcgYXMgYmVsb3cuCj4KPiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9pb21tdS5jOjI2OjEyOiB3
YXJuaW5nOiDigJhtc21faW9tbXVfYXR0YWNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1mdW5jdGlvbl0KPiAgc3RhdGljIGludCBtc21faW9tbXVfYXR0YWNoKHN0cnVjdCBtc21f
bW11ICptbXUpCj4gICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+Cj4gTm90IHN1cmUgaWYg
eW91IHdpbGwgdXNlIGl0IGFnYWluIGluIGZ1dHVyZSBwYXRjaGVzIHRob3VnaC4KCmxvb2tzIGxp
a2UgdGhpcyB3YXMgcmVtb3ZlZCBpbiBtc21fZ3B1bW11IChhMnh4KSBidXQgbm90IG1zbV9pb21t
dQooYTN4eCspLi4gSSd2ZSBzcXVhc2hlZCBhIGZpeHVwIGFuZCBwdXNoZWQgdG8gbXNtLW5leHQK
CnRoeAoKQlIsCi1SCgo+IFNoYXduCj4KPiA+ICAgICAgICAgICAgICAgLmRldGFjaCA9IG1zbV9p
b21tdV9kZXRhY2gsCj4gPiAgICAgICAgICAgICAgIC5tYXAgPSBtc21faW9tbXVfbWFwLAo+ID4g
ICAgICAgICAgICAgICAudW5tYXAgPSBtc21faW9tbXVfdW5tYXAsCj4gPiBAQCAtNzYsNiArNzUs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9tbXVfZnVuY3MgZnVuY3MgPSB7Cj4gPiAgc3Ry
dWN0IG1zbV9tbXUgKm1zbV9pb21tdV9uZXcoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaW9t
bXVfZG9tYWluICpkb21haW4pCj4gPiAgewo+ID4gICAgICAgc3RydWN0IG1zbV9pb21tdSAqaW9t
bXU7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4KPiA+ICAgICAgIGlvbW11ID0ga3phbGxvYyhzaXpl
b2YoKmlvbW11KSwgR0ZQX0tFUk5FTCk7Cj4gPiAgICAgICBpZiAoIWlvbW11KQo+ID4gQEAgLTg1
LDUgKzg1LDExIEBAIHN0cnVjdCBtc21fbW11ICptc21faW9tbXVfbmV3KHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluKQo+ID4gICAgICAgbXNtX21tdV9pbml0
KCZpb21tdS0+YmFzZSwgZGV2LCAmZnVuY3MpOwo+ID4gICAgICAgaW9tbXVfc2V0X2ZhdWx0X2hh
bmRsZXIoZG9tYWluLCBtc21fZmF1bHRfaGFuZGxlciwgaW9tbXUpOwo+ID4KPiA+ICsgICAgIHJl
dCA9IGlvbW11X2F0dGFjaF9kZXZpY2UoaW9tbXUtPmRvbWFpbiwgZGV2KTsKPiA+ICsgICAgIGlm
IChyZXQpIHsKPiA+ICsgICAgICAgICAgICAga2ZyZWUoaW9tbXUpOwo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgcmV0dXJu
ICZpb21tdS0+YmFzZTsKPiA+ICB9Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fbW11LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9tbXUuaAo+ID4gaW5kZXggNjdh
NjIzZjE0MzE5Li5iYWU5ZThlNjdlYzEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9tbXUuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fbW11LmgKPiA+
IEBAIC0xMCw3ICsxMCw2IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+Cj4gPgo+ID4g
IHN0cnVjdCBtc21fbW11X2Z1bmNzIHsKPiA+IC0gICAgIGludCAoKmF0dGFjaCkoc3RydWN0IG1z
bV9tbXUgKm1tdSk7Cj4gPiAgICAgICB2b2lkICgqZGV0YWNoKShzdHJ1Y3QgbXNtX21tdSAqbW11
KTsKPiA+ICAgICAgIGludCAoKm1hcCkoc3RydWN0IG1zbV9tbXUgKm1tdSwgdWludDY0X3QgaW92
YSwgc3RydWN0IHNnX3RhYmxlICpzZ3QsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbGVuLCBpbnQgcHJvdCk7Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
