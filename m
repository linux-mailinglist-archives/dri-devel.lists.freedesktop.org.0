Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CEE33AFEC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 11:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A186489DAB;
	Mon, 15 Mar 2021 10:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FA989DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 10:26:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bm21so65212818ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=XJ/bsidcf3TmYVo2hginQuNUftS9IrQC+baKfIs+yg8=;
 b=WYx1ASVj2FdcFzyDtf0MWLlila9M0YSqnXFMOgTTLSSm40N6fl9RG+20rZUjpoJJG+
 pcoCFJwa0W8at2432OfIbqUCLMxgrjo7iGlJq4K32ojhJ/sPi/jWldb2ffwSNuv4xxCF
 scfpOcMG9MXWiLO1g2MGkKrKfZX/GF8lUp+w8VJ2PfimL3FNFDGMrMFXoaEpYs577teI
 mr3gXiVp4UpvFD/ElmDZtG0xXOrmztEyn+OwgPgKutX7UUPvAzMz+dEOPOhR+MWH5EEa
 NMjiLR+oycHz1DYuSayuOg6aFLNMIvIcNR4SIEVGhEio3UJdjxnYS2yy1cH+fgvBXSh3
 PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XJ/bsidcf3TmYVo2hginQuNUftS9IrQC+baKfIs+yg8=;
 b=N3IFZzZYAdRr3Yq7I0CS8ibueS4UdoxqR57k2IYtzD/PDTWBHyK5Jf0/GELTGe41vy
 DXhnf8FiNRZ3f01MQwgSLdYJkGHgF5swRw7CfX+kCsSDiPGdJEHv4Pchr+VjFHyJuK1D
 bO/fy2C+kS7SKOpNSBqYcyzi9CVnUWfJwjDC6aI4c9C7+Ry/GWb7DWa5YzFwoVLX6JaX
 v3ueJJT1+rhP8kXXKRge4NqYNhmg5NBPUyy8gXyct6OCtVY4Bwvt2SYNkQHY/vuTc9Uv
 MmqJlT3cLTTdbPJmK3LeCdyqWjyLOE3movM7SdxVQFfg971kvM+Pvve934cNH6jsdIAl
 EeRg==
X-Gm-Message-State: AOAM531fW5mS9OogXi317ugSZf5uNtzrfFJC9gkvZvRJJAHZEQtN7bdF
 oV0tNG2LY3Q6e5mznyHvnrvJjSdObdw=
X-Google-Smtp-Source: ABdhPJxLGLR97boPwWF4nZHziNspALy/KgGJoBBlXFJYyjHBmDciAs30XfCGV06gSpwPQa1379N84w==
X-Received: by 2002:a17:907:37a:: with SMTP id
 rs26mr22677100ejb.336.1615803977553; 
 Mon, 15 Mar 2021 03:26:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:dd5e:327:8807:376f?
 ([2a02:908:1252:fb60:dd5e:327:8807:376f])
 by smtp.gmail.com with ESMTPSA id g11sm4222700edw.37.2021.03.15.03.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:26:17 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
Date: Mon, 15 Mar 2021 11:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMy4wMy4yMSB1bSAxOToyOSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6
Cj4gSGksIENocmlzdGlhbgo+Cj4gT24gMy8xMi8yMSAxMDozOCBBTSwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPj4gV2Ugc2VlbSB0byBoYXZlIHNvbWUgbW9yZSBkcml2ZXIgYnVncyB0aGFuIHRo
b3VnaHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgg
fCA2ICsrKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4gaW5kZXggNGZiNTIzZGZhYjMyLi5kZjlm
ZTU5NmU3YzUgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4g
KysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+PiBAQCAtNjAzLDkgKzYwMywxMSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX3BpbihzdHJ1Y3QgCj4+IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibykKPj4gwqAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191bnBpbihzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3ZfYXNzZXJ0
X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4+IC3CoMKgwqAgV0FSTl9PTl9PTkNFKCFiby0+cGluX2Nv
dW50KTsKPj4gwqDCoMKgwqDCoCBXQVJOX09OX09OQ0UoIWtyZWZfcmVhZCgmYm8tPmtyZWYpKTsK
Pj4gLcKgwqDCoCAtLWJvLT5waW5fY291bnQ7Cj4+ICvCoMKgwqAgaWYgKGJvLT5waW5fY291bnQp
Cj4+ICvCoMKgwqDCoMKgwqDCoCAtLWJvLT5waW5fY291bnQ7Cj4+ICvCoMKgwqAgZWxzZQo+PiAr
wqDCoMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKHRydWUpOwo+PiDCoCB9Cj4+IMKgIMKgIGludCB0
dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+Cj4gU2luY2UgSSBu
b3cgaGF2ZSBiZWVuIHN0YXJpbmcgZm9yIGhhbGYgYSB5ZWFyIGF0IHRoZSBjb2RlIG9mIHRoZSAK
PiBkcml2ZXIgdGhhdCBtYWRlIHBpbm5pbmcgYW4gYXJ0LCBJIGhhdmUgYSBjb3VwbGUgb2Ygc3Vn
Z2VzdGlvbnMgaGVyZSwgCj4gQ291bGQgd2UgdXNlIGFuIGF0b21pYyBmb3IgcGluX2NvdW50LCBh
bGxvd2luZyB1bmxvY2tlZCB1bnBpbm5pbmcgYnV0IAo+IHJlcXVpcmUgdGhlIGxvY2sgb25seSBm
b3IgcGluX2NvdW50IHRyYW5zaXRpb24gMC0+MSwgKGJ1dCB1bmxvY2tlZCBmb3IgCj4gcGluX2lm
X2FscmVhZHlfcGlubmVkKS4gSW4gcGFydGljdWxhciBJIHRoaW5rIHZtd2dmeCB3b3VsZCBiZW5l
Zml0IAo+IGZyb20gdW5sb2NrZWQgdW5waW5zLiBBbHNvIGlmIHRoZSBhdG9taWMgd2VyZSBhIHJl
ZmNvdW50X3QsIHRoYXQgd291bGQgCj4gcHJvYmFibHkgZ2l2ZSB5b3UgdGhlIGFib3ZlIGJlaGF2
aW91cj8KCk5vcGUsIEkndmUgY29uc2lkZXJlZCB0aGlzIGFzIHdlbGwgd2hpbGUgbW92aW5nIHRo
ZSBwaW4gY291bnQgaW50byBUVE0uCgpUaGUgcHJvYmxlbSBpcyB0aGF0IHlvdSBub3Qgb25seSBu
ZWVkIHRoZSBCTyByZXNlcnZlZCBmb3IgMC0+MSAKdHJhbnNpdGlvbnMsIGJ1dCBhbHNvIGZvciAx
LT4wIHRyYW5zaXRpb25zIHRvIG1vdmUgdGhlIEJPIG9uIHRoZSBMUlUgCmNvcnJlY3RseS4KCkNo
cmlzdGlhbi4KCj4KPiAvVGhvbWFzCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
