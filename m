Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5AF10154A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 06:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE240896DD;
	Tue, 19 Nov 2019 05:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761A8967B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 05:42:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJ5gFrF029531;
 Mon, 18 Nov 2019 23:42:15 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJ5gF7t097443
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Nov 2019 23:42:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 23:42:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 23:42:15 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJ5gCdl015366;
 Mon, 18 Nov 2019 23:42:13 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To: Tony Lindgren <tony@atomide.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
Date: Tue, 19 Nov 2019 07:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118230535.GG35479@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574142136;
 bh=bWtRsR/3TOxHAcS6XxIdxnEimos6cH+h2hRdBhT3N2Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uZZdRHV1J4X6rWKntPyBWK+7mIq+22MIDQn3ch59qSF3uz5NVkCQGcjjuTwcFrXy3
 FAFyJGs4A+kCKMH6+xZLlDWcOl+Q1MfTZe7GZHzpOJcD/I8bGAMFSkCoUkCaCQEITC
 KaEB9FsgquaSvk2J2awolRWTIC3y/ANdAOpd72gY=
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
Cc: kernel@collabora.com, "H.
 Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMTEvMjAxOSAwMTowNSwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiAqIFNlYmFzdGlhbiBS
ZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPiBbMTkxMTE3IDA3OjExXToK
Pj4gV2UgY2FuIHNpbXBseSB1c2UgdGhlIGF0b21pYyBoZWxwZXIgZm9yCj4+IGhhbmRsaW5nIHRo
ZSBkaXJ0eWZiIGNhbGxiYWNrLgo+IC4uLgo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2NydGMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMu
Ywo+PiAtdm9pZCBvbWFwX2NydGNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjKQo+PiArc3Rh
dGljIHZvaWQgb21hcF9jcnRjX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPj4gICB7Cj4+
ICAgCXN0cnVjdCBvbWFwX2NydGMgKm9tYXBfY3J0YyA9IHRvX29tYXBfY3J0YyhjcnRjKTsKPj4g
LQlzdHJ1Y3Qgb21hcF9jcnRjX3N0YXRlICpvbWFwX3N0YXRlID0gdG9fb21hcF9jcnRjX3N0YXRl
KGNydGMtPnN0YXRlKTsKPj4gLQo+PiAtCWlmICghb21hcF9zdGF0ZS0+bWFudWFsbHlfdXBkYXRl
ZCkKPj4gLQkJcmV0dXJuOwo+PiAgIAo+PiAgIAlpZiAoIWRlbGF5ZWRfd29ya19wZW5kaW5nKCZv
bWFwX2NydGMtPnVwZGF0ZV93b3JrKSkKPj4gICAJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmb21h
cF9jcnRjLT51cGRhdGVfd29yaywgMCk7Cj4gCj4gSXQgd291bGQgYmUgbmljZSBpZiBvbWFwX2Ny
dGNfZmx1c2goKSB3b3VsZCBiZWNvbWUganVzdCBzb21lIGdlbmVyaWMKPiB2b2lkIGZ1bmN0aW9u
IHdpdGggbm8gbmVlZCB0byBwYXNzIGl0IGEgY3J0Yy4gSSBndWVzcyBmb3IgdGhhdCBpdAo+IHNo
b3VsZCBrbm93IHdoYXQgcGFuZWxzIGFyZSBpbiBtYW51YWwgY29tbWFuZCBtb2RlIHRvIHJlZnJl
c2ggdGhlbS4KPiAKPiBUaGUgcmVhc29uIEknbSBicmluZ2luZyB0aGlzIHVwIGlzIGJlY2F1c2Ug
aXQgbG9va3MgbGlrZSB3ZSBuZWVkCj4gdG8gYWxzbyBmbHVzaCBEU0kgY29tbWFuZCBtb2RlIHBh
bmVscyBmcm9tIG9tYXBfZ2VtX29wX2ZpbmlzaCgpCj4gZm9yIGdsZXMgYW5kIHRoZSBnZW0gY29k
ZSBwcm9iYWJseSBzaG91bGQgbm90IG5lZWQgdG8ga25vdyBhbnl0aGluZwo+IGFib3V0IGNydGMs
IHJpZ2h0PwoKV2UgaGF2ZW4ndCBoYWQgb21hcF9nZW1fb3BfZmluaXNoKCkgaW4gdGhlIGtlcm5l
bCBmb3Igc29tZSB5ZWFycyBub3cuLi4KClNob3VsZG4ndCBhIG5vcm1hbCBwYWdlIGZsaXAsIG9y
IGlmIGRvaW5nIHNpbmdsZS1idWZmZXJpbmcsIHVzaW5nIHRoZSAKZGlydHlmYiBpb2N0bCwgZG8g
dGhlIGpvYj8KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtr
YWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUy
MS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
