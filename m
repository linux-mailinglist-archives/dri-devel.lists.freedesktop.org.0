Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33C1134A5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 19:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53396F4F0;
	Wed,  4 Dec 2019 18:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3EC6F4F0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 18:27:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4IR9uL118997;
 Wed, 4 Dec 2019 12:27:09 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4IR9Tb051413
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 12:27:09 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 12:27:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 12:27:07 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4IR4nI106520;
 Wed, 4 Dec 2019 12:27:05 -0600
Subject: Re: [PATCH v6 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
 <20190619052716.16831-4-andrew.smirnov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0d84fa72-bc96-9b88-cd89-c04327109e0e@ti.com>
Date: Wed, 4 Dec 2019 20:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20190619052716.16831-4-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575484029;
 bh=Uet6ftlBWt6BLt4lGobOQD5+cFdGEWSfTiuKL7t91js=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SbzuqJJ3+pluoOby71dsCavu5VY1IJbySeO+FHIVH2JAUN6StofHWG/cC1GLh6F17
 LDw6r7+PbTZtCvHUaRrRIxN8e7jV2AdctsNbU4vKyqu7FaEfhAMgi5d53K/QIjCtlc
 q58YXAV6zNHqrtQk9b87TGsUYr4gve4UuoeudWu4=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKT24gMTkvMDYvMjAxOSAwODoyNywgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cgo+
IEBAIC03NDgsMjIgKzc0OCwxOSBAQCBzdGF0aWMgaW50IHRjX3NldF92aWRlb19tb2RlKHN0cnVj
dCB0Y19kYXRhICp0YywKPiAgIAo+ICAgc3RhdGljIGludCB0Y193YWl0X2xpbmtfdHJhaW5pbmco
c3RydWN0IHRjX2RhdGEgKnRjKQo+ICAgewo+IC0JdTMyIHRpbWVvdXQgPSAxMDAwOwo+ICAgCXUz
MiB2YWx1ZTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gLQlkbyB7Cj4gLQkJdWRlbGF5KDEpOwo+IC0J
CXRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsKPiAtCX0gd2hpbGUgKCghKHZhbHVlICYgTFRf
TE9PUERPTkUpKSAmJiAoLS10aW1lb3V0KSk7Cj4gLQo+IC0JaWYgKHRpbWVvdXQgPT0gMCkgewo+
ICsJcmV0ID0gdGNfcG9sbF90aW1lb3V0KHRjLCBEUDBfTFRTVEFULCBMVF9MT09QRE9ORSwKPiAr
CQkJICAgICAgTFRfTE9PUERPTkUsIDEsIDEwMDApOwoKVGhpcyBzZWVtcyB0byBicmVhayBEUCBh
dCBsZWFzdCB3aXRoIHNvbWUgbW9uaXRvcnMgZm9yIG1lLiBJIHRoaW5rIGl0J3MganVzdCBhIHRp
bWVvdXQgcHJvYmxlbSwgYXMgCmluY3JlYXNpbmcgdGhlIHZhbHVlcyBoZWxwcy4KClVzaW5nIGt0
aW1lLCBJIGNhbiBzZWUgdGhhdCBkdXJpbmcgbGluayB0cmFpbmluZywgdGhlIGZpcnN0IGNhbGwg
dGFrZXMgfjJtcywgdGhlIHNlY29uZCB+N21zLiBJIAp0aGluayB0aGlzIHdvcmtlZCBiZWZvcmUs
IGFzIHVkZWxheSgxKSB0YWtlcyBtdWNoIGxvbmdlciB0aGFuIDEgdXMuCgpXZSBoYXZlIDEwMDB1
cyBsaW1pdCBpbiBhIGZldyBvdGhlciBwbGFjZXMgdG9vLCB3aGljaCBJIGRvbid0IHNlZSBjYXVz
aW5nIGlzc3VlcywgYnV0IG1pZ2h0IG5lZWQgCmluY3JlYXNpbmcgdG9vLgoKQWxzbywgMXVzIHNs
ZWVwX3VzIG1heSBiZSBhIGJpdCB0b28gc21hbGwgdG8gYmUgc2FuZS4gSWYgdGhlIGxvb3BzIHRh
a2UgbWlsbGlzZWNvbmRzLCBwcm9iYWJseSAxMDB1cyAKb3IgZXZlbiBtb3JlIHdvdWxkIG1ha2Ug
c2Vuc2UuCgpUaGlzIGRpZG4ndCBjYXVzZSBhbnkgaXNzdWVzIHdpdGggeW91ciBkaXNwbGF5PwoK
ICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAy
MiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlw
YWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
