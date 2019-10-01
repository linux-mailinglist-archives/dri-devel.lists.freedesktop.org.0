Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340EC4840
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDD66E8E3;
	Wed,  2 Oct 2019 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F2F898BE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 15:17:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91FHd6G012908;
 Tue, 1 Oct 2019 10:17:39 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91FHdhi031997
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 10:17:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:17:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:17:29 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91FHceg051485;
 Tue, 1 Oct 2019 10:17:38 -0500
Subject: Re: [PATCH V6 5/8] backlight: qcom-wled: Restructure the driver for
 WLED3
To: Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
 <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
 <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
Date: Tue, 1 Oct 2019 10:17:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569943059;
 bh=mYUdVtpTVwCAKDqOu/gzrxlPJtwVfw4kTjUjOPGBBwI=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=vgVjgSmM4Fm9w2oqiQFOOZO20eOMLlmf2fpPWhTk4SB6lLT6cXWfq0Z6zuuYfKhb9
 WJcvCpx5oSZRqK2kWQ7PTEZWd82IgRDhabn5MBGNjzDlHvmLVVdbTmmHjMnBeKbxqw
 yXchTeVsv4hWw2aRN9OXYzqf2lbVnB42ync3zMWA=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2lyYW4KCk9uIDkvMzAvMTkgMTozOSBBTSwgS2lyYW4gR3VuZGEgd3JvdGU6Cj4gUmVzdHJ1Y3R1
cmUgdGhlIGRyaXZlciB0byBhZGQgdGhlIHN1cHBvcnQgZm9yIG5ldyBXTEVECj4gcGVyaXBoZXJh
bHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJvcmEub3Jn
Pgo+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCAzOTUgKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjQ1
IGluc2VydGlvbnMoKyksIDE1MCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fj
b20td2xlZC5jCj4gaW5kZXggZjE5MTI0Mi4uNzQwZjFiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3Fjb20td2xlZC5jCj4gQEAgLTcsNTkgKzcsNzEgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L29m
X2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L3JlZ21hcC5oPgo+ICAgCj4gICAvKiBGcm9tIERUIGJpbmRpbmcgKi8KPiArI2RlZmlu
ZSBXTEVEX01BWF9TVFJJTkdTCQkJCTQKPiArCj4gICAjZGVmaW5lIFdMRURfREVGQVVMVF9CUklH
SFRORVNTCQkJCTIwNDgKPiAgIAo+IC0jZGVmaW5lIFdMRUQzX1NJTktfUkVHX0JSSUdIVF9NQVgJ
CQkweEZGRgo+IC0jZGVmaW5lIFdMRUQzX0NUUkxfUkVHX1ZBTF9CQVNFCQkJCTB4NDAKPiArI2Rl
ZmluZSBXTEVEX1NJTktfUkVHX0JSSUdIVF9NQVgJCQkweEZGRgoKV2h5IGRpZCB5b3UgY2hhbmdl
IHNvbWUgb2YgdGhlc2UgYWdhaW4/CgpDYW4geW91IGp1c3QgY2hhbmdlIGl0IHRvIHRoZSBmaW5h
bCAjZGVmaW5lIGluIHBhdGNoIDQvOD8KCkRhbgoKPHNuaXA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
