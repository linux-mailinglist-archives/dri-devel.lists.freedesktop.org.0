Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2234E12F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0916E853;
	Tue, 30 Mar 2021 06:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA546E4D4;
 Mon, 29 Mar 2021 19:27:36 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id D718C65B2D;
 Mon, 29 Mar 2021 15:27:23 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617046055;
 bh=q5jy06gXbsh54zTcjXzkpHo6iPU/YhiGMix3TqY8BK4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=hg/Gc597690mti/NLTwXW6eufoo40Y0FP61MRrSTcqtmdukiixS07cWw2xjn9/Ipn
 nNFA4csrZtwx0neVRRo6IQNXbOwejpumm2sQN8z/eQuoSwoZ/AXHcNASsM9Z+Qr+Pz
 +ZHCHnG+6iUs46Z4iYdKoJvTabQwRWdaLymrD1B8ijcWq7UX06Q79eiohSyCktTKng
 a14eSX2wdS3GSIliKyke8imRGdN2ITbYjwwwCN0v/d5gXUjOJvs1Xs7CAAI15g2xyK
 aHaPfvz4cagvj2dz+MlehKdzSNxmR+cLosYlmKvV1YG90qEqf0rDe9I90xdZBj2rq8
 mBNCzDIY/CN/Q==
Message-ID: <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 03:27:15 +0800
In-Reply-To: <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
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

