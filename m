Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F542DA02D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531F6E0ED;
	Mon, 14 Dec 2020 19:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6B6E04B;
 Mon, 14 Dec 2020 19:20:53 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a109so16867360otc.1;
 Mon, 14 Dec 2020 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rqu9ukuFbDsfW+0GqTDXdU4DLppHl7XH5wFuWtOu/MM=;
 b=Z36qnk87KkXc13Y8s+BFNHfY7qdIBJge1DeHipst+gNrBbF+kCrSudaPbDB+mlvz1u
 J7E6LQ4u++7lzOwUeDruIFJCx4OREt1LyuFNqu5Mwkpo0MODSIRl0Q30h9GeUjOJ5nz+
 PmdEGjMArv5bnGIL/hnksmo1fS9HJDgvM6w/qVApZLVmrNCM+rqLcq4X1ISHZfy0C3kx
 0OI5tqSZXeohljzoMEK4eIrjIpiya31t9Hmt/sYpuLSLhVxDsISAc7iEXQry8QJKG3lt
 Vj7hE0igwVu02CJ6jyXGiV52JqP/h+7LjWpG00aMRtZIRdo/uCgnlYBRdPWW0SW76eJK
 G4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rqu9ukuFbDsfW+0GqTDXdU4DLppHl7XH5wFuWtOu/MM=;
 b=EFeHAEcypre5QLGRajvBe2xbVyutdbjgr2ko+Gla/leI/JtqPmeGyz7I10eWkT2K73
 p+MVL9xD7kA2BPhRtJzM2HoyXCxhBuHZwVaNoyvtfinaFW2kDcq0EQ0uo9luuol/HeYa
 ZvgyGWGEPf6OAgnzDEh1v9QIRn6LwPZ7ApuwoINXqR0HAS7xCjkPkCqS5BNeUNKX11Np
 rHdCHZI5bQ0jWHtTdAzEi9jJVfhHgrVxKaDHgj8QAFzl/95XS3uvnvY8+zBKW1mt8CiO
 u7Ha2Nf73uUjVHBuirhYMaIOHx5p/ekXnr3ncqxcS94iP8zuWmrIFxh5iwqqfTxSckSi
 Gd7w==
X-Gm-Message-State: AOAM530SAg+9SfPNw+E/4898T585KOCEvgu/DOty/W/S0WHCMygNW36N
 qnz1ZA9jMwBc37+HW18XqquwzN8J4KkYN00b38M=
X-Google-Smtp-Source: ABdhPJweqgJBxT4wAdZ1AV51GNpvdvAAcs8DmlQuTB5H2zXOr+Cv9Bz2K7/n+SLUbf+y0FUFnQaAoQDh/JxpcPDbfpc=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr20995016otg.311.1607973650934; 
 Mon, 14 Dec 2020 11:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Dec 2020 14:20:39 -0500
Message-ID: <CADnq5_MNC73FKyfJScYr0ieaOeCJB0nzPXyGK6g9UH=B9rCbjA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix ttm size refactor fallout
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMTQsIDIwMjAgYXQgMjoxNyBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IEkgZ3Vlc3MgQ2hyaXN0aWFuIGRpZG4ndCBjb21waWxl
IHRlc3QgYW1ka2ZkLgo+Cj4gRml4ZXM6IGUxMWJmYjk5ZDZlYyAoImRybS90dG06IGNsZWFudXAg
Qk8gc2l6ZSBoYW5kbGluZyB2MyIpCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4gKHYxKQo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KCkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jCj4gaW5kZXggNzc5MWQwNzRiZDMyLi5hOTY0N2U3Zjk4YTggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jCj4gQEAgLTQ1Myw3ICs0NTMsNyBAQCBzdGF0aWMgaW50IGFkZF9ib190b192bShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSwKPiAgICAgICAgIHN0cnVj
dCBhbWRncHVfYm8gKmJvID0gbWVtLT5ibzsKPiAgICAgICAgIHVpbnQ2NF90IHZhID0gbWVtLT52
YTsKPiAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgKmxpc3RfYm9fdmEgPSAmbWVtLT5ib192YV9s
aXN0Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBib19zaXplID0gYm8tPnRiby5tZW0uc2l6ZTsK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IGJvLT50Ym8uYmFzZS5zaXplOwo+Cj4g
ICAgICAgICBpZiAoIXZhKSB7Cj4gICAgICAgICAgICAgICAgIHByX2VycigiSW52YWxpZCBWQSB3
aGVuIGFkZGluZyBCTyB0byBWTVxuIik7Cj4gQEAgLTEyODEsNyArMTI4MSw3IEBAIGludCBhbWRn
cHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29mX2dwdSgKPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0gKm1lbSwgdWludDY0X3QgKnNpemUpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPSBt
ZW0tPnByb2Nlc3NfaW5mbzsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+
Ym8tPnRiby5tZW0uc2l6ZTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+
Ym8tPnRiby5iYXNlLnNpemU7Cj4gICAgICAgICBzdHJ1Y3Qga2ZkX2JvX3ZhX2xpc3QgKmVudHJ5
LCAqdG1wOwo+ICAgICAgICAgc3RydWN0IGJvX3ZtX3Jlc2VydmF0aW9uX2NvbnRleHQgY3R4Owo+
ICAgICAgICAgc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKmJvX2xpc3RfZW50cnk7Cj4gQEAg
LTE0MDIsNyArMTQwMiw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX21hcF9tZW1vcnlfdG9f
Z3B1KAo+ICAgICAgICAgbXV0ZXhfbG9jaygmbWVtLT5sb2NrKTsKPgo+ICAgICAgICAgZG9tYWlu
ID0gbWVtLT5kb21haW47Cj4gLSAgICAgICBib19zaXplID0gYm8tPnRiby5tZW0uc2l6ZTsKPiAr
ICAgICAgIGJvX3NpemUgPSBiby0+dGJvLmJhc2Uuc2l6ZTsKPgo+ICAgICAgICAgcHJfZGVidWco
Ik1hcCBWQSAweCVsbHggLSAweCVsbHggdG8gdm0gJXAgZG9tYWluICVzXG4iLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIG1lbS0+dmEsCj4gQEAgLTE1MDYsNyArMTUwNiw3IEBAIGludCBhbWRn
cHVfYW1ka2ZkX2dwdXZtX3VubWFwX21lbW9yeV9mcm9tX2dwdSgKPiAgICAgICAgIHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gZ2V0X2FtZGdwdV9kZXZpY2Uoa2dkKTsKPiAgICAgICAgIHN0
cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPQo+ICAgICAgICAgICAgICAg
ICAoKHN0cnVjdCBhbWRncHVfdm0gKil2bSktPnByb2Nlc3NfaW5mbzsKPiAtICAgICAgIHVuc2ln
bmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5tZW0uc2l6ZTsKPiArICAgICAgIHVuc2ln
bmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5iYXNlLnNpemU7Cj4gICAgICAgICBzdHJ1
Y3Qga2ZkX2JvX3ZhX2xpc3QgKmVudHJ5Owo+ICAgICAgICAgc3RydWN0IGJvX3ZtX3Jlc2VydmF0
aW9uX2NvbnRleHQgY3R4Owo+ICAgICAgICAgaW50IHJldDsKPiAtLQo+IDIuMjkuMgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
