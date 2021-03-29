Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F334E12A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368D56E49A;
	Tue, 30 Mar 2021 06:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC76E4B3;
 Mon, 29 Mar 2021 18:30:49 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 2C1B065B30;
 Mon, 29 Mar 2021 14:30:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617042649;
 bh=CiLAhcBYdIBxO9trAzmTsXeaetQu3vlDdKujBncqKc8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qOQg7r7unrFpq/RMBtE7nW5QP0kRgD5BV83yIwM/nIcVv8VVcSn5O6BoE+QKAtAVS
 pl0CfEKV9GMVxuczjH9ah1vbHlxP5Lg/FXopX6u6jetaREHIkwVZ1jMCIoAr3Pc2zM
 A96jZ+73VyKmx+gWNFVhqKrKU8n5JED9jNcJkjkT7Zqm2ckgWe5sakN0Wjt9h8JWyn
 7E7+inKSzV3CFDA5Zu5DTCbl9boge165JDOCMnHsBpVG6ZzoMW3yfG1mjsvwZA1iAz
 MQ5LkeSKTUv//YFE13S6cx/XWf2FxanCb+dk5vr94jx1TC3L3MoDptqOmX5HwXtWux
 kOw/gPyVFc2Hg==
Message-ID: <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 02:30:26 +0800
In-Reply-To: <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 06:26:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dan =?ISO-8859-1?Q?Hor=E1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0zMCAwMjoyMSArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+IE9uIDIwMjEtMDMt
MjkgMjA6MTAgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiBZb3UgbmVlZCB0byBp
ZGVudGlmeSB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzLCBtb3N0IGxpa2VseSBzdGFydCBvciBsYXN0
IAo+ID4gYXJlIG5vdCBhIG11bHRpcGxlIG9mIEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0Uu
Cj4gCj4gSSBwcmludGsnZWQgdGhlIHZhbHVlIG9mIHN0YXJ0ICYgbGFzdCwgdGhleSBhcmUgYWxs
IGEgbXVsdGlwbGUgb2YgNAo+IChBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFKS4KPiAKPiBI
b3dldmVyLi4uIGBudW1fZW50cmllcyA9IGxhc3QgLSBzdGFydCArIDFgIHNvIGl0IGJlY2FtZSBz
b21lIGlycmF0aW9uYWwKPiB0aGluZy4uLsKgIEVpdGhlciB0aGlzIGxpbmUgaXMgd3JvbmcsIG9y
IHNvbWVvbmUgY2FsbGVkCj4gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nIHdpdGggW3N0YXJ0
LCBsYXN0KSBpbnN0ZWFkIG9mIFtzdGFydCwgbGFzdF0sIHdoaWNoCj4gaXMgdW5leHBlY3RlZC4K
CkkgYWRkZWQgQlVHX09OKG51bV9lbnRyaWVzICUgQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFH
RSAhPSAwKSwgZ2V0OgoKPiBNYXIgMzAgMDI6Mjg6MjcgeHJ5MTExLUExOTAxIGtlcm5lbDogWzxm
ZmZmZmZmZjgzYzkwNzUwPl0KPiBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcuY29uc3Rwcm9w
LjArMHgyMTgvMHhhZTgKPiBNYXIgMzAgMDI6Mjg6MjcgeHJ5MTExLUExOTAxIGtlcm5lbDogWzxm
ZmZmZmZmZjgzYzkyMmI4Pl0KPiBhbWRncHVfdm1fYm9fdXBkYXRlKzB4MjcwLzB4NGMwCj4gTWFy
IDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBrZXJuZWw6IFs8ZmZmZmZmZmY4M2M4MjNlYz5dCj4g
YW1kZ3B1X2dlbV92YV9pb2N0bCsweDQwYy8weDQzMAo+IE1hciAzMCAwMjoyODoyNyB4cnkxMTEt
QTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNjMWNhZTQ+XQo+IGRybV9pb2N0bF9rZXJuZWwrMHhj
Yy8weDEyMAo+IE1hciAzMCAwMjoyODoyNyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZm
ODNjMWNmZDg+XQo+IGRybV9pb2N0bCsweDIyMC8weDQwOAo+IE1hciAzMCAwMjoyODoyNyB4cnkx
MTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNjNWVhNDg+XQo+IGFtZGdwdV9kcm1faW9jdGwr
MHg1OC8weDk4Cj4gTWFyIDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBrZXJuZWw6IFs8ZmZmZmZm
ZmY4MzhmZWFjND5dIHN5c19pb2N0bCsweGNjLzB4ZTgKPiBNYXIgMzAgMDI6Mjg6MjcgeHJ5MTEx
LUExOTAxIGtlcm5lbDogWzxmZmZmZmZmZjgzNmU3NGYwPl0KPiBzeXNjYWxsX2NvbW1vbisweDM0
LzB4NTgKPiAKCj4gPiA+ID4gPiBCdWdMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2FtZC8tL2lzc3Vlcy8xNTQ5Cj4gPiA+ID4gPiBGaXhlczogYTM5ZjJhOGQ3MDY2ICgi
ZHJtL2FtZGdwdTogbnVrZSBhbWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyB2MiIpCj4gPiA+ID4g
PiBSZXBvcnRlZC1ieTogWGkgUnVveWFvIDx4cnkxMTFAbWVuZ3lhbjEyMjMud2FuZz4KPiA+ID4g
PiA+IFJlcG9ydGVkLWJ5OiBEYW4gSG9yw6FrIDxkYW5AZGFubnkuY3o+Cj4gPiA+ID4gPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGkgUnVveWFv
IDx4cnkxMTFAbWVuZ3lhbjEyMjMud2FuZz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gwqDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KPiA+ID4gPiA+IMKg
wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
Ywo+ID4gPiA+ID4gaW5kZXggYWQ5MWMwYzNjNDIzLi5jZWUwY2M5YzgwODUgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+ID4gPiA+
IEBAIC0xNzA3LDcgKzE3MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFw
cGluZyhzdHJ1Y3QKPiA+ID4gPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0ID0gdG1wOwo+ID4gPiA+ID4gwqDCoCAKPiA+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoH0gd2hpbGUgKHVubGlrZWx5KHN0YXJ0ICE9IGxhc3QgKyAxKSk7Cj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqB9IHdoaWxlICh1bmxpa2VseShzdGFydCA8IGxhc3QgKyAx
KSk7Cj4gPiA+ID4gPiDCoMKgIAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgciA9IHZtLT51
cGRhdGVfZnVuY3MtPmNvbW1pdCgmcGFyYW1zLCBmZW5jZSk7Cj4gPiA+ID4gPiDCoMKgIAo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBiYXNlLWNvbW1pdDogYTVlMTNjNmRmMGU0MTcwMmQyYjJjNzdjOGFk
NDE2NzdlYmIwNjViMwo+ID4gCj4gCgotLSAKWGkgUnVveWFvIDx4cnkxMTFAbWVuZ3lhbjEyMjMu
d2FuZz4KU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4g
VW5pdmVyc2l0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
