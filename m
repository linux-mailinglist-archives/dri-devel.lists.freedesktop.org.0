Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D217367E14
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D636E06B;
	Thu, 22 Apr 2021 09:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB836E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 09:46:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e5so15458538wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 02:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hHenTJ0Iw1ZTELVG+kP1QVYQ2RCVTfVgpTgHlUMx1u8=;
 b=TzuKZJDDfEu05sj+sNSvaPDXXrL9fau8QBkpmgh1DG0EE+XNygu6nSQzKYGCT4v277
 XMQ/vR3bivR6tCWOs6TumlK1US8k1ZR6M7sYtwjVuhjDn8aDoFG1hYatUlRMXoLdYNPd
 VolgpPcuGNmTsCexYEcKNSZPM+b6EkDCA/z/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hHenTJ0Iw1ZTELVG+kP1QVYQ2RCVTfVgpTgHlUMx1u8=;
 b=JVLReZwOq0NvP54fF0JrSnjcYnPJl2n8DsoL3h5YJ51gM7o1V2XcsPUQCxFDUyCaEn
 d3QznDqZxQcmBhkpoXTrPB86nc64aBkPJctHxPFFcu/R/FLYipR2hoyEOOpRCU85x1q+
 8pYnTipVAeCPwOdZPecNFOsLgii12DVAJkJ7BXMk3QWU36jqYWy61Rx9t2wbKGjoF9tU
 p6RwugYXcYksCRYT208xyxs3VjFN4uFWnGXsJdPAKX5QRa+LXQ2wiwy6uCn1G2Z0E6fF
 QVBfQYmNa8a4JEExTIgy+KQ4GZek5pff9ETGXM5oaZ0ccRRUt7fzUf2M4lurGHgklt91
 9ghw==
X-Gm-Message-State: AOAM531LwBXjVjP0NqDVqlKg6+H2jFR16fkb11LS2TrTO7qH81sHk0lK
 NroaJT8ZynWGs7lPtc+STEQGZQ==
X-Google-Smtp-Source: ABdhPJwPROE1H4EdTcU14ewT2z2aNVltaa9rW2kcZWclMUuoqBfaJV/lmWwYHilIlV+zFemTf98sXA==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr2890288wrg.376.1619084786482; 
 Thu, 22 Apr 2021 02:46:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n18sm2569248wrw.11.2021.04.22.02.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 02:46:25 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:46:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_lock_all() with drm_modeset_lock_all_ctx()
Message-ID: <YIFF77+MS+vQ3uTV@phenom.ffwll.local>
References: <20210421113716.15472-1-fmdefrancesco@gmail.com>
 <20210421113716.15472-2-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421113716.15472-2-fmdefrancesco@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjEsIDIwMjEgYXQgMDE6Mzc6MTVQTSArMDIwMCwgRmFiaW8gTS4gRGUgRnJh
