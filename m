Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB31DD891
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 22:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2306E954;
	Thu, 21 May 2020 20:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5E6E954;
 Thu, 21 May 2020 20:40:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec6e6f80000>; Thu, 21 May 2020 13:39:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 13:40:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 13:40:40 -0700
Received: from [10.2.48.182] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 May
 2020 20:40:39 +0000
Subject: Solved: [PATCH 0/4] mm/gup, drm/i915: refactor gup_fast, convert to
 pin_user_pages()
From: John Hubbard <jhubbard@nvidia.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20200519002124.2025955-1-jhubbard@nvidia.com>
 <159008745422.32320.5724805750977048669@build.alporthouse.com>
 <b907c1d5-b95a-3d00-cafa-0a321f0141d8@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7d79c089-7b21-cf7f-66ea-078d44c5e007@nvidia.com>
Date: Thu, 21 May 2020 13:40:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b907c1d5-b95a-3d00-cafa-0a321f0141d8@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590093560; bh=R00sEmekZJ8u338i/al5pR/bnMoqlwFIj15sC5O7Tb0=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HEehV5TEO95q9SZZIw94tj9i8A1ZHRKg/VVw2mM1WbQii8ZoxWDLYpPGI8JZlmyTE
 bHp0aCT2uYsQTO30z0juH470+/qQiTLEOl76kEibLolBDUxvBjyH28W5YWkuGp02BN
 Hdmsc8q6FKDac9PYGELJ/3wJK6IiwGHGgN+Et2XA70z51BIE7ubIHSLvisNG9Vs1yx
 +lzHxw+OtEJEzSUk6opuAjcCHpYlwiBayNhAwGWOJGIBESU1Vcee8UjNwpYFwG3INr
 2isZCbqFqafbsyQl+cXjBrlG+X+72PTLeCFFpHGWD8n7M6ApU7d7IJXQeJXeYcDfRG
 cE+N7LFn2e0MQ==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yMSAxMjoxMSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IE9uIDIwMjAtMDUtMjEg
