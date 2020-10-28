Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7129CF5A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 10:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0DB6E4D2;
	Wed, 28 Oct 2020 09:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7406A6E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:57:53 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gs25so6333423ejb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gqxbff3sIwRJKJ2vetLSa1wEknO8WgouSta4QsKyVI4=;
 b=CWH37Rbx0kYXww4gIBBgMaSYSknkO+ocuTjqw8MKssUIq99FsGhR3gIaCbV1ZLuXff
 n6MvssieCJynUHj0QBcblZj72K3cVeWbFIaam0cUp5TuBNkOVILOB9C206CtuwRVqfoQ
 rDsxZTsXP0VoLG51XWAtNWGiqHsiOMAz4HEMYPS36vAI1IfmbdyhsTQDnAF2hD0VkerM
 LjKKf8vrJo+5MMY7iPF3J34cWfGrydB8Ti1/3jLDoWTqfDkn9/8riY6CBv4TxnXfhw7j
 iU5RgpQgmZZeFkw8BpKRHNGATHXCDzIypDUhAlOOb2mF7QZyrBb1uutoxcfi7tlWNLVp
 zVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gqxbff3sIwRJKJ2vetLSa1wEknO8WgouSta4QsKyVI4=;
 b=Mmw5n3IgDV+0EwIXFx8FX6cI0ahghxZyBhfK3fmnjGcJhkxcmERXFneV4ZJDlqi9x1
 oWy0hMYQ+l/MqLtfgqEW9n528NtlctQ+bFZ+OFgHppyU8w4lLWxMbYNxwVGiXL/pj1+S
 n4Dw2k8o/OOeErzNPoSpkbL3HWqKqEm8vjnE/lVmETqpyinWJP9I5wNYbJAXegkFkEWw
 sVq++cW+l9GWTU8J78cIg4S93uiCx00yc1BAzoSQwRstmC2NoQahQqBdCXluXQw98gT0
 zGqkar+52/B80eUMrAKRqH9V++/B2gBSxbDPpaRm5gHG+7WbrWCSnWusQeRYCFG86WEU
 tbLw==
X-Gm-Message-State: AOAM530KMZUgJFzk7fduwRtyDMQuatiZfn1+kgVDn7cDnGq71Dh39lfE
 Ar/q/BcrL9d3zeszP6pJmcE=
X-Google-Smtp-Source: ABdhPJw+FfZnd8LSJtXqeaZjKv8Rr31kSq6R9Gg4Nw/fxyyAp5tvKQxisnaGWJNOnsxbVlPXxp4Hew==
X-Received: by 2002:a17:906:af71:: with SMTP id
 os17mr6750928ejb.200.1603879072094; 
 Wed, 28 Oct 2020 02:57:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 64sm470042eda.63.2020.10.28.02.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 02:57:51 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] drm/shme-helpers: Fix dma_buf_mmap
 forwarding bug
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201027214922.3566743-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <62e05cfd-0030-ad32-0b3f-69dd257b2e3c@gmail.com>
Date: Wed, 28 Oct 2020 10:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027214922.3566743-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, piotr.oniszczuk@gmail.com,
 Seung-Woo Kim <sw0312.kim@samsung.com>, stable@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMTAuMjAgdW0gMjI6NDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFdoZW4gd2UgZm9y
