Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF57113588
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 20:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74AD6E966;
	Wed,  4 Dec 2019 19:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486A6E966
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 19:14:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4JDxBK000406;
 Wed, 4 Dec 2019 13:13:59 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4JDxm9125014;
 Wed, 4 Dec 2019 13:13:59 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 13:13:58 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 13:13:58 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4JDtxj035343;
 Wed, 4 Dec 2019 13:13:55 -0600
Subject: Re: [PATCH v6 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
 <20190619052716.16831-4-andrew.smirnov@gmail.com>
 <0d84fa72-bc96-9b88-cd89-c04327109e0e@ti.com>
Message-ID: <bdf4df0a-06d7-2ccb-9e8a-0c0ad55871ec@ti.com>
Date: Wed, 4 Dec 2019 21:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <0d84fa72-bc96-9b88-cd89-c04327109e0e@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575486839;
 bh=INvrPZI5l4kkjk9uHY07YAmvrsfziEoknfrwIChpOz8=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=cAKtD1TvJwPuHmdqJGLoZN/AHr7XxMIhG01lF19iVzEUCJ0GGnbV+mbb9h9nIMj/W
 y3bI2aTrNRSNjFhyj5hJ2L4g3T1uLfBC7zUr/DjtAUFOhSRJwcpjosKeG5llno/xsZ
 nrnpIrHZ0ZCiOc6iNnXtjcCOqqbOQKoWXjX5n6ts=
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

T24gMDQvMTIvMjAxOSAyMDoyNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSGkgQW5kcmV5LAo+
IAo+IE9uIDE5LzA2LzIwMTkgMDg6MjcsIEFuZHJleSBTbWlybm92IHdyb3RlOgo+IAo+PiBAQCAt
NzQ4LDIyICs3NDgsMTkgQEAgc3RhdGljIGludCB0Y19zZXRfdmlkZW9fbW9kZShzdHJ1Y3QgdGNf
ZGF0YSAqdGMsCj4+IMKgIHN0YXRpYyBpbnQgdGNfd2FpdF9saW5rX3RyYWluaW5nKHN0cnVjdCB0
Y19kYXRhICp0YykKPj4gwqAgewo+PiAtwqDCoMKgIHUzMiB0aW1lb3V0ID0gMTAwMDsKPj4gwqDC
oMKgwqDCoCB1MzIgdmFsdWU7Cj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4gLcKgwqDCoCBkbyB7
Cj4+IC3CoMKgwqDCoMKgwqDCoCB1ZGVsYXkoMSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCB0Y19yZWFk
KERQMF9MVFNUQVQsICZ2YWx1ZSk7Cj4+IC3CoMKgwqAgfSB3aGlsZSAoKCEodmFsdWUgJiBMVF9M
T09QRE9ORSkpICYmICgtLXRpbWVvdXQpKTsKPj4gLQo+PiAtwqDCoMKgIGlmICh0aW1lb3V0ID09
IDApIHsKPj4gK8KgwqDCoCByZXQgPSB0Y19wb2xsX3RpbWVvdXQodGMsIERQMF9MVFNUQVQsIExU
X0xPT1BET05FLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMVF9MT09Q
RE9ORSwgMSwgMTAwMCk7Cj4gCj4gVGhpcyBzZWVtcyB0byBicmVhayBEUCBhdCBsZWFzdCB3aXRo
IHNvbWUgbW9uaXRvcnMgZm9yIG1lLiBJIHRoaW5rIGl0J3MganVzdCBhIHRpbWVvdXQgcHJvYmxl
bSwgYXMgCj4gaW5jcmVhc2luZyB0aGUgdmFsdWVzIGhlbHBzLgo+IAo+IFVzaW5nIGt0aW1lLCBJ
IGNhbiBzZWUgdGhhdCBkdXJpbmcgbGluayB0cmFpbmluZywgdGhlIGZpcnN0IGNhbGwgdGFrZXMg
fjJtcywgdGhlIHNlY29uZCB+N21zLiBJIAo+IHRoaW5rIHRoaXMgd29ya2VkIGJlZm9yZSwgYXMg
dWRlbGF5KDEpIHRha2VzIG11Y2ggbG9uZ2VyIHRoYW4gMSB1cy4KCkFsc28gdGhlIHRpbWVvdXQg
aW4gdGNfYXV4X2xpbmtfc2V0dXAgdGFrZXMgfjUwMHVzIGZvciBtZSwgYW5kIG1heCBpcyAxMDAw
dXMuIFNvIGl0IHdvcmtzLCBidXQgSSAKdGhpbmsgaXQncyBhIGJpdCB0aWdodC4KCiAgVG9taQoK
LS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgw
IEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0Rv
bWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