SGkgQ2hyaXN0aWFuLAoKSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgY29uc3RyYWludCBpbXBs
ZW1lbnRlZCB0byBlbnN1cmUgYG51bV9lbnRyaWVzICUKQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVf
UEFHRSA9PSAwYC4gIEZvciBleGFtcGxlLCBpbiBgYW1kZ3B1X3ZtX2JvX21hcCgpYDoKCiAgICAg
ICAgLyogdmFsaWRhdGUgdGhlIHBhcmFtZXRlcnMgKi8KICAgICAgICBpZiAoc2FkZHIgJiBBTURH
UFVfR1BVX1BBR0VfTUFTSyB8fCBvZmZzZXQgJiBBTURHUFVfR1BVX1BBR0VfTUFTSyB8fAogICAg
ICAgICAgICBzaXplID09IDAgfHwgc2l6ZSAmIEFNREdQVV9HUFVfUEFHRV9NQVNLKQogICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgovKiBzbmlwICovCgogICAgICAgIHNhZGRyIC89IEFN
REdQVV9HUFVfUEFHRV9TSVpFOwogICAgICAgIGVhZGRyIC89IEFNREdQVV9HUFVfUEFHRV9TSVpF
OwoKLyogc25pcCAqLwoKICAgICAgICBtYXBwaW5nLT5zdGFydCA9IHNhZGRyOwogICAgICAgIG1h
cHBpbmctPmxhc3QgPSBlYWRkcjsKCgpJZiB3ZSByZWFsbHkgd2FudCB0byBlbnN1cmUgKG1hcHBp
bmctPmxhc3QgLSBtYXBwaW5nLT5zdGFydCArIDEpICUKQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVf
UEFHRSA9PSAwLCB0aGVuIHdlIHNob3VsZCByZXBsYWNlICJBTURHUFVfR1BVX1BBR0VfTUFTSyIK
aW4gInZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzIiB3aXRoICJQQUdFX01BU0siLgoKSSB0cmllZCBp
dCBhbmQgaXQgYnJva2UgdXNlcnNwYWNlOiBYb3JnIHN0YXJ0dXAgZmFpbHMgd2l0aCBFSU5WQUwg
d2l0aCB0aGlzCmNoYW5nZS4KCk9uIDIwMjEtMDMtMzAgMDI6MzAgKzA4MDAsIFhpIFJ1b3lhbyB3
cm90ZToKPiBPbiAyMDIxLTAzLTMwIDAyOjIxICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4gPiBP
biAyMDIxLTAzLTI5IDIwOjEwICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiBZ
b3UgbmVlZCB0byBpZGVudGlmeSB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzLCBtb3N0IGxpa2VseSBz
dGFydCBvciBsYXN0IAo+ID4gPiBhcmUgbm90IGEgbXVsdGlwbGUgb2YgQU1ER1BVX0dQVV9QQUdF
U19JTl9DUFVfUEFHRS4KPiA+IAo+ID4gSSBwcmludGsnZWQgdGhlIHZhbHVlIG9mIHN0YXJ0ICYg
bGFzdCwgdGhleSBhcmUgYWxsIGEgbXVsdGlwbGUgb2YgNAo+ID4gKEFNREdQVV9HUFVfUEFHRVNf
SU5fQ1BVX1BBR0UpLgo+ID4gCj4gPiBIb3dldmVyLi4uIGBudW1fZW50cmllcyA9IGxhc3QgLSBz
dGFydCArIDFgIHNvIGl0IGJlY2FtZSBzb21lIGlycmF0aW9uYWwKPiA+IHRoaW5nLi4uwqAgRWl0
aGVyIHRoaXMgbGluZSBpcyB3cm9uZywgb3Igc29tZW9uZSBjYWxsZWQKPiA+IGFtZGdwdV92bV9i
b191cGRhdGVfbWFwcGluZyB3aXRoIFtzdGFydCwgbGFzdCkgaW5zdGVhZCBvZiBbc3RhcnQsIGxh
c3RdLCB3aGljaAo+ID4gaXMgdW5leHBlY3RlZC4KPiAKPiBJIGFkZGVkIEJVR19PTihudW1fZW50
cmllcyAlIEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0UgIT0gMCksIGdldDoKPiAKPiA+IE1h
ciAzMCAwMjoyODoyNyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNjOTA3NTA+XQo+
ID4gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nLmNvbnN0cHJvcC4wKzB4MjE4LzB4YWU4Cj4g
PiBNYXIgMzAgMDI6Mjg6MjcgeHJ5MTExLUExOTAxIGtlcm5lbDogWzxmZmZmZmZmZjgzYzkyMmI4
Pl0KPiA+IGFtZGdwdV92bV9ib191cGRhdGUrMHgyNzAvMHg0YzAKPiA+IE1hciAzMCAwMjoyODoy
NyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNjODIzZWM+XQo+ID4gYW1kZ3B1X2dl
bV92YV9pb2N0bCsweDQwYy8weDQzMAo+ID4gTWFyIDMwIDAyOjI4OjI3IHhyeTExMS1BMTkwMSBr
ZXJuZWw6IFs8ZmZmZmZmZmY4M2MxY2FlND5dCj4gPiBkcm1faW9jdGxfa2VybmVsKzB4Y2MvMHgx
MjAKPiA+IE1hciAzMCAwMjoyODoyNyB4cnkxMTEtQTE5MDEga2VybmVsOiBbPGZmZmZmZmZmODNj
MWNmZDg+XQo+ID4gZHJtX2lvY3RsKzB4MjIwLzB4NDA4Cj4gPiBNYXIgMzAgMDI6Mjg6MjcgeHJ5
MTExLUExOTAxIGtlcm5lbDogWzxmZmZmZmZmZjgzYzVlYTQ4Pl0KPiA+IGFtZGdwdV9kcm1faW9j
dGwrMHg1OC8weDk4Cj4gPiBNYXIgMzAgMDI6Mjg6MjcgeHJ5MTExLUExOTAxIGtlcm5lbDogWzxm
ZmZmZmZmZjgzOGZlYWM0Pl0gc3lzX2lvY3RsKzB4Y2MvMHhlOAo+ID4gTWFyIDMwIDAyOjI4OjI3
IHhyeTExMS1BMTkwMSBrZXJuZWw6IFs8ZmZmZmZmZmY4MzZlNzRmMD5dCj4gPiBzeXNjYWxsX2Nv
bW1vbisweDM0LzB4NTgKPiA+IAo+IAo+ID4gPiA+ID4gPiBCdWdMaW5rOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8xNTQ5Cj4gPiA+ID4gPiA+IEZpeGVz
OiBhMzlmMmE4ZDcwNjYgKCJkcm0vYW1kZ3B1OiBudWtlIGFtZGdwdV92bV9ib19zcGxpdF9tYXBw
aW5nIHYyIikKPiA+ID4gPiA+ID4gUmVwb3J0ZWQtYnk6IFhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5
YW4xMjIzLndhbmc+Cj4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBEYW4gSG9yw6FrIDxkYW5AZGFu
bnkuY3o+Cj4gPiA+ID4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+Cj4gPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jIHwgMiArLQo+ID4gPiA+ID4gPiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gPiA+ID4gPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+ID4gPiA+ID4gaW5kZXgg
YWQ5MWMwYzNjNDIzLi5jZWUwY2M5YzgwODUgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gPiA+ID4gPiA+IEBAIC0xNzA3LDcg
KzE3MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QK
PiA+ID4gPiA+ID4gYW1kZ3B1X2RldmljZSAqYWRldiwKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHN0YXJ0ID0gdG1wOwo+ID4gPiA+ID4gPiDCoMKgIAo+ID4gPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqB9IHdoaWxlICh1bmxpa2VseShzdGFydCAhPSBsYXN0ICsgMSkpOwo+ID4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqB9IHdoaWxlICh1bmxpa2VseShzdGFydCA8IGxhc3QgKyAx
KSk7Cj4gPiA+ID4gPiA+IMKgwqAgCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHIgPSB2
bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgZmVuY2UpOwo+ID4gPiA+ID4gPiDCoMKg
IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gYmFzZS1jb21taXQ6IGE1ZTEzYzZkZjBlNDE3MDJk
MmIyYzc3YzhhZDQxNjc3ZWJiMDY1YjMKPiA+ID4gCj4gPiAKPiAKCi0tIApYaSBSdW95YW8gPHhy
eTExMUBtZW5neWFuMTIyMy53YW5nPgpTY2hvb2wgb2YgQWVyb3NwYWNlIFNjaWVuY2UgYW5kIFRl
Y2hub2xvZ3ksIFhpZGlhbiBVbml2ZXJzaXR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