bmNlc2NvIHdyb3RlOgo+IFJlcGxhY2UgdGhlIGRlcHJlY2F0ZWQgQVBJIHdpdGggbmV3IGhlbHBl
cnMsIGFjY29yZGluZyB0byB0aGUKPiBUT0RPIGxpc3Qgb2YgdGhlIERSTSBzdWJzeXN0ZW0uCj4g
Cj4gSW4gdGhpcyBmaXJzdCBwYXRjaCBkcm1fbW9kZXNldF9sb2NrX2FsbCgpIGlzIHJlcGxhY2Vk
IHdpdGgKPiBkcm1fbW9kZXNldF9sb2NrX2FsbF9jdHgoKS4gVW5saWtlIGRybV9tb2Rlc2V0X2xv
Y2tfYWxsKCksCj4gdGhlIGxhdHRlciBkb2VzbuKAmXQgdGFrZSB0aGUgZ2xvYmFsIGRybV9tb2Rl
X2NvbmZpZy5tdXRleAo+IHNpbmNlIHRoYXQgbG9jayBpc27igJl0IHJlcXVpcmVkIGZvciBtb2Rl
c2V0IHN0YXRlIGNoYW5nZXMuCgpTbyB0aGlzIGlzIG9ubHkgdHJ1ZSBmb3IgY29yZSBtb2Rlc2V0
IGNvZGUsIG5vdCBuZWNlc3NhcmlseSBmb3IgZHJpdmVycy4KU28gbmVlZHMgdG8gYmUgYXVkaXRl
ZCBpbiBlYWNoIGNhc2UuCgpOb3cgbG9vY2tpbmcgYXQgdGhlIHByZWNpc2UgY29kZSB5b3UncmUg
dG91Y2hpbmcgaGVyZSB0aGUgc2l0dWF0aW9uIGlzIGEKbG90IG1vcmUgc3BlY2lmaWM6Ci0gV2Ug
YXJlIGxvb3Bpbmcgb3ZlciBhbGwgdGhlIGNydGMuIFRoaXMgbGlzdCBuZXZlciBjaGFuZ2VzLCBz
byBubyBsb2NrcwogIG5lZWRlZC4KLSBUaGVuIHdlIGxvb2sgYXQgY3J0Yy0+c3RhdGUsIHdoaWNo
IGlzIHByb3RlY2VkIGJ5IGNydGMtPm11dGV4LiBTbyB0aGF0J3MKICB0aGUgb25seSBsb2NrIHdl
IG5lZWQsIGFuZCB3ZSBvbmx5IG5lZWQgdG8gaG9sZCBhIHNpbmdsZSBvbmUgKHNvIG5vCiAgRURF
QURMQ0sgcmV0cnkgbG9vcCBuZWVkZWQgZHVlIHRvIG11bHRpcGxlIGxvY2sgYWNxdWlzaXRpb24p
LgoKU28gSSB0aGluayB0aGUgcmlnaHQgZml4IGhlcmUgaXMgdG8ganVzdCBncmFiIHRoZSBjcnRj
LT5tdXRleCBsb2NrIHJpZ2h0CmFyb3VuZCB0aGUgYWNjZXNzIHRvIGNydGMtPnN0YXRlIHdpdGgg
ZHJtX21vZGVzZXRfbG9jaygpLiBBbmQgZGl0Y2ggdGhlCmxvY2tfYWxsIGFuZCBhbGwgaXRzIGNv
bXBsZXhpdHkgY29tcGxldGVseS4KCnRsZHI7IGxvY2tpbmcgaXMgY29tcGxpY2F0ZWQgOi0pCgpD
YW4geW91IHBscyByZXNwaW4/CgpUaGFua3MsIERhbmllbAoKPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
byBNLiBEZSBGcmFuY2VzY28gPGZtZGVmcmFuY2VzY29AZ21haWwuY29tPgo+IC0tLQo+IAo+IENo
YW5nZXMgZnJvbSB2MjogVGhlIHdvcmsgaXMgc3BsaXQgaW4gdHdvIGNvbnNlY3V0aXZlIGxvZ2lj
YWwgc3RlcHMuCj4gQ2hhbmdlcyBmcm9tIHYxOiBBZGRlZCBmdXJ0aGVyIGluZm9ybWF0aW9uIHRv
IHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIHwgMTMgKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jCj4gaW5kZXggNjcxZWMxMDAyMjMwLi44NTY5MDNkYjM0YzUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTE0MzgsOCArMTQzOCwxNSBA
QCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAqZGV2
KQo+ICAKPiAgCWlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKSB7Cj4gIAkJ
c3RydWN0IGRybV9jcnRjICpjcnRjOwo+IC0KPiAtCQlkcm1fbW9kZXNldF9sb2NrX2FsbChkcm1f
ZGV2KTsKPiArCQlzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggY3R4Owo+ICsJCWludCBy
ZXRfbG9jayA9IDA7Cj4gKwo+ICtyZXRyeToKPiArCQlkcm1fbW9kZXNldF9sb2NrX2FsbF9jdHgo
ZHJtX2RldiwgJmN0eCk7Cj4gKwkJaWYocmV0X2xvY2sgPT0gLUVERUFETEspIHsKPiArCQkJZHJt
X21vZGVzZXRfYmFja29mZigmY3R4KTsKPiArCQkJZ290byByZXRyeTsKPiArCQl9Cj4gIAo+ICAJ
CWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRybV9kZXYpIHsKPiAgCQkJaWYgKGNydGMtPnN0YXRl
LT5hY3RpdmUpIHsKPiBAQCAtMTQ0OCw3ICsxNDU1LDcgQEAgc3RhdGljIGludCBhbWRncHVfcG1v
cHNfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQkJfQo+ICAJCX0KPiAgCj4g
LQkJZHJtX21vZGVzZXRfdW5sb2NrX2FsbChkcm1fZGV2KTsKPiArCQlkcm1fbW9kZXNldF9kcm9w
X2xvY2tzKCZjdHgpOwo+ICAKPiAgCX0gZWxzZSB7Cj4gIAkJc3RydWN0IGRybV9jb25uZWN0b3Ig
Kmxpc3RfY29ubmVjdG9yOwo+IC0tIAo+IDIuMzEuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
