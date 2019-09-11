Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABBB093C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3226EBBE;
	Thu, 12 Sep 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF36E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:48:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BImcY7051732;
 Wed, 11 Sep 2019 13:48:38 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BImbgv068137
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Sep 2019 13:48:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:48:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:48:37 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BImaxV119829;
 Wed, 11 Sep 2019 13:48:36 -0500
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
To: Daniel Thompson <daniel.thompson@linaro.org>, Andreas Kemnade
 <andreas@kemnade.info>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
 <20190911102533.not4ta3xwgm6bhjo@holly.lan>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
Date: Wed, 11 Sep 2019 13:48:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911102533.not4ta3xwgm6bhjo@holly.lan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568227718;
 bh=1xSERSqIkAtP/bLDu3RUnmyzW6/XzR17kn4wt0JSzQE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LdwUSNv6ZbXANbfxNoJYEDv5rETOOMt04lMlvG8RYbaxYrQHBgvNg3m/RdnpG5lq2
 Yjj10rCiVfbF39DafaKdYQ1v6fluk0Bw4dMFmGqNwMCLhe7HBe0KyxPFnkmi3pGYvI
 6TMFbQLtFu+VsK3BApMVojHliBROeOnBpSjZJAI4=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTEvMTkgNToyNSBBTSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFR1ZSwgU2Vw
IDEwLCAyMDE5IGF0IDExOjI5OjA5UE0gKzAyMDAsIEFuZHJlYXMgS2VtbmFkZSB3cm90ZToKPj4g
Rm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gYWxsb3cgaTJj
Cj4+IGFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSByZWdpc3RlciB2
YWx1ZXMKPj4gdG8gZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgZG9lcyBu
b3QgZ2l2ZQo+PiBwb3dlciBzYXZpbmdzCj4+Cj4+IFRlc3RlZCBvbiBLb2JvIENsYXJhIEhELgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZv
Pgo+PiAtLS0KPj4gY2hhbmdlcyBpbiB2MjoKPj4gLSBzaW1wbGlmaWNhdGlvbgo+PiAtIGNvcnJl
Y3QgZ3BpbyBkaXJlY3Rpb24gaW5pdGlhbGlzYXRpb24KPj4KPj4gICBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9sbTM2MzBhX2JsLmMgfCAxMCArKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2xtMzYzMGFfYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+
PiBpbmRleCA4Zjg0ZjM2ODRmMDQuLjlkMDYzOWQ0MjAyZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2xtMzYzMGFfYmwuYwo+PiBAQCAtMTIsNiArMTIsOCBAQAo+PiAgICNpbmNsdWRlIDxs
aW51eC91YWNjZXNzLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+PiAgICNp
bmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby5oPgo+IE5pdHBpY2tpbmcuLi4gYnV0IEkgZG9u
J3QgdGhpbmsgbGludXgvZ3Bpby5oIGlzIHVzZWQgYW55bW9yZS4KPgo+Cj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3B3bS5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2xtMzYzMGFf
YmwuaD4KPj4gICAKPj4gQEAgLTQ4LDYgKzUwLDcgQEAgc3RydWN0IGxtMzYzMGFfY2hpcCB7Cj4+
ICAgCXN0cnVjdCBsbTM2MzBhX3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+PiAgIAlzdHJ1Y3QgYmFj
a2xpZ2h0X2RldmljZSAqYmxlZGE7Cj4+ICAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVk
YjsKPj4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsKPj4gICAJc3RydWN0IHJlZ21h
cCAqcmVnbWFwOwo+PiAgIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtZDsKPj4gICB9Owo+PiBAQCAt
NTM1LDYgKzUzOCwxMyBAQCBzdGF0aWMgaW50IGxtMzYzMGFfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCwKPj4gICAJfQo+PiAgIAlwY2hpcC0+cGRhdGEgPSBwZGF0YTsKPj4gICAKPj4g
KwlwY2hpcC0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgmY2xpZW50LT5k
ZXYsICJlbmFibGUiLAo+PiArCQkJCQkJR1BJT0RfT1VUX0hJR0gpOwo+PiArCWlmIChJU19FUlIo
cGNoaXAtPmVuYWJsZV9ncGlvKSkgewo+PiArCQlydmFsID0gUFRSX0VSUihwY2hpcC0+ZW5hYmxl
X2dwaW8pOwo+PiArCQlyZXR1cm4gcnZhbDsKCnRoZSBlbmFibGUgZ3BpbyBpcyBvcHRpb25hbCBz
byBpZiBpdCBmYWlscyB5b3UgbG9nIHRoZSBlcnJvciBhbmQgbW92ZSBvbgoKQWxzbyBvbiBkcml2
ZXIgcmVtb3ZhbCBkaWQgeW91IHdhbnQgdG8gc2V0IHRoZSBHUElPIHRvIGxvdyB0byBkaXNhYmxl
IAp0aGUgZGV2aWNlIHRvIHNhdmUgcG93ZXI/CgpEYW4KCgo+PiArCX0KPj4gKwo+PiAgIAkvKiBj
aGlwIGluaXRpYWxpemUgKi8KPj4gICAJcnZhbCA9IGxtMzYzMGFfY2hpcF9pbml0KHBjaGlwKTsK
Pj4gICAJaWYgKHJ2YWwgPCAwKSB7Cj4+IC0tIAo+PiAyLjIwLjEKPj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