MTE6NTcsIENocmlzIFdpbHNvbiB3cm90ZToKPj4gUXVvdGluZyBKb2huIEh1YmJhcmQgKDIwMjAt
MDUtMTkgMDE6MjE6MjApCj4+PiBUaGlzIG5lZWRzIHRvIGdvIHRocm91Z2ggQW5kcmV3J3MgLW1t
IHRyZWUsIGR1ZSB0byBhZGRpbmcgYSBuZXcgZ3VwLmMKPj4+IHJvdXRpbmUuIEhvd2V2ZXIsIEkg
d291bGQgcmVhbGx5IGxvdmUgdG8gaGF2ZSBzb21lIHRlc3RpbmcgZnJvbSB0aGUKPj4+IGRybS9p
OTE1IGZvbGtzLCBiZWNhdXNlIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gcnVuLXRpbWUgdGVzdCB0
aGF0IHBhcnQKPj4+IG9mIGl0Lgo+Pgo+PiBDSSBoaXQKPj4KPj4gPDQ+IFsxODUuNjY3NzUwXSBX
QVJOSU5HOiBDUFU6IDAgUElEOiAxMzg3IGF0IG1tL2d1cC5jOjI2OTkgCj4+IGludGVybmFsX2dl
dF91c2VyX3BhZ2VzX2Zhc3QrMHg2M2EvMHhhYzAKCgpPSywgd2hhdCBoYXBwZW5lZCBoZXJlIGlz
IHRoYXQgaXQncyBXQVJOKCknaW5nIGR1ZSB0byBwYXNzaW5nIGluIHRoZSBuZXcKRk9MTF9GQVNU
X09OTFkgZmxhZywgd2hpY2ggd2FzIG5vdCBhZGRlZCB0byB0aGUgd2hpdGVsaXN0LgoKU28gdGhl
IGZpeCBpcyBlYXN5LCBhbmQgc2hvdWxkIGJlIGFwcGxpZWQgdG8gdGhlIHJlZmFjdG9yaW5nIHBh
dGNoLiBJJ2xsCnNlbmQgb3V0IGEgdjIgb2YgdGhlIHNlcmllcywgd2hpY2ggd2lsbCBlZmZlY3Rp
dmVseSBoYXZlIHRoaXMgYXBwbGllZDoKCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAu
YwppbmRleCA2Y2JlOThjOTM0NjYuLjRmMGNhM2Y4NDlkMSAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMK
KysrIGIvbW0vZ3VwLmMKQEAgLTI2OTYsNyArMjY5Niw4IEBAIHN0YXRpYyBpbnQgaW50ZXJuYWxf
Z2V0X3VzZXJfcGFnZXNfZmFzdCh1bnNpZ25lZCBsb25nIHN0YXJ0LCAKaW50IG5yX3BhZ2VzLAog
IAlpbnQgbnJfcGlubmVkID0gMCwgcmV0ID0gMDsKCiAgCWlmIChXQVJOX09OX09OQ0UoZ3VwX2Zs
YWdzICYgfihGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSB8Ci0JCQkJICAgICAgIEZPTExfRk9S
Q0UgfCBGT0xMX1BJTiB8IEZPTExfR0VUKSkpCisJCQkJICAgICAgIEZPTExfRk9SQ0UgfCBGT0xM
X1BJTiB8IEZPTExfR0VUIHwKKwkJCQkgICAgICAgRk9MTF9GQVNUX09OTFkpKSkKICAJCXJldHVy
biAtRUlOVkFMOwoKICAJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KSAmIFBBR0VfTUFTSzsK
Cgo+PiA8ND4gWzE4NS42Njc3NTJdIE1vZHVsZXMgbGlua2VkIGluOiB2Z2VtIHNuZF9oZGFfY29k
ZWNfaGRtaSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgCj4+IHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBp
OTE1IG1laV9oZGNwIHg4Nl9wa2dfdGVtcF90aGVybWFsIGNvcmV0ZW1wIHNuZF9oZGFfaW50ZWwg
Cj4+IHNuZF9pbnRlbF9kc3BjZmcgY3JjdDEwZGlmX3BjbG11bCBzbmRfaGRhX2NvZGVjIGNyYzMy
X3BjbG11bCBzbmRfaHdkZXAgc25kX2hkYV9jb3JlIAo+PiBnaGFzaF9jbG11bG5pX2ludGVsIGNk
Y19ldGhlciB1c2JuZXQgbWlpIHNuZF9wY20gZTEwMDBlIG1laV9tZSBwdHAgcHBzX2NvcmUgbWVp
IAo+PiBpbnRlbF9scHNzX3BjaSBwcmltZV9udW1iZXJzCj4+IDw0PiBbMTg1LjY2Nzc3NF0gQ1BV
OiAwIFBJRDogMTM4NyBDb21tOiBnZW1fdXNlcnB0cl9ibGkgVGFpbnRlZDogR8KgwqDCoMKgIFUg
ICAgICAgICAgICAKPj4gNS43LjAtcmM1LUNJLVBhdGNod29ya18xNzcwNCsgIzEKPj4gPDQ+IFsx
ODUuNjY3Nzc3XSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBDb3Jwb3JhdGlvbiBJY2UgTGFrZSBDbGll
bnQgUGxhdGZvcm0vSWNlTGFrZSAKPj4gVSBERFI0IFNPRElNTSBQRCBSVlAsIEJJT1MgSUNMU0ZX
UjEuUjAwLjMyMzQuQTAxLjE5MDYxNDE3NTAgMDYvMTQvMjAxOQo+PiA8ND4gWzE4NS42Njc3ODJd
IFJJUDogMDAxMDppbnRlcm5hbF9nZXRfdXNlcl9wYWdlc19mYXN0KzB4NjNhLzB4YWMwCj4+IDw0
PiBbMTg1LjY2Nzc4NV0gQ29kZTogMjQgNDAgMDggNDggMzkgNWMgMjQgMzggNDkgODkgZGYgMGYg
ODUgNzQgZmMgZmYgZmYgNDggODMgNDQgCj4+IDI0IDUwIDA4IDQ4IDM5IDVjIDI0IDU4IDQ5IDg5
IGRjIDBmIDg1IGUwIGZiIGZmIGZmIGU5IDE0IGZlIGZmIGZmIDwwZj4gMGIgYjggZWEgZmYgCj4+
IGZmIGZmIGU5IDM2IGZiIGZmIGZmIDRjIDg5IGU4IDQ4IDIxIGU4IDQ4IDM5IGU4IDBmCj4+IDw0
PiBbMTg1LjY2Nzc4OV0gUlNQOiAwMDE4OmZmZmZjOTAwMDExMzNjMzggRUZMQUdTOiAwMDAxMDIw
Ngo+PiA8ND4gWzE4NS42Njc3OTJdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAw
MDAwMDAwMDAgUkNYOiBmZmZmODg4NDk5OWVlODAwCj4+IDw0PiBbMTg1LjY2Nzc5NV0gUkRYOiAw
MDAwMDAwMDAwMGMwMDAxIFJTSTogMDAwMDAwMDAwMDAwMDEwMCBSREk6IDAwMDA3ZjQxOWU3NzQw
MDAKPj4gPDQ+IFsxODUuNjY3Nzk4XSBSQlA6IGZmZmY4ODg0NTNkYmYwNDAgUjA4OiAwMDAwMDAw
MDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMQo+PiA8ND4gWzE4NS42Njc4MDBdIFIxMDog
MDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZmODg4NDUzZGJm
MzgwCj4+IDw0PiBbMTg1LjY2NzgwM10gUjEzOiBmZmZmODg4NDk5OWVlODAwIFIxNDogZmZmZjg4
ODQ1M2RiZjNlOCBSMTU6IDAwMDAwMDAwMDAwMDAwNDAKPj4gPDQ+IFsxODUuNjY3ODA2XSBGUzrC
oCAwMDAwN2Y0MTllODc1ZTQwKDAwMDApIEdTOmZmZmY4ODg0OWZlMDAwMDAoMDAwMCkgCj4+IGtu
bEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4gPDQ+IFsxODUuNjY3ODA4XSBDUzrCoCAwMDEwIERTOiAw
MDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+PiA8ND4gWzE4NS42Njc4MTFdIENS
MjogMDAwMDdmNDE5ZTg3MzAwMCBDUjM6IDAwMDAwMDA0NThiZDIwMDQgQ1I0OiAwMDAwMDAwMDAw
NzYwZWYwCj4+IDw0PiBbMTg1LjY2NzgxNF0gUEtSVTogNTU1NTU1NTQKPj4gPDQ+IFsxODUuNjY3
ODE2XSBDYWxsIFRyYWNlOgo+PiA8ND4gWzE4NS42Njc5MTJdwqAgPyBpOTE1X2dlbV91c2VycHRy
X2dldF9wYWdlcysweDFjNi8weDI5MCBbaTkxNV0KPj4gPDQ+IFsxODUuNjY3OTE4XcKgID8gbWFy
a19oZWxkX2xvY2tzKzB4NDkvMHg3MAo+PiA8ND4gWzE4NS42Njc5OThdwqAgPyBpOTE1X2dlbV91
c2VycHRyX2dldF9wYWdlcysweDFjNi8weDI5MCBbaTkxNV0KPj4gPDQ+IFsxODUuNjY4MDczXcKg
ID8gaTkxNV9nZW1fdXNlcnB0cl9nZXRfcGFnZXMrMHgxYzYvMHgyOTAgW2k5MTVdCj4+Cj4+IGFu
ZCB0aGVuIHBhbmlja2VkLCBhY3Jvc3MgYSByYW5nZSBvZiBzeXN0ZW1zLgo+PiAtQ2hyaXMKPj4K
CmJ0dywgdGhlIHBhbmljIHNlZW1zIHRvIGluZGljYXRlIGFuIGFkZGl0aW9uYWwsIHByZS1leGlz
dGluZyBwcm9ibGVtOgppOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcygpLCBpbiB0aGlzIGNhc2Ug
YXQgbGVhc3QsIGlzIG5vdCBhYmxlIHRvCnJlY292ZXIgZnJvbSBhIGdldF91c2VyX3BhZ2VzL3Bp
bl91c2VyX3BhZ2VzIGZhaWx1cmUuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
