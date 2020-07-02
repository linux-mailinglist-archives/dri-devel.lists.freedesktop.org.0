Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E28211CEA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD39B6EA74;
	Thu,  2 Jul 2020 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02F66E203
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 05:43:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f8so17864088ljc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8q209O2LZaPOsMqrkcwLXZ9FBAITgOWF27/Mx+CT9XE=;
 b=m6mNKjiOin5lgFBuoN5BSEkJnGnaqUFj0LyH9vfXAI5kXFAMaAD6Gk3FH/jPRl178h
 fQQTlpUePeq4EXUm+oADV3rXutKG7wXyJp3IncAg0FLgPdK/lnLbIYinqm7vTd5aTomr
 bRsdSbtBZyNLj8Cmo9hNk0ljmnqAHKyZaHUxC2Krf5RbVQPtqeBl/I1c+fH6u/cU4H0e
 o7KEvY2B/Zd/aMNH0/sxZjXV+Y1pDAzxvquulWy91PqKwp6x8Iv7ZGcv4rrLL+7Ze3nq
 zIAOFLXLO4GSLT/gZxs45TYfQE8HBqC6n+Zd1SBHCeT736pqB73Rpxq0lCY03gtwKQK7
 kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8q209O2LZaPOsMqrkcwLXZ9FBAITgOWF27/Mx+CT9XE=;
 b=FTgYH9jEdzatqAo7sY7GPI7BhBUYJuSJ3Km8p0ktLGOA2NXcfdRHIWfM8hisFAz2BS
 a+aJOcmjk4cNaxtEbAZqoYheVhe5jm+BB02HR31Y2XlMP255lh7BWlBsdFki6WX31Ax1
 wibLSVFSwFYa32Dnpord1YYFIYFdve03ORtP+956XPl7164YJocl3F9RUnmXAKAQ1VoL
 /R37WZuSORZ1/CiTnUJxet+1gZGXUrX7HJ/nZo2AKf3Xj7b/U4N0d5VptXskJVDHUFbS
 vUWSyvZTHDaKIoSN4wiHvyf3f1i70ZsPJxY8JJHuqIDlphzMgOftHpIW/PF8aFescz6S
 5PYw==
X-Gm-Message-State: AOAM530uux0jycelDx0UHAHQ6qm57grrf8YlIupFYue6wfjTvZJgOL72
 HnCHIFCLInQEuzxIMpI/7Pw=
X-Google-Smtp-Source: ABdhPJzNDK/EGBA1dP+Bkg8lYhHrdYDFzeDuloBP68+sx4P4oGWh2smxM3ZdupKE9ncqdIA0J+glXQ==
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr6402902ljj.333.1593668612201; 
 Wed, 01 Jul 2020 22:43:32 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id w24sm2937288lfl.17.2020.07.01.22.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 22:43:31 -0700 (PDT)
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
 <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
 <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
 <2069fb51-f043-795d-7768-0024fc9a9f4e@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7988b6cf-e60c-7e5c-ffc3-8075c20af3d3@gmail.com>
