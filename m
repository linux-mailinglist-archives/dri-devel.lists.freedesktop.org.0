Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B745E2F31EB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 14:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42A6E226;
	Tue, 12 Jan 2021 13:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7356E226
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:44:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d13so2515847wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 05:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7+CygbaNK8RHrTYKRH9okC/C8+mWeFn+wpyKag9alwM=;
 b=nb2va2lASe6ml4oEgsCucR2h4msVpa/5PWlMPxNIr3yB+4cvOjhdTE4RKYQEzeFzzH
 oiivQ5vvm9GCeZww1BgVbRfNGh2y18UHOlMD5gMo9D7R7/IwddYyhB3/IncauhM8P8bf
 NSQ8Vz40gJ2a9+HkIYXJCKt0hH8yCvN578LOFHcfXSesl/qX0XCieF7bXmUVuX3YZ79g
 LjbJosVcLaZCikduTj06Ie7qp7NMICNlavL6di1bEZID437VdvD1uMnAgkz8/EaVqjc3
 5vuoIamKNyat/YfZ9MQPmNxb0lNrt9GiGTHGEciDLlWOgc3bGaFpr8SyUzAb8qzTfwPo
 IHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7+CygbaNK8RHrTYKRH9okC/C8+mWeFn+wpyKag9alwM=;
 b=NNxROnVCdDT4bNEbev4ZnfEFP/3/hpLxQsEKMc7fnJY6mSKIdWSjAmyt1ikpMZ+oRs
 0QFHbkXLxF2f3Rilz5+Is5X08YkzkOrQZPYybJ9MzpWVjysFjJuJ0iSS3fj8jAOP3ZYa
 ZOJ+j8LIU/ft+rGwxVnp+DfOeLdAVafK5vNyZeD4P5l/AsuqlnkKoHuhytMSsrbroaLQ
 UU75D0I0Mqs9PATrKQCZHi2BaZixB4b9K8RO1PnhQID6wOGhhqqdgkOiocHozIFzAIIK
 iIK1WfTgBAc8nbE9UD9QfDS91n7vqwVUJwP0xlPOGo64EjJ04akzey1oR4tHI6GYHqFt
 H1lQ==
X-Gm-Message-State: AOAM530ixM677F1brLl3R9D3SXKBiOWomWIGyLNEn/lnY2UCz5ztjY1+
 mv1KyGWRkuAmnggJWRiJw2toSQ==
X-Google-Smtp-Source: ABdhPJzZqlNguZvDKi2CFA1mo99Wnpi9WTqm4JhWMkWTz2Hy16qA5C3yjzwttwDyYbr3GW6kYbgLUg==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr4464921wrn.245.1610459072649; 
 Tue, 12 Jan 2021 05:44:32 -0800 (PST)
Received: from dell ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id y68sm4561267wmc.0.2021.01.12.05.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 05:44:32 -0800 (PST)
Date: Tue, 12 Jan 2021 13:44:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Ian King <colin.king@canonical.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/40] drm/amd/display/dc/calcs/dce_calcs: Move some
 large variables from the stack to the heap
Message-ID: <20210112134430.GA3975472@dell>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111191926.3688443-14-lee.jones@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMSBKYW4gMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzogSW4gZnVuY3Rpb24g4oCY
Y2FsY3VsYXRlX2JhbmR3aWR0aOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzoyMDE2OjE6IHdhcm5pbmc6IHRoZSBmcmFtZSBz
aXplIG9mIDEyMTYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJn
ZXItdGhhbj1dCj4gCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
Pgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyAgfCAyMSArKysrKysrKysrKysr
KystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2Nh
bGNzLmMKPiBpbmRleCAxNThkOTI3YzAzZTU1Li5hMGM2OWZhZTQwY2VkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+IEBAIC05
OCwxNiArOTgsMTYgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX2JhbmR3aWR0aCgKPiAgCWludDMy
X3QgbnVtX2N1cnNvcl9saW5lczsKPiAgCj4gIAlpbnQzMl90IGksIGosIGs7Cj4gLQlzdHJ1Y3Qg
YndfZml4ZWQgeWNsa1szXTsKPiAtCXN0cnVjdCBid19maXhlZCBzY2xrWzhdOwo+ICsJc3RydWN0
IGJ3X2ZpeGVkICp5Y2xrOwo+ICsJc3RydWN0IGJ3X2ZpeGVkICpzY2xrOwo+ICAJYm9vbCBkMF91
bmRlcmxheV9lbmFibGU7Cj4gIAlib29sIGQxX3VuZGVybGF5X2VuYWJsZTsKPiAgCWJvb2wgZmJj
X2VuYWJsZWQ7Cj4gIAlib29sIGxwdF9lbmFibGVkOwo+ICAJZW51bSBid19kZWZpbmVzIHNjbGtf
bWVzc2FnZTsKPiAgCWVudW0gYndfZGVmaW5lcyB5Y2xrX21lc3NhZ2U7Cj4gLQllbnVtIGJ3X2Rl
ZmluZXMgdGlsaW5nX21vZGVbbWF4aW11bV9udW1iZXJfb2Zfc3VyZmFjZXNdOwo+IC0JZW51bSBi
d19kZWZpbmVzIHN1cmZhY2VfdHlwZVttYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlc107Cj4gKwll
bnVtIGJ3X2RlZmluZXMgKnRpbGluZ19tb2RlOwo+ICsJZW51bSBid19kZWZpbmVzICpzdXJmYWNl
X3R5cGU7Cj4gIAllbnVtIGJ3X2RlZmluZXMgdm9sdGFnZTsKPiAgCWVudW0gYndfZGVmaW5lcyBw
aXBlX2NoZWNrOwo+ICAJZW51bSBid19kZWZpbmVzIGhzcl9jaGVjazsKPiBAQCAtMTIyLDYgKzEy
MiwxNCBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+ICAJaW50MzJfdCBudW1i
ZXJfb2ZfZGlzcGxheXNfZW5hYmxlZF93aXRoX21hcmdpbiA9IDA7Cj4gIAlpbnQzMl90IG51bWJl
cl9vZl9hbGlnbmVkX2Rpc3BsYXlzX3dpdGhfbm9fbWFyZ2luID0gMDsKPiAgCj4gKwl5Y2xrID0g
a3phbGxvYyhzaXplb2YoKnljbGspICogMywgR0ZQX0tFUk5FTCk7Cj4gKwlzY2xrID0ga3phbGxv
YyhzaXplb2YoKnNjbGspICogOCwgR0ZQX0tFUk5FTCk7Cj4gKwo+ICsJdGlsaW5nX21vZGUgPSBr
emFsbG9jKHNpemVvZigqdGlsaW5nX21vZGUpICoKPiArCQkJICAgICAgbWF4aW11bV9udW1iZXJf
b2Zfc3VyZmFjZXMsIEdGUF9LRVJORUwpOwo+ICsJc3VyZmFjZV90eXBlID0ga3phbGxvYyhzaXpl
b2YoKnN1cmZhY2VfdHlwZSkgKgo+ICsJCQkgICAgICAgbWF4aW11bV9udW1iZXJfb2Zfc3VyZmFj
ZXMsIEdGUF9LRVJORUwpOwoKUGxlYXNlIHJlZnJhaW4gZnJvbSBtZXJnaW5nIHRoaXMgeWV0LiAg
SSBtaXNzZWQgc29tZSBlcnJvciBjaGVja2luZy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
U2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
