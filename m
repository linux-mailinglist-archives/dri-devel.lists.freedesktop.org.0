Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC434ECDA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186126E922;
	Tue, 30 Mar 2021 15:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0996E922;
 Tue, 30 Mar 2021 15:47:30 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 1C2D56594D;
 Tue, 30 Mar 2021 11:47:04 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617119249;
 bh=eigbB8qDAI5a8bYAXwC0uvl+3igPnE99OdGkCocv9GA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=1EWOwcM9/Ngu2Q35IvMTF6ORq00zTvR8ODmvXryNd1NO40Una9iMzBXJpLZB6pIuu
 0nE/T24ASHFs5LYmG+Qy5eYqmx/mbYPQuGK4yWSbQvj2iXqpAek6FTl0I4Ln1a8OFd
 JBTCvwO77mb0Grnu0lK0gmEUeS7aQJY+KQP6TMz/fyJxsLubm+ib1rshZBJCiaoi2Y
 +CZ2RED5MXg1F2INPK0cWYlYGXCtgI3aYWoUr3lBHq2+vRV2Y2s6Ypbfsy8B6SqVQq
 ZTKxk3s8yVHLSfanPUHytOYezaBpaKChpVW7iFvHjtQCaWi/dTt0YoRhivNOaTfkfX
 y3vRPT3huSCAQ==
Message-ID: <91dec1a3b6fe9165d1adab9cc69a788799e64fec.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dan
 =?ISO-8859-1?Q?Hor=E1k?= <dan@danny.cz>