d2FyZCBhbiBtbWFwIHRvIHRoZSBkbWFfYnVmIGV4cG9ydGVyLCB0aGV5IGdldCB0byBvd24KPiBl
dmVyeXRoaW5nLiBVbmZvcnR1bmF0ZWx5IGRybV9nZW1fbW1hcF9vYmooKSBvdmVyd3JvdGUKPiB2
bWEtPnZtX3ByaXZhdGVfZGF0YSBhZnRlciB0aGUgZHJpdmVyIGNhbGxiYWNrLCB3cmVha2luZyB0
aGUKPiBleHBvcnRlciBjb21wbGV0ZS4gVGhpcyB3YXMgbm90aWNlZCBiZWNhdXNlIHZiMl9jb21t
b25fdm1fY2xvc2UgYmxldwo+IHVwIG9uIG1hbGkgZ3B1IHdpdGggcGFuZnJvc3QgYWZ0ZXIgY29t
bWl0IDI2ZDNhYzNjYjA0ZAo+ICgiZHJtL3NobWVtLWhlbHBlcnM6IFJlZGlyZWN0IG1tYXAgZm9y
IGltcG9ydGVkIGRtYS1idWYiKS4KPgo+IFVuZm9ydHVuYXRlbHkgZHJtX2dlbV9tbWFwX29iaiBh
bHNvIGFjcXVpcmVzIGEgc3VycGx1cyByZWZlcmVuY2UgdGhhdAo+IHdlIG5lZWQgdG8gZHJvcCBp
biBzaG1lbSBoZWxwZXJzLCB3aGljaCBpcyBhIGJpdCBvZiBhIG1pc2xheWVyCj4gc2l0dWF0aW9u
LiBNYXliZSB0aGUgZW50aXJlIGRtYV9idWZfbW1hcCBmb3J3YXJkaW5nIHNob3VsZCBiZSBwdWxs
ZWQKPiBpbnRvIGNvcmUgZ2VtIGNvZGUuCj4KPiBOb3RlIHRoYXQgdGhlIG9ubHkgdHdvIG90aGVy
IGRyaXZlcnMgd2hpY2ggZm9yd2FyZCBtbWFwIGluIHRoZWlyIG93bgo+IGNvZGUgKGV0bmF2aXYg
YW5kIGV4eW5vcykgZ2V0IHRoaXMgc29tZXdoYXQgcmlnaHQgYnkgb3ZlcndyaXRpbmcgdGhlCj4g
Z2VtIG1tYXAgY29kZS4gQnV0IHRoZXkgc2VlbSB0byBzdGlsbCBoYXZlIHRoZSBsZWFrLiBUaGlz
IG1pZ2h0IGJlIGEKPiBnb29kIGV4Y3VzZSB0byBtb3ZlIHRoZXNlIGRyaXZlcnMgb3ZlciB0byBz
aG1lbSBoZWxwZXJzIGNvbXBsZXRlbHkuCj4KPiBOb3RlIHRvIHN0YWJsZSB0ZWFtOiBUaGVyZSdz
IGEgdHJpdmlhbCBjb250ZXh0IGNvbmZsaWN0IHdpdGgKPiBkNjkzZGVmNGZkMWMgKCJkcm06IFJl
bW92ZSBvYnNvbGV0ZSBHRU0gYW5kIFBSSU1FIGNhbGxiYWNrcyBmcm9tCj4gc3RydWN0IGRybV9k
cml2ZXIiKS4gSSdtIGFzc3VtaW5nIGl0J3MgY2xlYXIgd2hlcmUgdG8gcHV0IHRoZSBmaXJzdAo+
IGh1bmssIG90aGVyd2lzZSBJIGNhbiBzZW5kIGEgNS45IHZlcnNpb24gb2YgdGhpcy4KPgo+IENj
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4K2V0bmF2aXZAYXJt
bGludXgub3JnLnVrPgo+IENjOiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJA
Z21haWwuY29tPgo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IEpv
b255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KPiBDYzogU2V1bmctV29vIEtp
bSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPiBDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4u
cGFya0BzYW1zdW5nLmNvbT4KPiBGaXhlczogMjZkM2FjM2NiMDRkICgiZHJtL3NobWVtLWhlbHBl
cnM6IFJlZGlyZWN0IG1tYXAgZm9yIGltcG9ydGVkIGRtYS1idWYiKQo+IENjOiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IENjOiA8c3RhYmxlQHZn
ZXIua2VybmVsLm9yZz4gIyB2NS45Kwo+IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IHBpb3RyLm9u
aXN6Y3p1a0BnbWFpbC5jb20KPiBDYzogcGlvdHIub25pc3pjenVrQGdtYWlsLmNvbQo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgoKQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICB8IDQgKystLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCA3ICsrKysrKy0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5j
Cj4gaW5kZXggMWRhNjdkMzRlNTVkLi5kNTg2MDY4ZjU1MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBA
QCAtMTA3Niw2ICsxMDc2LDggQEAgaW50IGRybV9nZW1fbW1hcF9vYmooc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3NpemUsCj4gICAJICovCj4gICAJZHJtX2dl
bV9vYmplY3RfZ2V0KG9iaik7Cj4gICAKPiArCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gb2JqOwo+
ICsKPiAgIAlpZiAob2JqLT5mdW5jcy0+bW1hcCkgewo+ICAgCQlyZXQgPSBvYmotPmZ1bmNzLT5t
bWFwKG9iaiwgdm1hKTsKPiAgIAkJaWYgKHJldCkgewo+IEBAIC0xMDk2LDggKzEwOTgsNiBAQCBp
bnQgZHJtX2dlbV9tbWFwX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdW5zaWduZWQg
bG9uZyBvYmpfc2l6ZSwKPiAgIAkJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3RfZGVjcnlwdGVk
KHZtYS0+dm1fcGFnZV9wcm90KTsKPiAgIAl9Cj4gICAKPiAtCXZtYS0+dm1fcHJpdmF0ZV9kYXRh
ID0gb2JqOwo+IC0KPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2dl
bV9tbWFwX29iaik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiBpbmRl
eCBmYjExZGY3YWNlZDUuLjgyMzNiZGE0NjkyZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3NobWVtX2hlbHBlci5jCj4gQEAgLTU5OCw4ICs1OTgsMTMgQEAgaW50IGRybV9nZW1fc2htZW1f
bW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCj4gICAJLyogUmVtb3ZlIHRoZSBmYWtlIG9mZnNldCAqLwo+ICAgCXZtYS0+dm1fcGdvZmYg
LT0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKPiAgIAo+IC0JaWYgKG9iai0+
aW1wb3J0X2F0dGFjaCkKPiArCWlmIChvYmotPmltcG9ydF9hdHRhY2gpIHsKPiArCQkvKiBEcm9w
IHRoZSByZWZlcmVuY2UgZHJtX2dlbV9tbWFwX29iaigpIGFjcXVpcmVkLiovCj4gKwkJZHJtX2dl
bV9vYmplY3RfcHV0KG9iaik7Cj4gKwkJdm1hLT52bV9wcml2YXRlX2RhdGEgPSBOVUxMOwo+ICsK
PiAgIAkJcmV0dXJuIGRtYV9idWZfbW1hcChvYmotPmRtYV9idWYsIHZtYSwgMCk7Cj4gKwl9Cj4g
ICAKPiAgIAlzaG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7Cj4gICAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