Date: Thu, 2 Jul 2020 08:43:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2069fb51-f043-795d-7768-0024fc9a9f4e@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAwODozMCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gT24gNy8yLzIwIDI6
MDcgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDIuMDcuMjAyMCAwNzoxOCwgQ2hhbndv
byBDaG9pINC/0LjRiNC10YI6Cj4+PiBIaSBEbWl0cnksCj4+Pgo+Pj4gT24gNi85LzIwIDEwOjEz
IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gVGhlIGNsa19yb3VuZF9yYXRlKCkgd29u
J3QgYmUgdXNhYmxlIGZvciBidWlsZGluZyBPUFAgdGFibGUgb25jZQo+Pj4+IGludGVyY29ubmVj
dCBzdXBwb3J0IHdpbGwgYmUgYWRkZWQgdG8gdGhlIEVNQyBkcml2ZXIgYmVjYXVzZSB0aGF0IENM
SyBBUEkKPj4+PiBmdW5jdGlvbiBsaW1pdHMgdGhlIHJvdW5kZWQgcmF0ZSBiYXNlZCBvbiB0aGUg
Y2xrIHJhdGUgdGhhdCBpcyBpbXBvc2VkIGJ5Cj4+Pj4gYWN0aXZlIGNsay11c2VycywgYW5kIHRo
dXMsIHRoZSByb3VuZGluZyB3b24ndCB3b3JrIGFzIGV4cGVjdGVkIGlmCj4+Pj4gaW50ZXJjb25u
ZWN0IHdpbGwgc2V0IHRoZSBtaW5pbXVtIEVNQyBjbG9jayByYXRlIGJlZm9yZSBkZXZmcmVxIGRy
aXZlciBpcwo+Pj4+IGxvYWRlZC4gVGhlIHN0cnVjdCB0ZWdyYV9tYyBjb250YWlucyBtZW1vcnkg
dGltaW5ncyB3aGljaCBjb3VsZCBiZSB1c2VkIGJ5Cj4+Pj4gdGhlIGRldmZyZXEgZHJpdmVyIGZv
ciBidWlsZGluZyB1cCBPUFAgdGFibGUgaW5zdGVhZCBvZiByb3VuZGluZyBjbG9jawo+Pj4+IHJh
dGUsIHRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGlzIGlkZWEuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRy
aXZlcnMvZGV2ZnJlcS90ZWdyYTIwLWRldmZyZXEuYyB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMgYi9k
cml2ZXJzL2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMKPj4+PiBpbmRleCA2NDY5ZGM2OWM1ZTAu
LmJmNTA0Y2E0ZGVhMiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvdGVncmEyMC1k
ZXZmcmVxLmMKPj4+PiArKysgYi9kcml2ZXJzL2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMKPj4+
PiBAQCAtMTIzLDggKzEyMyw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZGV2ZnJlcV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICB7Cj4+Pj4gIAlzdHJ1Y3QgdGVncmFfZGV2
ZnJlcSAqdGVncmE7Cj4+Pj4gIAlzdHJ1Y3QgdGVncmFfbWMgKm1jOwo+Pj4+IC0JdW5zaWduZWQg
bG9uZyBtYXhfcmF0ZTsKPj4+PiAtCXVuc2lnbmVkIGxvbmcgcmF0ZTsKPj4+PiArCXVuc2lnbmVk
IGludCBpOwo+Pj4+ICAJaW50IGVycjsKPj4+PiAgCj4+Pj4gIAltYyA9IHRlZ3JhX2dldF9tZW1v
cnlfY29udHJvbGxlcigpOwo+Pj4+IEBAIC0xNTEsMTIgKzE1MCwxNyBAQCBzdGF0aWMgaW50IHRl
Z3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiAgCj4+
Pj4gIAl0ZWdyYS0+cmVncyA9IG1jLT5yZWdzOwo+Pj4+ICAKPj4+PiAtCW1heF9yYXRlID0gY2xr
X3JvdW5kX3JhdGUodGVncmEtPmVtY19jbG9jaywgVUxPTkdfTUFYKTsKPj4+PiAtCj4+Pj4gLQlm
b3IgKHJhdGUgPSAwOyByYXRlIDw9IG1heF9yYXRlOyByYXRlKyspIHsKPj4+PiAtCQlyYXRlID0g
Y2xrX3JvdW5kX3JhdGUodGVncmEtPmVtY19jbG9jaywgcmF0ZSk7Cj4+Pj4gKwlpZiAoIW1jLT5u
dW1fdGltaW5ncykgewo+Pj4KPj4+IENvdWxkIHlvdSBleHBsYWluIHdoYXQgaXMgbWVhbmluZyBv
ZiAnbnVtX3RpbWluZz8KPj4KPj4gVGhlIG51bV90aW1pbmdzIGlzIHRoZSBudW1iZXIgb2YgbWVt
b3J5IHRpbWluZ3MgZGVmaW5lZCBpbiBhCj4+IGRldmljZS10cmVlLiBPbmUgdGltaW5nIGNvbmZp
Z3VyYXRpb24gcGVyIG1lbW9yeSBjbG9jayByYXRlLgo+IAo+IE9LLiBJIHVuZGVyc3RhbmQuCj4g
Cj4+Cj4+PiBBbHNvLCB3aHkgYWRkIHRoZSBvcHAgZW50cnkgaW4gY2FzZSBvZiBtYy0+bnVtX3Rp
bWluZ3MgaXMgemVybz8KPj4KPj4gVGltaW5ncyBtYXkgYmUgbm90IGRlZmluZWQgaW4gc29tZSBk
ZXZpY2UtdHJlZXMgYXQgYWxsIGFuZCBpbiB0aGlzIGNhc2UKPj4gbWVtb3J5IGFsd2F5cyBydW5u
aW5nIG9uIGEgZml4ZWQgY2xvY2sgcmF0ZS4KPiAKPiBZb3UgbWVhbiB0aGF0ICd0aW1pbmdzJyBp
bmZvcm1hdGlvbiBpcyBvcHRpb25hbD8KClllcwoKQWN0dWFsbHksIGxvb2tzIGxpa2UgSSBtaXNz
ZWQgdG8gcHJvcGVybHkgdGVzdCB0aGlzIGNhc2Ugd2hlcmUgdGltaW5ncwphcmUgbWlzc2luZyBp
biBEVCBhbmQgaXQgc2hvdWxkbid0IHdvcmsgd2l0aCB0aGUgY3VycmVudCBjb2RlLiBJJ2xsIGZp
eAppdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPj4KPj4gVGhlIGRldmZyZXEgZHJpdmVyIHdvbid0
IGJlIHByYWN0aWNhbGx5IHVzZWZ1bCBpZiBtYy0+bnVtX3RpbWluZ3MgaXMKPj4gemVybyBzaW5j
ZSBtZW1vcnkgZnJlcXVlbmN5IGNhbid0IGJlIGNoYW5nZWQsIGJ1dCBhbnl3YXlzIHdlJ2Qgd2Fu
dCB0bwo+PiBsb2FkIHRoZSBkZXZmcmVxIGRyaXZlciBpbiBvcmRlciB0byBwcmV2ZW50IGNvbmZ1
c2lvbiBhYm91dCB3aHkgaXQncyBub3QKPj4gbG9hZGVkLgo+Pgo+PiBGb3IgZXhhbXBsZSwgeW91
IG1heSBhc2sgc29tZWJvZHkgdG8gc2hvdyBjb250ZW50cyBvZgo+PiAvc3lzL2NsYXNzL2RldmZy
ZXEvdGVncmEyMC1kZXZmcmVxL3RyYW5zX3N0YXQgYW5kIHRoZSBwZXJzb24gc2F5cyB0byB5b3UK
Pj4gdGhhdCB0aGlzIGZpbGUgZG9lc24ndCBleGlzdCwgbm93IHlvdSdsbCBoYXZlIHRvIGZpZ3Vy
ZSBvdXQgd2hhdAo+PiBoYXBwZW5lZCB0byB0aGUgZGV2ZnJlcSBkcml2ZXIuCj4gCj4gSSB1bmRl
cnN0YW5kIHdoeSBhZGQgT1BQIGVudHJ5IHBvaW50IHdoZW4gdGltaW5nIGlzIG5vdCBkZWZpbmVk
IG9uIERULgo+IEJ1dCwgYWN0dWFsbHksIEkgdGhpbmsgdGhhdCB5b3UgYmV0dGVyIHRvIGNoYW5n
ZSAndGltaW5ncycgaW5mbyBpcyBtYW5kYXRvcnkKPiBpbnN0ZWFkIG9mIG9wdGlvbmFsLiBCZWNh
dXNlIHRoZSBkZXZmcmVxIGRyaXZlciBpcyBmb3IgRFZGUwo+IGFuZCB0aGUgZHJpdmVyIHN1cHBv
cnRpbmcgRFZGUyBoYXZlIHRvIGhhdmUgdGhlIGZyZXF1ZW5jeSBpbmZvcm1hdGlvbgo+IGxpa2Ug
T1BQLgo+IAo+IE9yLCAKPiBJZiB5b3Ugd2FudCB0byBrZWVwICd0aW1pbmcnIGlzIG9wdGlvbmFs
IG9uIERULAo+IEkgcmVjb21tZW5kIHRoYXQgeW91IGFkZCBvbmUgdGltaW5nIGRhdGEgdG8gdGVn
cmEgbWMgZHJpdmVyCj4gd2hlbiBEVCBkb2Vzbid0IGluY2x1ZGUgdGhlIGFueSB0aW1pbmcgaW5m
b3JtYXRpb24KPiBJIHRoaW5rIHRoYXQgaXMgaXQgbW9yZSBjbGVhci4KCk9rYXksIEknbGwgbW92
ZSBpdCBpbnRvIHRoZSBNQyBkcml2ZXIgaW4gdGhlIG5leHQgdmVyc2lvbi4KClRoYW5rIHlvdSBm
b3IgdGhlIHJldmlldyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