Date: Tue, 30 Mar 2021 23:46:58 +0800
In-Reply-To: <92dc0767-0c4e-34bc-d1ee-66105d0f2013@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
 <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
 <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
 <f3fb57055f0bd3f19bb6ac397dc92113e1555764.camel@mengyan1223.wang>
 <63f5f6b39d22d9833a4c1503a34840eb08050f75.camel@mengyan1223.wang>
 <20210330152300.b790099debcd7659e30d9bfd@danny.cz>
 <92dc0767-0c4e-34bc-d1ee-66105d0f2013@amd.com>
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0zMCAxNToyNCArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAz
MC4wMy4yMSB1bSAxNToyMyBzY2hyaWViIERhbiBIb3LDoWs6Cj4gPiBPbiBUdWUsIDMwIE1hciAy
MDIxIDIxOjA5OjEyICswODAwCj4gPiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5n
PiB3cm90ZToKPiA+IAo+ID4gPiBPbiAyMDIxLTAzLTMwIDIxOjAyICswODAwLCBYaSBSdW95YW8g
d3JvdGU6Cj4gPiA+ID4gT24gMjAyMS0wMy0zMCAxNDo1NSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gPiA+IEkgcmF0aGVyIHNlZSB0aGlzIGFzIGEga2VybmVsIGJ1Zy4gQ2Fu
IHlvdSB0ZXN0IGlmIHRoaXMgY29kZSBmcmFnbWVudAo+ID4gPiA+ID4gZml4ZXMgeW91ciBpc3N1
ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9rbXMuYwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKPiA+ID4gPiA+IGluZGV4IDY0YmViMzM5OTYwNC4uZTEyNjBiNTE3ZTFi
IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ttcy5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMKPiA+ID4gPiA+IEBAIC03ODAsNyArNzgwLDcgQEAgaW50IGFtZGdwdV9pbmZvX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQKPiA+ID4gPiA+ICpkYXRhLCBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbHApCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8t
PnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQgPQo+ID4gPiA+ID4gbWF4KChpbnQpUEFHRV9TSVpF
LCBBTURHUFVfR1BVX1BBR0VfU0laRSk7Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRldl9pbmZvLT5wdGVfZnJhZ21lbnRfc2l6ZSA9ICgxIDw8Cj4gPiA+ID4g
PiBhZGV2LT52bV9tYW5hZ2VyLmZyYWdtZW50X3NpemUpICogQU1ER1BVX0dQVV9QQUdFX1NJWkU7
Cj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Z2FydF9w
YWdlX3NpemUgPSBBTURHUFVfR1BVX1BBR0VfU0laRTsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5nYXJ0X3BhZ2Vfc2l6ZSA9Cj4gPiA+ID4gPiBkZXZf
aW5mby0+dmlydHVhbF9hZGRyZXNzX2FsaWdubWVudDsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPmN1X2FjdGl2ZV9udW1iZXIgPSBhZGV2LQo+
ID4gPiA+ID4gPmdmeC5jdV9pbmZvLm51bWJlcjsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPmN1X2FvX21hc2sgPSBhZGV2LT5nZnguY3VfaW5m
by5hb19jdV9tYXNrOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfaW5mby0+Y2VfcmFtX3NpemUgPSBhZGV2LT5nZnguY2VfcmFtX3NpemU7Cj4gPiA+ID4g
SXQgd29ya3MuwqAgSSd2ZSBzZWVuIGl0IGF0Cj4gPiA+ID4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUy
RnhlbjBuJTJGbGludXglMkZjb21taXQlMkY4NGFkYTcyOTgzODM4YmQ3Y2U1NGJjMzJmNWQzNGFj
NWI1YWFlMTkxJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
Q2YzN2ZkZGYyMGE4ODQ3ZWRmNjc4MDhkOGYzN2VmMjNjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzUyNzA3NDExODc5MTMyMSU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1EWm5tZWUzOE5HcGlXUk1YNUxtbHhP
aHhBekJNaEF1c25BV05uQ3hYVEowJTNEJmFtcDtyZXNlcnZlZD0wCj4gPiA+ID4gYmVmb3JlICh3
aXRoIGEgY29tbW9uIHN1Yi1leHByZXNzaW9uLCB0aG91Z2ggOikuCj4gPiA+IFNvbWUgY29tbWVu
dDogb24gYW4gb2xkIHZlcnNpb24gb2YgRmVkb3JhIHBvcnRlZCBieSBMb29uZ3NvbiwgWG9yZyBq
dXN0Cj4gPiA+IGhhbmdzCj4gPiA+IHdpdGhvdXQgdGhpcyBjb21taXQuwqAgQnV0IG9uIHRoZSBz
eXN0ZW0gSSBidWlsdCBmcm9tIHNvdXJjZSwgSSBkaWRuJ3Qgc2VlCj4gPiA+IGFueQo+ID4gPiBp
c3N1ZSBiZWZvcmUgTGludXggNS4xMS7CoCBTbyBJIG1pc2JlbGlldmVkIHRoYXQgaXQgd2FzIHNv
bWV0aGluZyBhbHJlYWR5Cj4gPiA+IGZpeGVkLgo+ID4gPiAKPiA+ID4gRGFuOiB5b3UgY2FuIHRy
eSBpdCBvbiB5b3VyIFBQQyA2NCB3aXRoIG5vbi00SyBwYWdlIGFzIHdlbGwuCj4gPiB5dXAsIGxv
b2tzIGdvb2QgaGVyZSBhcyB3ZWxsLCBwcGM2NGxlIChQb3dlcjkpIHN5c3RlbSB3aXRoIDY0S0Ig
cGFnZXMKPiAKPiBNaG0sIGFzIGZhciBhcyBJIGNhbiBzYXkgdGhpcyBwYXRjaCBuZXZlciBtYWRl
IGl0IHRvIHVzLgoKSSB0aGluayBtYXliZSBpdHMgYXV0aG9yIGNvbnNpZGVycyBpdCBhICJ3b3Jr
YXJvdW5kIiBsaWtlIG1lLCBhcyB0aGVyZSBpcwphbHJlYWR5IGEgInZpcnR1YWxfYWRkcmVzc19h
bGlnbm1lbnQiIHdoaWNoIHNlZW1zIGNvcnJlY3QuCgo+IENhbiB5b3UgcGxlYXNlIHNlbmQgaXQg
dG8gdGhlIG1haWxpbmcgbGlzdCB3aXRoIG1lIG9uIENDPwoKSSd2ZSBzZW50IGl0LCB0b2dldGhl
ciB3aXRoIG15IHBhdGNoIGZvciB1c2luZyB+UEFHRV9NQVNLIGluIHBhcmFtZXRlcgp2YWxpZGF0
aW9uLgoKLS0gClhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+ClNjaG9vbCBvZiBB
ZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
