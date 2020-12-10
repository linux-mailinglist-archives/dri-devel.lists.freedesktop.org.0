Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D42D6256
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D836EA70;
	Thu, 10 Dec 2020 16:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B626EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:46:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAGkIOA017148;
 Thu, 10 Dec 2020 10:46:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607618778;
 bh=/yAAdf85hn76uTV5lnEj6b5CiO5rePxLyL0RgRt4KGA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SOnp7lsWrepQafvuMba3Wn6GeEnG20/XEkblzUwnjn62h1hogOca4BLbtrsS36pUo
 0gSF8lqLlStKp0QBt3ij7MVThdfmkEQ+6JO7pstGims0QYvtdvz04DuQHESOI1maRb
 M1RXWAqPNC5C668+stJa0IFkK9+YFkap3PqvLfTo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAGkIEs065368
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 10:46:18 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 10:45:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 10:45:30 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAGjRIS108810;
 Thu, 10 Dec 2020 10:45:27 -0600
Subject: Re: [PATCH v3 1/2] drm: automatic legacy gamma support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
 <20201210140852.1040054-2-tomi.valkeinen@ti.com>
 <20201210152739.GF401619@phenom.ffwll.local> <X9JNn4AZaaG4YOIR@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <360878f4-5779-ea77-3039-ab6c28935508@ti.com>
Date: Thu, 10 Dec 2020 18:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9JNn4AZaaG4YOIR@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTIvMjAyMCAxODozMiwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgoKPj4+IEBAIC0xMDUz
LDE4ICsxMDUyLDkgQEAgc3RhdGljIGludCBzZXRjbWFwX2F0b21pYyhzdHJ1Y3QgZmJfY21hcCAq
Y21hcCwgc3RydWN0IGZiX2luZm8gKmluZm8pCj4+PiAgCQkJZ290byBvdXRfc3RhdGU7Cj4+PiAg
CQl9Cj4+PiAgCj4+PiAtCQljcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShz
dGF0ZSwgY3J0Yyk7Cj4+PiAtCQlpZiAoSVNfRVJSKGNydGNfc3RhdGUpKSB7Cj4+PiAtCQkJcmV0
ID0gUFRSX0VSUihjcnRjX3N0YXRlKTsKPj4+ICsJCXJldCA9IGRybV9jcnRjX2dhbW1hX3JhbXBf
c2V0KHN0YXRlLCBjcnRjLCBnYW1tYV9sdXQpOwo+Pj4gKwkJaWYgKHJldCkKPj4KPj4gWW91J3Jl
IG5lc3RpbmcgYW4gYXRvbWljIGNvbW1pdCBpbiBhbiBhdG9taWMgY29tbWl0IGhlcmUsIHRoYXQg
d2lsbCBnbwo+PiBib29tLiBJIGd1ZXNzIGlkZWFsbHkgd2UnZCBtb3ZlIHRoaXMgaW50byBkcm1f
Y2xpZW50X21vZGVzZXQgc28gaXQKPj4gcmVtZW1iZXJzIHRoZSBmYmRldiBnYW1tYSByYW1wIGFu
ZCBkb2VzIGl0IGFsbCBpbiBvbmUgZ28uCj4gCj4gSUlSQyB0aGF0J3MgcHJldHR5IG11Y2ggd2hh
dCdzIGluIG15IGJyYW5jaCB0aGF0IEkgbWVudGlvbmVkIGVhcmxpZXIuCj4gTWVudGlvbmluZyBp
dCBhZ2FpbiBpbiBjYXNlIHNvbWVvbmUgd2FudHMgYSBsZWcgdXAgZm9yIGltcGxlbWVudGluZwo+
IHRoaXMgaWRlYSA7KQoKWWVwLCBJIHRoaW5rIHlvdXIgYnJhbmNoIGxvb2tzIGdvb2QsIGFuZCBJ
IGFsbW9zdCBzdGFydGVkIHdvcmtpbmcgb24gaXQsIGJ1dCBJIGRvbid0IHRoaW5rIEkgaGF2ZQp0
aGUgdGltZSBmb3IgaXQuIEkgaGF2ZSB0byBmaW5pc2ggdGhpcyBieSBlYXJseSBuZXh0IHdlZWss
IGFmdGVyIHdoaWNoIEkgZG9uJ3Qga25vdyB3aGVuIEkgY291bGQKY29udGludWUgd2l0aCBpdCAo
aWYgZXZlciwgam9iIGNoYW5nZS4uLikuCgogVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
