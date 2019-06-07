Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93B83A59D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE14892F3;
	Sun,  9 Jun 2019 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA147899F2;
 Fri,  7 Jun 2019 20:46:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfacd1a0000>; Fri, 07 Jun 2019 13:46:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:46:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:46:33 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 20:46:31 +0000
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <96a2739f-6902-05be-7143-289b41c4304d@nvidia.com>
Date: Fri, 7 Jun 2019 13:46:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-10-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559940378; bh=+DzfkNN8iXOL7by8qMWBjVwFAYZtnua1XZdudIdSS1I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=VluKSBvkfaYIX++zlv6XbGKYR777aYfJahPNKO/wmahQZbfZhQO0mclBAunQkei1x
 cmaNgrzDDMriQDpXTunXqzxWpXX2n2UXyyFCSG3yr1peoDkbHDXEL2lhubMUXxqVpx
 vflN1kbYMdCmz1XHBwtlcJK7eGpIO27Pznx1OsNID29nU27/Z8TKtxAqoQ4ZvR+NNG
 y9lD95yLdEEDsDCmGy22bIUny2N5+9ttBIp9Ndq4vra/BLx9O57G9SALrAnL40nMhY
 aeMl7wBddrI0belykCs3zCS0k7KMxawm1rABIt5Cn2NEifhgOtCyvgnknxVVQ+8WEt
 tVh+oG5gKD+NQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IEZyb206IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBUcnlpbmcgdG8gbWlzdXNlIGEgcmFu
Z2Ugb3V0c2lkZSBpdHMgbGlmZXRpbWUgaXMgYSBrZXJuZWwgYnVnLiBVc2UgV0FSTl9PTgo+IGFu
ZCBwb2lzb24gYnl0ZXMgdG8gZGV0ZWN0IHRoaXMgY29uZGl0aW9uLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiBSZXZpZXdlZC1ieTogSsOp
csO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogUmFscGggQ2Ft
cGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgoKPiAtLS0KPiB2Mgo+IC0gS2VlcCByYW5nZSBz
dGFydC9lbmQgdmFsaWQgYWZ0ZXIgdW5yZWdpc3RyYXRpb24gKEplcm9tZSkKPiAtLS0KPiAgIG1t
L2htbS5jIHwgNyArKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5k
ZXggNjgwMmRlNzA4MGQxNzIuLmMyZmVjYjNlY2IxMWUxIDEwMDY0NAo+IC0tLSBhL21tL2htbS5j
Cj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtOTM3LDcgKzkzNyw3IEBAIHZvaWQgaG1tX3JhbmdlX3Vu
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gICAJc3RydWN0IGhtbSAqaG1tID0g
cmFuZ2UtPmhtbTsKPiAgIAo+ICAgCS8qIFNhbml0eSBjaGVjayB0aGlzIHJlYWxseSBzaG91bGQg
bm90IGhhcHBlbi4gKi8KPiAtCWlmIChobW0gPT0gTlVMTCB8fCByYW5nZS0+ZW5kIDw9IHJhbmdl
LT5zdGFydCkKPiArCWlmIChXQVJOX09OKHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0YXJ0KSkKPiAg
IAkJcmV0dXJuOwoKV0FSTl9PTigpIGlzIGRlZmluaXRlbHkgYmV0dGVyIHRoYW4gc2lsZW50IHJl
dHVybiBidXQgSSB3b25kZXIgaG93CnVzZWZ1bCBpdCBpcyBzaW5jZSB0aGUgY2FsbGVyIHNob3Vs
ZG4ndCBiZSBtb2RpZnlpbmcgdGhlIGhtbV9yYW5nZQpvbmNlIGl0IGlzIHJlZ2lzdGVyZWQuIE90
aGVyIGZpZWxkcyBjb3VsZCBiZSBjaGFuZ2VkIHRvby4uLgoKPiAgIAltdXRleF9sb2NrKCZobW0t
PmxvY2spOwo+IEBAIC05NDgsNyArOTQ4LDEwIEBAIHZvaWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIo
c3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gICAJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4gICAJ
bW1wdXQoaG1tLT5tbSk7Cj4gICAJaG1tX3B1dChobW0pOwo+IC0JcmFuZ2UtPmhtbSA9IE5VTEw7
Cj4gKwo+ICsJLyogVGhlIHJhbmdlIGlzIG5vdyBpbnZhbGlkLCBsZWF2ZSBpdCBwb2lzb25lZC4g
Ki8KPiArCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ICsJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lT
T05fSU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKGht
bV9yYW5nZV91bnJlZ2lzdGVyKTsKPiAgIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
