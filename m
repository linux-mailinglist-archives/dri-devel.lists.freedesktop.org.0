Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5534E12C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B346E84C;
	Tue, 30 Mar 2021 06:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A6F6E4A6;
 Mon, 29 Mar 2021 18:08:55 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 8E86265B2D;
 Mon, 29 Mar 2021 14:08:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617041334;
 bh=DnbFnwZ0/NuIMzB/7EbnclRu37Hg7RRrTWRMFouAYiY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eud4UHFmqGdkogF/vnhMCKl190X1Lx65bFaTgdfl+MlbTUpeY7mcQy4Vbmpjtc95J
 PMqWWNP7RQ75jB/WpJ3wr3rkXC9baOSQyJPRpYIp20wzuZYlkBZtwHVFr/UkHKLl37
 dnaSp+ZX2lG0dIZeqmglsLk0cEQC9LzZ1f9CfhEh/GQL0/MvG1MxssMrKQpNZWiZUf
 hJJbRSc+mafXGpbfgbeOKZOnQDG0QVHPiOoc6Liu3sf4khCbQ6/gf/876E4QCouvFk
 0ZtsKsl1RlGA0ursq/pLBvT4uoIc2edOlSRAd8iCn5wo2bUCJKZO7codNKxm6NAAiS
 +2HbmYpCJKk9g==
Message-ID: <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 02:08:36 +0800
In-Reply-To: <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
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

T24gMjAyMS0wMy0yOSAyMDowNCArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAy
OS4wMy4yMSB1bSAxOTo1MyBzY2hyaWViIFjihLkgUnVveWFvOgo+ID4gSWYgdGhlIGluaXRpYWwg
dmFsdWUgb2YgYG51bV9lbnRpcmVzYCAoY2FsY3VsYXRlZCBhdCBsaW5lIDE2NTQpIGlzIG5vdAo+
ID4gYW4gaW50ZWdyYWwgbXVsdGlwbGUgb2YgYEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0Vg
LCBpbiBsaW5lIDE2ODEgYQo+ID4gdmFsdWUgZ3JlYXRlciB0aGFuIHRoZSBpbml0aWFsIHZhbHVl
IHdpbGwgYmUgYXNzaWduZWQgdG8gaXQuwqAgVGhhdCBjYXVzZXMKPiA+IGBzdGFydCA+IGxhc3Qg
KyAxYCBhZnRlciBsaW5lIDE3MDguwqAgVGhlbiBpbiB0aGUgbmV4dCBpdGVyYXRpb24gYW4KPiA+
IHVuZGVyZmxvdyBoYXBwZW5zIGF0IGxpbmUgMTY1NC7CoCBJdCBjYXVzZXMgbWVzc2FnZQo+ID4g
Cj4gPiDCoMKgwqDCoCAqRVJST1IqIENvdWxkbid0IHVwZGF0ZSBCT19WQSAoLTEyKQo+ID4gCj4g
PiBwcmludGVkIGluIGtlcm5lbCBsb2csIGFuZCBHUFUgaGFuZ2luZy4KPiA+IAo+ID4gRm9ydGlm
eSB0aGUgY3JpdGVyaWEgb2YgdGhlIGxvb3AgdG8gZml4IHRoaXMgaXNzdWUuCj4gCj4gTkFLIHRo
ZSB2YWx1ZSBvZiBudW1fZW50cmllcyBtdXN0IGFsd2F5cyBiZSBhIG11bHRpcGxlIG9mIAo+IEFN
REdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0Ugb3Igb3RoZXJ3aXNlIHdlIGNvcnJ1cHQgdGhlIHBh
Z2UgdGFibGVzLgo+IAo+IEhvdyBkbyB5b3UgdHJpZ2dlciB0aGF0PwoKU2ltcGx5IHJ1biAiT3Bl
bkdMIGFyZWEiIGZyb20gZ3RrMy1kZW1vICh3aGljaCBqdXN0IHJlbmRlcnMgYSB0cmlhbmdsZSB3
aXRoIEdMKQp1bmRlciBYb3JnLCBvbiBNSVBTNjQuICBTZWUgdGhlIEJ1Z0xpbmsuCgo+IENocmlz
dGlhbi4KPiAKPiA+IAo+ID4gQnVnTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9hbWQvLS9pc3N1ZXMvMTU0OQo+ID4gRml4ZXM6IGEzOWYyYThkNzA2NiAoImRybS9hbWRn
cHU6IG51a2UgYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcgdjIiKQo+ID4gUmVwb3J0ZWQtYnk6
IFhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+Cj4gPiBSZXBvcnRlZC1ieTogRGFu
IEhvcsOhayA8ZGFuQGRhbm55LmN6Pgo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+
IFNpZ25lZC1vZmYtYnk6IFhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+Cj4gPiAt
LS0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiArLQo+
ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ID4gaW5kZXggYWQ5
MWMwYzNjNDIzLi5jZWUwY2M5YzgwODUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmMKPiA+IEBAIC0xNzA3LDcgKzE3MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QKPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RhcnQgPSB0bXA7Cj4gPiDCoCAKPiA+IC3CoMKgwqDCoMKgwqDCoH0g
d2hpbGUgKHVubGlrZWx5KHN0YXJ0ICE9IGxhc3QgKyAxKSk7Cj4gPiArwqDCoMKgwqDCoMKgwqB9
IHdoaWxlICh1bmxpa2VseShzdGFydCA8IGxhc3QgKyAxKSk7Cj4gPiDCoCAKPiA+IMKgwqDCoMKg
wqDCoMKgwqByID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29tbWl0KCZwYXJhbXMsIGZlbmNlKTsKPiA+
IMKgIAo+ID4gCj4gPiBiYXNlLWNvbW1pdDogYTVlMTNjNmRmMGU0MTcwMmQyYjJjNzdjOGFkNDE2
NzdlYmIwNjViMwo+IAoKLS0gClhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+ClNj
aG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNp
dHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
