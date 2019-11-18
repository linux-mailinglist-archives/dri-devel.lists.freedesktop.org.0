Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E157100AC0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8C56E388;
	Mon, 18 Nov 2019 17:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBAD6E067;
 Mon, 18 Nov 2019 17:48:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so20555444wrs.12;
 Mon, 18 Nov 2019 09:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=piNHro+ZEjxTlVQYbgYFct0MWJy6Nfv3mhGBZxaqWEI=;
 b=q08tciorAdfUyG7QSk0qrESuoprkzz9GzIV9wm2nUatT/ASE7IkVkLg5ywcOcPzKO7
 PaLP2+fY0DI7YGPZhOqUCiP4Gv81eKDf8itvRMqpt/qUcsADk1wYtu25J5zWEJos9VjR
 MwBEP0lj3Dxo8yYemeB/beOkRuD/9Ebb6oYkusi0zPApRXBCn7yh2Cwjh8R12641ECTg
 qNYtRt+yGDsnzqPCblYaR5wKs+3LtYbL0J9e8/cGRFWWIoQ+YC72B5jpaxZiQ62l/0UH
 HftkoGcysIAHgnm+WSDj10ltcBViTtYgITSletCMt+aqAl2lfxO9jHTNq6r4ElVpoHpQ
 5ZEw==
X-Gm-Message-State: APjAAAUx4wM3JGnKNG+MXizODfXtlwr2JdVDfu6Btp5x4MOvYr36/95V
 6aiDIQoHewonzYI9yTIICizDN2ZPyp7CgwNgbPE=
X-Google-Smtp-Source: APXvYqyGywWdEXXMqyuzeVwYL9crbS3T81rogaadiKCASpSKYQ4z/YHdFapsZ0h0gIEfDTYiyLAMQrdillBqOPi1WYs=
X-Received: by 2002:adf:9d87:: with SMTP id p7mr31061751wre.11.1574099281432; 
 Mon, 18 Nov 2019 09:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20191115094754.40920-1-colin.king@canonical.com>
 <MN2PR12MB3344F8D7498FC9DA8302AD05E44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344F8D7498FC9DA8302AD05E44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2019 12:47:49 -0500
Message-ID: <CADnq5_ODJOk3vV1QBQRQkMxZTa5reBqsPy-Q+1rrEBw4dJEtoQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu/powerplay: fix dereference before null
 check of pointer hwmgr
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=piNHro+ZEjxTlVQYbgYFct0MWJy6Nfv3mhGBZxaqWEI=;
 b=UcScLZd47Ox+WvIdRLwBXlvs7qK537HzRtbKDchwlW+qVieV2yoxduZiS/8bKA7ZZC
 L1uY3ELur64yoob3gNfgGBqlVgbUWKVfrXWMTw1kE95SPQxB6i77lBTuV5OuoYL8YM5v
 HGQsUHoVlMgfW/aM5HqdZWzChr3zx39uMDlrcRTqkHK/h7a+OWKQE6I2QKz+acfPqyDB
 WTcv7aBh31zUuBi9K6azzO2WBylVe++dkigF4YDD8EuQ37ZPiF/KWpbyqi+EA0j+gxdN
 bkkX1tMAeHRuRHVJhTAweZFBBDuz/9zk+KckxOUXrng7mCnpS2IuJNz5IcOGR6Djz1Qp
 X5fA==
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 Rex Zhu <rex.zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDE6NTYgQU0g
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+IHdyb3RlOgo+Cj4gUmV2aWV3ZWQtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+IEZyb206IENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiBTZW50OiBG
cmlkYXksIE5vdmVtYmVyIDE1LCAyMDE5IDU6NDggUE0KPiBUbzogUmV4IFpodSA8cmV4LnpodUBh
bWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZpZDEuWmhvdUBh
bWQuY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzoga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVs
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IFN1YmplY3Q6IFtQQVRDSF1bbmV4
dF0gZHJtL2FtZGdwdS9wb3dlcnBsYXk6IGZpeCBkZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBjaGVj
ayBvZiBwb2ludGVyIGh3bWdyCj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gVGhlIGFzc2lnbm1lbnQgb2YgYWRldiBkZXJlZmVyZW5jZXMgcG9p
bnRlciBod21nciBiZWZvcmUgaHdtZ3IgaXMgbnVsbCBjaGVja2VkLCBoZW5jZSB0aGVyZSBpcyBh
IHBvdGVudGlhbCBudWxsIHBvaW50ZXIgZGVmZXJlbmNlIGlzc3VlLiBGaXggdGhpcyBieSBhc3Np
Z25pbmcgYWRldiBhZnRlciB0aGUgbnVsbCBjaGVjay4KPgo+IEFkZHJlc3Nlcy1Db3Zlcml0eTog
KCJEZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBjaGVjayIpCj4gRml4ZXM6IDA4OTZkMmY3YmE0ZCAo
ImRybS9hbWRncHUvcG93ZXJwbGF5OiBwcm9wZXJseSBzZXQgUFBfR0ZYT0ZGX01BU0siKQo+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgfCA0ICsr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jCj4gaW5kZXggNDQz
NjI1YzgzZWM5Li5kMjkwOWM5MWQ2NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2h3bWdyL2h3bWdyLmMKPiBAQCAtODEsNyArODEsNyBAQCBzdGF0aWMgdm9pZCBod21n
cl9pbml0X3dvcmtsb2FkX3Byb3JpdHkoc3RydWN0IHBwX2h3bWdyICpod21ncikKPgo+ICBpbnQg
aHdtZ3JfZWFybHlfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKSAgewo+IC0gICAgICAgc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKPiArICAgICAgIHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2Owo+Cj4gICAgICAgICBpZiAoIWh3bWdyKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiBAQCAtOTYsNiArOTYsOCBAQCBpbnQgaHdtZ3JfZWFybHlf
aW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgaHdtZ3JfaW5pdF93b3JrbG9h
ZF9wcm9yaXR5KGh3bWdyKTsKPiAgICAgICAgIGh3bWdyLT5nZnhvZmZfc3RhdGVfY2hhbmdlZF9i
eV93b3JrbG9hZCA9IGZhbHNlOwo+Cj4gKyAgICAgICBhZGV2ID0gaHdtZ3ItPmFkZXY7Cj4gKwo+
ICAgICAgICAgc3dpdGNoIChod21nci0+Y2hpcF9mYW1pbHkpIHsKPiAgICAgICAgIGNhc2UgQU1E
R1BVX0ZBTUlMWV9DSToKPiAgICAgICAgICAgICAgICAgYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+
UFBfR0ZYT0ZGX01BU0s7Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
