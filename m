Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BB35ED9B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0546E8E9;
	Wed, 14 Apr 2021 06:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBA26E8E9;
 Wed, 14 Apr 2021 06:51:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mh2so8160830ejb.8;
 Tue, 13 Apr 2021 23:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mGpaRCKO03N6fDPvtldGCnh5e6qWIgdgkLU4gSx6Zgo=;
 b=eTdplDZAqJ8IGxhfVRjV3K8s4+Efgu0ixcYUBM56TGA+sPxS4IG3SYm+lDJuHWc3MP
 ee5HEjMFxWIg9BjLCHLf79m0d2PSj5yBpjOZhOIMXFqWbRLnhK42uN38MkKXhanEY7GN
 AVehufOlzrj+a+3XRPrPQ4Md2Jc9lzTlo1VYjOxO4mfmzKOOzqMFrSb0xtbjDGuMmB2U
 H/rhL4Ufok/9Whxenz+V9a1sh+mUIx2EU5DPX4KtP67P9uEvs67EagEKgohYD65B5K12
 dPd65Kb/IO5HNR0VP4y/Qtf2btrheAUbyAISwr0fI9B8O8duKUwBHmo10Ae7lPCn5w9x
 dHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mGpaRCKO03N6fDPvtldGCnh5e6qWIgdgkLU4gSx6Zgo=;
 b=LzWp7y9won48wN+jeAgsZfbdSl1RFKPevqGa1D3OlvIavnQN6b/fhPGmCJ/yRGowDA
 rdcuh6Exo5HNBT2/15ySoFsS0xKPudoz84Mj2u3UdwXX3EjHgLlYDPC2X8lRlMOBSIzk
 tNgfhKntxzw9Uz9kiJ9otU5KsX5vzCcC8v1zDrHueuZryZGwIZU8Rvdiyp8kELUvktde
 EoAxwI+gvJ7ooeEPS8G/QGF9QYVaO1IFMutxmXVwCcvW07xIytjZa3658sfk11vQC4Q3
 dehL1uJNtqazRhuBjpL1IkXdfPBRsVAXre39qFoBkq3EATX2Sne98HMA44TG5tdzihKg
 bH0A==
X-Gm-Message-State: AOAM533rTO9KdGI+4nHe85rrH87BsXch/7QQY2PYi7MV4D6ZAk4nc+5F
 FJww9TgfrOeJMfeXWErpwac=
X-Google-Smtp-Source: ABdhPJym/nLYGtvqD65RoGdeyerhhSI823SnlNGnEBiJu4UODDIKF+oF6fldWDjQWeVdLwBQ4/+TrA==
X-Received: by 2002:a17:907:3f10:: with SMTP id
 hq16mr36214000ejc.181.1618383112049; 
 Tue, 13 Apr 2021 23:51:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:eb49:bad8:5b80:ea48?
 ([2a02:908:1252:fb60:eb49:bad8:5b80:ea48])
 by smtp.gmail.com with ESMTPSA id g11sm11068003edw.37.2021.04.13.23.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 23:51:51 -0700 (PDT)
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
Date: Wed, 14 Apr 2021 08:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210414064804.29356-9-Felix.Kuehling@amd.com>
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
Cc: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDQuMjEgdW0gMDg6NDggc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBQYWdlcyBpbiBT
RyBCT3Mgd2VyZSBub3QgYWxsb2NhdGVkIGJ5IFRUTS4gU28gZG9uJ3QgY291bnQgdGhlbSBhZ2Fp
bnN0Cj4gVFRNJ3MgcGFnZXMgbGltaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpHb2luZyB0byBwaWNrIHRoYXQgb25lIHVwIGZv
ciBpbmNsdXNpb24gaW4gZHJtLW1pc2MtbmV4dC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIHwgMjcgKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+IGluZGV4IDVkODgyMDcyNWI3NS4uZThiOGMzMjU3
MzkyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gQEAgLTMxNyw5ICszMTcsMTIgQEAgaW50IHR0
bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgIAlpZiAodHRtX3R0X2lz
X3BvcHVsYXRlZCh0dG0pKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+IC0JYXRvbWljX2xvbmdfYWRk
KHR0bS0+bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gLQlpZiAoYmRldi0+cG9v
bC51c2VfZG1hMzIpCj4gLQkJYXRvbWljX2xvbmdfYWRkKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2Rt
YTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gKwlpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFH
RV9GTEFHX1NHKSkgewo+ICsJCWF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9w
YWdlc19hbGxvY2F0ZWQpOwo+ICsJCWlmIChiZGV2LT5wb29sLnVzZV9kbWEzMikKPiArCQkJYXRv
bWljX2xvbmdfYWRkKHR0bS0+bnVtX3BhZ2VzLAo+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxs
b2NhdGVkKTsKPiArCX0KPiAgIAo+ICAgCXdoaWxlIChhdG9taWNfbG9uZ19yZWFkKCZ0dG1fcGFn
ZXNfYWxsb2NhdGVkKSA+IHR0bV9wYWdlc19saW1pdCB8fAo+ICAgCSAgICAgICBhdG9taWNfbG9u
Z19yZWFkKCZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKSA+Cj4gQEAgLTM1MCw5ICszNTMsMTIg
QEAgaW50IHR0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgIAlyZXR1
cm4gMDsKPiAgIAo+ICAgZXJyb3I6Cj4gLQlhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMs
ICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPiAtCWlmIChiZGV2LT5wb29sLnVzZV9kbWEzMikKPiAt
CQlhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2Nh
dGVkKTsKPiArCWlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKSB7Cj4g
KwkJYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7
Cj4gKwkJaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+ICsJCQlhdG9taWNfbG9uZ19zdWIodHRt
LT5udW1fcGFnZXMsCj4gKwkJCQkJJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQpOwo+ICsJfQo+
ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV90dF9wb3B1bGF0ZSk7
Cj4gQEAgLTM4Miw5ICszODgsMTIgQEAgdm9pZCB0dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRt
X2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqdHRtKQo+ICAgCWVsc2UKPiAgIAkJdHRtX3Bv
b2xfZnJlZSgmYmRldi0+cG9vbCwgdHRtKTsKPiAgIAo+IC0JYXRvbWljX2xvbmdfc3ViKHR0bS0+
bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gLQlpZiAoYmRldi0+cG9vbC51c2Vf
ZG1hMzIpCj4gLQkJYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3Bh
Z2VzX2FsbG9jYXRlZCk7Cj4gKwlpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFH
X1NHKSkgewo+ICsJCWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19h
bGxvY2F0ZWQpOwo+ICsJCWlmIChiZGV2LT5wb29sLnVzZV9kbWEzMikKPiArCQkJYXRvbWljX2xv
bmdfc3ViKHR0bS0+bnVtX3BhZ2VzLAo+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVk
KTsKPiArCX0KPiAgIAo+ICAgCXR0bS0+cGFnZV9mbGFncyAmPSB+VFRNX1BBR0VfRkxBR19QUklW
X1BPUFVMQVRFRDsKPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
